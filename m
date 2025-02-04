Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2C1C02193
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 18:10:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2251E10E079;
	Tue,  4 Feb 2025 18:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="nRLJRPgM";
	dkim-atps=neutral
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1321A10E079
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 18:10:51 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-38da84c9e4bso727349f8f.1
 for <intel-xe@lists.freedesktop.org>; Tue, 04 Feb 2025 10:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1738692649; x=1739297449;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6EfSg6asZuRz8ZjyXPyM7mhqZuAOv2M4L7r4CA47VrI=;
 b=nRLJRPgMlyjShM2F7UzmrGvo0hktUWtDswVi71LZcstttVf4RMVlkQ1KBOgf8/MsLs
 uCn+AAG9U0peYexnbuqxfB3iAjQt0YNUjUGmRn6kyoQcVVNoqF+FC7MLbhUff8QBk+L3
 442DICL4FTTmTbUD8o214JZKmhMFkjUqPrwr57c8icvvPSm+ZSx8PCNrh9R77BGsEl26
 +eUtoEwEoAZ7nTNGL8+XzvAx4zjzNdMhNt6sGRMyt5hXjU0hTk2T5XhitO9YVsH6kgOD
 V6IpFHndaSeUpTrSpaUK0fVEbyJ5CQTd8zqiLTBfhIiyqwIOFoNTcFXBCqLP3O6wRzF5
 PXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738692649; x=1739297449;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6EfSg6asZuRz8ZjyXPyM7mhqZuAOv2M4L7r4CA47VrI=;
 b=LZPadZEikMp5qex97ivNqsiB7vSEKiH9hMASUZaqy0+/LaPCLTbJXbrvByTbQP553R
 EQ/PDYXDEKJF26m5t55pYShZYOHoRO5rbDTEj+qCo8K3G+/dDYI3zg9mqvbdJy3rnIEr
 Xd4pWX8W3T1YduLgLqxJUh8hzC/e45jPvOx4FKCYZWIAccBb4ITAOK3Xa8m+JrNZwVfB
 /WM9rVSjvcjClASNHGyHg2TrMHqW9m7UbplFE8aLNr7seCyQRl4OeDVkQhn5ok2rzkhe
 5Oyu9Jl1YmqCkMO5T28LKe3CRmnFNwkt6KL7l4heUg1GNFRv8TVLWwyeGH4SGeCqnLD8
 r2tA==
X-Gm-Message-State: AOJu0YwAMhrEOwo29AIUES2Muk3CdRP30Xfb+cJGt+8ndfMOvDUtS5pg
 5ZS33WryAMeFIuUHcbhI2a1MD5ERdfUyumWK7VI/K/6wlyPR852N0IwSOyQmqOTN0rmKIcwb63W
 x
X-Gm-Gg: ASbGncvi+LkX1vb5ZzWr927u1EbhwIpauzaJKSiAyoyBLuE5k2hFeRYw+x4wgaTF1uJ
 lXQX7eFZBfM77p8/APtCcfazL2qjPp+NO0govWdVfonJAfI7rbLP9PQMeQ/88ZSA/1FyM6+d5Wg
 adY5OprSJ06jjGZo0h/pGW/2RU+sDayXwG7frWVzegd1UTAXfQJGrjK71nt78JHW75KPlRCEcmY
 /rIink4ltb+ST81TU6ILZsdJ+Qg3jlA9kP5VDlytEUaJekNRRlLRf4cKyOYuNAe1Zy+P0R2+Rhy
 6J1IuxhcdlUVVDbx34sSK+XVavqnmCQ=
X-Google-Smtp-Source: AGHT+IFdADo9/dubtmPQ2Heb1AzjLppdgw/uAgerbrs0sltr+RH360YXn5fgDWp6HXWYPRHrUF6lQw==
X-Received: by 2002:a5d:64a5:0:b0:38c:3fd1:6164 with SMTP id
 ffacd0b85a97d-38c51e8dc97mr19925027f8f.42.1738692649227; 
 Tue, 04 Feb 2025 10:10:49 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c11fadbsm16212943f8f.44.2025.02.04.10.10.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 10:10:48 -0800 (PST)
Message-ID: <7d074cfe-0a64-480c-b1c5-d3dc850b6c1e@ursulin.net>
Date: Tue, 4 Feb 2025 18:10:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Cleanup error handling on probe
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
References: <20250131223140.4144292-1-lucas.demarchi@intel.com>
 <37e94776-ea74-4fb7-ae50-ab999324df7f@ursulin.net>
 <juvslcazrixq4cy3ebiddbw7zwnpfah3mmaqu5qyclaonmupg3@x5l5kv4nuwg5>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <juvslcazrixq4cy3ebiddbw7zwnpfah3mmaqu5qyclaonmupg3@x5l5kv4nuwg5>
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


On 04/02/2025 14:50, Lucas De Marchi wrote:
> On Tue, Feb 04, 2025 at 08:58:37AM +0000, Tvrtko Ursulin wrote:
>>
>> On 31/01/2025 22:31, Lucas De Marchi wrote:
>>> Mixing style with goto and devm_add_action_or_reset() is very confusing
>>> and error prone. Clean that up. The only missing one is one of the
>>> display calls, but that can be done in parallel to the review of these
>>> first patches.
>>>
>>> This received limited load/unload tests on LNL and may very well not be
>>> 100%.
>>
>> Is this series hinting you are looking into making heavier 
>> refactorings in the init code? Triggered by me recently discovering 
> 
> yes, I still need to move more display init around and some other gt
> parts.
> 
>> GT-per-engine workarounds are not working?
> 
> it was not what triggered this - it was rather my review of the pmu
> integration in xe when I noticed we were just continuing on a failed pmu
> registration:
> 
> https://lore.kernel.org/intel-xe/lnvrm7guru3ujx7kt4irhvjb3wc3vcfzzhko3h5zkvgdig6znm@xb56nnaemwi5/
> 
> what's the state of your patch to fix engine registers in GT WAs?
> Did you find a suitable place for that fix?

Status is that I found a chicken and egg where GuC load needs engines 
and engine init needs GuC. I had some vague ideas that something could 
maybe be done in two passes, but then I spotted you were working in init 
paths so parked it until I see what you were up to. :)

Regards,

Tvrtko

>>> Lucas De Marchi (7):
>>>   drm/xe: Fix xe_display_fini() calls
>>>   drm/xe: Fix error handling in xe_irq_install()
>>>   drm/xe: Fix xe_tile_init_noalloc() error propagation
>>>   drm/xe: Stop ignoring errors from xe_ttm_stolen_mgr_init()
>>>   drm/xe: Cleanup unwind of gt initialization
>>>   drm/xe: Cleanup extra calls to  xe_hw_fence_irq_finish()
>>>   drm/xe: Move oa fini to xe_oa
>>>
>>>  drivers/gpu/drm/xe/display/xe_display.c | 22 +++++-----
>>>  drivers/gpu/drm/xe/display/xe_display.h |  2 -
>>>  drivers/gpu/drm/xe/xe_device.c          | 53 ++++++++-----------------
>>>  drivers/gpu/drm/xe/xe_gt.c              | 52 ++++++++++--------------
>>>  drivers/gpu/drm/xe/xe_gt.h              |  1 -
>>>  drivers/gpu/drm/xe/xe_irq.c             | 14 +------
>>>  drivers/gpu/drm/xe/xe_oa.c              | 48 +++++++++++-----------
>>>  drivers/gpu/drm/xe/xe_oa.h              |  1 -
>>>  drivers/gpu/drm/xe/xe_tile.c            |  4 +-
>>>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c  | 17 ++++----
>>>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h  |  2 +-
>>>  11 files changed, 86 insertions(+), 130 deletions(-)
>>>
