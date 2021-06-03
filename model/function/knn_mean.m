function [n_mF]=knn_mean(obv_F,n_mF,p_num)
% % logistic difference between model and SMAP (0:same, 1:pixel non-NaN for model but NaN for SMAP(1-0=1), -1:pixel NaN for model but non-NaN for SMAP (0-1=-1))
logic_temp_obv=single(~isnan(obv_F));
logic_temp_modelf=single(~isnan(n_mF));
diff_temp=logic_temp_modelf-logic_temp_obv;
n_mF(diff_temp==1)=nan;   % change non-NaN for model but NaN for SMAP to NaN in model
diff_num=length(find(diff_temp==-1));

while diff_num>0
    % % change NaN for model but non-NaN for SMAP to non-NaN in model (KNN-mean)
    dim=size(obv_F);
    [lat,lon]=find(diff_temp==-1);
    idx=find(diff_temp==-1);
    idx_temp=[lat,lon,idx];
    % % find corresponding index for pixels as non-NaN in SMAP
    p_c_lt=find(lon==1 & lat==1);   % left-top-corner pixel
    p_c_lb=find(lon==1 & lat==dim(1));   % left-bottom-corner pixel
    p_c_rt=find(lon==dim(2) & lat==1);   % right-top-corner pixel
    p_c_rb=find(lon==dim(2) & lat==dim(1));   % right-bottom-corner pixel
    p_t=find((lat==1 & lon~=1 & lon~=dim(2)));   % top line pixels (without corner)
    p_b=find((lat==dim(1) & lon~=1 & lon~=dim(2)));   % bottom line pixels (without corner)
    p_l=find((lon==1 & lat~=1 & lat~=dim(1)));   % left line pixels (without corner)
    p_r=find((lon==dim(2) & lat~=1 & lat~=dim(1)));   % right line pixels (without corner)
    p_o=find((lat~=1 & lat~=dim(1) & lon~=1 & lon~=dim(2)));   % other pixels
    % % change pixels with NaN for model but non-NaN for SMAP to non-NaN in model (four corners)
    n_mF(idx(p_c_lt))=nanmean([n_mF(lat(p_c_lt),lon(p_c_lt)+p_num),n_mF(lat(p_c_lt)+p_num,lon(p_c_lt)),n_mF(lat(p_c_lt)+p_num,lon(p_c_lt)+1)]);
    n_mF(idx(p_c_lb))=nanmean([n_mF(lat(p_c_lb)-p_num,lon(p_c_lb)),n_mF(lat(p_c_lb),lon(p_c_lb)+p_num),n_mF(lat(p_c_lb)-p_num,lon(p_c_lb)+1)]);
    n_mF(idx(p_c_rt))=nanmean([n_mF(lat(p_c_rt),lon(p_c_rt)-p_num),n_mF(lat(p_c_rt)+p_num,lon(p_c_rt)),n_mF(lat(p_c_rt)+p_num,lon(p_c_rt)-1)]);
    n_mF(idx(p_c_rb))=nanmean([n_mF(lat(p_c_rb)-p_num,lon(p_c_rb)),n_mF(lat(p_c_rb),lon(p_c_rb)-p_num),n_mF(lat(p_c_rb)-p_num,lon(p_c_rb)-1)]);
    % % change pixels with NaN for model but non-NaN for SMAP to non-NaN in model (Outermost circle)
    % % n_t, n_b, n_l, n_r: number of pixels in top, bottom, left, right line
    for n_t=1:length(p_t)
        if lon(p_t(n_t))-p_num>=1 && lat(p_t(n_t))+p_num<=dim(1) && lon(p_t(n_t))+p_num<=dim(2)
            n_mF(idx(p_t(n_t)))=nanmean([n_mF(lat(p_t(n_t)),lon(p_t(n_t))-p_num),n_mF(lat(p_t(n_t))+p_num,lon(p_t(n_t))),n_mF(lat(p_t(n_t)),lon(p_t(n_t))+p_num),n_mF(lat(p_t(n_t))+p_num,lon(p_t(n_t))-p_num),n_mF(lat(p_t(n_t))+p_num,lon(p_t(n_t))+p_num)]);
        elseif lon(p_t(n_t))-p_num<1
            n_mF(idx(p_t(n_t)))=nanmean([n_mF(lat(p_t(n_t))+p_num,lon(p_t(n_t))),n_mF(lat(p_t(n_t)),lon(p_t(n_t))+p_num),n_mF(lat(p_t(n_t))+p_num,lon(p_t(n_t))+p_num)]);
        elseif lat(p_t(n_t))+p_num>dim(1)
            n_mF(idx(p_t(n_t)))=nanmean([n_mF(lat(p_t(n_t)),lon(p_t(n_t))-p_num),n_mF(lat(p_t(n_t)),lon(p_t(n_t))+p_num)]);
        elseif lon(p_t(n_t))+p_num>dim(2)
            n_mF(idx(p_t(n_t)))=nanmean([n_mF(lat(p_t(n_t)),lon(p_t(n_t))-p_num),n_mF(lat(p_t(n_t))+p_num,lon(p_t(n_t))),n_mF(lat(p_t(n_t))+p_num,lon(p_t(n_t))-p_num)]);
        end
    end
    for n_b=1:length(p_b)
        if lat(p_b(n_b))-p_num>=1 && lon(p_b(n_b))-p_num>=1 && lon(p_b(n_b))+p_num<=dim(2)
            n_mF(idx(p_b(n_b)))=nanmean([n_mF(lat(p_b(n_b)),lon(p_b(n_b))-p_num),n_mF(lat(p_b(n_b))-p_num,lon(p_b(n_b))),n_mF(lat(p_b(n_b)),lon(p_b(n_b))+p_num),n_mF(lat(p_b(n_b))-p_num,lon(p_b(n_b))-p_num),n_mF(lat(p_b(n_b))-p_num,lon(p_b(n_b))+p_num)]);
        elseif lat(p_b(n_b))-p_num<1
            n_mF(idx(p_b(n_b)))=nanmean([n_mF(lat(p_b(n_b)),lon(p_b(n_b))-p_num),n_mF(lat(p_b(n_b)),lon(p_b(n_b))+p_num)]);
        elseif lon(p_b(n_b))-p_num<1
            n_mF(idx(p_b(n_b)))=nanmean([n_mF(lat(p_b(n_b))-p_num,lon(p_b(n_b))),n_mF(lat(p_b(n_b)),lon(p_b(n_b))+p_num),n_mF(lat(p_b(n_b))-p_num,lon(p_b(n_b))+p_num)]);
        elseif lon(p_b(n_b))+p_num>dim(2)
            n_mF(idx(p_b(n_b)))=nanmean([n_mF(lat(p_b(n_b)),lon(p_b(n_b))-p_num),n_mF(lat(p_b(n_b))-p_num,lon(p_b(n_b))),n_mF(lat(p_b(n_b))-p_num,lon(p_b(n_b))-p_num)]);
        end
    end
    for n_l=1:length(p_l)
        if lat(p_l(n_l))-p_num>=1 && lat(p_l(n_l))+p_num<=dim(1) && lon(p_l(n_l))+p_num<=dim(2)
            n_mF(idx(p_l(n_l)))=nanmean([n_mF(lat(p_l(n_l))-p_num,lon(p_l(n_l))),n_mF(lat(p_l(n_l)),lon(p_l(n_l))+p_num),n_mF(lat(p_l(n_l))+p_num,lon(p_l(n_l))),n_mF(lat(p_l(n_l))-p_num,lon(p_l(n_l))+p_num),n_mF(lat(p_l(n_l))+p_num,lon(p_l(n_l))+p_num)]);
        elseif lat(p_l(n_l))-p_num<1
            n_mF(idx(p_l(n_l)))=nanmean([n_mF(lat(p_l(n_l)),lon(p_l(n_l))+p_num),n_mF(lat(p_l(n_l))+p_num,lon(p_l(n_l))),n_mF(lat(p_l(n_l))+p_num,lon(p_l(n_l))+p_num)]);
        elseif lat(p_l(n_l))+p_num>dim(1)
            n_mF(idx(p_l(n_l)))=nanmean([n_mF(lat(p_l(n_l))-p_num,lon(p_l(n_l))),n_mF(lat(p_l(n_l)),lon(p_l(n_l))+p_num),n_mF(lat(p_l(n_l))-p_num,lon(p_l(n_l))+p_num)]);
        elseif lon(p_l(n_l))+p_num>dim(2)
            n_mF(idx(p_l(n_l)))=nanmean([n_mF(lat(p_l(n_l))-p_num,lon(p_l(n_l))),n_mF(lat(p_l(n_l))+p_num,lon(p_l(n_l)))]);
        end
    end
    for n_r=1:length(p_r)
        if lat(p_r(n_r))-p_num>=1 && lon(p_r(n_r))-p_num>=1 && lat(p_r(n_r))+p_num<=dim(1)
            n_mF(idx(p_r(n_r)))=nanmean([n_mF(lat(p_r(n_r))-p_num,lon(p_r(n_r))),n_mF(lat(p_r(n_r)),lon(p_r(n_r))-p_num),n_mF(lat(p_r(n_r))+p_num,lon(p_r(n_r))),n_mF(lat(p_r(n_r))-p_num,lon(p_r(n_r))-p_num),n_mF(lat(p_r(n_r))+p_num,lon(p_r(n_r))-p_num)]);
        elseif lat(p_r(n_r))-p_num<1
            n_mF(idx(p_r(n_r)))=nanmean([n_mF(lat(p_r(n_r)),lon(p_r(n_r))-p_num),n_mF(lat(p_r(n_r))+p_num,lon(p_r(n_r))),n_mF(lat(p_r(n_r))+p_num,lon(p_r(n_r))-p_num)]);
        elseif lon(p_r(n_r))-p_num<1
            n_mF(idx(p_r(n_r)))=nanmean([n_mF(lat(p_r(n_r))-p_num,lon(p_r(n_r))),n_mF(lat(p_r(n_r))+p_num,lon(p_r(n_r)))]);
        elseif lat(p_r(n_r))+p_num>dim(1)
            n_mF(idx(p_r(n_r)))=nanmean([n_mF(lat(p_r(n_r))-p_num,lon(p_r(n_r))),n_mF(lat(p_r(n_r)),lon(p_r(n_r))-p_num),n_mF(lat(p_r(n_r))-p_num,lon(p_r(n_r))-p_num)]);
        end
    end
    % % change pixels with NaN for model but non-NaN for SMAP to non-NaN in model (others in center)
    % % n_o: number of pixels in center (i.e., other pixels)
    for n_o=1:length(p_o)
        if lat(p_o(n_o))-p_num>=1 && lon(p_o(n_o))-p_num>=1 && lat(p_o(n_o))+p_num<=dim(1) && lon(p_o(n_o))+p_num<=dim(2)
            n_mF(idx(p_o(n_o)))=nanmean([n_mF(lat(p_o(n_o)),lon(p_o(n_o))-p_num),n_mF(lat(p_o(n_o))-p_num,lon(p_o(n_o))),n_mF(lat(p_o(n_o)),lon(p_o(n_o))+p_num),n_mF(lat(p_o(n_o))+p_num,lon(p_o(n_o))),n_mF(lat(p_o(n_o))-p_num,lon(p_o(n_o))-p_num),n_mF(lat(p_o(n_o))-p_num,lon(p_o(n_o))+p_num),n_mF(lat(p_o(n_o))+p_num,lon(p_o(n_o))-p_num),n_mF(lat(p_o(n_o))+p_num,lon(p_o(n_o))+p_num)]);
        elseif lat(p_o(n_o))-p_num<1
            n_mF(idx(p_o(n_o)))=nanmean([n_mF(lat(p_o(n_o)),lon(p_o(n_o))-p_num),n_mF(lat(p_o(n_o)),lon(p_o(n_o))+p_num),n_mF(lat(p_o(n_o))+p_num,lon(p_o(n_o))),n_mF(lat(p_o(n_o))+p_num,lon(p_o(n_o))-p_num),n_mF(lat(p_o(n_o))+p_num,lon(p_o(n_o))+p_num)]);
        elseif lon(p_o(n_o))-p_num<1
            n_mF(idx(p_o(n_o)))=nanmean([n_mF(lat(p_o(n_o))-p_num,lon(p_o(n_o))),n_mF(lat(p_o(n_o)),lon(p_o(n_o))+p_num),n_mF(lat(p_o(n_o))+p_num,lon(p_o(n_o))),n_mF(lat(p_o(n_o))-p_num,lon(p_o(n_o))+p_num),n_mF(lat(p_o(n_o))+p_num,lon(p_o(n_o))+p_num)]);
        elseif lat(p_o(n_o))+p_num>dim(1)
            n_mF(idx(p_o(n_o)))=nanmean([n_mF(lat(p_o(n_o)),lon(p_o(n_o))-p_num),n_mF(lat(p_o(n_o))-p_num,lon(p_o(n_o))),n_mF(lat(p_o(n_o)),lon(p_o(n_o))+p_num),n_mF(lat(p_o(n_o))-p_num,lon(p_o(n_o))-p_num),n_mF(lat(p_o(n_o))-p_num,lon(p_o(n_o))+p_num)]);
        elseif lon(p_o(n_o))+p_num>dim(2)
            n_mF(idx(p_o(n_o)))=nanmean([n_mF(lat(p_o(n_o)),lon(p_o(n_o))-p_num),n_mF(lat(p_o(n_o))-p_num,lon(p_o(n_o))),n_mF(lat(p_o(n_o))+p_num,lon(p_o(n_o))),n_mF(lat(p_o(n_o))-p_num,lon(p_o(n_o))-p_num),n_mF(lat(p_o(n_o))+p_num,lon(p_o(n_o))-p_num)]);
        end
    end
    % % Reculculate diff_num to check whether equals to 0
    logic_temp_modelf=single(~isnan(n_mF));
    diff_temp=logic_temp_modelf-logic_temp_obv;
    diff_num=length(find(diff_temp==-1));
    disp(['diff_num:',num2str(diff_num)])
    p_num=p_num+1;
    disp(['p_num:',num2str(p_num)])
end
end