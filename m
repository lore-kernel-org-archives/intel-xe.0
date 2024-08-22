Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19FCC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 13:58:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0BF10EAB2;
	Thu, 22 Aug 2024 13:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F3W8MGNP";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3426F10EA8F
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 13:58:05 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-428243f928fso8469385e9.0
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 06:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724335083; x=1724939883; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:reply-to
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=FHalTTA2FuGZnPvxNdNsyRZDjFksIYDDXRDZy3reUX4=;
 b=F3W8MGNPpYewsmIoyNvKyvdajOEp0JJ+LS4M4MXghtCnvCLmE371h+ABkhN8ePaU1J
 vL0JN0zV0RuC+1zWggReD3XvWfkwB2lfCOipQ4TfbzzqkW7dBvrVz2GS/+GKEyQmnG+I
 Yz4OZjN/qNODIUWLzyrWUSYg8jbzLtM49ej+oNB3yxssKykXjBw4aKs/ni6YqmrAobbY
 rWM3Jcq+kp8cz+C59aI7LFZ/8yswb71sGQyolmf27G2/GiCm/v7Fqy0WJS94oviB8OxI
 p+Dh2m1iH4JSP4w5DwS0mxTVg5AvgHqIsa/pzQNdHQaa6wRJSfqK3io/ME1X3sOU7awa
 EwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724335083; x=1724939883;
 h=content-transfer-encoding:in-reply-to:from:reply-to
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FHalTTA2FuGZnPvxNdNsyRZDjFksIYDDXRDZy3reUX4=;
 b=Z//PwLmyH6Ekm+plKa3lzTTEuJw0WtOjeFOBMUN4KYJuIXrLgaLyqFRzsjMz3Egrir
 9LadvbxfrI7vL7L3ZuXDa80B+KuOeWWIJRd7Wa5BQzwhzgnqg9U/mLnsLtAN/Vn0BQz9
 guWsSjKLIILSVoSohAfxpz9w7wPkkliagyZAZzHyGvAt656bS65lGra03EkO3e7aSfVT
 OmWQxi4Z1FG0XHexkpvn9FEW9LO0DaiPANe/TnYn2A7oZRrJAHZkvkORzojCoEZ63w7/
 KM+sh88U4PFXEMi66n44BF/H/l1eO8XyZD5itQeBpaP32m9+LXQ2cr5u59nVdAQk8L7Y
 Y4BA==
X-Gm-Message-State: AOJu0YxoZEjKensGN0Ovbj0dt2rWMu7C9NdGFWowAcuGswNZNA0Ssq5U
 Gnp7BYRlQSN7ylemyhHfR5NvYc7OUYSNEjIUMcGPNyH+giL1cttQ69cArdhQ2De/+Q==
X-Google-Smtp-Source: AGHT+IHKH3SGB056K7cFL5kQWwMzZB9B0ETS0MsHfiZiFcqz0v+44E0sVLc1tZ/q4sl4rXNqPJe2EQ==
X-Received: by 2002:a05:600c:3546:b0:426:6f87:65fc with SMTP id
 5b1f17b1804b1-42ac55df623mr18602045e9.17.1724335083276; 
 Thu, 22 Aug 2024 06:58:03 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42ac624bb23sm21105995e9.32.2024.08.22.06.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Aug 2024 06:58:02 -0700 (PDT)
Message-ID: <5271653f-bf93-4b79-9d26-f2e4f51d212b@gmail.com>
Date: Thu, 22 Aug 2024 16:57:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe: Align all 64k VRAM buffers physically when
 multiple of 64k.
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20240821205637.552424-1-maarten.lankhorst@linux.intel.com>
 <20240821205637.552424-2-maarten.lankhorst@linux.intel.com>
 <20240822121230.bwkl5txsawu3tkn6@zkempczy-mobl2>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240822121230.bwkl5txsawu3tkn6@zkempczy-mobl2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 22.8.2024 15.12, Zbigniew Kempczyński wrote:
> On Wed, Aug 21, 2024 at 10:56:35PM +0200, Maarten Lankhorst wrote:
>> For CCS formats on affected platforms, CCS can be used freely, but
>> display engine requires a multiple of 64k physical pages. No other
>> changes are needed.
>>
>> At the BO creation time we don't know if the BO will be used for CCS
>> or not. If the scanout flag is set, and the BO is a multiple of 64k,
>> we take the safe route and force the physical alignment of 64k pages.
>>
>> If the BO is not a multiple of 64k, or the scanout flag was not set
>> at BO creation, we reject it for usage as CCS in display. The physical
>> pages are likely not aligned correctly, and this will cause corruption
>> when used as FB.
>>
>> This is a slightly different approach from my previous patch. Instead
>> of requiring a scanout flag at FB creation, we now make all buffers of
>> the right size physically aligned correctly, so no change from userspace
>> is needed.
>>
>> It will be interesting to see if it affects performance in any way,
>> could potentially even improve things with 64k PTE's.
>>
>> Inspired by Zbigniews patch.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Co-developed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
>> ---
>>   drivers/gpu/drm/xe/display/intel_fb_bo.c |  6 ++++++
>>   drivers/gpu/drm/xe/xe_bo.c               | 10 ++++++++++
>>   drivers/gpu/drm/xe/xe_device_types.h     |  1 +
>>   drivers/gpu/drm/xe/xe_vm.c               |  3 ++-
>>   4 files changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/intel_fb_bo.c b/drivers/gpu/drm/xe/display/intel_fb_bo.c
>> index f835492f73fb4..407367719abe2 100644
>> --- a/drivers/gpu/drm/xe/display/intel_fb_bo.c
>> +++ b/drivers/gpu/drm/xe/display/intel_fb_bo.c
>> @@ -7,6 +7,7 @@
>>   #include <drm/ttm/ttm_bo.h>
>>   
>>   #include "intel_display_types.h"
>> +#include "intel_fb.h"
>>   #include "intel_fb_bo.h"
>>   #include "xe_bo.h"
>>   
>> @@ -28,6 +29,11 @@ int intel_fb_bo_framebuffer_init(struct intel_framebuffer *intel_fb,
>>   	struct xe_device *xe = to_xe_device(bo->ttm.base.dev);
>>   	int ret;
>>   
>> +	if (XE_IOCTL_DBG(xe, intel_fb_is_ccs_modifier(mode_cmd->modifier[0]) &&
>> +			     (xe->info.vram_flags & XE_VRAM_FLAGS_DISPLAY_NEED64K_CCS) &&
>> +			     !(bo->flags & XE_BO_FLAG_NEEDS_64K)))
>> +		return -EINVAL;
> 
> Sth is wrong with intel_fb_is_ccs_modifier(), it is returning false for
> kms_ccs crc-primary-basic-4-tiled-bmg-ccs subtest and is not falling
> here.

This is because these new modifiers are CCS modifiers only in the name 
for UMDs sake. From kernel pov they're just the regular Tile4 as per 
spec. If I mark them as CCS modifiers for kernel then there's needed 
special casing for every place where intel_fb_is_ccs_modifier() is used.

/Juha-Pekka

> 
>> +>  	xe_bo_get(bo);
>>   
>>   	ret = ttm_bo_reserve(&bo->ttm, true, false, NULL);
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 6ed0e19552159..3a753f4644cb6 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -2017,6 +2017,16 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>>   	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
>>   		bo_flags |= XE_BO_FLAG_SCANOUT;
>>   
>> +	/*
>> +	 * Lets see what happens if we simply align any buffer that's
>> +	 * a multiple of 64k to 64k in places where it's not officially
>> +	 * needed.
>> +	 */
>> +	if ((bo_flags & XE_BO_FLAG_VRAM_MASK) &&
>> +	    !(xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) &&
>> +	    !(args->size % SZ_64K))
>> +		bo_flags |= XE_BO_FLAG_NEEDS_64K;
>> +
>>   	bo_flags |= args->placement << (ffs(XE_BO_FLAG_SYSTEM) - 1);
>>   
>>   	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM) {
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 5ed6f5434f42c..12ddab91a01c0 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -47,6 +47,7 @@ struct xe_pat_ops;
>>   #define HAS_HECI_CSCFI(xe) ((xe)->info.has_heci_cscfi)
>>   
>>   #define XE_VRAM_FLAGS_NEED64K		BIT(0)
>> +#define XE_VRAM_FLAGS_DISPLAY_NEED64K_CCS	BIT(1)
>>   
>>   #define XE_GT0		0
>>   #define XE_GT1		1
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index d1bfd0b6e9558..af215f6d6588b 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2878,7 +2878,8 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>>   		return -EINVAL;
>>   	}
>>   
>> -	if (bo->flags & XE_BO_FLAG_INTERNAL_64K) {
>> +	if ((bo->flags & XE_BO_FLAG_INTERNAL_64K) &&
>> +	    (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)) {
>>   		if (XE_IOCTL_DBG(xe, obj_offset &
>>   				 XE_64K_PAGE_MASK) ||
>>   		    XE_IOCTL_DBG(xe, addr & XE_64K_PAGE_MASK) ||
>> -- 
>> 2.45.2
>>

