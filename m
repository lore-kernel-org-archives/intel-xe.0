Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E75C0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 08:44:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B3C10E40E;
	Wed, 29 Jan 2025 08:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="X3X6Pw9w";
	dkim-atps=neutral
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C7D10E411
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 08:44:10 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43618283d48so46664365e9.1
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 00:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1738140249; x=1738745049;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LQ7UQFc0W24PUIHdo7OrS6QM+0vcBB9sQvwA8ufJ07I=;
 b=X3X6Pw9wdwPHLqumh4jvgCpXGr0YZQAGK0Tk9daNnacqQnsQbzgsrVUmKgg6nn4lKj
 PV3bjehVFZeZ1RivsvB+nhrjRkQuv7+edNnxrLr50jZERynPsoAtvaXP0YLVpKdviaSx
 9Qq1UKNeJDFaqBEjFQAX1X3ixkLO7NUqBU0tc+sf/QB2bwPL12+Qd38ZWPG0q8qu5Oyt
 JrDuJ0ld0pWLrvr3ZpnDpvdSUkkcuQzCrf5oqyuzXqxjJ4fXSEI/vjJTRZn12Ouebo/x
 QhTAFHfyI6g9wTSqjWeEi7LRwg0I/0HG4I6W9YPK0s4k4r2BIT8dRbc7s3Jt48d1QAs+
 ptLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738140249; x=1738745049;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LQ7UQFc0W24PUIHdo7OrS6QM+0vcBB9sQvwA8ufJ07I=;
 b=gkxRgMFqg4PRNmyiimBex2rEU0sb1uMZSAbkJH5o8/Chd3CrwI5mRSg3ZC5jjlORxx
 Lcz8ezeOux4o1Fjf93Rp/Yb+7sHOMXDEYUIWp2xYA70d8sjieM5rQtDAjQfXv0H7bnTP
 TgIWJ41MGRHvmwCDVCR/urspH8ZZFWZM+3dhM6518VicG57lnbgK+kIg3j/5kZUe4gdf
 IJTAkKcz3H5waMGkOayaOWCmPRKDGIn5TyUqknEfgxt0gturfawjbozNc/BTtNgXK61Q
 rbocUO6IYt86Zc+kWTjUQD1KFfcM80lQxmvSprpZOCy9LJMwbj/VTJjw033DCcycb23J
 /G0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1tRmPNG4/WSbpw2ITzHq8PNsk20LNKD73exTH0q0kZa2Ksybg53jYUx0RK7otHa14yk9Rl6rHNw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yylp/VN6Ujez6tyAhir6hxLXL5qNqmzq3rIgwisoO+SlvqYSvLk
 fbZB0Bu6HxX2zWAJiXZJm45h3gilSQY2cLf0MtGjkcB8ii+3Xon6PB8gvEN2BQw=
X-Gm-Gg: ASbGnct5laYQegY12icvr6hXCkLsZKhVEFxmoog0xk37O3OvtODJTEaCaK9kLRwowgb
 ROZt9TkKKybAzTEAjDDCCcd59TOJ5GacRc+Sv/e4YmyJmN9hPW6FeIIsA0NZTTdsQhSR2E6X7zA
 Gloan+TDaNz8a7ih28z6X6+lSM9x6cE8OsZJCicR6JNx1Pgsi2B3N6lFFmzH90qDqXT1NahCFi7
 8aYu9cMjUYEf0ebtWgzBPwrVdeSOCUPfgqEhW1tLFx4FEGbcgh8wRsNmikAWpEGFivVINBL5fX4
 QyYlqSOnE1RWhwgrvLaTjMmUnRxOGCY=
X-Google-Smtp-Source: AGHT+IEBUc1AFI04kLkOWVHYK0u+8wdNlFR9LHspIVFaCsbs4hRxd3Wttd9cC2GJBb+7SrD3BwveTQ==
X-Received: by 2002:a05:6000:4008:b0:386:459e:655d with SMTP id
 ffacd0b85a97d-38c51952173mr1758736f8f.20.1738140249095; 
 Wed, 29 Jan 2025 00:44:09 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bb0c9sm16551520f8f.78.2025.01.29.00.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 00:44:08 -0800 (PST)
Message-ID: <71c2213c-4445-4285-aab8-6d7ad6f5a723@ursulin.net>
Date: Wed, 29 Jan 2025 08:44:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/display: Disable AuxCCS framebuffers if built
 for Xe
To: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 "Souza, Jose" <jose.souza@intel.com>
References: <20240228140225.858145-1-juhapekka.heikkila@gmail.com>
 <875xy01vd8.fsf@intel.com> <72a58a16-d7aa-4b85-bd67-40cd87366b0b@ursulin.net>
 <CAJ=qYWRZZd4FmYXxqaT5hm5RqOQsNow4UbG=fdQFr_odSGUrEQ@mail.gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <CAJ=qYWRZZd4FmYXxqaT5hm5RqOQsNow4UbG=fdQFr_odSGUrEQ@mail.gmail.com>
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


On 28/01/2025 15:55, Juha-Pekka Heikkilä wrote:
> On Tue, Jan 28, 2025 at 3:08 PM Tvrtko Ursulin <tursulin@ursulin.net> wrote:
>>
>>
>> Hi,
>>
>> On 05/03/2024 16:44, Jani Nikula wrote:
>>> On Wed, 28 Feb 2024, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> wrote:
>>>> AuxCCS framebuffers don't work on Xe driver hence disable them
>>>> from plane capabilities until they are fixed. FlatCCS framebuffers
>>>> work and they are left enabled. CCS is left untouched for i915
>>>> driver.
>>
>> I couldn't find the answer in the below linked issue or in the thread -
>> is it known what exactly is missing/broken to make this work and are
>> there any plans to do it? Or perhaps not if gen12lp is not intended to
>> be supported?
> 
> As far as I know devices with AuxCCS are not intended to be supported.
> 
> As for this patch, from display point of view these would work the same
> as before, just put compressed fb on screen and enable decompression
> but I figure there are parts missing from gem side to support AuxCCS.

Right, I can dig in and try to figure out what are those missing GEM 
bits but I was hoping someone might know straight away to save me that 
initial digging around.

Regards,

Tvrtko

>>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/933
>>>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>>
>>> Acked-by: Jani Nikula <jani.nikula@intel.com>
>>>
>>>
>>>> ---
>>>>    drivers/gpu/drm/i915/display/skl_universal_plane.c | 3 +++
>>>>    1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>>> index e941e2e4fd14..860574d04f88 100644
>>>> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>>> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>>>> @@ -2295,6 +2295,9 @@ static u8 skl_get_plane_caps(struct drm_i915_private *i915,
>>>>       if (HAS_4TILE(i915))
>>>>               caps |= INTEL_PLANE_CAP_TILING_4;
>>>>
>>>> +    if (!IS_ENABLED(I915) && !HAS_FLAT_CCS(i915))
>>>> +            return caps;
>>>> +
>>>>       if (skl_plane_has_rc_ccs(i915, pipe, plane_id)) {
>>>>               caps |= INTEL_PLANE_CAP_CCS_RC;
>>>>               if (DISPLAY_VER(i915) >= 12)
>>>
