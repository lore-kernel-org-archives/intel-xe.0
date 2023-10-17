Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81846CDB474
	for <intel-xe@archiver.kernel.org>; Tue, 17 Oct 2023 11:13:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F0610E2CD;
	Tue, 17 Oct 2023 11:13:24 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B89510E2CD
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Oct 2023 11:13:21 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-53f3609550bso24795a12.1
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Oct 2023 04:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697541200; x=1698146000; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Qbtw3xOL5H/XmWax2scGobg4PRVF07CxIih1u7kosrg=;
 b=d+PP6M+JZil6yrmhkt+6Tf46oX/ZFy1YQZ+AoTviwYBdVlUhwHJhgI8w7Bf9TFrBHs
 7OCxDQ1KJCW7U8CPyZO+DT/Y2UG8kxwb/urdEKz2r6wmjBdGMCv9K9Zr5q+BQAbChVhB
 iu7bVQDXaGHiZJpo3EDNrYL4mgn6PaW8bdTbjqXSmvYrORz/Iw5E+0aE9G63cNo14NOE
 t0n7/7pwctp9jIi0G45ArbwYFQ58Vv74eA1ehbCnByZM3P2F3f20ZEMLoU3NRt2SupVX
 C377gBFuSlC/Xy2BG4YdfbCsJZQ/4F8fCT8DiNS2tFSZCWVBsTgDDX8749qG2jQCQx/B
 3SUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697541200; x=1698146000;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qbtw3xOL5H/XmWax2scGobg4PRVF07CxIih1u7kosrg=;
 b=IsPL/Rm/LW3TYeUgQZuhpoMxkeoITbyWl2ore7/U1x0Aq6sIwrEfSTJJ/01HrucU6Q
 fODJT4aBrSoov79sQ/Xyw+xeCwzCinP/tlbE+cKfkbk/twzzTXpMeObNasJ7QnC1WOxg
 0qZoTSlyuUeCbithzc6CTbx1YEM1feQAAn+DqS6Wo1HlhEROgio8B4ML8CIyi97zugvf
 m/j5q9aGJ7VjvVXrjsFki/nW+djP+7cT0+nufwVt7VMG1xyzdtdTmieNloS0gpKPRhWl
 VB9kBxQhanu9iPSaHKza6RlFazEU8rksDaMGA/IshJzN95FMsdWxS8qhI9vzoPp12iCa
 wEgQ==
X-Gm-Message-State: AOJu0Yw1ERVP/HDDl+C7V6WE5eb2uVL3pBsRYJIBj910SKYHnIY2A4Sy
 sAPUAglm/We815d2hSiQd8U=
X-Google-Smtp-Source: AGHT+IFulDlfyLNFAc2D7BECGGPIJxMGozQ8WvwGj5RUOiT7zWRloZ1yJsL96FxsZ9NN6oyS1VBYjg==
X-Received: by 2002:a17:907:98e:b0:9a1:891b:6eed with SMTP id
 bf14-20020a170907098e00b009a1891b6eedmr1550406ejc.76.1697541199976; 
 Tue, 17 Oct 2023 04:13:19 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.87])
 by smtp.googlemail.com with ESMTPSA id
 ze12-20020a170906ef8c00b009929d998abcsm1032307ejb.209.2023.10.17.04.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Oct 2023 04:13:19 -0700 (PDT)
Message-ID: <0172bc2f-fab4-4141-9012-fc8c3085f38e@gmail.com>
Date: Tue, 17 Oct 2023 14:13:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231012135209.403827-2-juhapekka.heikkila@gmail.com>
 <a3b00b7b-266f-4c46-1af3-401aabce2134@gmail.com>
 <IA1PR11MB64181E4AB368B7C1B2F92C93C1D7A@IA1PR11MB6418.namprd11.prod.outlook.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <IA1PR11MB64181E4AB368B7C1B2F92C93C1D7A@IA1PR11MB6418.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v6 1/2] drm/xe/display: Don't try to use vram
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

On 16.10.2023 18.03, Ruhl, Michael J wrote:
>> -----Original Message-----
>> From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Sent: Monday, October 16, 2023 10:54 AM
>> To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>> Subject: Fwd: [PATCH v6 1/2] drm/xe/display: Don't try to use vram if not
>> available
>>
>> Trying to get bo from vram when vram not available will cause
>> WARN_ON() hence avoid touching vram if not available.
>>
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 11 ++++++-----
>>   1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> index 2c36e5032433..89cf65c58191 100644
>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> @@ -62,11 +62,12 @@ static int __xe_pin_fb_vma_dpt(struct
>> intel_framebuffer *fb,
>>   		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
>>   				 XE_PAGE_SIZE);
>>   -	dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
>> -				  ttm_bo_type_kernel,
>> -				  XE_BO_CREATE_VRAM0_BIT |
>> -				  XE_BO_CREATE_GGTT_BIT);
>> -	if (IS_ERR(dpt))
>> +	if (IS_DGFX(xe))
>> +		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
>> +					   ttm_bo_type_kernel,
>> +					   XE_BO_CREATE_VRAM0_BIT |
>> +					   XE_BO_CREATE_GGTT_BIT);
>> +	else
>>   		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
>>   					   ttm_bo_type_kernel,
>>   					   XE_BO_CREATE_STOLEN_BIT |
> 
> Hi Juha,
> 
> You have changed this code from:
> 
> "Best effort allocation" (try vram, and then fallback to stolen), to "Discrete gets vram, !discrete gets
> stolen".

Hi Michael,

this is correct. vram is for discrete and stolen is found on integrated. 
Earlier pattern was copied from i915 way of setting up display page 
table but it had to be changed because asking for vram on Xe while on 
discrete will cause WARN_ON() hence exact same pattern from i915 
couldn't be used.

/Juha-Pekka

> 
> If this is correct:
> 
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> 
> Is this new sematic the "correct" allocation method?
> 
> Thanks,
> 
> Mike
> 
> 
>> --
>> 2.25.1
> 

