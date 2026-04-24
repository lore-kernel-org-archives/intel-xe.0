Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D08FE5210
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 11:54:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D9C10F537;
	Fri, 24 Apr 2026 11:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jAD1xIsW";
	dkim-atps=neutral
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0204210F537
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Apr 2026 11:54:02 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-35fc258aaa4so4941299a91.2
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Apr 2026 04:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777031642; x=1777636442; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S9ZV06dw1Xc2/kOu0yRK7+Q4rZacpv7z7wydikflQkM=;
 b=jAD1xIsWsSVCZXWnW+lX9O2iRukIn5UBPmREPNbbLNSVIj/wwKOiGM9MD4jna4xjCh
 BQJFDTI3GCOOW4i5wuh0SSTcpJOL37zL/GgXrFepwR04WIBC5yzN/Uw/SB7rccFEKLVj
 0rDZCcxdSrnsJ3bMdrA8ldqkI8uN473kRLw7+cQyo3Sw7Vp9EYJsRq5RfcRCAjkPl3FF
 gRvEfvp1hw/ttNSRkz286UEQLMmyvKdEhG0ANwvJ3+NtOU6byzsa3ULA8ULvYy/lda+N
 J/TRkgbNbaN8AqZeHPOFYVlgIqTnIBaLL0f9SYSfZnfko7HoaCCUcwozxa5aw+zsHAOL
 0uRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777031642; x=1777636442;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S9ZV06dw1Xc2/kOu0yRK7+Q4rZacpv7z7wydikflQkM=;
 b=DztEXLB8GFR9I/Zi/4Kd4AZhqMkCIst1llvcDPkaKxf04y3ijE9Uipd0AWHBHNSwpQ
 v3Tis+t5SIK0rnddRtp9QgPKAekQQLFfxipUAOzMjPf3USkXN37IYUWPq+xwA/g9WFSd
 wEcH+xSe/A3ODw9A1yKPJ0TBUgPTHoYp8qhT1S1Sy+M+95EDGgK1NcoVIaiwQt06OrZy
 m/PWoJs307vAJx0TA4uM03/Jy5tR9sTmFVf9YaO9OB9AgTBZHDbU1TaGvrevLVxgnjjb
 jNXW2kHo9sce7G5NrKYpCHMukzzekKT71hVD4TBXVpxaBM6cNTTbbK+IyrbWhaQxoVh1
 hjLg==
X-Gm-Message-State: AOJu0Yz0hjd9eho9i4MSJSd43eeX3nbC92QIpTEPU6f3EO6rKYqjsydY
 PzJ+22leglViBj8XSKt18NEGOSYjveZWR6pJoVXVZTMvmW+FpioZK0YL
X-Gm-Gg: AeBDies8D6P/jAQqwyv2D2amibyiZW9zWZuE4GJJpI/AmZkIJwJJV0QrqdNzbuX5pJI
 x2RfImGseMEop7DlQVEEdKruA+sDP8lJVe1yJJoyAfkUXk/WpwD/ziFMcLHirEcprkSm6gFpowD
 cKajpaawPj0jN7ehgjz/Siiz38nCi1cNoBT/HC5Iu7JkbQuW74SAalgySQjhPWMrB0uAC4B3hsy
 wes6kQAQN17EPRP1YIgG0jBmy7ppYe4O/mjI/OFXm0n8+z+GyMIVR57u8Qh4fKBSKJqwlg1i0S7
 +/jH4L0FizkZSRNsNyahxIhMJPcnbFCcb0jiRn35VDHCrlT8kjPyMxeaKjVMv6EAf+6I3JPkeCZ
 rWr6amfaACZGmuo5I3VWS1ic9m2g8LWdkx25OtiAVcz9D11u1Imv0nDEHyja4cMejDz+X5cRhJg
 moHcdY5cZ/I+wfBpKyQ+iXANTr2oI/tRvZ1k02GmRw5BpygcrigO12kZIq7R/MnJodz+ztWuq+m
 cY/TLq19A==
X-Received: by 2002:a17:90a:d40d:b0:35b:e5ce:73bb with SMTP id
 98e67ed59e1d1-361403d61d5mr31485122a91.1.1777031642364; 
 Fri, 24 Apr 2026 04:54:02 -0700 (PDT)
Received: from [134.134.137.78] ([134.134.137.78])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-362bc4f9360sm8049611a91.1.2026.04.24.04.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2026 04:54:01 -0700 (PDT)
Message-ID: <737a684a-5a97-4e2d-9250-69990fb23e91@gmail.com>
Date: Fri, 24 Apr 2026 14:53:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/display: enable ccs modifiers on dg2
To: Raag Jadav <raag.jadav@intel.com>, Jani Nikula <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20260423141148.3145665-1-juhapekka.heikkila@gmail.com>
 <92d121173a3e42ef91274f9fa810e47d71b8dd70@intel.com>
 <aetXJXANjinP119i@black.igk.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <aetXJXANjinP119i@black.igk.intel.com>
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



On 24/04/2026 14.42, Raag Jadav wrote:
> On Fri, Apr 24, 2026 at 11:44:57AM +0300, Jani Nikula wrote:
>> On Thu, 23 Apr 2026, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> wrote:
>>> Since Xe driver aux ccs enablement dg2 ccs modifiers have been
>>> disabled on both Xe and i915 drivers. Here allow dg2 to use
>>> ccs again for framebuffers.
>>>
>>> Fixes: 6a99e91a6ca8fec5882450128fb128265f86b32a ("drm/i915/display: Detect AuxCCS support via display parent interface")
>>
>> In kernel, there should be 12 characters of sha1.
> 
> I had a misconception that checkpatch already flags this, but it seems
> not? Or perhaps I'm not much informed about the history (if any)?

What checkpatch says is to use 12+ long sha when sha is shorter, like this:

WARNING: Please use correct Fixes: style 'Fixes: <12+ chars of sha1> 
("<title line>")'

hence I did put the full sha.

/Juha-Pekka


>> 'dim fixes <sha1>' gives you the correct format, and suggests Cc's
>> (though you probably shouldn't actually Cc all of them).
>>
>> For referencing commits in general, I have this handy alias in my
>> .gitconfig:
>>
>> [alias]
>> 	cite = log -1 --abbrev=12 '--format=%h (\"%s\")'
>>
>> $ git cite 6a99e91a6ca8fec5882450128fb128265f86b32a
>> 6a99e91a6ca8 ("drm/i915/display: Detect AuxCCS support via display parent interface")
>>
>> BR,
>> Jani.
>>
>>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>> ---
>>>   drivers/gpu/drm/i915/i915_driver.c | 5 ++---
>>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>>> index d31819758f3d..a4bd4f8e18b2 100644
>>> --- a/drivers/gpu/drm/i915/i915_driver.c
>>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>>> @@ -750,9 +750,8 @@ static bool has_auxccs(struct drm_device *drm)
>>>   {
>>>   	struct drm_i915_private *i915 = to_i915(drm);
>>>   
>>> -	return IS_GRAPHICS_VER(i915, 9, 12) ||
>>> -	       IS_ALDERLAKE_P(i915) ||
>>> -	       IS_METEORLAKE(i915);
>>> +	return IS_GRAPHICS_VER(i915, 9, 12) &&
>>> +		!HAS_FLAT_CCS(i915);
>>>   }
>>>   
>>>   static bool has_fenced_regions(struct drm_device *drm)
>>
>> -- 
>> Jani Nikula, Intel

