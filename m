Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32603D16260
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 13:17:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20C310E2A0;
	Mon, 14 Oct 2024 13:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ShDlXEhe";
	dkim-atps=neutral
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0185210E2A0;
 Mon, 14 Oct 2024 13:17:10 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5c94b0b466cso3535312a12.0; 
 Mon, 14 Oct 2024 06:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728911829; x=1729516629; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=LoNYz5MjtHEBD3o73CtDTYNSFCNEulgFMr98dQeUkqw=;
 b=ShDlXEheqnib4eyVofDIANUYdd4Znd47a6uPL4GTL/iAYszX6ar9QyY5sXZZCJdBoP
 X5uXbAIRofVzQSjHDs1P36H7iUYIvILUfuGMqRSGiKCr0uTzFQKxfJheh4JMb/zWjoV9
 HODycdifAtCHBPsFKnkk8t2U20feo8RamzqHtggHM/McEWKfTb4Jp/iEMWxAVqK3fNfS
 cOXQJOyShiI0v6rGv7s3c9O8NwGoZilH5B5e05MhIK4MTOuet//HTj1c5RLzklfjh7xI
 VIr2QuKbx28iZyZEUO8UQ2zsNZulhqM2lAgOBaq7JxVPXitGwoQjXd57IUgBAcHvgdcJ
 FoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728911829; x=1729516629;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LoNYz5MjtHEBD3o73CtDTYNSFCNEulgFMr98dQeUkqw=;
 b=Dr1+5oLmcP1tR+2myJrfTNKxKtrJ3dg+vw37N+x2UqEKmN8bIcNyJ7d2DrlUriaG1W
 pMsobEAmx96d3nQJJfQUmV5OEeoO4IrCg251++e5K00I+wO9tqFEqu+ijBvTrme1hwDf
 W1ilmwf8g2NJwB7HpXebmHiHg+igh1+RMUpS7373SMOi0G4utgpYa67HUkVmVU1WcXBO
 nd+Xh38q2XaWsJwK4LMPmpd/Wis8/YT/EhyaBo+nbaguxb6ajzEw6rYyHdnK1ZqmUjpk
 n3OGVjat2NqyHhSPmQQdK68hAilTloSv36BYrW3uKnfqS0tivhIgHPXxN6l0h+agRwI6
 6TPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTKgw1fYIKfS1xE56SlRreE1jM5W+m+BM6p1V3WJAgHBclktCfdIwDfnDT6Rsio0QLfOJ7V/7sEhiPiB90@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIOQ1ByMhbrzCAbFNkTZwcxQ3RRi4m3lzfiPIVvGzG2PJqGrlG
 yLvZDDEd4MgDl+28cWwk0vz2pPCOuJ23uDtZPOviz6n8zNdypZ4CKhXj5ZN7jzFihQ==
X-Google-Smtp-Source: AGHT+IFYGUuMZBWSfYxExm7MDL9X7Y/b3NS/qzkomFVnHlOZBGGyZKx0ZjXxYecuyvh282lHrbX7QA==
X-Received: by 2002:a05:6402:3589:b0:5c5:b90a:5b78 with SMTP id
 4fb4d7f45d1cf-5c948c728b9mr8018151a12.5.1728911828302; 
 Mon, 14 Oct 2024 06:17:08 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.77])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c93711bc4dsm5031670a12.39.2024.10.14.06.17.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 06:17:07 -0700 (PDT)
Message-ID: <fead2341-0e72-4284-90ba-9558758dc94d@gmail.com>
Date: Mon, 14 Oct 2024 16:17:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915/display?=
 =?UTF-8?Q?=3A_Don=27t_allow_tile4_framebuffer_to_do_hflip_on_display20_or_g?=
 =?UTF-8?Q?reater_=28rev2=29?=
To: intel-xe@lists.freedesktop.org,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
References: <20241007182841.2104740-1-juhapekka.heikkila@gmail.com>
 <172854176942.1213934.17371461848447967201@2413ebb6fbb6>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <172854176942.1213934.17371461848447967201@2413ebb6fbb6>
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
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

These listed regressions don't seem to be caused by my change.

/Juha-Pekka

On 10.10.2024 9.29, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/i915/display: Don't allow tile4 framebuffer to do hflip on 
> display20 or greater (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/139665/ <https:// 
> patchwork.freedesktop.org/series/139665/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/ 
> index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f_full -> xe-
>   pw-139665v2_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-139665v2_full absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-139665v2_full, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe- 
> pw-139665v2_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-2/
>         igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-139665v2/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-
>         stride-32bpp-rotate-0-hflip.html> +1 other test skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-5/
>         igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-
>         async-flip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-6/igt@kms_big_fb@4-tiled-max-
>         hw-stride-64bpp-rotate-180-hflip-async-flip.html> +4 other tests
>         fail
>   *
> 
>     igt@kms_flip@absolute-wf_vblank:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-dg2-433/
>         igt@kms_flip@absolute-wf_vblank.html> -> DMESG-WARN <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-dg2-466/
>         igt@kms_flip@absolute-wf_vblank.html> +9 other tests dmesg-warn
>   *
> 
>     igt@kms_flip@plain-flip-fb-recreate@a-edp1:
> 
>       o shard-lnl: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-lnl-6/igt@kms_flip@plain-
>         flip-fb-recreate@a-edp1.html>
>   *
> 
>     igt@kms_pm_rpm@legacy-planes-dpms@plane-41:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-8/
>         igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-
>         lnl-6/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html> +2 other
>         tests dmesg-warn
>   *
> 
>     igt@xe_vm@bind-flag-invalid:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-adlp-8/
>         igt@xe_vm@bind-flag-invalid.html> -> TIMEOUT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-adlp-9/
>         igt@xe_vm@bind-flag-invalid.html> +1 other test timeout
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-5/
>         igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-
>         hflip.html> (Intel XE#1659 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1659>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-lnl-1/igt@kms_big_fb@4-tiled-
>         max-hw-stride-64bpp-rotate-180-hflip.html> +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-adlp-8/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-
>         onoff.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/656>) -> TIMEOUT <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-adlp-9/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html>
>   *
> 
>     igt@xe_copy_basic@mem-copy-linear-0x3fff:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-adlp-8/
>         igt@xe_copy_basic@mem-copy-linear-0x3fff.html> (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>) ->
>         TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-139665v2/shard-adlp-9/igt@xe_copy_basic@mem-copy-
>         linear-0x3fff.html>
>   *
> 
>     igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-adlp-8/
>         igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html>
>         (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1392>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-adlp-9/igt@xe_exec_basic@multigpu-
>         once-bindexecqueue-userptr.html>
> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   * igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind:
>       o {shard-bmg}: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-bmg-4/
>         igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind.html>
>         -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-139665v2/shard-bmg-3/igt@xe_exec_threads@threads-hang-shared-
>         vm-userptr-rebind.html>
> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-139665v2_full that come from known 
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
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-8/igt@kms_addfb_basic@addfb25-
>         y-tiled-small-legacy.html> (Intel XE#1466 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1466>)
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-dg2-466/igt@kms_big_fb@4-
>         tiled-32bpp-rotate-90.html> (Intel XE#316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@y-tiled-64bpp-rotate-180:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-6/igt@kms_big_fb@y-
>         tiled-64bpp-rotate-180.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +3 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-dg2-464/igt@kms_big_fb@y-
>         tiled-addfb-size-overflow.html> (Intel XE#610 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-dg2-464/igt@kms_big_fb@yf-
>         tiled-64bpp-rotate-180.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2 other
>         tests skip
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-3840x2160p:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-5/igt@kms_bw@linear-tiling-3-
>         displays-3840x2160p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1 other test skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-adlp-8/igt@kms_ccs@bad-pixel-
>         format-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +1
>         other test skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-adlp-8/igt@kms_ccs@bad-pixel-
>         format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html> (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +2
>         other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-8/igt@kms_ccs@bad-rotation-90-
>         y-tiled-gen12-rc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +3 other
>         tests skip
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-dg2-464/igt@kms_ccs@ccs-on-
>         another-bo-y-tiled-ccs.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +7
>         other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-dg2-432/igt@kms_ccs@crc-
>         primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html> (Intel
>         XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +27 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-dg2-436/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html>
>         -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-139665v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-
>         dg2-mc-ccs@pipe-a-dp-4.html> (Intel XE#1195 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>   *
> 
>     igt@kms_cdclk@mode-transition-all-outputs:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-adlp-8/igt@kms_cdclk@mode-
>         transition-all-outputs.html> (Intel XE#314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/314>)
>   *
> 
>     igt@kms_cdclk@plane-scaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-5/igt@kms_cdclk@plane-
>         scaling.html> (Intel XE#1152 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1152>) +3 other tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-max:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-5/igt@kms_chamelium_color@ctm-
>         max.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/306>) +1 other test skip
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-fast:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-dg2-464/
>         igt@kms_chamelium_hpd@dp-hpd-fast.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2 other tests
>         skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-
>         hpd-with-enabled-mode.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +3 other tests
>         skip
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-128x42:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-5/igt@kms_cursor_crc@cursor-
>         sliding-128x42.html> (Intel XE#1424 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +1 other test
>         skip
>   *
> 
>     igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-1/
>         igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/
>         shard-lnl-4/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-
>         edp-1.html> (Intel XE#2577 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2577>) +1 other test fail
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-5/
>         igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html> (Intel
>         XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/309>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-adlp-8/
>         igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html>
>         (Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/309>)
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-1/
>         igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-
>         size.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-139665v2/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-
>         atomic-transitions-varying-size.html> (Intel XE#1475 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1475>)
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-6/igt@kms_cursor_legacy@short-
>         busy-flip-before-cursor-toggle.html> (Intel XE#323 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>   *
> 
>     igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-5/igt@kms_dsc@dsc-with-output-
>         formats-with-bpc.html> (Intel XE#599 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/599>) +2 other tests
>         skip
>   *
> 
>     igt@kms_fbcon_fbt@psr:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-dg2-464/
>         igt@kms_fbcon_fbt@psr.html> (Intel XE#776 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/776>)
>   *
> 
>     igt@kms_feature_discovery@display-4x:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-8/
>         igt@kms_feature_discovery@display-4x.html> (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
>   *
> 
>     igt@kms_feature_discovery@psr2:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-dg2-464/
>         igt@kms_feature_discovery@psr2.html> (Intel XE#1135 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1135>)
>   *
> 
>     igt@kms_flip@2x-absolute-wf_vblank-interruptible:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-5/igt@kms_flip@2x-absolute-
>         wf_vblank-interruptible.html> (Intel XE#1421 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +1 other test
>         skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-dg2-432/
>         igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/
>         shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-
>         dp4.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1204>)
>   *
> 
>     igt@kms_flip@bo-too-big-interruptible@a-edp1:
> 
>       o shard-lnl: NOTRUN -> TIMEOUT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-6/igt@kms_flip@bo-too-big-
>         interruptible@a-edp1.html> (Intel XE#1504 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1504>) +1 other test
>         timeout
>   *
> 
>     igt@kms_flip@flip-vs-absolute-wf_vblank:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-1/
>         igt@kms_flip@flip-vs-absolute-wf_vblank.html> -> FAIL <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-lnl-4/
>         igt@kms_flip@flip-vs-absolute-wf_vblank.html> (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +6
>         other tests fail
>   *
> 
>     igt@kms_flip@plain-flip-fb-recreate:
> 
>       o shard-lnl: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-lnl-6/igt@kms_flip@plain-
>         flip-fb-recreate.html> (Intel XE#2049 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2049>)
>   *
> 
>     igt@kms_flip@plain-flip-ts-check@c-edp1:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-5/igt@kms_flip@plain-flip-ts-
>         check@c-edp1.html> (Intel XE#886 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +2 other tests
>         fail
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-5/
>         igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-
>         downscaling.html> (Intel XE#1397 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1397> / Intel
>         XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-
>     downscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-5/
>         igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-
>         downscaling@pipe-a-default-mode.html> (Intel XE#1397 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1397>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>     downscaling:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-adlp-8/
>         igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>         downscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-dg2-432/
>         igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-
>         upscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455>) +7 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-
>     downscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-5/
>         igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-
>         downscaling.html> (Intel XE#1401 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1401> / Intel
>         XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1745>) +2 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-
>     upscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-5/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-
>         upscaling@pipe-a-default-mode.html> (Intel XE#1401 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1401>) +2 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-adlp-8/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-5/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-
>         onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-
>         render.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) +7 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-5/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-
>         move.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/656>) +15 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-dg2-432/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +7 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-adlp-8/
>         igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html>
>         (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/653>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-suspend:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-6/
>         igt@kms_frontbuffer_tracking@fbcpsr-suspend.html> -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-
>         lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html> (Intel
>         XE#2050 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-adlp-8/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-
>         blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/656>) +1 other test skip
>   *
> 
>     igt@kms_hdr@bpc-switch-suspend:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-dg2-435/
>         igt@kms_hdr@bpc-switch-suspend.html> -> ABORT <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-dg2-432/
>         igt@kms_hdr@bpc-switch-suspend.html> (Intel XE#2625 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2625>) +1 other test
>         abort
>   *
> 
>     igt@kms_hdr@static-swap:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-6/igt@kms_hdr@static-
>         swap.html> (Intel XE#1503 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1503> / Intel XE#599 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
>   *
> 
>     igt@kms_plane@plane-position-covered@pipe-a-plane-2:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-4/
>         igt@kms_plane@plane-position-covered@pipe-a-plane-2.html> ->
>         DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-139665v2/shard-lnl-5/igt@kms_plane@plane-position-
>         covered@pipe-a-plane-2.html> (Intel XE#324 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>   *
> 
>     igt@kms_plane@plane-position-hole@pipe-b-plane-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-7/
>         igt@kms_plane@plane-position-hole@pipe-b-plane-1.html> -> DMESG-
>         WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/
>         shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-b-
>         plane-1.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/324>) +3 other tests dmesg-warn
>   *
> 
>     igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-8/
>         igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/
>         shard-lnl-6/igt@kms_plane_cursor@viewport@pipe-a-edp-1-
>         size-128.html> (Intel XE#1471 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1471>)
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-dg2-432/
>         igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html>
>         (Intel XE#361 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/361>) +1 other test fail
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-dg2-433/
>         igt@kms_plane_scaling@planes-downscale-factor-0-5-
>         upscale-20x20.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-dg2-466/
>         igt@kms_plane_scaling@planes-downscale-factor-0-5-
>         upscale-20x20.html> (Intel XE#2566 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2566>)
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-dg2-433/
>         igt@kms_plane_scaling@planes-downscale-factor-0-5-
>         upscale-20x20@pipe-b.html> -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-dg2-466/
>         igt@kms_plane_scaling@planes-downscale-factor-0-5-
>         upscale-20x20@pipe-b.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763>)
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-8/
>         igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-
>         factor-0-25.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +7 other
>         tests skip
>   *
> 
>     igt@kms_pm_dc@dc6-psr:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#1430 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1430>)
>   *
> 
>     igt@kms_pm_rpm@cursor-dpms:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-1/
>         igt@kms_pm_rpm@cursor-dpms.html> -> DMESG-FAIL <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-lnl-4/
>         igt@kms_pm_rpm@cursor-dpms.html> (Intel XE#1620 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1620>)
>   *
> 
>     igt@kms_pm_rpm@universal-planes-dpms@plane-32:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-8/
>         igt@kms_pm_rpm@universal-planes-dpms@plane-32.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-139665v2/shard-lnl-6/igt@kms_pm_rpm@universal-planes-
>         dpms@plane-32.html> (Intel XE#1620 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1620>)
>   *
> 
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-dg2-432/igt@kms_psr2_sf@pr-
>         cursor-plane-move-continuous-sf.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>   *
> 
>     igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-adlp-8/igt@kms_psr2_sf@pr-primary-
>         plane-update-sf-dmg-area-big-fb.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>   *
> 
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-5/igt@kms_psr2_su@frontbuffer-
>         xrgb8888.html> (Intel XE#1128 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1128>)
>   *
> 
>     igt@kms_psr@fbc-pr-sprite-render:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-6/igt@kms_psr@fbc-pr-sprite-
>         render.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1406>)
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-plane-move:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-dg2-464/igt@kms_psr@fbc-psr2-
>         sprite-plane-move.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +4
>         other tests skip
>   *
> 
>     igt@kms_psr@psr2-cursor-plane-onoff:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-5/igt@kms_psr@psr2-cursor-
>         plane-onoff.html> (Intel XE#2948 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2948>) +1 other test
>         fail
>   *
> 
>     igt@kms_psr@psr2-primary-page-flip:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-adlp-8/igt@kms_psr@psr2-primary-
>         page-flip.html> (Intel XE#2850 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2850> / Intel XE#929 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>   *
> 
>     igt@kms_rotation_crc@primary-rotation-90:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-8/
>         igt@kms_rotation_crc@primary-rotation-90.html> (Intel XE#1437
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437>)
>   *
> 
>     igt@kms_setmode@basic@pipe-b-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-5/
>         igt@kms_setmode@basic@pipe-b-edp-1.html> -> FAIL <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-lnl-6/
>         igt@kms_setmode@basic@pipe-b-edp-1.html> (Intel XE#2883
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883>) +2
>         other tests fail
>   *
> 
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-5/
>         igt@kms_vrr@cmrr@pipe-a-edp-1.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-lnl-1/
>         igt@kms_vrr@cmrr@pipe-a-edp-1.html> (Intel XE#2159 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2159>) +1 other test
>         fail
>   *
> 
>     igt@kms_writeback@writeback-check-output:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-adlp-8/
>         igt@kms_writeback@writeback-check-output.html> (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>   *
> 
>     igt@xe_eudebug@basic-connect:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-5/igt@xe_eudebug@basic-
>         connect.html> (Intel XE#2905 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2905>) +6 other tests skip
>   *
> 
>     igt@xe_eudebug@basic-vm-bind-metadata-discovery:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-dg2-466/igt@xe_eudebug@basic-
>         vm-bind-metadata-discovery.html> (Intel XE#2905 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +2 other
>         tests skip
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-dg2-433/
>         igt@xe_evict@evict-beng-mixed-many-threads-small.html> ->
>         TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-139665v2/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-
>         threads-small.html> (Intel XE#1473 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#402
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>)
>   *
> 
>     igt@xe_evict@evict-beng-small-external:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-5/igt@xe_evict@evict-beng-
>         small-external.html> (Intel XE#688 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +2 other tests
>         skip
>   *
> 
>     igt@xe_evict@evict-beng-threads-large:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-dg2-435/
>         igt@xe_evict@evict-beng-threads-large.html> -> TIMEOUT <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-dg2-466/
>         igt@xe_evict@evict-beng-threads-large.html> (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-5/igt@xe_exec_basic@multigpu-
>         many-execqueues-many-vm-null-defer-bind.html> (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1
>         other test skip
>   *
> 
>     igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-1/
>         igt@xe_exec_compute_mode@many-bindexecqueue-userptr-
>         invalidate.html> -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-4/
>         igt@xe_exec_compute_mode@many-bindexecqueue-userptr-
>         invalidate.html> (Intel XE#2754 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2754>)
>   *
> 
>     igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-adlp-8/
>         igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-
>         race.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/288>) +1 other test skip
>   *
> 
>     igt@xe_exec_fault_mode@many-rebind-imm:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-7/
>         igt@xe_exec_fault_mode@many-rebind-imm.html> -> FAIL <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-lnl-5/
>         igt@xe_exec_fault_mode@many-rebind-imm.html> (Intel XE#1630
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630>)
>   *
> 
>     igt@xe_exec_fault_mode@once-userptr:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-dg2-432/
>         igt@xe_exec_fault_mode@once-userptr.html> (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +4
>         other tests skip
>   *
> 
>     igt@xe_oa@oa-regs-whitelisted@rcs-0:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-6/igt@xe_oa@oa-regs-
>         whitelisted@rcs-0.html> (Intel XE#2514 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2514>) +1 other test
>         fail
>   *
> 
>     igt@xe_pat@pat-index-xelpg:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-5/igt@xe_pat@pat-index-
>         xelpg.html> (Intel XE#979 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/979>)
>   *
> 
>     igt@xe_pm@d3cold-mmap-vram:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-5/igt@xe_pm@d3cold-mmap-
>         vram.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284> / Intel XE#366 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>   *
> 
>     igt@xe_pm@d3cold-mocs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-5/igt@xe_pm@d3cold-mocs.html>
>         (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2284>)
>   *
> 
>     igt@xe_pm@s2idle-multiple-execs:
> 
>       o shard-dg2-set2: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-dg2-432/igt@xe_pm@s2idle-
>         multiple-execs.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358>)
>   *
> 
>     igt@xe_pm@s4-vm-bind-prefetch:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-adlp-6/
>         igt@xe_pm@s4-vm-bind-prefetch.html> -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-adlp-9/
>         igt@xe_pm@s4-vm-bind-prefetch.html> (Intel XE#1607 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel
>         XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_pm@s4-vm-bind-userptr:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-7/
>         igt@xe_pm@s4-vm-bind-userptr.html> -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-lnl-2/igt@xe_pm@s4-
>         vm-bind-userptr.html> (Intel XE#1794 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_pm@vram-d3cold-threshold:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-dg2-432/igt@xe_pm@vram-
>         d3cold-threshold.html> (Intel XE#579 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
>   *
> 
>     igt@xe_query@multigpu-query-invalid-extension:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-adlp-8/igt@xe_query@multigpu-
>         query-invalid-extension.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_query@multigpu-query-invalid-size:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-lnl-8/igt@xe_query@multigpu-query-
>         invalid-size.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_wedged@basic-wedged:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-dg2-432/
>         igt@xe_wedged@basic-wedged.html> (Intel XE#2919 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2919>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_atomic_transition@modeset-transition-nonblocking:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-7/
>         igt@kms_atomic_transition@modeset-transition-nonblocking.html>
>         (Intel XE#1701 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1701>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139665v2/shard-lnl-2/igt@kms_atomic_transition@modeset-
>         transition-nonblocking.html> +1 other test pass
>   *
> 
>     igt@kms_big_fb@linear-64bpp-rotate-0:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-
>         dg2-466/igt@kms_big_fb@linear-64bpp-rotate-0.html> (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/
>         shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-0.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-
>         dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1195> / Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-dg2-432/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-
>         dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-
>         d-hdmi-a-6.html> (Intel XE#1195 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1195>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-dg2-432/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-
>         a-6.html>
>   *
> 
>     igt@kms_cursor_edge_walk@128x128-right-edge:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-4/
>         igt@kms_cursor_edge_walk@128x128-right-edge.html> -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-
>         lnl-7/igt@kms_cursor_edge_walk@128x128-right-edge.html> +1 other
>         test pass
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
> 
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-bmg-8/
>         igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html>
>         (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-139665v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-
>         vblank@ab-dp2-hdmi-a3.html> +1 other test pass
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-dg2-432/
>         igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html> ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/
>         shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-
>         dp4.html>
>   *
> 
>     igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> 
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-bmg-5/
>         igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html>
>         (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2882>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139665v2/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-
>         recreate-interruptible.html> +4 other tests pass
>   *
> 
>     igt@kms_flip@blocking-wf_vblank:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-1/
>         igt@kms_flip@blocking-wf_vblank.html> (Intel XE#886 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-
>         lnl-8/igt@kms_flip@blocking-wf_vblank.html> +7 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-dg2-433/
>         igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html>
>         (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-139665v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-
>         vblank-interruptible@a-dp4.html> +7 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-dg2-433/
>         igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-
>         a6.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1204>) -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-dg2-435/igt@kms_flip@flip-vs-
>         expired-vblank-interruptible@c-hdmi-a6.html>
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible:
> 
>       o shard-lnl: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-5/
>         igt@kms_flip@flip-vs-suspend-interruptible.html> (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/
>         shard-lnl-6/igt@kms_flip@flip-vs-suspend-interruptible.html> +1
>         other test pass
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-
>         adlp-3/igt@kms_frontbuffer_tracking@fbc-suspend.html> (Intel
>         XE#2953 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2953>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139665v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-
>         suspend.html>
>   *
> 
>     igt@kms_hdr@invalid-hdr:
> 
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-bmg-6/
>         igt@kms_hdr@invalid-hdr.html> (Intel XE#1503 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-
>         bmg-4/igt@kms_hdr@invalid-hdr.html>
>   *
> 
>     igt@kms_plane@plane-position-covered@pipe-a-plane-1:
> 
>       o shard-lnl: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-4/
>         igt@kms_plane@plane-position-covered@pipe-a-plane-1.html> (Intel
>         XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-139665v2/shard-lnl-5/igt@kms_plane@plane-position-
>         covered@pipe-a-plane-1.html> +1 other test pass
>   *
> 
>     igt@kms_plane@plane-position-covered@pipe-b-plane-4:
> 
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-4/
>         igt@kms_plane@plane-position-covered@pipe-b-plane-4.html> (Intel
>         XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-139665v2/shard-lnl-5/igt@kms_plane@plane-position-
>         covered@pipe-b-plane-4.html> +5 other tests pass
>   *
> 
>     igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-64:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-8/
>         igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-64.html> (Intel
>         XE#1471 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1471>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139665v2/shard-lnl-6/
>         igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-64.html>
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-adlp-9/
>         igt@kms_pm_dc@dc6-dpms.html> (Intel XE#718 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/718>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-
>         adlp-8/igt@kms_pm_dc@dc6-dpms.html>
>   *
> 
>     igt@kms_pm_rpm@cursor:
> 
>       o shard-lnl: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-6/
>         igt@kms_pm_rpm@cursor.html> (Intel XE#1620 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1620>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-
>         lnl-5/igt@kms_pm_rpm@cursor.html>
>   *
> 
>     igt@kms_setmode@basic:
> 
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-bmg-7/
>         igt@kms_setmode@basic.html> (Intel XE#2883 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2883>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-
>         bmg-8/igt@kms_setmode@basic.html> +6 other tests pass
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-1/
>         igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html> (Intel
>         XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/899>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-139665v2/shard-lnl-8/igt@kms_universal_plane@cursor-fb-
>         leak@pipe-a-edp-1.html>
>   *
> 
>     igt@xe_ccs@suspend-resume:
> 
>       o shard-lnl: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-4/
>         igt@xe_ccs@suspend-resume.html> (Intel XE#2760 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2760> / Intel
>         XE#2771 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2771>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139665v2/shard-lnl-5/igt@xe_ccs@suspend-resume.html>
>   *
> 
>     igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-system:
> 
>       o shard-lnl: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-4/
>         igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-
>         system.html> (Intel XE#2771 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2771>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-lnl-5/igt@xe_ccs@suspend-
>         resume@tile4-compressed-compfmt0-system-system.html>
>   *
> 
>     igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-4/
>         igt@xe_drm_fdinfo@utilization-single-full-load-destroy-
>         queue.html> (Intel XE#2667 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2667>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-lnl-7/
>         igt@xe_drm_fdinfo@utilization-single-full-load-destroy-
>         queue.html> +1 other test pass
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-7/
>         igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-
>         rebind.html> (Intel XE#1630 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1630>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-139665v2/shard-lnl-1/
>         igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind.html>
>   *
> 
>     igt@xe_pm@s2idle-exec-after:
> 
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-
>         dg2-432/igt@xe_pm@s2idle-exec-after.html> (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/
>         shard-dg2-464/igt@xe_pm@s2idle-exec-after.html> +1 other test pass
>   *
> 
>     igt@xe_pm@s4-mocs:
> 
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-adlp-9/
>         igt@xe_pm@s4-mocs.html> (Intel XE#1794 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-
>         adlp-8/igt@xe_pm@s4-mocs.html>
>   *
> 
>     igt@xe_pm@s4-multiple-execs:
> 
>       o shard-lnl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-2/
>         igt@xe_pm@s4-multiple-execs.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel
>         XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-lnl-8/igt@xe_pm@s4-
>         multiple-execs.html>
>   *
> 
>     igt@xe_pm_residency@toggle-gt-c6:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-7/
>         igt@xe_pm_residency@toggle-gt-c6.html> (Intel XE#958 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/958>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-
>         lnl-1/igt@xe_pm_residency@toggle-gt-c6.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-
>         adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-
>         hflip-async-flip.html> (Intel XE#324 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-
>         adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-
>         hflip-async-flip.html> (Intel XE#1204 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1204>)
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-
>         adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-
>         hflip-async-flip.html> (Intel XE#324 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-
>         adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-
>         hflip-async-flip.html> (Intel XE#1231 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) +1 other test
>         fail
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-adlp-2/
>         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-
>         flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1231>) -> DMESG-FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-adlp-3/
>         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-
>         flip.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/324>) +1 other test dmesg-fail
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-adlp-8/
>         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html>
>         (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1874>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-139665v2/shard-adlp-9/igt@kms_big_fb@y-tiled-max-
>         hw-stride-64bpp-rotate-180.html> (Intel XE#402 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/402>)
>   *
> 
>     igt@kms_plane@pixel-format:
> 
>       o shard-adlp: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-
>         adlp-3/igt@kms_plane@pixel-format.html> (Intel XE#1035 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1035>) -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-
>         adlp-8/igt@kms_plane@pixel-format.html> (Intel XE#1035 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1035> / Intel
>         XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1195>) +1 other test incomplete
>   *
> 
>     igt@kms_plane@plane-position-hole:
> 
>       o shard-lnl: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-lnl-7/
>         igt@kms_plane@plane-position-hole.html> (Intel XE#324 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-
>         lnl-2/igt@kms_plane@plane-position-hole.html> (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>   *
> 
>     igt@kms_pm_dc@dc9-dpms:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-adlp-3/
>         igt@kms_pm_dc@dc9-dpms.html> (Intel XE#734 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/734>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139665v2/shard-
>         adlp-8/igt@kms_pm_dc@dc9-dpms.html> (Intel XE#1204 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1204>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-dg2-433/
>         igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#1500 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1500>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139665v2/shard-dg2-466/igt@kms_tiled_display@basic-
>         test-pattern-with-chamelium.html> (Intel XE#362 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-large:
> 
>       o shard-dg2-set2: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f/shard-
>         dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html> (Intel
>         XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1473>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-139665v2/shard-dg2-433/igt@xe_evict@evict-mixed-many-
>         threads-large.html> (Intel XE#1000 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1000>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * Linux: xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f -> xe-
>     pw-139665v2
> 
> IGT_8061: 8061
> xe-2038-3e9cfd28b00560e4928ef9b8ab95429b17e0562f: 
> 3e9cfd28b00560e4928ef9b8ab95429b17e0562f
> xe-pw-139665v2: 139665v2
> 

