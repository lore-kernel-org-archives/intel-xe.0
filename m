Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0586DE81DFE
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 13:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C994710E4EB;
	Fri,  6 Oct 2023 13:43:00 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339FF10E4EB
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 13:42:59 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-325e9cd483eso2030764f8f.2
 for <intel-xe@lists.freedesktop.org>; Fri, 06 Oct 2023 06:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696599777; x=1697204577; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=E+G6Pdj3ewtpRdA/PsfBUUWDrkHge76FUCCnmcW57zo=;
 b=eRBacrEODeYxzcrD2yn3Ub53RhRjQHYixw1dY7gGQgg9Zsj+ECKkwejHudBmQY6Y9O
 Niie8Q3XX/Uc8hufJ+fWUcSM9a7BtF7ZCLEmnfw498t+u9CWXjfTwEKBvL3bRzWGeCzF
 uSYeFfsxrZMoE97VqT+g4xrOU5y7NgUJOsBncNmcS8dr08AqqkRl482qZlID6YMJl05t
 z7VvbQTwHn/KlTlea53KhPYlPggB7CRJGQNJcuCZZMFG6T/MiIOHYodfjcjYnTom1u+U
 82QnkuiME0bcQ7d6W50mwj9CS2bOPVr4RFjdPt6F40t7084RAIs5704MsnO2JUFX6sT+
 K2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696599777; x=1697204577;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E+G6Pdj3ewtpRdA/PsfBUUWDrkHge76FUCCnmcW57zo=;
 b=fKgJ2kVQrpYlEpLA9Q9yoBGB7+mSlIXW+WWsDAVMvhj4peHM8oJFi5W3s/W0IrbJTJ
 MJQcSeCG8PnwGFxY+YPPIu2F/WBW/Dzy/6qpHIlX3yS8iWFifNqQ2afv/p7NLswvzeJ0
 RuKY+fyduiUv1x2xkor1Okvm53pSOUoGFdt4/qKCnrnZG1IgsXJngj5NYXFouPisVrtq
 o8yQZfUbvVIA+V1Rl2BI6455gOpKaqUyN/mAZ+N6Yp7OQ0jIbreYfeXatlrPDG8PNu+G
 VfL9t6jSU7rp/5+XUqsiAUVyiTdNuBI4gCXQwH0/I3XJgMy7jXFLUMHZqAMGwn+dLVlz
 nv3A==
X-Gm-Message-State: AOJu0YwRyjeztvoDDMZoPlrGkYz8skEv1kzVcud9QFPlOGH1t9U8tMrv
 u/VksJo795WhmjK+Uxo1lMw=
X-Google-Smtp-Source: AGHT+IGD2kGKnjS/24IFgwR+AVaZO9Na7v01xrTAJA8Qy6KlgkP6dtObGIB9U6r4dJBvk4JuFOpV6A==
X-Received: by 2002:a5d:484a:0:b0:320:1d1:71c4 with SMTP id
 n10-20020a5d484a000000b0032001d171c4mr7725829wrs.23.1696599777036; 
 Fri, 06 Oct 2023 06:42:57 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.86])
 by smtp.googlemail.com with ESMTPSA id
 j35-20020a05600c1c2300b003fe15ac0934sm2367087wms.1.2023.10.06.06.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Oct 2023 06:42:56 -0700 (PDT)
Message-ID: <f9b72a0b-1698-fef1-02bf-f15412756889@gmail.com>
Date: Fri, 6 Oct 2023 16:42:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231005183404.324835-1-juhapekka.heikkila@gmail.com>
 <20231005183404.324835-4-juhapekka.heikkila@gmail.com>
 <IA1PR11MB6418356D73CC092531E3D8BAC1CAA@IA1PR11MB6418.namprd11.prod.outlook.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <IA1PR11MB6418356D73CC092531E3D8BAC1CAA@IA1PR11MB6418.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v3 3/3] drm/xe/display: Don't try to use vram
 if not available
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

On 5.10.2023 21.56, Ruhl, Michael J wrote:
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Juha-
>> Pekka Heikkila
>> Sent: Thursday, October 5, 2023 2:34 PM
>> To: intel-xe@lists.freedesktop.org
>> Subject: [Intel-xe] [PATCH v3 3/3] drm/xe/display: Don't try to use vram if not
>> available
>>
>> Trying to get bo from vram when vram not available will cause
>> WARN_ON() hence avoid touching vram if not available.
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>> drivers/gpu/drm/xe/display/xe_fb_pin.c | 11 ++++++-----
>> 1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> index e8e38091c8e6..a79c2416579f 100644
>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> @@ -83,7 +83,7 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer
>> *fb,
>> 	struct xe_device *xe = to_xe_device(fb->base.dev);
>> 	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
>> 	struct xe_ggtt *ggtt = tile0->mem.ggtt;
>> -	struct xe_bo *bo = intel_fb_obj(&fb->base), *dpt;
>> +	struct xe_bo *bo = intel_fb_obj(&fb->base), *dpt = ERR_PTR(-EINVAL);
>> 	u32 dpt_size, size = bo->ttm.base.size;
>>
>> 	if (view->type == I915_GTT_VIEW_NORMAL)
>> @@ -96,10 +96,11 @@ static int __xe_pin_fb_vma_dpt(struct
>> intel_framebuffer *fb,
>> 		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
>> 				 XE_PAGE_SIZE);
>>
>> -	dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
>> -				  ttm_bo_type_kernel,
>> -				  XE_BO_CREATE_VRAM0_BIT |
>> -				  XE_BO_CREATE_GGTT_BIT);
>> +	if (tile0->mem.vram.usable_size)
>> +		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
>> +					   ttm_bo_type_kernel,
>> +					   XE_BO_CREATE_VRAM0_BIT |
>> +					   XE_BO_CREATE_GGTT_BIT);
>> 	if (IS_ERR(dpt))
> 
> Hmm, seems like just 'else' here would be sufficient (if _size) vram0 else sysmem) ?

That's good idea, I'll send new version.

> 
> It also seems like maybe this check should be in the xe_bo_create_pin_map function?
> I.e. validate that the requested region bit is valid before creating the bo?
> 
> That would let you keep the pattern for the IS_ERR without the init..

This I didn't quite understand, I'm still new to how things work on Xe.

/Juha-Pekka

> 
> Just some thoughts.
> 
> M
> 
>> 		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
>> 					   ttm_bo_type_kernel,
>> --
>> 2.25.1
> 

