Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC543CDB474
	for <intel-xe@archiver.kernel.org>; Tue, 17 Oct 2023 11:14:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CFD10E2CD;
	Tue, 17 Oct 2023 11:14:16 +0000 (UTC)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F9010E2CD
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Oct 2023 11:14:13 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-53db360294fso9809429a12.3
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Oct 2023 04:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697541252; x=1698146052; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=voFbSHa7qyZiWNZ0Wh9jySRvOqgKj2vLFY1FcBZ41iU=;
 b=auN2zLORbeipOXYvRccF0yXnu9jZVN3E6pU2zUfm65YtC8QazIrLtVnuUK+YpRcMHN
 KErBHuE6/ZUeoiUDfYMFwFs0/wpmNEah1Jnn0NeHCv+OKJeKBFNLGPZffv8K1Bp32/O2
 88r8TI60gnqb7xGu/+WXpf66flIHaZDEAgtJYwRWE8EP4yeRpEymKUaoSZc1HX6h/Piv
 LG5q1pso+ONcIzsHB4rx98tZJO8LNNjLnLrzWbc6SP1bCpONRnSoCWPgHz2ynPGCl/Em
 jCyAN+Re21xYGAkF5t0lpqDL6bGGfirdCq3D30u1/AMiTEWI2B+HoZXR2AIxNUb4QdzQ
 qiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697541252; x=1698146052;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=voFbSHa7qyZiWNZ0Wh9jySRvOqgKj2vLFY1FcBZ41iU=;
 b=MHAv2Uzn5g+zJ9q16L/Z/pNvrOIKlvY0yl6+43i8YProbVJLtnX5wsyimvfP6k56w2
 BfBaAVWQlK0qx+vc2FpWnJhduUjJpGcZ31XXMyr4Maw5xJhbXIXei52qFeldpcKqK5DA
 cPorMyV9lZBBRliMYlmGtTQuQAnzsm4iYwavUa9hVSNjJL9dlpRH0yAbd1XoOGfnVM2y
 jjMNx5oQq1TMqTtIYUrYTJOK7qa3YTGBasUN3FAyt8V1tnS7m0/c+w/NAWMdQAdIVdau
 78BOv19K14uLJGLvO4rTib60qmqhxVVER2KEh248UZuBezQXTjSQzvlcjrvlf8nR2AdQ
 UWOQ==
X-Gm-Message-State: AOJu0YztjBk7k6/LNW/frx1DtFYdt0L8RQyVUZft2XNaEKbEl261eTL6
 YzvMz1ZJFdxsOS6N4RBCmvFWvoaNWeDmpA==
X-Google-Smtp-Source: AGHT+IE5d9Vm5f+0keZWujXIpWVoQX15l21DSDCD1mWeBrw+2AO8ay+sLwmecRBHdBc9boJAUFGq+g==
X-Received: by 2002:a17:907:6d03:b0:9a5:d657:47ee with SMTP id
 sa3-20020a1709076d0300b009a5d65747eemr1583487ejc.58.1697541251871; 
 Tue, 17 Oct 2023 04:14:11 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.87])
 by smtp.googlemail.com with ESMTPSA id
 qc27-20020a170906d8bb00b00997e00e78e6sm1049706ejb.112.2023.10.17.04.14.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Oct 2023 04:14:11 -0700 (PDT)
Message-ID: <9f06ac79-f01e-8378-e30a-d34cba2f414a@gmail.com>
Date: Tue, 17 Oct 2023 14:14:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231012135209.403827-3-juhapekka.heikkila@gmail.com>
 <5b377d00-3047-7aab-b606-25cd89b1d801@gmail.com>
 <IA1PR11MB64187E4465B3630A7EE6971FC1D7A@IA1PR11MB6418.namprd11.prod.outlook.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <IA1PR11MB64187E4465B3630A7EE6971FC1D7A@IA1PR11MB6418.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v6 2/2] drm/xe/display: Add writing of
 remapped dpt
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 16.10.2023 17.59, Ruhl, Michael J wrote:
>> -----Original Message-----
>> From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Sent: Monday, October 16, 2023 10:54 AM
>> To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>> Subject: Fwd: [PATCH v6 2/2] drm/xe/display: Add writing of remapped dpt
>>
>> Xe need to use remapped display page table for tiled framebuffers
>> on anywhere else than DG2. Here add function to write such dpt and
>> enable usage of remapped display page tables where needed.
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 52 +++++++++++++++++++++++--
>> -
>>   1 file changed, 46 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> index 89cf65c58191..ffd35a59f405 100644
>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> @@ -45,6 +45,37 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map
>> *map, u32 *dpt_ofs, u32 bo_
>>   	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
>>   }
>>   +static void
>> +write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32
>> *dpt_ofs,
>> +		   u32 bo_ofs, u32 width, u32 height, u32 src_stride,
>> +		   u32 dst_stride)
>> +{
>> +	struct xe_device *xe = xe_bo_device(bo);
>> +	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
>> +	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16
>> pat_index)
>> +		= ggtt->pt_ops->pte_encode_bo;
>> +	u32 column, row;
>> +
>> +	for (row = 0; row < height; row++) {
>> +		u32 src_idx = src_stride * row + bo_ofs;
>> +
>> +		for (column = 0; column < width; column++) {
>> +			iosys_map_wr(map, *dpt_ofs, u64,
>> +				     pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
>> +				     xe->pat.idx[XE_CACHE_WB]));
>> +
>> +			*dpt_ofs += 8;
>> +			src_idx++;
>> +		}
>> +
>> +		/* The DE ignores the PTEs for the padding tiles */
>> +		*dpt_ofs += (dst_stride - width) * 8;
>> +	}
>> +
>> +	/* Align to next page */
>> +	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
> 
> The use of 4096 here is unclear.
> 
> Should this value be XE_PAGE_SIZE?

I earlier was not certain about this so I checked with Maarten and he 
confirmed this is not about XE_PAGE_SIZE but gtt mapping size so each 
entry is 4k. Agreed there are lot of these magic numbers which at some 
point will likely be defined but it's not in the scope of this patch.

/Juha-Pekka

> 
> If not, or updated with this value,
> 
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> 
> 
>> +}
>> +
>>   static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
>>   			       const struct i915_gtt_view *view,
>>   			       struct i915_vma *vma)
>> @@ -57,6 +88,9 @@ static int __xe_pin_fb_vma_dpt(struct
>> intel_framebuffer *fb,
>>    	if (view->type == I915_GTT_VIEW_NORMAL)
>>   		dpt_size = ALIGN(size / XE_PAGE_SIZE * 8, XE_PAGE_SIZE);
>> +	else if (view->type == I915_GTT_VIEW_REMAPPED)
>> +		dpt_size =
>> ALIGN(intel_remapped_info_size(&fb->remapped_view.gtt.remapped) * 8,
>> +				 XE_PAGE_SIZE);
>>   	else
>>   		/* display uses 4K tiles instead of bytes here, convert to
>> entries.. */
>>   		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
>> @@ -89,6 +123,18 @@ static int __xe_pin_fb_vma_dpt(struct
>> intel_framebuffer *fb,
>>    			iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
>>   		}
>> +	} else if (view->type == I915_GTT_VIEW_REMAPPED) {
>> +		const struct intel_remapped_info *remap_info = &view-
>>> remapped;
>> +		u32 i, dpt_ofs = 0;
>> +
>> +		for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++)
>> +			write_dpt_remapped(bo, &dpt->vmap, &dpt_ofs,
>> +					   remap_info->plane[i].offset,
>> +					   remap_info->plane[i].width,
>> +					   remap_info->plane[i].height,
>> +					   remap_info->plane[i].src_stride,
>> +					   remap_info->plane[i].dst_stride);
>> +
>>   	} else {
>>   		const struct intel_rotation_info *rot_info = &view->rotated;
>>   		u32 i, dpt_ofs = 0;
>> @@ -212,12 +258,6 @@ static struct i915_vma *__xe_pin_fb_vma(struct
>> intel_framebuffer *fb,
>>   	if (!vma)
>>   		return ERR_PTR(-ENODEV);
>>   -	/* Remapped view is only required on ADL-P, which xe doesn't support.
>> */
>> -	if (XE_WARN_ON(view->type == I915_GTT_VIEW_REMAPPED)) {
>> -		ret = -ENODEV;
>> -		goto err;
>> -	}
>> -
>>   	if (IS_DGFX(to_xe_device(bo->ttm.base.dev)) &&
>>   	    intel_fb_rc_ccs_cc_plane(&fb->base) >= 0 &&
>>   	    !(bo->flags & XE_BO_NEEDS_CPU_ACCESS)) {
>> --
>> 2.25.1
> 

