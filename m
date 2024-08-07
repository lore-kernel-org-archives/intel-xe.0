Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF075C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 09:13:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF9E10E486;
	Wed,  7 Aug 2024 09:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k7pNUYkf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECE810E486
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 09:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723021998; x=1754557998;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=jkCUZ8/xWLnXPINkNdSkJ5IbZpd1tPALZ/x5WMWxU2Y=;
 b=k7pNUYkfXsR3s8EZ14L+rxmi1HeItDUiE5O5YsEwlkOy2uaQTggyaoEH
 RC4+oycITRXl3DUALLXvGA9MUZACpbsfOvAdX7vkNhArniMO5m1MDKAjA
 wleJZ9dQ1HgFN5JTeHpD1maz9GCIF9KdnY/MvzVUj1UZFuE/j9r1fz0vo
 4hB70It5EQZ+CwDi1AwqfKHnghzX3RrxjAC1ul7WhFYMBZtAwEm4B0tgv
 Bs+f/MNnWCq40sHmN/AXlljLx3r/T5EtjXqxYBTXPeCPPPofBl6peYwe5
 73zybLTBIKXXpqKEB2RHxuQijp8ACUf1hq1B05B2UPJHpBUhrII65rriF Q==;
X-CSE-ConnectionGUID: SW8fkoBeQQ+oix/tKGRmEw==
X-CSE-MsgGUID: RsQ9L01cQZ+BuGYTCC4jvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="24871548"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208,217";a="24871548"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 02:13:17 -0700
X-CSE-ConnectionGUID: PWfyPxCIRlG44Hkw+joXSw==
X-CSE-MsgGUID: wAj5H/tESzqwXK6uNDR4zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208,217";a="56869852"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.250.186])
 ([10.94.250.186])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 02:13:15 -0700
Content-Type: multipart/alternative;
 boundary="------------1XG2yuQrefxM0k1e7mCA5LBR"
Message-ID: <b5515e08-3240-414c-81f7-2ee619dc45af@linux.intel.com>
Date: Wed, 7 Aug 2024 11:13:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Fix_ac?=
 =?UTF-8?Q?cess=5Fok_check_in_user=5Ffence=5Fcreate?=
To: intel-xe@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20240806110722.28661-1-nirmoy.das@intel.com>
 <172295416899.543564.14170193410933299950@2413ebb6fbb6>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <172295416899.543564.14170193410933299950@2413ebb6fbb6>
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

This is a multi-part message in MIME format.
--------------1XG2yuQrefxM0k1e7mCA5LBR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/6/2024 4:22 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe: Fix access_ok check in user_fence_create
> *URL:* 	https://patchwork.freedesktop.org/series/136922/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/index.html
>
>
>   CI Bug Log - changes from
>   xe-1719-38af90f98c71935da87b28c0552f32d175352d9f_full ->
>   xe-pw-136922v1_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-136922v1_full absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-136922v1_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 4)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-136922v1_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a6-dp4:
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a6-dp4.html>
>
Unrelated, merged to drm-xe-next


Nirmoy

>  *
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2:
>
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html>
>         +10 other tests dmesg-warn
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-hdmi-a-3:
>
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-hdmi-a-3.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-hdmi-a-3.html>
>  *
>
>     {igt@kms_flip@2x-flip-vs-panning-interruptible@bd-dp2-hdmi-a3}:
>
>       o {shard-bmg}: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-interruptible@bd-dp2-hdmi-a3.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible@bd-dp2-hdmi-a3.html>
>  *
>
>     igt@kms_pm_rpm@modeset-stress-extra-wait:
>
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-bmg-8/igt@kms_pm_rpm@modeset-stress-extra-wait.html>
>         +2 other tests incomplete
>  *
>
>     igt@xe_exec_reset@parallel-gt-reset:
>
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html>
>
>
>     Known issues
>
> Here are the changes found in xe-pw-136922v1_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html>
>         (Intel XE#1407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>)
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (Intel XE#1659
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2
>         other tests skip
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-2560x1440p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@bad-pixel-format-y-tiled-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-7/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html>
>         (Intel XE#1399
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399>)
>  *
>
>     igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +6
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-d-dp-4.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html>
>         (Intel XE#1252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>)
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@atomic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-1/igt@kms_content_protection@atomic.html>
>         (Intel XE#599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>  *
>
>     igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-3/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html>
>         (Intel XE#1541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541>)
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend:
>
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html>
>         (Intel XE#2019
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019>)
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html>
>         (Intel XE#2019
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>) +1
>         other test skip
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html>
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-rte:
>
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-rte.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +5
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +1
>         other test skip
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_hdr@invalid-hdr.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-436/igt@kms_hdr@invalid-hdr.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html>
>         (Intel XE#2028
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028>) +6
>         other tests fail
>  *
>
>     igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html>
>         (Intel XE#2028
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028>)
>  *
>
>     igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +2
>         other tests dmesg-warn
>  *
>
>     igt@kms_plane_lowres@tiling-y:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_plane_lowres@tiling-y.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#498
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>)
>  *
>
>     igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1
>         other test skip
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-blt.html>
>         (Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>  *
>
>     igt@kms_psr@psr-suspend@edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-3/igt@kms_psr@psr-suspend@edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-1/igt@kms_psr@psr-suspend@edp-1.html>
>         (Intel XE#2028
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028> /
>         Intel XE#2447
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2447>) +1
>         other test fail
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-90:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html>
>         (Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html>
>         (Intel XE#771
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/771> /
>         Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>)
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html>
>         (Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>)
>  *
>
>     igt@xe_evict@evict-large-multi-vm-cm:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_evict@evict-large-multi-vm-cm.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html>
>         (Intel XE#1600
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600>)
>  *
>
>     igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>  *
>
>     igt@xe_exec_compute_mode@twice-userptr-invalidate-race:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-2/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html>
>         (Intel XE#1069
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069>) +1
>         other test fail
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +1
>         other test skip
>  *
>
>     igt@xe_module_load@unload:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-434/igt@xe_module_load@unload.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-463/igt@xe_module_load@unload.html>
>         (Intel XE#1551
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551> /
>         Intel XE#2019
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019>)
>  *
>
>     igt@xe_oa@non-sampling-read-error:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@xe_oa@non-sampling-read-error.html>
>         (Intel XE#2207
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207>)
>  *
>
>     igt@xe_pm@s2idle-vm-bind-prefetch:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-3/igt@xe_pm@s2idle-vm-bind-prefetch.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-prefetch.html>
>         (Intel XE#1924
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924> /
>         Intel XE#2028
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028>)
>  *
>
>     igt@xe_pm@s4-basic-exec:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-4/igt@xe_pm@s4-basic-exec.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html>
>         (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_pm@s4-exec-after:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-3/igt@xe_pm@s4-exec-after.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-2/igt@xe_pm@s4-exec-after.html>
>         (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#1607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>)
>  *
>
>     igt@xe_pm@s4-vm-bind-userptr:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-2/igt@xe_pm@s4-vm-bind-userptr.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html>
>         (Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_query@multigpu-query-gt-list:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-7/igt@xe_query@multigpu-query-gt-list.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_query@multigpu-query-uc-fw-version-huc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (Intel XE#1426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         +1 other test pass
>  *
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html>
>         (Intel XE#1659
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html>
>         +1 other test pass
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3:
>
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3.html>
>         (Intel XE#2436
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3.html>
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>
>       o {shard-bmg}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html>
>         +10 other tests pass
>  *
>
>     igt@kms_flip@2x-flip-vs-panning:
>
>       o {shard-bmg}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning.html>
>         (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html>
>  *
>
>     igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-edp1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-7/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-edp1.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-3/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-edp1.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html>
>         +1 other test pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-suspend:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html>
>         (Intel XE#2028
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html>
>         +1 other test pass
>  *
>
>     igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1:
>
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html>
>         +2 other tests pass
>  *
>
>     igt@kms_pm_backlight@fade-with-suspend:
>
>       o shard-lnl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-2/igt@kms_pm_backlight@fade-with-suspend.html>
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-2:
>
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-2.html>
>         (Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-bmg-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-2.html>
>  *
>
>     igt@kms_vblank@accuracy-idle:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-3/igt@kms_vblank@accuracy-idle.html>
>         (Intel XE#1523
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-2/igt@kms_vblank@accuracy-idle.html>
>         +1 other test pass
>  *
>
>     igt@xe_evict@evict-beng-mixed-threads-large:
>
>       o {shard-bmg}: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-bmg-4/igt@xe_evict@evict-beng-mixed-threads-large.html>
>         +1 other test pass
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html>
>         +2 other tests pass
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-small:
>
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html>
>  *
>
>     igt@xe_evict@evict-mixed-threads-large:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html>
>  *
>
>     igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-3/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html>
>         (Intel XE#1069
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-8/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html>
>  *
>
>     igt@xe_pm@s2idle-basic-exec:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-1/igt@xe_pm@s2idle-basic-exec.html>
>         (Intel XE#1924
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924> /
>         Intel XE#2028
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-2/igt@xe_pm@s2idle-basic-exec.html>
>  *
>
>     igt@xe_pm@s4-vm-bind-prefetch:
>
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html>
>         (Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-7/igt@xe_pm@s4-vm-bind-prefetch.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_async_flips@invalid-async-flip:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html>
>         (Intel XE#873
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#873
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>)
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +3
>         other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1204
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>)
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#1242
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
>  *
>
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +9
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +7
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>         (Intel XE#610
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#610
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>  *
>
>     igt@kms_big_joiner@invalid-modeset:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_big_joiner@invalid-modeset.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html>
>         (Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2
>         other tests skip
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +19
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +69
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +15
>         other tests skip
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +55
>         other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition@pipe-d-dp-4:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html>
>         (Intel XE#314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@degamma:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_chamelium_color@degamma.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-434/igt@kms_chamelium_color@degamma.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_color@gamma:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_chamelium_color@gamma.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_chamelium_color@gamma.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-433/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +8
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +6
>         other tests skip
>  *
>
>     igt@kms_content_protection@dp-mst-type-1:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html>
>         (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x170:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html>
>         (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x170.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>  *
>
>     igt@kms_cursor_crc@cursor-random-max-size:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_cursor_crc@cursor-random-max-size.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-max-size.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +12
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) +1
>         other test skip
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html>
>         (i915#3804
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         i915#3804
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>  *
>
>     igt@kms_dsc@dsc-with-output-formats-with-bpc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3
>         other tests skip
>  *
>
>     igt@kms_fbcon_fbt@psr:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_fbcon_fbt@psr.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#776
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_fbcon_fbt@psr.html>
>         (Intel XE#776
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>)
>  *
>
>     igt@kms_feature_discovery@chamelium:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-466/igt@kms_feature_discovery@chamelium.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#701
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_feature_discovery@chamelium.html>
>         (Intel XE#701
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>)
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend-interruptible:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#2019
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html>
>         (Intel XE#2019
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +20
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +26
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html>
>         (Intel XE#658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +22
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +27
>         other tests skip
>  *
>
>     igt@kms_hdmi_inject@inject-audio:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#417
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/417>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html>
>         (Intel XE#417
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/417>)
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (Intel XE#356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>)
>  *
>
>     igt@kms_plane@plane-panning-bottom-right-suspend:
>
>       o shard-lnl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-8/igt@kms_plane@plane-panning-bottom-right-suspend.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend.html>
>         (Intel XE#2028
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028>) +1
>         other test fail
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#498
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>)
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-hdmi-a-6.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#498
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>)
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html>
>         (Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html>
>         (Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318>) +2
>         other tests skip
>  *
>
>     igt@kms_pm_backlight@fade-with-dpms:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html>
>         (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>) +2
>         other tests skip
>  *
>
>     igt@kms_pm_dc@dc5-psr:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html>
>         (Intel XE#1129
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html>
>         (Intel XE#1129
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129>) +1
>         other test skip
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html>
>         (Intel XE#908
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#908
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-dpms:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_psr@fbc-psr2-dpms.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html>
>         (Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +9
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-plane-move:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html>
>         (Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +11
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-rotation-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-90.html>
>         (Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) +1
>         other test skip
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>  *
>
>     igt@kms_vrr@cmrr:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_vrr@cmrr.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_vrr@cmrr.html>
>         (Intel XE#2168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>)
>  *
>
>     igt@kms_writeback@writeback-invalid-parameters:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) +1
>         other test skip
>  *
>
>     igt@xe_copy_basic@mem-copy-linear-0x369:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html>
>         (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html>
>         (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_copy_basic@mem-copy-linear-0xfd:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfd.html>
>         (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html>
>         (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0x3fff:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_exec_fault_mode@once-bindexecqueue-imm:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +19
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +22
>         other tests skip
>  *
>
>     igt@xe_module_load@load:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_module_load@load.html>
>         (Intel XE#378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-434/igt@xe_module_load@load.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>  *
>
>     igt@xe_oa@non-zero-reason:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_oa@non-zero-reason.html>
>         (Intel XE#2207
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-434/igt@xe_oa@non-zero-reason.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2207
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207>) +3
>         other tests skip
>  *
>
>     igt@xe_oa@polling-small-buf:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@xe_oa@polling-small-buf.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2207
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@xe_oa@polling-small-buf.html>
>         (Intel XE#2207
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207>) +4
>         other tests skip
>  *
>
>     igt@xe_pat@display-vs-wb-transient:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html>
>         (Intel XE#1337
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1337
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337>)
>  *
>
>     igt@xe_pat@pat-index-xe2:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@xe_pat@pat-index-xe2.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#977
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@xe_pat@pat-index-xe2.html>
>         (Intel XE#977
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
>  *
>
>     igt@xe_pm@d3cold-basic-exec:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>  *
>
>     igt@xe_pm@vram-d3cold-threshold:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#579
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#579
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
>  *
>
>     igt@xe_query@multigpu-query-engines:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@xe_query@multigpu-query-engines.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@xe_query@multigpu-query-engines.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +3
>         other tests skip
>  *
>
>     igt@xe_query@multigpu-query-uc-fw-version-guc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * Linux: xe-1719-38af90f98c71935da87b28c0552f32d175352d9f ->
>     xe-pw-136922v1
>
> IGT_7957: cb9121cf18a2fa8dfa1f663484f3a460b95e1b41 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1719-38af90f98c71935da87b28c0552f32d175352d9f: 
> 38af90f98c71935da87b28c0552f32d175352d9f
> xe-pw-136922v1: 136922v1
>
--------------1XG2yuQrefxM0k1e7mCA5LBR
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/6/2024 4:22 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:172295416899.543564.14170193410933299950@2413ebb6fbb6">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe: Fix access_ok check in user_fence_create</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/136922/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/136922/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-1719-38af90f98c71935da87b28c0552f32d175352d9f_full -&gt;
        xe-pw-136922v1_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-136922v1_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-136922v1_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-136922v1_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a6-dp4:
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@ac-hdmi-a6-dp4.html"
                moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>Unrelated, merged to drm-xe-next</p>
    <p><br>
    </p>
    <p>Nirmoy<br>
    </p>
    <blockquote type="cite"
      cite="mid:172295416899.543564.14170193410933299950@2413ebb6fbb6">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h4>Suppressed</h4>
      <p>The following results come from untrusted machines, tests, or
        statuses.<br>
        They do not affect the overall result.</p>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html"
                moz-do-not-send="true">DMESG-WARN</a> +10 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-hdmi-a-3.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-a-hdmi-a-3.html"
                moz-do-not-send="true">DMESG-FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>{igt@kms_flip@2x-flip-vs-panning-interruptible@bd-dp2-hdmi-a3}:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-interruptible@bd-dp2-hdmi-a3.html"
                moz-do-not-send="true">INCOMPLETE</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible@bd-dp2-hdmi-a3.html"
                moz-do-not-send="true">DMESG-WARN</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-bmg-8/igt@kms_pm_rpm@modeset-stress-extra-wait.html"
                moz-do-not-send="true">INCOMPLETE</a> +2 other tests
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@parallel-gt-reset:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html"
                moz-do-not-send="true">TIMEOUT</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-136922v1_full that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407"
                moz-do-not-send="true">Intel XE#1407</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659"
                moz-do-not-send="true">Intel XE#1659</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-7/igt@kms_ccs@bad-pixel-format-y-tiled-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399"
                moz-do-not-send="true">Intel XE#1399</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252"
                moz-do-not-send="true">Intel XE#1252</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-1/igt@kms_content_protection@atomic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599"
                moz-do-not-send="true">Intel XE#599</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309"
                moz-do-not-send="true">Intel XE#309</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-3/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541"
                moz-do-not-send="true">Intel XE#1541</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019"
                moz-do-not-send="true">Intel XE#2019</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019"
                moz-do-not-send="true">Intel XE#2019</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401"
                moz-do-not-send="true">Intel XE#1401</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401"
                moz-do-not-send="true">Intel XE#1401</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745"
                moz-do-not-send="true">Intel XE#1745</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"
                moz-do-not-send="true">Intel XE#1874</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-rte:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-rte.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"
                moz-do-not-send="true">Intel XE#656</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_hdr@invalid-hdr.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-436/igt@kms_hdr@invalid-hdr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028"
                moz-do-not-send="true">Intel XE#2028</a>) +6 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028"
                moz-do-not-send="true">Intel XE#2028</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-4.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-y:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_plane_lowres@tiling-y.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498"
                moz-do-not-send="true">Intel XE#498</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-suspend@edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-3/igt@kms_psr@psr-suspend@edp-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-1/igt@kms_psr@psr-suspend@edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028"
                moz-do-not-send="true">Intel XE#2028</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2447"
                moz-do-not-send="true">Intel XE#2447</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-90:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327"
                moz-do-not-send="true">Intel XE#327</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771"
                moz-do-not-send="true">Intel XE#771</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899"
                moz-do-not-send="true">Intel XE#899</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899"
                moz-do-not-send="true">Intel XE#899</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-large-multi-vm-cm:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_evict@evict-large-multi-vm-cm.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600"
                moz-do-not-send="true">Intel XE#1600</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392"
                moz-do-not-send="true">Intel XE#1392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_compute_mode@twice-userptr-invalidate-race:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-2/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069"
                moz-do-not-send="true">Intel XE#1069</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@unload:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-434/igt@xe_module_load@unload.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-463/igt@xe_module_load@unload.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551"
                moz-do-not-send="true">Intel XE#1551</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019"
                moz-do-not-send="true">Intel XE#2019</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@non-sampling-read-error:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@xe_oa@non-sampling-read-error.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207"
                moz-do-not-send="true">Intel XE#2207</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-3/igt@xe_pm@s2idle-vm-bind-prefetch.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-prefetch.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924"
                moz-do-not-send="true">Intel XE#1924</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028"
                moz-do-not-send="true">Intel XE#2028</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-basic-exec:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-4/igt@xe_pm@s4-basic-exec.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-exec-after:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-3/igt@xe_pm@s4-exec-after.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-2/igt@xe_pm@s4-exec-after.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607"
                moz-do-not-send="true">Intel XE#1607</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-userptr:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-2/igt@xe_pm@s4-vm-bind-userptr.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-gt-list:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-7/igt@xe_query@multigpu-query-gt-list.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426"
                moz-do-not-send="true">Intel XE#1426</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659"
                moz-do-not-send="true">Intel XE#1659</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436"
                moz-do-not-send="true">Intel XE#2436</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html"
                moz-do-not-send="true">DMESG-WARN</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html"
                moz-do-not-send="true">PASS</a> +10 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-panning:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-edp1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-7/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-edp1.html"
                moz-do-not-send="true">FAIL</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-3/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@a-edp1.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"
                moz-do-not-send="true">Intel XE#886</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028"
                moz-do-not-send="true">Intel XE#2028</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade-with-suspend:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html"
                moz-do-not-send="true">INCOMPLETE</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-2/igt@kms_pm_backlight@fade-with-suspend.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-2:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-2.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899"
                moz-do-not-send="true">Intel XE#899</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-bmg-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-2.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@accuracy-idle:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-3/igt@kms_vblank@accuracy-idle.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523"
                moz-do-not-send="true">Intel XE#1523</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-2/igt@kms_vblank@accuracy-idle.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html"
                moz-do-not-send="true">TIMEOUT</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-bmg-4/igt@xe_evict@evict-beng-mixed-threads-large.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392"
                moz-do-not-send="true">Intel XE#392</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-small:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392"
                moz-do-not-send="true">Intel XE#392</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-3/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069"
                moz-do-not-send="true">Intel XE#1069</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-8/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-basic-exec:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-1/igt@xe_pm@s2idle-basic-exec.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924"
                moz-do-not-send="true">Intel XE#1924</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028"
                moz-do-not-send="true">Intel XE#2028</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-2/igt@xe_pm@s2idle-basic-exec.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-prefetch:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-7/igt@xe_pm@s4-vm-bind-prefetch.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873"
                moz-do-not-send="true">Intel XE#873</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873"
                moz-do-not-send="true">Intel XE#873</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204"
                moz-do-not-send="true">Intel XE#1204</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242"
                moz-do-not-send="true">Intel XE#1242</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610"
                moz-do-not-send="true">Intel XE#610</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610"
                moz-do-not-send="true">Intel XE#610</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_joiner@invalid-modeset:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_big_joiner@invalid-modeset.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346"
                moz-do-not-send="true">Intel XE#346</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346"
                moz-do-not-send="true">Intel XE#346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191"
                moz-do-not-send="true">Intel XE#2191</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191"
                moz-do-not-send="true">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +19 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +69 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +55 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314"
                moz-do-not-send="true">Intel XE#314</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314"
                moz-do-not-send="true">Intel XE#314</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@degamma:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_chamelium_color@degamma.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-434/igt@kms_chamelium_color@degamma.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@gamma:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_chamelium_color@gamma.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_chamelium_color@gamma.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-433/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-1:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307"
                moz-do-not-send="true">Intel XE#307</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307"
                moz-do-not-send="true">Intel XE#307</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"
                moz-do-not-send="true">Intel XE#308</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"
                moz-do-not-send="true">Intel XE#308</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x170:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"
                moz-do-not-send="true">Intel XE#308</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"
                moz-do-not-send="true">Intel XE#308</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-max-size:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_cursor_crc@cursor-random-max-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-max-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +12 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323"
                moz-do-not-send="true">Intel XE#323</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323"
                moz-do-not-send="true">Intel XE#323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323"
                moz-do-not-send="true">Intel XE#323</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323"
                moz-do-not-send="true">Intel XE#323</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804"
                moz-do-not-send="true">i915#3804</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804"
                moz-do-not-send="true">i915#3804</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_fbcon_fbt@psr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776"
                moz-do-not-send="true">Intel XE#776</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_fbcon_fbt@psr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776"
                moz-do-not-send="true">Intel XE#776</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@chamelium:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-466/igt@kms_feature_discovery@chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701"
                moz-do-not-send="true">Intel XE#701</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_feature_discovery@chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701"
                moz-do-not-send="true">Intel XE#701</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019"
                moz-do-not-send="true">Intel XE#2019</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019"
                moz-do-not-send="true">Intel XE#2019</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +20 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +26 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658"
                moz-do-not-send="true">Intel XE#658</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658"
                moz-do-not-send="true">Intel XE#658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +22 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +27 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdmi_inject@inject-audio:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417"
                moz-do-not-send="true">Intel XE#417</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417"
                moz-do-not-send="true">Intel XE#417</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356"
                moz-do-not-send="true">Intel XE#356</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356"
                moz-do-not-send="true">Intel XE#356</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-lnl-8/igt@kms_plane@plane-panning-bottom-right-suspend.html"
                moz-do-not-send="true">INCOMPLETE</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028"
                moz-do-not-send="true">Intel XE#2028</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498"
                moz-do-not-send="true">Intel XE#498</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-hdmi-a-6.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498"
                moz-do-not-send="true">Intel XE#498</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318"
                moz-do-not-send="true">Intel XE#2318</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318"
                moz-do-not-send="true">Intel XE#2318</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318"
                moz-do-not-send="true">Intel XE#2318</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318"
                moz-do-not-send="true">Intel XE#2318</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade-with-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870"
                moz-do-not-send="true">Intel XE#870</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870"
                moz-do-not-send="true">Intel XE#870</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122"
                moz-do-not-send="true">Intel XE#1122</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122"
                moz-do-not-send="true">Intel XE#1122</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-psr:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"
                moz-do-not-send="true">Intel XE#1129</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"
                moz-do-not-send="true">Intel XE#1129</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908"
                moz-do-not-send="true">Intel XE#908</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908"
                moz-do-not-send="true">Intel XE#908</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_psr@fbc-psr2-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-rotation-90:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327"
                moz-do-not-send="true">Intel XE#327</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327"
                moz-do-not-send="true">Intel XE#327</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327"
                moz-do-not-send="true">Intel XE#327</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327"
                moz-do-not-send="true">Intel XE#327</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@cmrr:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@kms_vrr@cmrr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168"
                moz-do-not-send="true">Intel XE#2168</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@kms_vrr@cmrr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168"
                moz-do-not-send="true">Intel XE#2168</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-invalid-parameters:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756"
                moz-do-not-send="true">Intel XE#756</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756"
                moz-do-not-send="true">Intel XE#756</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123"
                moz-do-not-send="true">Intel XE#1123</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123"
                moz-do-not-send="true">Intel XE#1123</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123"
                moz-do-not-send="true">Intel XE#1123</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123"
                moz-do-not-send="true">Intel XE#1123</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126"
                moz-do-not-send="true">Intel XE#1126</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126"
                moz-do-not-send="true">Intel XE#1126</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +19 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +22 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@load:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_module_load@load.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378"
                moz-do-not-send="true">Intel XE#378</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-434/igt@xe_module_load@load.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378"
                moz-do-not-send="true">Intel XE#378</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@non-zero-reason:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_oa@non-zero-reason.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207"
                moz-do-not-send="true">Intel XE#2207</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-434/igt@xe_oa@non-zero-reason.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207"
                moz-do-not-send="true">Intel XE#2207</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@polling-small-buf:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@xe_oa@polling-small-buf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207"
                moz-do-not-send="true">Intel XE#2207</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@xe_oa@polling-small-buf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207"
                moz-do-not-send="true">Intel XE#2207</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@display-vs-wb-transient:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337"
                moz-do-not-send="true">Intel XE#1337</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337"
                moz-do-not-send="true">Intel XE#1337</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xe2:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@xe_pat@pat-index-xe2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977"
                moz-do-not-send="true">Intel XE#977</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@xe_pat@pat-index-xe2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977"
                moz-do-not-send="true">Intel XE#977</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-basic-exec:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"
                moz-do-not-send="true">Intel XE#2284</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366"
                moz-do-not-send="true">Intel XE#366</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"
                moz-do-not-send="true">Intel XE#2284</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366"
                moz-do-not-send="true">Intel XE#366</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@vram-d3cold-threshold:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579"
                moz-do-not-send="true">Intel XE#579</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579"
                moz-do-not-send="true">Intel XE#579</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-engines:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-435/igt@xe_query@multigpu-query-engines.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-432/igt@xe_query@multigpu-query-engines.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1719-38af90f98c71935da87b28c0552f32d175352d9f/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136922v1/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-1719-38af90f98c71935da87b28c0552f32d175352d9f
          -&gt; xe-pw-136922v1</li>
      </ul>
      <p>IGT_7957: cb9121cf18a2fa8dfa1f663484f3a460b95e1b41 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-1719-38af90f98c71935da87b28c0552f32d175352d9f:
        38af90f98c71935da87b28c0552f32d175352d9f<br>
        xe-pw-136922v1: 136922v1</p>
    </blockquote>
  </body>
</html>

--------------1XG2yuQrefxM0k1e7mCA5LBR--
