Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DDFE77199
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 15:18:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE02710EAF7;
	Tue,  7 Jan 2025 15:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dTzU7dal";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB89C10EAF7
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jan 2025 15:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736263116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rUplG4F0XeXedPiFUz73Lrgro3oMqYtlKZ5uOAi7unA=;
 b=dTzU7dalRbiwr/a5lWJiCQ5p6L+dTKFCQi6ZQTYxLbYkupnNAn0+19upqrfzpCw3BwuARB
 LJCL2IDlDiZ4WuueMYcq4cd3iCww2TsZi8ZSn6dor9lNNNnAHFsfXDfOCJZc/SQYBL/eb1
 ikjLnSp/HJF2EROyTPJg1xtUY6i2iNk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-aNAwvl6DNbOrsTZ51i6j2A-1; Tue, 07 Jan 2025 10:18:34 -0500
X-MC-Unique: aNAwvl6DNbOrsTZ51i6j2A-1
X-Mimecast-MFC-AGG-ID: aNAwvl6DNbOrsTZ51i6j2A
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4362f893bfaso86638305e9.1
 for <intel-xe@lists.freedesktop.org>; Tue, 07 Jan 2025 07:18:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736263113; x=1736867913;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rUplG4F0XeXedPiFUz73Lrgro3oMqYtlKZ5uOAi7unA=;
 b=FFVCuhw7zuoTq+/AQf/4mHdSD4EaKipIvObsGJpWBY6CkX4pXl/82HNlF51lVzvlUi
 uoNfG+Dm9oUJinmJz+JuIjT45NClSZXZIRVQpjueln+m/XmuTab94sMlOgBBcIjpgG69
 efNKcfndJw3f9Nbw8rIztHwMlp1to2oDHJjvsghnwc0sEGWtaArDetRbKacPymDYdu0T
 zx6+TmWbjyuzMQkwvWlGGkiR90lukKRgT43OzGFqaPZBGfPUvUsF1AVwkaYPvZWwSBpX
 qteyq88x4awK+2lVSFcYINOLsJg1HV3GtRB3OCnGmXNooy92ruQAlENIPsYP5Vd+hSiC
 IJrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt6G398i0Nbz/XNqUrxnsv7Qinl3UywFN73pn/gAvq1bfbmXgpYBYooufLz1zQ7p0esJrhs7a+fQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+1P8W6JXJTAhPYbozjjbzwOS/AAaHKM18kLoYVRd2+Y/xATii
 G7QCPr3TvCKIKcttSbzWIYveCyRq9NbVU90+7uX7gZKfYRpmzXE1SmaACRsbmlvCCKhgMSsBZv5
 j53pJco0PpFLhani7FqzwIY5AH+LEVuTEvtd9c8MCwzF01DuYhWdGckWHkwY/aaRZ
X-Gm-Gg: ASbGncu7WG6RSbMo5ivi8eRgRAnC4N+kvWbSp2/8OWGo6jTBRFvSHXb/X6MMuz4d7WG
 xPsbov2F4eTXaFfkJ+F4DBVwoXGsd0dSQNE8H2z3VUAeNFecD5Oe4mS4kWsbCDhieI+6ANB50UW
 dBh4DvjboOz2x8k/rqpnMvAsVDLrmwYg/lhk+ZDeyXfLy73OOkkZQ2L+r4i3mLIxohRMuTcCH1Z
 sAL/Zp6lzEzwcNiNQqxz5FqwqLPewzWqf1Bu619mIqvHQhoXt0RWKg5GFz+EO1QWFK1Abi63eYU
 SEpsSw52Hlwpm83gw5mB
X-Received: by 2002:a05:600c:1994:b0:435:306:e5dd with SMTP id
 5b1f17b1804b1-43668b5dfaamr501387095e9.22.1736263113449; 
 Tue, 07 Jan 2025 07:18:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHimNiTTdzzguuYHGQ8lf7oorYauE7LFqE/pVfbyw+CccfhbHiXVwvu0+s5XK8lqHt82lbpMg==
X-Received: by 2002:a05:600c:1994:b0:435:306:e5dd with SMTP id
 5b1f17b1804b1-43668b5dfaamr501386895e9.22.1736263113060; 
 Tue, 07 Jan 2025 07:18:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611fc762sm597842465e9.11.2025.01.07.07.18.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 07:18:32 -0800 (PST)
Message-ID: <6f46535b-1075-4ac7-8809-274dffada2c8@redhat.com>
Date: Tue, 7 Jan 2025 16:18:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] drm/{i915,xe}: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, javierm@redhat.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20241212170913.185939-1-tzimmermann@suse.de>
 <20241212170913.185939-11-tzimmermann@suse.de>
 <8e175713-2762-4767-86c6-fe0c0b7e8cf2@redhat.com>
 <332ba13f-8dd8-4195-9af2-26b1f18cf1c8@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <332ba13f-8dd8-4195-9af2-26b1f18cf1c8@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5tMCJNjQyA7AvGUI8Vvhd4Ki36h8_8FLrPHhbrJT36k_1736263113
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

On 07/01/2025 15:42, Thomas Zimmermann wrote:
> Hi Jocelyn
> 
> 
> Am 07.01.25 um 13:10 schrieb Jocelyn Falempe:
>> On 12/12/2024 18:08, Thomas Zimmermann wrote:
>>> Rework fbdev probing to support fbdev_probe in struct drm_driver
>>> and remove the old fb_probe callback. Provide an initializer macro
>>> that sets the callback in struct drm_driver according to the kernel
>>> configuration. Call drm_client_setup_with_color_mode() to run the
>>> kernel's default client setup for DRM.
>>>
>>> This commit also prepares support for the kernel's drm_log client
>>> (or any future client) in i915. Using drm_log will also require vmap
>>> support in GEM objects.
>>
>> I've tested this series on an Alderlake laptop, and it effectively 
>> breaks the boot with drm_log on i915. (I can still see the drm_log on 
>> simpledrm, but when it switches to i915, I get a blackscreen, and the 
>> laptop hard freezes).
>> Can we wait to have the proper vmap support in GEM objects, before 
>> merging this series?
>> Or at least prevent drm_log to load on i915, until it is fixed?
> 
> Did you add vmap support as advised here? i915 will not support drm_log 
> without and this series does not add it.
> 
> A patch for vmap functions is at [1], I think.

Thanks a lot, it works much better with this patch :)
That was the missing piece to have drm_log display something on i915.

Best regards,

-- 

Jocelyn

> 
> Best regards
> Thomas
> 
> [1] https://patchwork.freedesktop.org/series/135554/
> 
> 
>>
>> Best regards,
>>
> 

