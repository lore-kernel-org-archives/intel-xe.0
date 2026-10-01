Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA4DCA5FCB
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 12:08:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4901B10F63F;
	Thu,  1 Oct 2026 12:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="ZWXo4SsS";
	dkim-atps=neutral
Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com
 [74.125.228.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C624410F63E
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 12:08:36 +0000 (UTC)
Received: by mail-ed2-f31.google.com with SMTP id
 4fb4d7f45d1cf-6ae42b3e901so610812a12.0
 for <intel-xe@lists.freedesktop.org>; Thu, 01 Oct 2026 05:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1790856515; x=1791461315; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=1Fp5kCYPGtQ2z9Nbrt8uULywDdXGnzq3Zd9J+qpzyo8=;
 b=ZWXo4SsSFdOcGy7PWS734bau2WWCdsezKV1+O2TDHHYop9nOt75VkXr5J8R6BrtYbG
 Tmc+X4I/aEENQPA2V3IPw7W+/s168YID+90PxgsgBQv/kcU5sLxVVPruv+qFVbdyS2xx
 wtx6wGQEAsTWng8jZ6IwH5DxK4oMgQ0OZFpgnSjK28ppEeEdxaxovZHxHZhOXarQTdb8
 /YsvDzinB0ppSzUHOz1V7bz3a7xztco2ymZrqG6/oKS+Bz7MbJ4anTBf2A9jsgRlpAgC
 jCNT808/iZS0b8vehtTlsmAGMk6W+C6tJaiJMV4qwvQYtIMullTYjgRNj6rI2Fz6bc0n
 +UcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790856515; x=1791461315;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1Fp5kCYPGtQ2z9Nbrt8uULywDdXGnzq3Zd9J+qpzyo8=;
 b=teK+rx5bNA8IfFhHGGZYX7Zf4iFoFde/0IzvHyuQu0jgqrFUr+r1Kyoo+yBkF+g8Ca
 /bN3YUEP/Nh8d8/uNeeIMnCg7t6V6cYFwyH9lSsDzio/03ZEZw4UlMCAO0c8CGSzkSTU
 g/RpKUbjHirSDPlQn5OnZFKayOIXOcf+hUBzBa4I0/USFaFSXOMC0x3Q08/gSrduy3hi
 n+gAf+PshOT2FdojZypcIMB7K7ThLZRUO44LZvFynOV1eZHd1DYnqiljgvbELLnkN2h+
 Yi+OTcVY8ORdcUiXN1T4bvdZjjUy/7fMdwVyVbesWMFL5qY9jlDtHlbS9lH9sRlfiZcB
 txHg==
X-Gm-Message-State: AFq9FYIADFl3HkD3CZbZuccswZZyUMiQxn8297dDuzro2wmga/UAlRMN
 rNdbStb9vPl0WMgNK5cnG/NrVu9v4PMfh8xHVkyBSGZIlb55b+aYNSbj5EgTJ99tm5uXPCrN2Yh
 ePdA9
X-Gm-Gg: AYBFou04vcQwLkGp6GnZftJIaGZ/Tf83YRlY6xNK0VkvH5Fo4eEi6CjNl/TfNA90sIf
 4kpubYJbrYnEFw0iP5QjHs6l9dgncbMf5cBiT7tH2lOvkPHqhiN8XXaNtD8+Yj3VFY30X+a45Gu
 U9PS+Ur1lm83ucHUwQlS9RYEDwfhephRTnGE7yQgh7iGeyrqatNEFwzy+19AuC28sQgcv48BvR7
 yjpELOYg1/sUKE7LFGPfIexNEfhzMdzSxgNU0NM28bWrDhwnPpmK1FezClUK+5lG/0GgqZNbdF6
 eLPBoidgRdKy2lRdSbVtd6MPJw7XpjYdtW9S2SC4DQ38wciW+0waEQ0nA95fOrlreQxSeWRoLWI
 a6dAjiOVeYpz5WGQVAwI69Xe9roXbQM1jkVZIBAOcj8p1tbldF5UenR866BIdru8UKuLOSytuZg
 q0lp77tgP1wV8DsDgTHYuFzOmeeacYsurrEva2H3e8zG2OL1I8qAUkmhAr0Yvpqyr2E/LqL5O7u
 +Wve8JuqRAX5kNSDVbfKZVBMGSq/Fxtq1o=
X-Received: by 2002:a05:6402:23da:b0:6aa:e589:87db with SMTP id
 4fb4d7f45d1cf-6ae307e47bcmr1978139a12.12.1790856514644; 
 Thu, 01 Oct 2026 05:08:34 -0700 (PDT)
Received: from [192.168.0.116] ([81.79.79.1]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6ae5ca79df1sm975775a12.32.2026.10.01.05.08.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 05:08:34 -0700 (PDT)
Message-ID: <1d9bb1d8-6d36-4c5e-a3f5-28bb6112b314@ursulin.net>
Date: Thu, 1 Oct 2026 13:08:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGU6IERv?=
 =?UTF-8?Q?_not_emit_Wa=5F16010904313_twice_=28rev2=29?=
To: intel-xe@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20260925080016.64802-1-tvrtko.ursulin@igalia.com>
 <179035660906.208907.15838431629542609031@61270ab9df2a>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <179035660906.208907.15838431629542609031@61270ab9df2a>
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


On 25/09/2026 18:16, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe: Do not emit Wa_16010904313 twice (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/174937/ <https:// 
> patchwork.freedesktop.org/series/174937/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174937v2/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174937v2/ 
> index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-5824-999838292166407bbe911a41dee23112c49e9d44_FULL -> xe-
>   pw-174937v2_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-174937v2_FULL absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-174937v2_FULL, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (3 -> 3)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe- 
> pw-174937v2_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:
>       o shard-ptl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-ptl-6/
>         igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html>
>         -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-174937v2/shard-ptl-1/igt@kms_async_flips@async-flip-suspend-
>         resume@pipe-d-edp-1.html>

Unrelated I would say. Re-test or Intel is okay to merge it?

Regards,

Tvrtko

> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-174937v2_FULL that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-2/igt@kms_addfb_basic@invalid-
>         smem-bo-on-discrete.html> (Intel XE#3157 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3157>)
>   *
> 
>     igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1:
> 
>       o shard-ptl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-ptl-6/
>         igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1.html>
>         -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-174937v2/shard-ptl-1/igt@kms_async_flips@async-flip-suspend-
>         resume@pipe-b-edp-1.html> (Intel XE#9394 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/9394>)
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@kms_big_fb@4-tiled-max-
>         hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#3658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658> /
>         Intel XE#7360 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7360>)
>   *
> 
>     igt@kms_big_fb@linear-8bpp-rotate-90:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-2/igt@kms_big_fb@linear-8bpp-
>         rotate-90.html> (Intel XE#5901 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5901>)
>   *
> 
>     igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-6/igt@kms_big_fb@linear-max-
>         hw-stride-32bpp-rotate-180-hflip.html> (Intel XE#7085 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7085>)
>   *
> 
>     igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@kms_big_fb@linear-max-
>         hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#7059 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7059> / Intel
>         XE#7085 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085>)
>   *
> 
>     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@kms_big_fb@x-
>         tiled-32bpp-rotate-270.html> (Intel XE#1407 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1407>)
>   *
> 
>     igt@kms_big_fb@x-tiled-addfb-size-overflow:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-3/igt@kms_big_fb@x-tiled-
>         addfb-size-overflow.html> (Intel XE#5855 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5855>)
>   *
> 
>     igt@kms_big_fb@y-tiled-8bpp-rotate-90:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@kms_big_fb@y-tiled-8bpp-
>         rotate-90.html> (Intel XE#1124 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1124>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-3/igt@kms_big_fb@y-tiled-max-
>         hw-stride-32bpp-rotate-0-hflip.html> (Intel XE#5808 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5808>) +11 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@kms_big_fb@yf-tiled-
>         addfb-size-overflow.html> (Intel XE#1428 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1428> / Intel
>         XE#7387 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-
>         hw-stride-64bpp-rotate-0-hflip.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +3 other
>         tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-8/igt@kms_bw@connected-linear-
>         tiling-3-displays-target-1920x1080p.html> (Intel XE#7679
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679>)
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-3/igt@kms_bw@connected-linear-
>         tiling-3-displays-target-1920x1080p.html> (Intel XE#7679
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679>) +2
>         other tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@kms_bw@connected-linear-
>         tiling-3-displays-target-3840x2160p.html> (Intel XE#7679
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679>)
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-6/igt@kms_bw@linear-tiling-2-
>         displays-target-2560x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@kms_ccs@ccs-on-another-
>         bo-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +4 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-6/igt@kms_ccs@crc-primary-
>         rotation-180-4-tiled-mtl-mc-ccs.html> (Intel XE#5822 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5822>) +13 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
> 
>       o shard-bmg: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-174937v2/shard-bmg-6/igt@kms_ccs@crc-
>         primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html> (Intel XE#7084
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084> /
>         Intel XE#8150 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/8150>)
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-5/igt@kms_ccs@crc-primary-
>         suspend-4-tiled-mtl-mc-ccs.html> (Intel XE#3432 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-8/igt@kms_ccs@random-ccs-
>         data-4-tiled-dg2-rc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +3 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-max:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-5/igt@kms_chamelium_color@ctm-
>         max.html> (Intel XE#5824 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/5824>) +1 other test skip
>   *
> 
>     igt@kms_chamelium_color@degamma:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/
>         igt@kms_chamelium_color@degamma.html> (Intel XE#306 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/306> / Intel XE#7358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358>)
>   *
> 
>     igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-6/
>         igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html> (Intel
>         XE#8391 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/8391>) +2 other tests skip
>   *
> 
>     igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-5/
>         igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html>
>         (Intel XE#7358 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7358>)
>   *
> 
>     igt@kms_chamelium_edid@dp-edid-change-during-suspend:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-3/igt@kms_chamelium_edid@dp-
>         edid-change-during-suspend.html> (Intel XE#2252 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +5 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-5/igt@kms_chamelium_hpd@dp-
>         hpd-after-hibernate.html> (Intel XE#2252 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +1 other test
>         skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-
>         hpd-with-enabled-mode.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2 other tests
>         skip
>   *
> 
>     igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-a-plane-3:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/
>         igt@kms_color_pipeline@plane-ctm3x4-lut1d@pipe-a-plane-3.html>
>         (Intel XE#6969 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6969>) +5 other tests skip
>   *
> 
>     igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-
>     lut1d@pipe-b-plane-0:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-8/
>         igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-
>         lut1d@pipe-b-plane-0.html> (Intel XE#9333 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/9333>) +9 other
>         tests fail
>   *
> 
>     igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-
>     lut1d@pipe-c-plane-2:
> 
>       o shard-ptl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-3/
>         igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-
>         lut1d@pipe-c-plane-2.html> (Intel XE#9333 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/9333>) +12 other
>         tests fail
>   *
> 
>     igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-5/
>         igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-
>         plane-4.html> (Intel XE#6969 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6969>) +36 other tests skip
>   *
> 
>     igt@kms_content_protection@legacy:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-5/
>         igt@kms_content_protection@legacy.html> (Intel XE#7642 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7642>) +2 other
>         tests skip
>   *
> 
>     igt@kms_content_protection@type1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/
>         igt@kms_content_protection@type1.html> (Intel XE#7642 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7642>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-256x85:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@kms_cursor_crc@cursor-
>         offscreen-256x85.html> (Intel XE#1424 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1424>)
>   *
> 
>     igt@kms_cursor_crc@cursor-random-512x170:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@kms_cursor_crc@cursor-
>         random-512x170.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321> / Intel
>         XE#7355 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355>)
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-128x42:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-2/igt@kms_cursor_crc@cursor-
>         rapid-movement-128x42.html> (Intel XE#5900 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5900>) +3 other
>         tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-5/igt@kms_cursor_crc@cursor-
>         rapid-movement-512x170.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321> / Intel
>         XE#7355 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355>)
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-2/igt@kms_cursor_crc@cursor-
>         sliding-512x170.html> (Intel XE#5846 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5846>)
>   *
> 
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@kms_cursor_legacy@2x-
>         flip-vs-cursor-atomic.html> (Intel XE#309 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/309> / Intel XE#7343
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343>)
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-6/
>         igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html> (Intel
>         XE#5962 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5962>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-2/
>         igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html> (Intel
>         XE#5962 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5962> / Intel XE#7343 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7343>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-5/igt@kms_cursor_legacy@short-
>         busy-flip-before-cursor-toggle.html> (Intel XE#6035 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6035>)
>   *
> 
>     igt@kms_dp_linktrain_fallback@dp-fallback:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-6/
>         igt@kms_dp_linktrain_fallback@dp-fallback.html> (Intel XE#9009
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009>)
>   *
> 
>     igt@kms_dsc@dsc-with-bpc-formats:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-2/igt@kms_dsc@dsc-with-bpc-
>         formats.html> (Intel XE#5907 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5907>) +2 other tests skip
>   *
> 
>     igt@kms_dsc@dsc-with-bpc-ultrajoiner:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-
>         ultrajoiner.html> (Intel XE#8265 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8265>)
>   *
> 
>     igt@kms_dsc@dsc-with-formats:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@kms_dsc@dsc-with-
>         formats.html> (Intel XE#8265 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/8265>)
>   *
> 
>     igt@kms_fbcon_fbt@fbc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html>
>         (Intel XE#4156 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4156> / Intel XE#7425 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7425>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend-interruptible:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-6/igt@kms_flip@2x-flip-vs-
>         suspend-interruptible.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +5 other
>         tests skip
>   *
> 
>     igt@kms_flip@2x-modeset-vs-vblank-race:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@kms_flip@2x-modeset-vs-
>         vblank-race.html> (Intel XE#1421 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1421>)
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-lnl-8/
>         igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html> -
>          > FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-174937v2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible@b-edp1.html> (Intel XE#301 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +3 other tests
>         fail
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-
>     downscaling@pipe-a-default-mode:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-6/
>         igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-
>         downscaling@pipe-a-default-mode.html> (Intel XE#5828 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5828>) +1 other test
>         skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-8/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-
>         downscaling.html> (Intel XE#7178 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7178> / Intel
>         XE#7351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-
>         upscaling.html> (Intel XE#7178 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7178> / Intel XE#7351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7351>) +1 other test
>         skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-
>     downscaling:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-2/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-
>         downscaling.html> (Intel XE#7178 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7178>) +4 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-5/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-
>         blt.html> (Intel XE#5800 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/5800> / Intel XE#6312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6312>) +7 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-
>         blt.html> (Intel XE#6312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/6312> / Intel XE#651 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-8/
>         igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-
>         wc.html> (Intel XE#7061 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/7061>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrshdr-slowdraw:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-6/
>         igt@kms_frontbuffer_tracking@drrshdr-slowdraw.html> (Intel
>         XE#6312 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6312>) +10 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#4141 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4141>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-
>         mmap-wc.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/656> / Intel XE#7905 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7905>) +10 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-
>     mmap-wc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-
>         draw-mmap-wc.html> (Intel XE#6312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6312>) +4 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/
>         igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html>
>         (Intel XE#7061 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7061> / Intel XE#7356 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7356>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-3/
>         igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-
>         wc.html> (Intel XE#7061 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/7061> / Intel XE#7356 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7356>) +5 other
>         tests skip
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-8/
>         igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-
>         wc.html> (Intel XE#7061 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/7061> / Intel XE#7356 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7356>) +1 other test
>         skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-6/
>         igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html> (Intel
>         XE#5865 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5865> / Intel XE#7399 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7399>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-
>     render:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-8/
>         igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-
>         draw-render.html> (Intel XE#2311 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +14 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-6/
>         igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-
>         render.html> (Intel XE#7061 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/7061>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-3/
>         igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc.html>
>         (Intel XE#7865 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7865>) +16 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html>
>         (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2313>) +11 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-plflip-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/
>         igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-plflip-
>         blt.html> (Intel XE#7905 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/7905>) +8 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/
>         igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-
>         blt.html> (Intel XE#7061 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/7061>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-mmap-wc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/
>         igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-mmap-wc.html>
>         (Intel XE#7865 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7865>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-5/
>         igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#5812 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5812>) +67 other tests skip
>   *
> 
>     igt@kms_hdmi_audio_bw@dpms-audio-recovery:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-3/igt@kms_hdmi_audio_bw@dpms-
>         audio-recovery.html> (Intel XE#9312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/9312>)
>   *
> 
>     igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/
>         igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html> (Intel
>         XE#9312 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312>)
>   *
> 
>     igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2-xrgb16161616f:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-10/
>         igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2-xrgb16161616f.html> -
>          > ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-174937v2/shard-bmg-2/igt@kms_hdr@bpc-switch-suspend@pipe-a-
>         dp-2-xrgb16161616f.html> (Intel XE#9362 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/9362>) +1 other test
>         abort
>   *
> 
>     igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-6/igt@kms_plane@pixel-format-
>         yf-tiled-modifier-source-clamping.html> (Intel XE#7283 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7283>) +1 other test
>         skip
>   *
> 
>     igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@kms_plane_lowres@tiling-
>         none@pipe-b-edp-1.html> (Intel XE#599 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/599> / Intel XE#7382
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382>) +3
>         other tests skip
>   *
> 
>     igt@kms_plane_multiple@2x-tiling-4:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-2/igt@kms_plane_multiple@2x-
>         tiling-4.html> (Intel XE#4596 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4596> / Intel XE#5854 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5854>) +1 other test
>         skip
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@kms_plane_scaling@intel-
>         max-src-size.html> (Intel XE#3307 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3307>)
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-2/
>         igt@kms_plane_scaling@planes-downscale-factor-0-5-
>         upscale-20x20@pipe-b.html> (Intel XE#6886 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6886>) +9 other
>         tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-8/
>         igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html>
>         (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2763> / Intel XE#6886 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6886>) +4 other tests skip
>   *
> 
>     igt@kms_pm_dc@dc5-pageflip-negative:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-5/igt@kms_pm_dc@dc5-pageflip-
>         negative.html> (Intel XE#6927 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6927> / Intel XE#8854 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8854>)
>   *
> 
>     igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-5/igt@kms_pm_rpm@dpms-mode-
>         unset-non-lpsp.html> (Intel XE#5810 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5810>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-2/igt@kms_psr2_sf@fbc-psr2-
>         overlay-plane-move-continuous-sf@pipe-a-edp-1.html> (Intel
>         XE#5858 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-2/igt@kms_psr2_sf@fbc-psr2-
>         overlay-plane-move-continuous-sf@pipe-b-edp-1.html> (Intel
>         XE#5858 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5858> / Intel XE#7304 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7304>) +1 other test skip
>   *
> 
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-5/igt@kms_psr2_sf@pr-cursor-
>         plane-move-continuous-exceed-sf.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1 other test
>         skip
>   *
> 
>     igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-5/igt@kms_psr2_sf@pr-plane-
>         move-sf-dmg-area.html> (Intel XE#7304 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7304>) +2 other
>         tests skip
>   *
> 
>     igt@kms_psr2_su@page_flip-p010:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-5/igt@kms_psr2_su@page_flip-
>         p010.html> (Intel XE#2387 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2387> / Intel XE#7429 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7429>)
>   *
> 
>     igt@kms_psr@fbc-pr-no-drrs:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-6/igt@kms_psr@fbc-pr-no-
>         drrs.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1406>) +3 other tests skip
>   *
> 
>     igt@kms_psr@pr-basic:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-5/igt@kms_psr@pr-basic.html>
>         (Intel XE#2234 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2234> / Intel XE#2850 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2850>)
>   *
> 
>     igt@kms_psr@pr-primary-page-flip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@kms_psr@pr-primary-page-
>         flip.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1406>) +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/
>         igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html> (Intel
>         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1127> / Intel XE#5813 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5813>)
>   *
> 
>     igt@kms_vrr@lobf:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-6/igt@kms_vrr@lobf.html>
>         (Intel XE#5950 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5950> / Intel XE#9277 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/9277>)
>   *
> 
>     igt@kms_vrr@lobf@pipe-a-edp-1:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-6/igt@kms_vrr@lobf@pipe-a-
>         edp-1.html> (Intel XE#7638 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/7638> / Intel XE#9277 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/9277>)
>   *
> 
>     igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@sriov_basic@pf-unbind-
>         with-vfs-enabled-numvfs-all.html> (Intel XE#8866 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8866>)
>   *
> 
>     igt@xe_ccs@vm-bind-fault-mode-decompress:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@xe_ccs@vm-bind-fault-
>         mode-decompress.html> (Intel XE#7644 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7644>)
>   *
> 
>     igt@xe_configfs@survivability-mode:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-6/
>         igt@xe_configfs@survivability-mode.html> (Intel XE#8428
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8428>)
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-5/
>         igt@xe_evict@evict-beng-mixed-many-threads-small.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-174937v2/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-
>         threads-small.html> (Intel XE#6321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6321> / Intel
>         XE#8355 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355>)
>   *
> 
>     igt@xe_evict@evict-mixed-threads-large-multi-vm:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-8/igt@xe_evict@evict-mixed-
>         threads-large-multi-vm.html> (Intel XE#5764 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5764>) +8 other
>         tests skip
>   *
> 
>     igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@xe_evict_ccs@evict-
>         overcommit-parallel-nofree-reopen.html> (Intel XE#6540 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6540> / Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +2
>         other tests skip
>   *
> 
>     igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-6/igt@xe_evict_ccs@evict-
>         overcommit-standalone-instantfree-reopen.html> (Intel XE#6144
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144>) +1
>         other test skip
>   *
> 
>     igt@xe_exec_balancer@many-cm-virtual-basic:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-3/igt@xe_exec_balancer@many-
>         cm-virtual-basic.html> (Intel XE#7482 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7482>) +15 other
>         tests skip
>   *
> 
>     igt@xe_exec_balancer@no-exec-cm-parallel-rebind:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@xe_exec_balancer@no-
>         exec-cm-parallel-rebind.html> (Intel XE#7482 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7482>) +4 other
>         tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-5/igt@xe_exec_basic@multigpu-
>         no-exec-bindexecqueue-rebind.html> (Intel XE#2322 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2322> / Intel
>         XE#7372 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7372>) +1 other test skip
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-userptr:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-2/igt@xe_exec_basic@multigpu-
>         no-exec-userptr.html> (Intel XE#5575 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5575> / Intel
>         XE#7484 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7484>) +5 other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@xe_exec_basic@multigpu-
>         once-bindexecqueue-rebind.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1 other test
>         skip
>   *
> 
>     igt@xe_exec_fault_mode@atomic-many:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-1/
>         igt@xe_exec_fault_mode@atomic-many.html> -> FAIL <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-174937v2/shard-bmg-5/
>         igt@xe_exec_fault_mode@atomic-many.html> (Intel XE#8578
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578>)
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-5/igt@xe_exec_fault_mode@many-
>         execqueues-multi-queue-imm.html> (Intel XE#8374 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8374>) +4 other
>         tests skip
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@xe_exec_fault_mode@many-
>         execqueues-multi-queue-userptr-invalidate.html> (Intel XE#8374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374>)
>   *
> 
>     igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-2/
>         igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-
>         race.html> (Intel XE#8374 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/8374>) +8 other tests skip
>   *
> 
>     igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-8/igt@xe_exec_multi_queue@max-
>         queues-preempt-mode-dyn-priority.html> (Intel XE#8364 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8364>) +8 other
>         tests skip
>   *
> 
>     igt@xe_exec_multi_queue@one-queue-close-fd-smem:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-5/igt@xe_exec_multi_queue@one-
>         queue-close-fd-smem.html> (Intel XE#8364 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8364>) +22 other
>         tests skip
>   *
> 
>     igt@xe_exec_multi_queue@two-queues-basic:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@xe_exec_multi_queue@two-
>         queues-basic.html> (Intel XE#8364 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8364>) +6 other
>         tests skip
>   *
> 
>     igt@xe_exec_reset@gt-reset-fault-injection:
> 
>       o shard-ptl: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-174937v2/shard-ptl-2/igt@xe_exec_reset@gt-
>         reset-fault-injection.html> (Intel XE#9130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/9130>)
>   *
> 
>     igt@xe_exec_reset@multi-queue-cancel:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@xe_exec_reset@multi-
>         queue-cancel.html> (Intel XE#8369 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8369>)
>   *
> 
>     igt@xe_exec_reset@multi-queue-close-fd:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-6/igt@xe_exec_reset@multi-
>         queue-close-fd.html> (Intel XE#8369 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8369>) +1 other test
>         skip
>   *
> 
>     igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-10/
>         igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html> -
>          > FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-174937v2/shard-bmg-2/igt@xe_exec_threads@threads-hang-
>         userptr-invalidate-race.html> (Intel XE#9096 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/9096>)
>   *
> 
>     igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-basic:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-5/igt@xe_exec_threads@threads-
>         multi-queue-mixed-shared-vm-basic.html> (Intel XE#8378 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8378>) +2 other
>         tests skip
>   *
> 
>     igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@xe_exec_threads@threads-
>         multi-queue-mixed-userptr-invalidate-race.html> (Intel XE#8378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378>) +2
>         other tests skip
>   *
> 
>     igt@xe_exec_threads@threads-multi-queue-shared-vm-rebind:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-3/igt@xe_exec_threads@threads-
>         multi-queue-shared-vm-rebind.html> (Intel XE#8378 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8378>) +2 other
>         tests skip
>   *
> 
>     igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-5/
>         igt@xe_fault_injection@inject-fault-probe-function-
>         xe_pcode_probe_early.html> -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-174937v2/shard-bmg-7/
>         igt@xe_fault_injection@inject-fault-probe-function-
>         xe_pcode_probe_early.html> (Intel XE#8007 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8007>)
>   *
> 
>     igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-5/igt@xe_multigpu_svm@mgpu-
>         atomic-op-conflict.html> (Intel XE#6964 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6964>) +2 other
>         tests skip
>   *
> 
>     igt@xe_multigpu_svm@mgpu-pagefault-basic:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-8/igt@xe_multigpu_svm@mgpu-
>         pagefault-basic.html> (Intel XE#6964 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6964>)
>   *
> 
>     igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@xe_multigpu_svm@mgpu-
>         xgpu-access-prefetch.html> (Intel XE#6964 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6964>)
>   *
> 
>     igt@xe_page_reclaim@basic-mixed:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@xe_page_reclaim@basic-
>         mixed.html> (Intel XE#7793 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/7793>)
>   *
> 
>     igt@xe_pat@xa-app-transient-media-on:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-2/igt@xe_pat@xa-app-transient-
>         media-on.html> (Intel XE#7590 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7590>)
>   *
> 
>     igt@xe_pm@d3cold-basic-exec:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@xe_pm@d3cold-basic-
>         exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284> / Intel XE#366 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/366> / Intel XE#7370
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370>)
>   *
> 
>     igt@xe_pm@d3cold-mmap-system:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-5/igt@xe_pm@d3cold-mmap-
>         system.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284> / Intel XE#7370 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7370>)
>   *
> 
>     igt@xe_pm@s3-mocs:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-3/igt@xe_pm@s3-mocs.html>
>         (Intel XE#6867 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6867>) +2 other tests skip
>   *
> 
>     igt@xe_pm@s3-vm-bind-prefetch:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@xe_pm@s3-vm-bind-
>         prefetch.html> (Intel XE#584 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/584> / Intel XE#7369 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7369>)
>   *
> 
>     igt@xe_pm@s4-vm-bind-unbind-all:
> 
>       o shard-ptl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-ptl-3/
>         igt@xe_pm@s4-vm-bind-unbind-all.html> -> ABORT <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-174937v2/shard-ptl-6/
>         igt@xe_pm@s4-vm-bind-unbind-all.html> (Intel XE#9362 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/9362>) +2 other
>         tests abort
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-lnl-3/
>         igt@xe_pm@s4-vm-bind-unbind-all.html> -> ABORT <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-174937v2/shard-lnl-1/
>         igt@xe_pm@s4-vm-bind-unbind-all.html> (Intel XE#9362 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/9362>) +1 other test
>         abort
>   *
> 
>     igt@xe_prefetch_fault@prefetch-fault-svm:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-5/
>         igt@xe_prefetch_fault@prefetch-fault-svm.html> (Intel XE#7599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599>)
>   *
> 
>     igt@xe_pxp@pxp-termination-key-update-post-rpm:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-5/igt@xe_pxp@pxp-termination-
>         key-update-post-rpm.html> (Intel XE#4733 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4733> / Intel
>         XE#7417 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417>)
>   *
> 
>     igt@xe_query@multigpu-query-invalid-cs-cycles:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-bmg-8/igt@xe_query@multigpu-query-
>         invalid-cs-cycles.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-3/igt@xe_query@multigpu-query-
>         invalid-cs-cycles.html> (Intel XE#6019 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6019>)
>   *
> 
>     igt@xe_sriov_vfio@open-basic:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-lnl-2/igt@xe_sriov_vfio@open-
>         basic.html> (Intel XE#7724 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/7724>)
>   *
> 
>     igt@xe_survivability@runtime-survivability:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-6/
>         igt@xe_survivability@runtime-survivability.html> (Intel XE#8415
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415> /
>         Intel XE#8432 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/8432>)
>   *
> 
>     igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-174937v2/shard-ptl-3/igt@xe_vm@overcommit-fault-
>         vram-lr-no-overcommit.html> (Intel XE#7892 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7892>) +1 other test
>         skip
>   *
> 
>     igt@xe_wedged@basic-wedged:
> 
>       o shard-ptl: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-174937v2/shard-ptl-5/igt@xe_wedged@basic-
>         wedged.html> (Intel XE#8963 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/8963>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-7/
>         igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-
>         a-3.html> (Intel XE#7084 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/7084> / Intel XE#8150 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8150>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174937v2/shard-
>         bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-
>         hdmi-a-3.html>
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
> 
>       o shard-ptl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-ptl-6/
>         igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html> (Intel
>         XE#9362 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/9362>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-174937v2/shard-ptl-3/igt@kms_cursor_crc@cursor-
>         suspend@pipe-a-edp-1.html> +6 other tests pass
>   *
> 
>     igt@kms_hdr@static-toggle-suspend:
> 
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-7/
>         igt@kms_hdr@static-toggle-suspend.html> -> PASS <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-174937v2/shard-bmg-2/
>         igt@kms_hdr@static-toggle-suspend.html> +1 other test pass
>   *
> 
>     igt@kms_pm_dc@deep-pkgc:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-lnl-8/
>         igt@kms_pm_dc@deep-pkgc.html> (Intel XE#2029 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2029> / Intel
>         XE#7395 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7395>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-174937v2/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html>
>   *
> 
>     igt@kms_vblank@accuracy-idle:
> 
>       o shard-ptl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-ptl-6/
>         igt@kms_vblank@accuracy-idle.html> -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-174937v2/shard-ptl-1/
>         igt@kms_vblank@accuracy-idle.html> +1 other test pass
>   *
> 
>     igt@kms_vblank@ts-continuation-suspend:
> 
>       o shard-ptl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-ptl-8/
>         igt@kms_vblank@ts-continuation-suspend.html> (Intel XE#9375
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174937v2/
>         shard-ptl-8/igt@kms_vblank@ts-continuation-suspend.html> +1
>         other test pass
>   *
> 
>     igt@kms_vrr@flip-dpms@pipe-a-edp-1:
> 
>       o shard-ptl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-ptl-7/
>         igt@kms_vrr@flip-dpms@pipe-a-edp-1.html> (Intel XE#4227
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227> /
>         Intel XE#7397 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7397>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-174937v2/shard-ptl-4/igt@kms_vrr@flip-dpms@pipe-a-
>         edp-1.html> +3 other tests pass
>   *
> 
>     igt@xe_exec_system_allocator@partial-atomic-middle-remap-cpu-fault:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-2/
>         igt@xe_exec_system_allocator@partial-atomic-middle-remap-cpu-
>         fault.html> (Intel XE#9115 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/9115>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-174937v2/shard-bmg-1/
>         igt@xe_exec_system_allocator@partial-atomic-middle-remap-cpu-
>         fault.html>
>   *
> 
>     igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
> 
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-1/
>         igt@xe_fault_injection@inject-fault-probe-function-
>         xe_wopcm_init.html> (Intel XE#8007 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8007>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174937v2/shard-
>         bmg-5/igt@xe_fault_injection@inject-fault-probe-function-
>         xe_wopcm_init.html>
>   *
> 
>     igt@xe_pm@s4-mocs:
> 
>       o shard-lnl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-lnl-6/
>         igt@xe_pm@s4-mocs.html> (Intel XE#9362 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/9362>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174937v2/shard-
>         lnl-2/igt@xe_pm@s4-mocs.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_async_flips@async-flip-suspend-resume:
> 
>       o shard-ptl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-ptl-6/
>         igt@kms_async_flips@async-flip-suspend-resume.html> (Intel
>         XE#9362 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/9362>) -> ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-174937v2/shard-ptl-1/igt@kms_async_flips@async-flip-
>         suspend-resume.html> (Intel XE#9375 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/9375> / Intel
>         XE#9394 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9394>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-2/
>         igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426> /
>         Intel XE#5848 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5848>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-174937v2/shard-bmg-1/igt@kms_tiled_display@basic-test-
>         pattern.html> (Intel XE#1729 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1729> / Intel XE#7424 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7424>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-8/
>         igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2426 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2426> / Intel XE#5848 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5848>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-174937v2/shard-bmg-4/
>         igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2509 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2509> / Intel XE#7437 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7437>)
>   *
> 
>     igt@xe_pat@pat-sw-hw-suspend:
> 
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-bmg-8/
>         igt@xe_pat@pat-sw-hw-suspend.html> (Intel XE#9362 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/9362>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174937v2/shard-
>         bmg-4/igt@xe_pat@pat-sw-hw-suspend.html> (Intel XE#7695
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695>)
>       o shard-ptl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5824-999838292166407bbe911a41dee23112c49e9d44/shard-ptl-3/
>         igt@xe_pat@pat-sw-hw-suspend.html> (Intel XE#7695 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7695>) -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174937v2/shard-
>         ptl-7/igt@xe_pat@pat-sw-hw-suspend.html> (Intel XE#9362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * Linux: xe-5824-999838292166407bbe911a41dee23112c49e9d44 -> xe-
>     pw-174937v2
> 
> IGT_9112: 8d3284b5ae16ca1aef353dfaffb6c0896ceacc19 @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-5824-999838292166407bbe911a41dee23112c49e9d44: 
> 999838292166407bbe911a41dee23112c49e9d44
> xe-pw-174937v2: 174937v2
> 

