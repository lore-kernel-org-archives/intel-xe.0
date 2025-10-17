Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E90CCD195
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 22:18:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DE710E1BD;
	Fri, 17 Oct 2025 22:18:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="guIvFWEk";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070B310E1BD
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 22:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760739504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PWbT81A2gFENMtPrN9qUwjqJwpk199Zt7kKsVBssYtg=;
 b=guIvFWEklJ7ppHqQGW0BSk9W2ALw1MFiS0fnh7GpOUIrjBTXFgaOkclRJUXwgWyJYrq8zM
 TY+IS2+w435L9fdyz14mrthKiYVTtdckxQEor3TfcP0oHIlBRoRkt9bWilMRy0RIu2aMmZ
 Io+yhzqDDHZ9HGGSpFwNNYsROqJBBQ4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-270-ePb3nsqIOpaFXBqdOXDGsQ-1; Fri, 17 Oct 2025 18:18:22 -0400
X-MC-Unique: ePb3nsqIOpaFXBqdOXDGsQ-1
X-Mimecast-MFC-AGG-ID: ePb3nsqIOpaFXBqdOXDGsQ_1760739501
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-427027a2095so2838709f8f.2
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 15:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760739501; x=1761344301;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PWbT81A2gFENMtPrN9qUwjqJwpk199Zt7kKsVBssYtg=;
 b=ESJSvhHghyMf2s/QrCr+FF4cvlS9YVeyx5nuGtF0VDpNPC7G9ShFmF3c9nakXZdLTQ
 UwtgmI7E+cis33cnPCx/OToznedJ77SF73DBipyumCEDD/ucRteY938wjjFG2jUoibXc
 fG3ODCNVd3XdNYYOevcRz6oVhuHP5iNdNP2zLVDa7OasQUyHeLV623sBIDEDeIbfJeaH
 fMDC3vQDc0fkAKxwNXGEiRzszZ0DER+EWAUzmcQyJ+aoU0EVowkhDOIEyEPdXb3V/S/b
 rzlXwczRgIj9qd8uQvSv/btH2xVShiQiW49Fl2NFf6LkNOiyfCVoHB6KJMmw3YODTPsr
 JmfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXdGUEpbmkXbQKWMtslH8Yjr7Z/llnUj4xelscQ2tMQRoQxgQ8mljyp2+hPUHZVRdx5LzJlPrZLA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKQTYWwHRBEjnvWX1U0YA7tcslPtAcU0qVIJI196HWhqbHAsjz
 eu+/PqrAy+tlqjhKA/AhEv/D+I1YJdeleEP6zJtpu3OzRFEktixymshVQEpuQ9kUpl1c062BSlA
 LMQmAQZIiEuDgB7qdQFAnIR2Cij5+PQOhfYhGoGb6t1Ao4l0IB630rRiRnvrA+cISZ/uM
X-Gm-Gg: ASbGncsZ7RHBzkzKjcRp2a9q2OVukP666j3EnW3nVfV7e7CDhGbgnsCAmZS151IIV9m
 Frigs6LcQJnay44o/M5T8eFJE4r6xT/hdPOjKkwXbwq3itJHQJnqHZbyBPMCXhBhZIxpUvCcWSB
 /l7kbzBEQxOtTvHqEJ6GUfFj4ia3z6Oc+kcAD50tzBl89SFTGwoVgyd4kFDquMAOmd/1xthpaCH
 0Cuw81gonWjGaRMcFFzJQg5KKgtLh435PEKwSwTWHE4Wci6MoQd8Qja3PrAYtMN2LU3phxRIBFC
 XopRD8N/eJulFX+slJn0wDN0wxtFC8rRk4fo8/dbxCo6yy2J7zkMiU+FA0KussOhYOLNrWmT3Mo
 /HLSHFz73z2t+uQSjL710yf4hnNBuMdP3RyQ/IAE=
X-Received: by 2002:a05:6000:2389:b0:427:151:3db6 with SMTP id
 ffacd0b85a97d-42704d8e226mr3847172f8f.24.1760739501383; 
 Fri, 17 Oct 2025 15:18:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4cXwC/bBiWyVCfkyHieCkHSPJ4FC799iHkds8A9KDRD6bEgjTx6TDPFiud+Ye7AP3dDZwPg==
X-Received: by 2002:a05:6000:2389:b0:427:151:3db6 with SMTP id
 ffacd0b85a97d-42704d8e226mr3847165f8f.24.1760739500969; 
 Fri, 17 Oct 2025 15:18:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5a1002sm1430845f8f.10.2025.10.17.15.18.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Oct 2025 15:18:20 -0700 (PDT)
Message-ID: <ade5c380-2f43-4c3e-b63e-75d6f384ba6a@redhat.com>
Date: Sat, 18 Oct 2025 00:18:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/display: Make panic support work on vram.
To: Maarten Lankhorst <dev@lankhorst.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
References: <20251016075701.379023-1-jfalempe@redhat.com>
 <20251016075701.379023-3-jfalempe@redhat.com>
 <5e285430-fd5e-4cd1-82b1-2b84b4eb3808@lankhorst.se>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <5e285430-fd5e-4cd1-82b1-2b84b4eb3808@lankhorst.se>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ac7zYEmeaI5zQJVtyOlJFtxLk2CCkDbknWqYM9Xy-i4_1760739501
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 17/10/2025 17:35, Maarten Lankhorst wrote:
> Hey,
> 
> Thanks for resubmitting, wnat me to push it?

Yes, please.

-- 

Jocelyn>
> Best regards,
> ~Maarten Lankhorst
> 
> Den 2025-10-16 kl. 09:52, skrev Jocelyn Falempe:
>> From: Maarten Lankhorst <dev@lankhorst.se>
>>
>> Add a special path for VRAM using xe_res iterators to ensure a panic
>> screen is shown on VRAM as well.
>>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> Acked-by: Jocelyn Falempe <jfalempe@redhat.com>
>> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/xe/display/xe_panic.c | 50 +++++++++++++++++++--------
>>   1 file changed, 36 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_panic.c b/drivers/gpu/drm/xe/display/xe_panic.c
>> index f32b23338331..df663286092a 100644
>> --- a/drivers/gpu/drm/xe/display/xe_panic.c
>> +++ b/drivers/gpu/drm/xe/display/xe_panic.c
>> @@ -8,20 +8,23 @@
>>   #include "intel_fb.h"
>>   #include "intel_panic.h"
>>   #include "xe_bo.h"
>> +#include "xe_res_cursor.h"
>>   
>>   struct intel_panic {
>> -	struct page **pages;
>> +	struct xe_res_cursor res;
>> +	struct iosys_map vmap;
>> +
>>   	int page;
>> -	void *vaddr;
>>   };
>>   
>>   static void xe_panic_kunmap(struct intel_panic *panic)
>>   {
>> -	if (panic->vaddr) {
>> -		drm_clflush_virt_range(panic->vaddr, PAGE_SIZE);
>> -		kunmap_local(panic->vaddr);
>> -		panic->vaddr = NULL;
>> +	if (!panic->vmap.is_iomem && iosys_map_is_set(&panic->vmap)) {
>> +		drm_clflush_virt_range(panic->vmap.vaddr, PAGE_SIZE);
>> +		kunmap_local(panic->vmap.vaddr);
>>   	}
>> +	iosys_map_clear(&panic->vmap);
>> +	panic->page = -1;
>>   }
>>   
>>   /*
>> @@ -46,15 +49,29 @@ static void xe_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int
>>   	new_page = offset >> PAGE_SHIFT;
>>   	offset = offset % PAGE_SIZE;
>>   	if (new_page != panic->page) {
>> -		xe_panic_kunmap(panic);
>> +		if (xe_bo_is_vram(bo)) {
>> +			/* Display is always mapped on root tile */
>> +			struct xe_vram_region *vram = xe_bo_device(bo)->mem.vram;
>> +
>> +			if (panic->page < 0 || new_page < panic->page) {
>> +				xe_res_first(bo->ttm.resource, new_page * PAGE_SIZE,
>> +					     bo->ttm.base.size - new_page * PAGE_SIZE, &panic->res);
>> +			} else {
>> +				xe_res_next(&panic->res, PAGE_SIZE * (new_page - panic->page));
>> +			}
>> +			iosys_map_set_vaddr_iomem(&panic->vmap,
>> +						  vram->mapping + panic->res.start);
>> +		} else {
>> +			xe_panic_kunmap(panic);
>> +			iosys_map_set_vaddr(&panic->vmap,
>> +					    ttm_bo_kmap_try_from_panic(&bo->ttm,
>> +								       new_page));
>> +		}
>>   		panic->page = new_page;
>> -		panic->vaddr = ttm_bo_kmap_try_from_panic(&bo->ttm,
>> -							  panic->page);
>> -	}
>> -	if (panic->vaddr) {
>> -		u32 *pix = panic->vaddr + offset;
>> -		*pix = color;
>>   	}
>> +
>> +	if (iosys_map_is_set(&panic->vmap))
>> +		iosys_map_wr(&panic->vmap, offset, u32, color);
>>   }
>>   
>>   struct intel_panic *intel_panic_alloc(void)
>> @@ -68,6 +85,12 @@ struct intel_panic *intel_panic_alloc(void)
>>   
>>   int intel_panic_setup(struct intel_panic *panic, struct drm_scanout_buffer *sb)
>>   {
>> +	struct intel_framebuffer *fb = (struct intel_framebuffer *)sb->private;
>> +	struct xe_bo *bo = gem_to_xe_bo(intel_fb_bo(&fb->base));
>> +
>> +	if (xe_bo_is_vram(bo) && !xe_bo_is_visible_vram(bo))
>> +		return -ENODEV;
>> +
>>   	panic->page = -1;
>>   	sb->set_pixel = xe_panic_page_set_pixel;
>>   	return 0;
>> @@ -76,5 +99,4 @@ int intel_panic_setup(struct intel_panic *panic, struct drm_scanout_buffer *sb)
>>   void intel_panic_finish(struct intel_panic *panic)
>>   {
>>   	xe_panic_kunmap(panic);
>> -	panic->page = -1;
>>   }
> 

