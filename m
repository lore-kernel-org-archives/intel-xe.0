Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D36C54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 19:17:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD4910F38C;
	Thu, 14 Mar 2024 19:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nefsyn5j";
	dkim-atps=neutral
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87FB810F9D0
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 19:17:45 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-563c595f968so1748793a12.0
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 12:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710443864; x=1711048664; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=3ZhzbajSi0eNhbPPNhshTMy+0Fic2MeSQi61SNXVtks=;
 b=Nefsyn5juH90PsBqP3d5nUClJWz/7IRCsGBAIuEvr96QNjNMdz47ZBfn1qEPSxtWsb
 /u+dPRtX173qLaQchy7/xTZ4n8ilKv2WEHHKQrv3EWQUPMYAYuML493mbpODVXJf4sFy
 8QoKblpanSo0JjbQFJdgmd6uMyIWtF544/iwX70N/5gaOCLjv38rSvl3StOVcUq6N+R0
 JCYJNjaZRp9PsK0hLr/BHj0samK9cppfpaXBhOLgfvEJmnxBeYQwn4CeFikDilz1+Wkx
 p+IujJSqKvsW52l8nx84ag4GnojL+htDPARTTUekVztDQD4Fk8HbBU45mjLxKRtakK/y
 Dl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710443864; x=1711048664;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3ZhzbajSi0eNhbPPNhshTMy+0Fic2MeSQi61SNXVtks=;
 b=bOu2xCSVthWWXaPka0aXrMf3Rbu6dh68JV9S0dwV5HHJSzl7EYDXZI5L05UtM8PPa7
 /Tw+Zg80KpnJaTwNCMTAkstU3t//l2zMUqMWhWN/9g+d0FsCHGoWIl1WwjaN0P1DkzRm
 qMUqlOzcwwTDRLDauyE481g067Dg4mbOl5roe3/lK7cmM/P61e7DBHIQL9yQi2z9Zubi
 61WkBJOipfE6oU0h7eMoc/nhZRgoqUpU9tUkahMHPYC4/8jvvym4t0SPR5Du7mMnS7yh
 pV2hiHoywrBja8rGTN5FOZvlFRsNl/EwOXVeu3SzY3iPvVIswrL/QpSkuVMieq7QW9ui
 7mug==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8p8udinIhhguWb6Om8pDPw0bx/zIgAaiygf+97ZgOiaoFlHC+SdWwCIV2OvrbmHDg5gp39kloBK5tR3PFe6nZ6eizig+7O5YctZIRQvQ=
X-Gm-Message-State: AOJu0Yw1esitrxNU2XrTwjeJpcIN470okOJDsWJktKawO6QqNh2LxcTk
 YDvBjmXDN1/3z+XPXr31w7v9fYNwEfaYn/6Jurlq4UpYo/EeL2zqzMC9NKg2W5oGmw==
X-Google-Smtp-Source: AGHT+IFAlgppbJhSVV3BEczMVfp7hm14GvZV70RPkT5F0ZdoT6cxxMm2FFFEVezww1UO2vYs3lMPXg==
X-Received: by 2002:a05:6402:530f:b0:568:a67f:34af with SMTP id
 eo15-20020a056402530f00b00568a67f34afmr1159168edb.17.1710443863574; 
 Thu, 14 Mar 2024 12:17:43 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.84])
 by smtp.googlemail.com with ESMTPSA id
 o1-20020aa7dd41000000b00568830944f9sm970237edw.19.2024.03.14.12.17.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 12:17:43 -0700 (PDT)
Message-ID: <a14651ca-1f4a-462d-b6d1-daa3694e47b8@gmail.com>
Date: Thu, 14 Mar 2024 21:17:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/display: mark dpt as uncached
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20240314162054.75751-1-juhapekka.heikkila@gmail.com>
 <4c12d45a-366d-454e-ba1d-af813732c551@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <4c12d45a-366d-454e-ba1d-af813732c551@intel.com>
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

On 14.3.2024 19.05, Matthew Auld wrote:
> On 14/03/2024 16:20, Juha-Pekka Heikkila wrote:
>> make dpt as uncached to avoid pipe faults on some devices
> 
> s/make/Mark/
> 
> Also missing full stop.
> 
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> 
> Did this help on ADL btw? I don't think there are any PAT bits in the 
> GGTT on that hw so this just noops, right? Or am I misremembering...

adlp go through here setting up dpt..but turn out there was bit of 
mismatch is results. I don't have proper hw to test and my friend 
initially thought this fixed dpt issues on adlp. Turn out he had changed 
fbdev configs that affected results, which maybe point towards some 
issue on stolen. I'll yet need to ask for more logs from him.

> 
> In addition to this I think we might also want something like:
> https://patchwork.freedesktop.org/series/131148/
> 
>> ---
>>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c 
>> b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> index 722c84a56607..98592994c8d4 100644
>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> @@ -30,7 +30,7 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map 
>> *map, u32 *dpt_ofs, u32 bo_
>>           for (row = 0; row < height; row++) {
>>               u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * 
>> XE_PAGE_SIZE,
>> -                                  xe->pat.idx[XE_CACHE_WB]);
>> +                                  xe->pat.idx[XE_CACHE_NONE]);
>>               iosys_map_wr(map, *dpt_ofs, u64, pte);
>>               *dpt_ofs += 8;
>> @@ -62,7 +62,7 @@ write_dpt_remapped(struct xe_bo *bo, struct 
>> iosys_map *map, u32 *dpt_ofs,
>>           for (column = 0; column < width; column++) {
>>               iosys_map_wr(map, *dpt_ofs, u64,
>>                        pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
>> -                     xe->pat.idx[XE_CACHE_WB]));
>> +                     xe->pat.idx[XE_CACHE_NONE]));
>>               *dpt_ofs += 8;
>>               src_idx++;
>> @@ -119,7 +119,7 @@ static int __xe_pin_fb_vma_dpt(struct 
>> intel_framebuffer *fb,
>>           for (x = 0; x < size / XE_PAGE_SIZE; x++) {
>>               u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x * XE_PAGE_SIZE,
>> -                                  xe->pat.idx[XE_CACHE_WB]);
>> +                                  xe->pat.idx[XE_CACHE_NONE]);
>>               iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
>>           }
>> @@ -165,7 +165,7 @@ write_ggtt_rotated(struct xe_bo *bo, struct 
>> xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo
>>           for (row = 0; row < height; row++) {
>>               u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * 
>> XE_PAGE_SIZE,
>> -                                  xe->pat.idx[XE_CACHE_WB]);
>> +                                  xe->pat.idx[XE_CACHE_NONE]);
>>               xe_ggtt_set_pte(ggtt, *ggtt_ofs, pte);
>>               *ggtt_ofs += XE_PAGE_SIZE;
>> @@ -211,7 +211,7 @@ static int __xe_pin_fb_vma_ggtt(struct 
>> intel_framebuffer *fb,
>>           for (x = 0; x < size; x += XE_PAGE_SIZE) {
>>               u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x,
>> -                                  xe->pat.idx[XE_CACHE_WB]);
>> +                                  xe->pat.idx[XE_CACHE_NONE]);
> 
> This looks unrelated to DPT? Maybe tweak the commit title/message.
> 
> Anyway, I think change looks reasonable since you usually don't want to 
> mess around with caching for display stuff.
> 
> With commit title/message tweaked,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Thanks

/Juha-Pekka

> 
>>               xe_ggtt_set_pte(ggtt, vma->node.start + x, pte);
>>           }

