Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E461CDB474
	for <intel-xe@archiver.kernel.org>; Tue, 17 Oct 2023 13:37:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352AC10E03A;
	Tue, 17 Oct 2023 13:37:32 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A413310E03A
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Oct 2023 13:37:29 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40806e40fccso4255065e9.2
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Oct 2023 06:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697549848; x=1698154648; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=+Pk55zvf1x02wioe9BcWgyGGLMy2u5y7rE1EMXWvAoQ=;
 b=YGq/wXgP4Nm2lxrAgis0Nxs7QB0oFN5nM0wD+8vKWFatzL/veWevK1p7dE6BG80gix
 kpcIp1zRARLUjxH0D39rZxGgMIH2282w7z4gNe8K0sH5W7TnPnLS/R6GvmPUvpGBTaEo
 h4/Rg5nyGel8jPGLWbANk4TGLUuWPDaSJ1E0+2jccBd6JayI6RdBzY4f+fftgLtg41sd
 Zisiyj8Rtnyf2fDuaLz5qRIWksvJeznQhNje5Lmx3iT/DEppceNuIpVYczaDFyqYuJIE
 g1tOXi3Rfn5pWigdiPd2CU7YE9zNReVWpDSJdWu9PYPxfYdABP6pVWFUfIWBXopUx997
 Cy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697549848; x=1698154648;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Pk55zvf1x02wioe9BcWgyGGLMy2u5y7rE1EMXWvAoQ=;
 b=cRIzHSNEDzNZeKc/lZpfGa1nJB5RnjNja1tbcLBvgB1sTAE4PxFBh87QKRHbl4pyKk
 ZH95lfCshtE5f4Rc6g7Yx9BMzwINg6ZwRj1EQj2ZOT09DHpyWkgdIQVHXXZH9jROd/Qu
 jkXrkSslhJcJugBfamgenWvbabnhGzJvCkOoor2HB9/Q4mGaV4LE6LqXZl396+95n+dK
 mQ7dPKojrD5X+3sb8RHiJKWNjzarzocWKC9ZjpXn1KRlAKAVw7PMDpabNnnOGM1f/Ejw
 9DjXWDy/d0cTAuMaXWTQCrbXNE9u/1xmbFvgNDqhCax2UWjM0WczAN0knvA4hyYRI7Vc
 92lw==
X-Gm-Message-State: AOJu0Yx+MC0AqUleKbKfmIzj4TgWdsPOHhPw3HTSNk/5ofMmDYFQ4RB+
 3GvPEuv9moRrjSftTVBu5/bn5AulEPzsQQ==
X-Google-Smtp-Source: AGHT+IFhdsjd1LDaWBpwOvbxkWvrRwxIKK+zpW4JLK6E7EMEjNm0hbVhChZLW2dIToRRDJNjprX6+w==
X-Received: by 2002:a05:600c:4744:b0:406:61c6:30b8 with SMTP id
 w4-20020a05600c474400b0040661c630b8mr1790366wmo.22.1697549847780; 
 Tue, 17 Oct 2023 06:37:27 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.87])
 by smtp.googlemail.com with ESMTPSA id
 y19-20020a1c4b13000000b00401bbfb9b2bsm300497wma.0.2023.10.17.06.37.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Oct 2023 06:37:27 -0700 (PDT)
Message-ID: <8ea7121e-bfb5-c537-9b40-825d1080fcb7@gmail.com>
Date: Tue, 17 Oct 2023 16:37:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231012135209.403827-2-juhapekka.heikkila@gmail.com>
 <a3b00b7b-266f-4c46-1af3-401aabce2134@gmail.com>
 <IA1PR11MB64181E4AB368B7C1B2F92C93C1D7A@IA1PR11MB6418.namprd11.prod.outlook.com>
 <0172bc2f-fab4-4141-9012-fc8c3085f38e@gmail.com>
 <IA1PR11MB641823F87ED59A4E4D2DC04CC1D6A@IA1PR11MB6418.namprd11.prod.outlook.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <IA1PR11MB641823F87ED59A4E4D2DC04CC1D6A@IA1PR11MB6418.namprd11.prod.outlook.com>
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

On 17.10.2023 14.38, Ruhl, Michael J wrote:
>> -----Original Message-----
>> From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> Sent: Tuesday, October 17, 2023 7:13 AM
>> To: Ruhl, Michael J <michael.j.ruhl@intel.com>; intel-xe@lists.freedesktop.org
>> Subject: Re: [PATCH v6 1/2] drm/xe/display: Don't try to use vram if not
>> available
>>
>> On 16.10.2023 18.03, Ruhl, Michael J wrote:
>>>> -----Original Message-----
>>>> From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>>> Sent: Monday, October 16, 2023 10:54 AM
>>>> To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>>>> Subject: Fwd: [PATCH v6 1/2] drm/xe/display: Don't try to use vram if not
>>>> available
>>>>
>>>> Trying to get bo from vram when vram not available will cause
>>>> WARN_ON() hence avoid touching vram if not available.
>>>>
>>>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/display/xe_fb_pin.c | 11 ++++++-----
>>>>    1 file changed, 6 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>> b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>> index 2c36e5032433..89cf65c58191 100644
>>>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>>>> @@ -62,11 +62,12 @@ static int __xe_pin_fb_vma_dpt(struct
>>>> intel_framebuffer *fb,
>>>>    		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
>>>>    				 XE_PAGE_SIZE);
>>>>    -	dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
>>>> -				  ttm_bo_type_kernel,
>>>> -				  XE_BO_CREATE_VRAM0_BIT |
>>>> -				  XE_BO_CREATE_GGTT_BIT);
>>>> -	if (IS_ERR(dpt))
>>>> +	if (IS_DGFX(xe))
>>>> +		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
>>>> +					   ttm_bo_type_kernel,
>>>> +					   XE_BO_CREATE_VRAM0_BIT |
>>>> +					   XE_BO_CREATE_GGTT_BIT);
>>>> +	else
>>>>    		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
>>>>    					   ttm_bo_type_kernel,
>>>>    					   XE_BO_CREATE_STOLEN_BIT |
>>>
>>> Hi Juha,
>>>
>>> You have changed this code from:
>>>
>>> "Best effort allocation" (try vram, and then fallback to stolen), to "Discrete
>> gets vram, !discrete gets
>>> stolen".
>>
>> Hi Michael,
>>
>> this is correct. vram is for discrete and stolen is found on integrated.
>> Earlier pattern was copied from i915 way of setting up display page
>> table but it had to be changed because asking for vram on Xe while on
>> discrete will cause WARN_ON() hence exact same pattern from i915
>> couldn't be used.
> 
> Ok, that makes sense.  If there is still time, I would suggest updating the commit
> message to say something like:
> 
> --
> Discrete should us vram only.  Current allocation allows a fallback.
> Update display allocation to require vram for discrete.
> --
> 
> Or something like that so the commit message tells us why the change is happening.
> 

Alas this was merged already to drm-xe-next.

/Juha-Pekka

>>
>>>
>>> If this is correct:
>>>
>>> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>>>
>>> Is this new sematic the "correct" allocation method?
>>>
>>> Thanks,
>>>
>>> Mike
>>>
>>>
>>>> --
>>>> 2.25.1
>>>
> 

