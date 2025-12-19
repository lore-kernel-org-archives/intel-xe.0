Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED2CD78786
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 15:06:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F03810EAD3;
	Fri, 19 Dec 2025 15:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kh+xG/9B";
	dkim-atps=neutral
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727BA10EFE8
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 15:06:06 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2a0eaf55d58so17721955ad.1
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 07:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766156766; x=1766761566; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=hfaIIVE5Ota75ZfJhuSYl8nByrDQrb3YLFP+5RNPh/Q=;
 b=kh+xG/9B80kD//SI3bkjUJGLmgNF5/Z5wwZLfWWBKU7vQixoLUcwYhVM8lEEBZnckf
 EcNljClOz8j035gxEB6nt4A3TWRmbcAWqoxENDWIYZHfVqyad0ORSVZzTVubjqVGTEKD
 lcDk+ivT+80msOE02RPjmp8GW9xmOSf70WCc00t2hXbkODCS3OrmhhHXnMlmHEnHi3rb
 rLVPpngdHXSAMeRwmf4JzqXoYLrcqK5KxmGD4cfP01DNsqO0b2WddGQCe7leHjW77dQr
 VKApB6G8KRIDh9eIwhWzHqy3R+tyfSRLwi6REztxtSsCvKkravT5d4kE1cDmSP6nhvMx
 097w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766156766; x=1766761566;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hfaIIVE5Ota75ZfJhuSYl8nByrDQrb3YLFP+5RNPh/Q=;
 b=Rk5EQAOsuD/3VJYsiAY6uQ39sToL0r+CnnB0wCar2GUHLPQJ5aYK1e4pLW8Wx4lTO0
 zsTX1qTLioqMWkmAt8pV1kmZXF78wAEdvck538oKD3fKGp1AiDABvdaZa6LoLqvMBEap
 YHWFn6iyGvT6TC+T44+MbJIiDY1PdFBbbmzekMI4HW4uKp8rgNrlsm4uyX9A/5+/9uqL
 JFOJvMM1f0R/APaho2cIx8oURXMrgF3m1YTmpqHFalH8aOkwqXNRX01AKPDxANWMd28z
 KmeaWHDqYUcsNHqFVupaEtwKnvJQLHBcMG/Dqc2wfpyDe5Npb73JQPSrNkA1cMe9lBU7
 QP2A==
X-Gm-Message-State: AOJu0YzvhFKatNZWDHlJI3oCzDvRGOfEIjOd7GiIk+nihg1BcPxCJkGK
 rdjGt21EEAoRRCUXUuT1eDZZ8TncQWw2xsH38o5Lib37gvE5Xa/tDpsP
X-Gm-Gg: AY/fxX4MMiVDmCcHWVBUQDmGXocI2sH4d1D9b7vesbU76sRz98O2EHo1+IwD3bJOaja
 XJ8NUvpJLzTkR8zpXbL5Kh6HI0Eme7F3uVuagEMDHCstcp73QVWtGrSzN+SMcWXTURJSTvGU2ss
 klYQ1PZVlSnowCHeYXKJKD/+wJ2OhlNEJ5RyA6cKqr+NuP/KYrBAQhq+5GAqsPJEfVKC5+hY2Bg
 a+CsSDnNHM3AaZZWSRFs1kmVIzGSeI+6GWttrqjAkYJyfOtIfrBeJf1Uxup4PcCcjEsQaP55obR
 Kmb/rU5/k7rofyEM2S2Is59CaN1tl57HNqdpIloO/o2xfo3eB/G0EUBC6BZb47SiSL123GUXJh+
 cRQc4fOPAsa72TtWtPDGooGek5NTlTvVbElbq8kE+BcPg5suij1/y5hMbOVLOwwcX+gaKtzH82Y
 NWbO3GvXPcUQ2opB3EPQuV8VCC5k9Sj50d5tKjFoMFMLoYhvcgPApSaxRW5rgD
X-Google-Smtp-Source: AGHT+IEx/Hbb7pPBFhlShbKCU+FQf74AnSYNMhP2OcCFiI9x7u71k/w17J8B+3pquZWRHHoIOBpl6w==
X-Received: by 2002:a17:903:b07:b0:2a0:e80e:b11c with SMTP id
 d9443c01a7336-2a2f0cbbd49mr31691635ad.10.1766156765746; 
 Fri, 19 Dec 2025 07:06:05 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5?
 ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3d76ce3sm25730145ad.90.2025.12.19.07.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 07:06:05 -0800 (PST)
Message-ID: <633cacdc-f9ad-47e0-9aea-889850b99cc7@roeck-us.net>
Date: Fri, 19 Dec 2025 07:06:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm/xe/hwmon: Expose temperature limits
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, riana.tauro@intel.com
References: <20251216114030.226399-1-karthik.poosa@intel.com>
 <20251216114030.226399-2-karthik.poosa@intel.com>
 <aULiyK1tWOxKZLI8@black.igk.intel.com>
 <3849de5d-2cf9-4a06-b35f-428253a4e0d3@intel.com>
 <aUPiXUAji8P9QvFH@black.igk.intel.com>
 <4af066d2-b9c8-4352-b709-dc3ab1e58784@intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <4af066d2-b9c8-4352-b709-dc3ab1e58784@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 12/19/25 00:37, Nilawar, Badal wrote:
> Hi Guenter,
> 
...
>>>>> +
>>>>> +        Only supported for particular Intel Xe graphics platforms.
>>>> As per hwmon documentation all these attributes are RW so they don't
>>>> match with ABI expectations.
>>> 1. These are read only values for our hardware, write is not supported.
>>>
>>> 2. Couple of other drivers are also supporting readonly for temp_crit.
>>>
>>> Ex:
>>>
>>> a) drivers/net/ethernet/broadcom/bnxt/bnxt_hwmon.c - bnxt_hwmon_is_visible
>>>
>>> 75 static umode_t bnxt_hwmon_is_visible(const void *_data, enum
>>> hwmon_sensor_types type,
>>>   76                                      u32 attr, int channel)
>>>   77 { 82
>>>   83         switch (attr) {
>>>   86         case hwmon_temp_max:
>>>   87         case hwmon_temp_crit:
>>>   88         case hwmon_temp_emergency:
>>>   89         case hwmon_temp_max_alarm:
>>>   90         case hwmon_temp_crit_alarm:
>>>   91         case hwmon_temp_emergency_alarm:
>>>   92                 if (!(bp->fw_cap &
>>> BNXT_FW_CAP_THRESHOLD_TEMP_SUPPORTED))
>>>   93                         return 0;
>>>   94                 return 0444;
>>>
>>> b) . drivers/hwmon/intel-m10-bmc-hwmon.c -
>>>
>>> static const struct hwmon_ops m10bmc_hwmon_ops = {
>>>          .visible = 0444,
>>>          .read = m10bmc_hwmon_read,
>>>
>>> 3. hwmon also doesn't report any violation for 0444 return from
>>> xe_hwmon_temp_is_visible.
>> Sure, but since this is a pre-defined ABI which we don't control I'll let
>> the maintainers have the final call on this.
> 
> Could you please share your thoughts on this? Temperature limits are kept RO as hardware doesn't allow to write.
> 

One of the developers involved in the drm hardware monitoring code once
told me that I have no clue what hardware monitoring is about, so why
do you ask me ? Apparently they know better.

If the driver was in drivers/hwmon, this would not be an issue. Of course
it does not make sense to have an attribute as writable if the value it
controls can not be modified. I can not tell you the rules for this driver
because it does not reside in drivers/hwmon and, again, the above.

Sorry for the rude reply, but, please, do not ask me for advice on any
hwmon code in the drm subdirectory. They make their own rules.

Guenter

