Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA51606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 11:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ursulin.net header.i=@ursulin.net header.a=rsa-sha256 header.s=google header.b=YfvcNphq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A9210E035;
	Wed, 21 Oct 2026 11:18:15 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41ED810E035
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 11:18:09 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-48df4e9d2d4so364762f8f.3
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 04:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1792581487; x=1793186287; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0FYx3ziy3a6kJ/elD2YTt4M+woFbfyXbnGY4NEJZSDM=;
 b=YfvcNphqCNlCHw6oLjs0eGiOVhUFnKsFOnEqeopkYGPLNfgdWhFh57KF8dPKdgQB6I
 Zrsun+xvRIJ7qtvdHJYjb42qT1sHW/tGaPKh6vwFjksK8lfyRmn3f+qDSWe+/VWD8NIz
 DUbX/4ohPLmaIUOL1RHbCt1NRcetIGYU/xBMj4obNYilouW2EattIHPF9vdiiGTTJuJ/
 4h6jmCk1a+OX2F20Wro9I4FganP3yEXnxXXOH/binFWj78/+g4QZD5kXnQTQETpjYeNo
 zYGzygdPNJxfUj9M1dEjMvXrcSc2CJDTibYHWJGh5zhkKNJiXUimXc8OYtfLSnpgY+MM
 MXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792581487; x=1793186287;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0FYx3ziy3a6kJ/elD2YTt4M+woFbfyXbnGY4NEJZSDM=;
 b=CYNiXJKfvJ6WcmY+0vhgYt1nVhjTL+YTNYlGCfPrp/A+gmukhGHoOaBhf+A5XShsrS
 /Z+E6DHbadQZxosl7nWLacqLNhYTi8MFQb/dvalj1sBcGxDO9sXjW0at1K9cvs/MRga9
 /7/6P5kseE3ZBsWxVUO8e90yTrGmi4MHdHwZJv1siPttLpz87yROVzCcibAtbabxUSzs
 UVoSip/RCkGXoRza0FaZQf1oC0MGZelSSBwoEL9Sh1Zu1SB98hwm2iyQlzBkmKBwnuDd
 snDfp+H410mQSDzHSzBMmaOhCYDZyhht973Vf/7EmBqEWItuWR1adrHV5qJ32z9k+jkc
 oFSw==
X-Gm-Message-State: AFq9FYIc4SBKfcVj0/lXHa/wPsM4Ht/650MgpbQVTGTeUFSt78bSHs8G
 Qw7ME36Rmn33cIsfIko+z5u5o1LG5T1mw5he1YYH2M1Bu3pxGegkXq44kwNaHwueMuDo7nQSTmX
 vGDDS
X-Gm-Gg: AYBFou271406+FnFo/VMandygGgfzcT7LJ1AjwoJhL2e/jyFEXsrUQ5FMA5oJf5v0oy
 +XpuwNUGEwgKHmXzUr0b/9HwA986vYRj7H1vivByK2MhkvqV/aU4qewcKUBdCeHazHcQaL0oqvG
 SkmatT2+1OKADc+UTHSGCIfrI+UoyzoAPFG1so67IHFm+0kspp5/ajj5RRvDiFoAzg6nT6SvOKC
 BuVrYLqrag9a5KvdxMt7J3EmFGNEkPG1Uk9XK2o8uQYmeO8ZtImTzY+4A6F5vX/VT7njI5+IXKl
 /SHKteYJGhsoiH6V5lEt0RGSY5jAC9rwQ8hiyC1m9NLaRph4l3civgnT1r/p92H1LXDmZpcPjid
 tPfN4m2SKO363LmCAVTgd3GfPH/JCtUJIHHB0GuL90cBGuGQoelyi1RBPwWIp4qjeKeRY7+yufO
 Ks2LE/7JEXrBPoqtVxkA2ndNWIoR2CuxwNoFfGePCLuaTY0yo16zEB33myQhDuhqHaAWxyrWise
 yd098gAkmZTTbMT1Hzbw0oR3uETvwY7E9vJ8dD/KqD++wY9W5dgNToLkr7IlWFQfZmzga0ffYQL
 k3Ta+hDaEfhqF7QN4Y0=
X-Received: by 2002:a05:600c:190f:b0:4a2:1a:a11d with SMTP id
 5b1f17b1804b1-4a2001aa316mr22159365e9.0.1792581486748; 
 Wed, 21 Oct 2026 04:18:06 -0700 (PDT)
Received: from [192.168.0.116] ([81.79.79.1]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1fd546371sm19030935e9.2.2026.10.21.04.18.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 04:18:06 -0700 (PDT)
Message-ID: <5694f56b-6dfa-4d87-ba3b-0f73a8b1a024@ursulin.net>
Date: Wed, 21 Oct 2026 12:18:05 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/lrc?=
 =?UTF-8?Q?=3A_Restore_CTX=5FCS=5FINDIRECT=5FCTX=5FOFFSET_programming_for_pr?=
 =?UTF-8?Q?e-Xe2?=
To: intel-xe@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>, Helen Koike <koike@igalia.com>
References: <20261016214112.1647202-1-koike@igalia.com>
 <179221004956.36666.14877204128152344270@221881a7231d>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <179221004956.36666.14877204128152344270@221881a7231d>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 17/10/2026 05:07, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/lrc: Restore CTX_CS_INDIRECT_CTX_OFFSET programming for 
> pre-Xe2
> *URL:*	https://patchwork.freedesktop.org/series/176319/ <https:// 
> patchwork.freedesktop.org/series/176319/>
> *State:*	success
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176319v1/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176319v1/ 
> index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89_FULL -> xe-
>   pw-176319v1_FULL
> 
> 
>     Summary
> 
> *SUCCESS*
> 
> No regressions found.

Looks good to merge if someone could pick it up please?

Regards,

Tvrtko

> 
> 
>     Participating hosts (3 -> 3)
> 
> No changes in participating hosts
> 
> 
>     New tests
> 
> New tests have been introduced between 
> xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89_FULL and xe- 
> pw-176319v1_FULL:
> 
> 
>       New IGT tests (5)
> 
>   *
> 
>     igt@kms_invalid_mode@bad-vsync-end@pipe-d-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.03] s
>   *
> 
>     igt@kms_sequence@get-forked@pipe-d-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [2.38] s
>   *
> 
>     igt@kms_sequence@get-idle@pipe-d-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [2.34] s
>   *
> 
>     igt@kms_vblank@query-forked-hang@pipe-d-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [2.37] s
>   *
> 
>     igt@kms_vblank@ts-continuation-modeset-hang@pipe-d-dp-1:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.45] s
> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-176319v1_FULL that come from known 
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
>     igt@intel_hwmon@hwmon-write:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-1/igt@intel_hwmon@hwmon-
>         write.html> (Intel XE#7225 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/7225>)
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-2/
>         igt@kms_async_flips@alternate-sync-async-flip.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-
>         bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html> (Intel
>         XE#3718 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3718> / Intel XE#6078 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6078>)
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-2/
>         igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html>
>         -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-176319v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-
>         async-flip@pipe-c-dp-2.html> (Intel XE#6078 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6078>)
>   *
> 
>     igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/igt@kms_big_fb@linear-max-
>         hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#7059 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7059> / Intel
>         XE#7085 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085>)
>   *
> 
>     igt@kms_big_fb@x-tiled-64bpp-rotate-270:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/igt@kms_big_fb@x-
>         tiled-64bpp-rotate-270.html> (Intel XE#2327 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +2 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-64bpp-rotate-270:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/igt@kms_big_fb@y-
>         tiled-64bpp-rotate-270.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1 other test
>         skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-1/igt@kms_big_fb@yf-tiled-
>         addfb-size-offset-overflow.html> (Intel XE#5851 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5851>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-1/igt@kms_big_fb@yf-tiled-max-
>         hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#5808
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808>) +6
>         other tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-7/igt@kms_bw@connected-linear-
>         tiling-2-displays-target-2560x1440p.html> (Intel XE#7679
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679>) +2
>         other tests skip
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-7/igt@kms_bw@linear-tiling-3-
>         displays-target-1920x1080p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1 other test skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-7/igt@kms_ccs@bad-rotation-90-
>         y-tiled-gen12-mc-ccs.html> (Intel XE#5822 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5822>) +2 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-9/igt@kms_ccs@crc-primary-
>         basic-4-tiled-lnl-ccs@pipe-b-dp-2.html> (Intel XE#2652 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2652>) +3 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-9/igt@kms_ccs@crc-primary-
>         basic-4-tiled-mtl-mc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +7 other
>         tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-d-edp-1:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-1/igt@kms_ccs@random-ccs-
>         data-4-tiled-bmg-ccs@pipe-d-edp-1.html> (Intel XE#5823 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5823> / Intel
>         XE#6918 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6918>) +4 other tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-blue-to-red:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/igt@kms_chamelium_color@ctm-
>         blue-to-red.html> (Intel XE#2325 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2325> / Intel
>         XE#7358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358>)
>   *
> 
>     igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lut1d:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-1/
>         igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-
>         bt601-lut1d.html> (Intel XE#8391 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8391>)
>   *
> 
>     igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-7/igt@kms_chamelium_edid@dp-
>         edid-change-during-hibernate.html> (Intel XE#2252 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +4 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_edid@dp-edid-resolution-list:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/igt@kms_chamelium_edid@dp-
>         edid-resolution-list.html> (Intel XE#2252 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +1 other test
>         skip
>   *
> 
>     igt@kms_chamelium_sharpness_filter@filter-basic:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-7/
>         igt@kms_chamelium_sharpness_filter@filter-basic.html> (Intel
>         XE#6507 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507>)
>   *
> 
>     igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-4:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/
>         igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-
>         plane-4.html> (Intel XE#6969 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6969>) +7 other tests skip
>   *
> 
>     igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/
>         igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html>
>         (Intel XE#3304 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3304> / Intel XE#7374 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7374>) +1 other test fail
>   *
> 
>     igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-1:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-7/
>         igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-1.html>
>         (Intel XE#3304 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3304>)
>   *
> 
>     igt@kms_content_protection@atomic@pipe-a-dp-2:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-9/
>         igt@kms_content_protection@atomic@pipe-a-dp-2.html> (Intel
>         XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1178> / Intel XE#3304 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3304> / Intel XE#7374 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7374>)
>   *
> 
>     igt@kms_content_protection@lic-type-0-hdcp14:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-1/
>         igt@kms_content_protection@lic-type-0-hdcp14.html> (Intel
>         XE#7642 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642>)
>   *
> 
>     igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-7/
>         igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1.html>
>         (Intel XE#6707 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6707> / Intel XE#7439 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7439>)
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-32x10:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-1/igt@kms_cursor_crc@cursor-
>         onscreen-32x10.html> (Intel XE#5900 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5900>)
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-32x32:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/igt@kms_cursor_crc@cursor-
>         onscreen-32x32.html> (Intel XE#2320 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +2 other
>         tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-1/igt@kms_cursor_crc@cursor-
>         rapid-movement-512x170.html> (Intel XE#5846 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5846>) +1 other test
>         skip
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-3/igt@kms_cursor_crc@cursor-
>         sliding-512x512.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321> / Intel
>         XE#7355 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355>)
>   *
> 
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-7/igt@kms_cursor_legacy@2x-
>         flip-vs-cursor-legacy.html> (Intel XE#5962 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5962>) +1 other test
>         skip
>   *
> 
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-9/igt@kms_dirtyfb@psr-dirtyfb-
>         ioctl.html> (Intel XE#1508 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1508>)
>   *
> 
>     igt@kms_dp_link_training@uhbr-mst:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-7/
>         igt@kms_dp_link_training@uhbr-mst.html> (Intel XE#9533 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/9533>)
>   *
> 
>     igt@kms_dsc@dsc-with-bpc-ultrajoiner:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-
>         ultrajoiner.html> (Intel XE#8265 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8265>)
>   *
> 
>     igt@kms_dsc@dsc-with-formats-bigjoiner:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-2/igt@kms_dsc@dsc-with-
>         formats-bigjoiner.html> (Intel XE#5907 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5907>) +1 other test
>         skip
>   *
> 
>     igt@kms_fbcon_fbt@psr-suspend:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/igt@kms_fbcon_fbt@psr-
>         suspend.html> (Intel XE#8680 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/8680>)
>   *
> 
>     igt@kms_feature_discovery@chamelium:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/
>         igt@kms_feature_discovery@chamelium.html> (Intel XE#2372
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372> /
>         Intel XE#7359 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7359>)
>   *
> 
>     igt@kms_feature_discovery@display-3x:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-9/
>         igt@kms_feature_discovery@display-3x.html> (Intel XE#2373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373> /
>         Intel XE#7448 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7448>)
>   *
> 
>     igt@kms_flip@2x-blocking-absolute-wf_vblank:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-2/igt@kms_flip@2x-blocking-
>         absolute-wf_vblank.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +3 other
>         tests skip
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@c-edp1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-3/
>         igt@kms_flip@flip-vs-expired-vblank@c-edp1.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-
>         lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html> (Intel
>         XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301> / Intel XE#3149 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3149>)
>   *
> 
>     igt@kms_flip@modeset-vs-vblank-race:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-10/
>         igt@kms_flip@modeset-vs-vblank-race.html> -> FAIL <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-bmg-4/
>         igt@kms_flip@modeset-vs-vblank-race.html> (Intel XE#3098
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098> /
>         Intel XE#3149 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3149>) +1 other test fail
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-
>     upscaling:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling.html> (Intel XE#7178 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7178> / Intel
>         XE#7351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7351>) +2 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-7/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-
>         upscaling.html> (Intel XE#7178 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7178>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-
>     reflect-x:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-1/
>         igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-
>         linear-reflect-x.html> (Intel XE#7179 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7179>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrshdr-slowdraw:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@drrshdr-slowdraw.html> (Intel
>         XE#2311 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2311>) +22 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-
>         fullscreen.html> (Intel XE#4141 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4141>) +6 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-1/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#5812 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/5812>) +28 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-
>     mmap-wc:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-7/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-
>         draw-mmap-wc.html> (Intel XE#6312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6312>) +8 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-1/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-
>         onoff.html> (Intel XE#5800 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/5800> / Intel XE#6312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6312>) +2 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-
>         render.html> (Intel XE#7061 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/7061> / Intel XE#7356 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7356>) +2 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-
>         render.html> (Intel XE#7061 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/7061>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-2/
>         igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#7865 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7865>) +9 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-2/
>         igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc.html>
>         (Intel XE#7061 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7061>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-
>         move.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2313>) +27 other tests skip
>   *
> 
>     igt@kms_hdmi_audio_bw@audio-bw-hblank80:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-1/igt@kms_hdmi_audio_bw@audio-
>         bw-hblank80.html> (Intel XE#9312 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/9312>)
>   *
> 
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-9/
>         igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel
>         XE#7591 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591>)
>   *
> 
>     igt@kms_pipe_stress@stress-xrgb8888-xtiled:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-1/igt@kms_pipe_stress@stress-
>         xrgb8888-xtiled.html> (Intel XE#6912 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6912>)
>   *
> 
>     igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-2/igt@kms_plane@pixel-format-
>         y-tiled-ccs-modifier-source-clamping.html> (Intel XE#7283
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283>) +1
>         other test skip
>   *
> 
>     igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/igt@kms_plane@pixel-format-
>         yf-tiled-modifier-source-clamping.html> (Intel XE#7283 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7283>) +3 other
>         tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-7/
>         igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html>
>         (Intel XE#6886 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6886>) +4 other tests skip
>   *
> 
>     igt@kms_pm_backlight@fade-with-dpms:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/igt@kms_pm_backlight@fade-
>         with-dpms.html> (Intel XE#7376 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7376> / Intel XE#7760 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7760> / Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-1/igt@kms_pm_dc@dc3co-after-
>         dc6@pr-xrgb8888.html> (Intel XE#8395 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8395> / Intel
>         XE#8396 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/8396>) +1 other test skip
>   *
> 
>     igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-1/igt@kms_pm_dc@dc3co-after-
>         dc6@psr2-yuv420.html> (Intel XE#8396 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8396>) +1 other test
>         skip
>   *
> 
>     igt@kms_pm_rpm@package-g7:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/igt@kms_pm_rpm@package-
>         g7.html> (Intel XE#6814 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/6814> / Intel XE#7428 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7428>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-
>     sf@pipe-a-edp-1:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-2/igt@kms_psr2_sf@fbc-psr2-
>         cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1.html> (Intel
>         XE#5858 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-
>     sf@pipe-b-edp-1:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-2/igt@kms_psr2_sf@fbc-psr2-
>         cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html> (Intel
>         XE#5858 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5858> / Intel XE#7304 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7304>) +1 other test skip
>   *
> 
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-3/igt@kms_psr2_sf@pr-cursor-
>         plane-move-continuous-exceed-fully-sf.html> (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +4
>         other tests skip
>   *
> 
>     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-2/igt@kms_psr2_sf@pr-overlay-
>         plane-move-continuous-exceed-fully-sf.html> (Intel XE#7304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304>)
>   *
> 
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-3/igt@kms_psr2_su@frontbuffer-
>         xrgb8888.html> (Intel XE#2387 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2387> / Intel XE#7429 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7429>)
>   *
> 
>     igt@kms_psr2_su@page_flip-nv12:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-7/igt@kms_psr2_su@page_flip-
>         nv12.html> (Intel XE#7413 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/7413>)
>   *
> 
>     igt@kms_psr@fbc-psr-sprite-render:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-9/igt@kms_psr@fbc-psr-sprite-
>         render.html> (Intel XE#2234 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2234> / Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +2 other
>         tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-7/igt@kms_psr@fbc-psr2-
>         primary-page-flip@edp-1.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406> / Intel
>         XE#5835 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5835>) +1 other test skip
>   *
> 
>     igt@kms_psr@pr-sprite-plane-onoff:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-7/igt@kms_psr@pr-sprite-plane-
>         onoff.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1406>) +2 other tests skip
>   *
> 
>     igt@kms_psr@psr2-primary-render:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/igt@kms_psr@psr2-primary-
>         render.html> (Intel XE#2234 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2234>)
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-90:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-1/igt@kms_rotation_crc@sprite-
>         rotation-90.html> (Intel XE#5821 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5821>)
>   *
> 
>     igt@kms_setmode@invalid-clone-exclusive-crtc:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-7/igt@kms_setmode@invalid-
>         clone-exclusive-crtc.html> (Intel XE#5910 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5910>)
>   *
> 
>     igt@kms_sharpness_filter@filter-toggle:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/
>         igt@kms_sharpness_filter@filter-toggle.html> (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>) +1
>         other test skip
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-2/igt@kms_tiled_display@basic-
>         test-pattern.html> (Intel XE#5848 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5848>)
>   *
> 
>     igt@kms_vrr@flip-basic-fastset:
> 
>       o shard-ptl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-6/
>         igt@kms_vrr@flip-basic-fastset.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-8/
>         igt@kms_vrr@flip-basic-fastset.html> (Intel XE#4227 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4227> / Intel
>         XE#7397 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397>)
>   *
> 
>     igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
> 
>       o shard-ptl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-6/
>         igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-
>         ptl-8/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html> (Intel
>         XE#6293 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6293> / Intel XE#7397 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7397>)
>   *
> 
>     igt@kms_vrr@lobf-dc3co:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-7/igt@kms_vrr@lobf-dc3co.html>
>         (Intel XE#8397 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/8397>)
>   *
> 
>     igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:
> 
>       o shard-ptl: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-4/igt@sriov_basic@pf-unbind-
>         with-vfs-enabled-numvfs-all.html> (Intel XE#8868 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8868>) +1 other test
>         abort
>   *
> 
>     igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-2/igt@xe_evict@evict-beng-cm-
>         threads-large-multi-vm.html> (Intel XE#5764 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5764>) +5 other
>         tests skip
>   *
> 
>     igt@xe_exec_balancer@many-execqueues-virtual-userptr-invalidate-race:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-2/igt@xe_exec_balancer@many-
>         execqueues-virtual-userptr-invalidate-race.html> (Intel XE#7482
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482>) +3
>         other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/igt@xe_exec_basic@multigpu-
>         no-exec-userptr-invalidate.html> (Intel XE#2322 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2322> / Intel
>         XE#7372 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7372>) +2 other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-once-bindexecqueue:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-7/igt@xe_exec_basic@multigpu-
>         once-bindexecqueue.html> (Intel XE#5575 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/5575> / Intel
>         XE#7484 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7484>) +1 other test skip
>   *
> 
>     igt@xe_exec_fault_mode@many-multi-queue-rebind:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-3/igt@xe_exec_fault_mode@many-
>         multi-queue-rebind.html> (Intel XE#8374 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8374>) +5 other
>         tests skip
>   *
> 
>     igt@xe_exec_fault_mode@once-multi-queue-invalid-fault:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-1/igt@xe_exec_fault_mode@once-
>         multi-queue-invalid-fault.html> (Intel XE#8374 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8374>) +3 other
>         tests skip
>   *
> 
>     igt@xe_exec_multi_queue@max-queues-preempt-mode-priority:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-1/igt@xe_exec_multi_queue@max-
>         queues-preempt-mode-priority.html> (Intel XE#8364 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8364>) +9 other
>         tests skip
>   *
> 
>     igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-9/igt@xe_exec_multi_queue@two-
>         queues-preempt-mode-fault-priority.html> (Intel XE#8364
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364>) +14
>         other tests skip
>   *
> 
>     igt@xe_exec_reset@multi-queue-cat-error-on-secondary:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-9/igt@xe_exec_reset@multi-
>         queue-cat-error-on-secondary.html> (Intel XE#8369 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8369>)
>   *
> 
>     igt@xe_exec_reset@multi-queue-gt-reset:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-7/igt@xe_exec_reset@multi-
>         queue-gt-reset.html> (Intel XE#8369 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8369>)
>   *
> 
>     igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-9/igt@xe_exec_threads@threads-
>         multi-queue-mixed-fd-userptr.html> (Intel XE#8378 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8378>) +5 other
>         tests skip
>   *
> 
>     igt@xe_exec_threads@threads-multi-queue-shared-vm-basic:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-1/igt@xe_exec_threads@threads-
>         multi-queue-shared-vm-basic.html> (Intel XE#8378 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/8378>) +2 other
>         tests skip
>   *
> 
>     igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-10/
>         igt@xe_fault_injection@inject-fault-probe-function-
>         xe_sriov_init.html> -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-10/
>         igt@xe_fault_injection@inject-fault-probe-function-
>         xe_sriov_init.html> (Intel XE#9463 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/9463>)
>   *
> 
>     igt@xe_gpgpu_fill@offset-4x4:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-9/
>         igt@xe_gpgpu_fill@offset-4x4.html> (Intel XE#7954 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7954>)
>   *
> 
>     igt@xe_mempage_offline@inject-duplicate-page:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-2/
>         igt@xe_mempage_offline@inject-duplicate-page.html> (Intel
>         XE#9203 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203>)
>   *
> 
>     igt@xe_mmap@small-bar:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-1/igt@xe_mmap@small-bar.html>
>         (Intel XE#5867 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/5867>)
>   *
> 
>     igt@xe_multigpu_svm@mgpu-latency-basic:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-9/igt@xe_multigpu_svm@mgpu-
>         latency-basic.html> (Intel XE#6964 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/6964>)
>   *
> 
>     igt@xe_page_reclaim@basic-mixed:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-9/igt@xe_page_reclaim@basic-
>         mixed.html> (Intel XE#7793 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/7793>)
>   *
> 
>     igt@xe_page_reclaim@binds-1g-partial:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-1/
>         igt@xe_page_reclaim@binds-1g-partial.html> (Intel XE#7793
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793>)
>   *
> 
>     igt@xe_pat@pat-index-xelp:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/igt@xe_pat@pat-index-
>         xelp.html> (Intel XE#2245 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2245> / Intel XE#7590 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7590>)
>   *
> 
>     igt@xe_pat@xa-app-transient-media-off:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-3/igt@xe_pat@xa-app-transient-
>         media-off.html> (Intel XE#7590 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/7590>)
>   *
> 
>     igt@xe_pm@d3cold-multiple-execs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/igt@xe_pm@d3cold-multiple-
>         execs.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284> / Intel XE#7370 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7370>)
>   *
> 
>     igt@xe_pm@s3-vm-bind-unbind-all:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-2/igt@xe_pm@s3-vm-bind-unbind-
>         all.html> (Intel XE#6867 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/6867>) +1 other test skip
>   *
> 
>     igt@xe_pm@s4-basic-exec:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-2/
>         igt@xe_pm@s4-basic-exec.html> -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-lnl-8/igt@xe_pm@s4-
>         basic-exec.html> (Intel XE#9362 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/9362>) +1 other test abort
>   *
> 
>     igt@xe_pm@s4-vm-bind-userptr:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-6/
>         igt@xe_pm@s4-vm-bind-userptr.html> -> DMESG-WARN <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-lnl-2/
>         igt@xe_pm@s4-vm-bind-userptr.html> (Intel XE#7727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7727>) +1 other test
>         dmesg-warn
>   *
> 
>     igt@xe_pm_residency@gt-c6-freeze:
> 
>       o shard-ptl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-6/
>         igt@xe_pm_residency@gt-c6-freeze.html> -> ABORT <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-8/
>         igt@xe_pm_residency@gt-c6-freeze.html> (Intel XE#9362 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/9362>) +6 other
>         tests abort
>   *
> 
>     igt@xe_pxp@pxp-termination-key-update-post-suspend:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-9/igt@xe_pxp@pxp-termination-
>         key-update-post-suspend.html> (Intel XE#4733 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4733> / Intel
>         XE#7417 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/7417>) +1 other test skip
>   *
> 
>     igt@xe_query@multigpu-query-pxp-status:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-bmg-1/igt@xe_query@multigpu-query-
>         pxp-status.html> (Intel XE#944 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_query@multigpu-query-topology:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-1/igt@xe_query@multigpu-query-
>         topology.html> (Intel XE#6019 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/6019>)
>   *
> 
>     igt@xe_survivability@runtime-survivability:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-2/
>         igt@xe_survivability@runtime-survivability.html> (Intel XE#8415
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415> /
>         Intel XE#8432 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/8432>)
>   *
> 
>     igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:
> 
>       o shard-ptl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-176319v1/shard-ptl-1/igt@xe_vm@overcommit-fault-
>         vram-lr-no-overcommit.html> (Intel XE#9597 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/9597>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:
> 
>       o shard-ptl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-8/
>         igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-
>         edp-1.html> (Intel XE#7084 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/7084> / Intel XE#9378 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/9378>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-
>         ptl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-
>         edp-1.html> +1 other test pass
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-edp-1:
> 
>       o shard-ptl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-8/
>         igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-
>         edp-1.html> (Intel XE#9412 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/9412>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-176319v1/shard-ptl-4/igt@kms_ccs@crc-
>         primary-suspend-4-tiled-lnl-ccs@pipe-d-edp-1.html>
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend:
> 
>       o shard-ptl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-8/
>         igt@kms_cursor_crc@cursor-suspend.html> (Intel XE#9375 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/9375>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-
>         ptl-2/igt@kms_cursor_crc@cursor-suspend.html> +1 other test pass
>   *
> 
>     igt@kms_flip@2x-flip-vs-suspend:
> 
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-4/
>         igt@kms_flip@2x-flip-vs-suspend.html> (Intel XE#9362 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/9362>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-
>         bmg-3/igt@kms_flip@2x-flip-vs-suspend.html> +1 other test pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1:
> 
>       o shard-ptl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-5/
>         igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1.html>
>         (Intel XE#3149 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3149> / Intel XE#3321 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3321>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-3/
>         igt@kms_flip@flip-vs-expired-vblank-interruptible@d-edp1.html>
>         +1 other test pass
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-8/
>         igt@xe_evict@evict-beng-mixed-many-threads-small.html> (Intel
>         XE#6321 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/6321> / Intel XE#8355 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/8355>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-bmg-1/
>         igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>   *
> 
>     igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-1/
>         igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html>
>         (Intel XE#9096 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/9096>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-176319v1/shard-lnl-3/igt@xe_exec_threads@threads-hang-
>         userptr-invalidate-race.html>
>   *
> 
>     igt@xe_module_load@load:
> 
>       o shard-ptl: (PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-6/
>         igt@xe_module_load@load.html>, SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-8/
>         igt@xe_module_load@load.html>) (Intel XE#9286 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/9286>) -> (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-
>         ptl-2/igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-8/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-4/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-7/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-2/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-6/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-1/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-3/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-5/
>         igt@xe_module_load@load.html>, PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-ptl-5/
>         igt@xe_module_load@load.html>)
>   *
> 
>     igt@xe_module_load@reload:
> 
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-1/
>         igt@xe_module_load@reload.html> (Intel XE#9463 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/9463>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-
>         bmg-1/igt@xe_module_load@reload.html>
>   *
> 
>     igt@xe_pmu@engine-activity-suspend:
> 
>       o shard-ptl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-4/
>         igt@xe_pmu@engine-activity-suspend.html> (Intel XE#9362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176319v1/
>         shard-ptl-1/igt@xe_pmu@engine-activity-suspend.html> +2 other
>         tests pass
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-lnl-3/
>         igt@kms_flip@flip-vs-expired-vblank.html> (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176319v1/
>         shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html> (Intel
>         XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301> / Intel XE#3149 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3149>)
>   *
> 
>     igt@kms_hdr@brightness-with-hdr:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-bmg-7/
>         igt@kms_hdr@brightness-with-hdr.html> (Intel XE#3374 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3374> / Intel
>         XE#3544 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3544>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-176319v1/shard-bmg-9/igt@kms_hdr@brightness-with-
>         hdr.html> (Intel XE#3544 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/3544>)
>   *
> 
>     igt@xe_pat@pat-sw-hw-suspend:
> 
>       o shard-ptl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89/shard-ptl-7/
>         igt@xe_pat@pat-sw-hw-suspend.html> (Intel XE#7695 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/7695>) -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176319v1/shard-
>         ptl-8/igt@xe_pat@pat-sw-hw-suspend.html> (Intel XE#9362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362>)
> 
> 
>     Build changes
> 
>   * Linux: xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89 -> xe-
>     pw-176319v1
> 
> IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-5964-173c9ebb628f22cdfb18e080e0ef46b728649f89: 
> 173c9ebb628f22cdfb18e080e0ef46b728649f89
> xe-pw-176319v1: 176319v1
> 

