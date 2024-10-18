Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC47BD2FFFA
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 15:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58CF10E17F;
	Fri, 18 Oct 2024 15:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kl03X17H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3C910E17F
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 15:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729266027; x=1760802027;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=mY8iDRE5vZ5MnZwRxhtdhq0dtst6xEh4iE9hJ9TIpzA=;
 b=Kl03X17HrK8sqAsqUftIYUo3Gc2860P4JDsJOTMWEM9vHRj0NKeJBg/E
 mjSbiuVaz1r/W5KI3TInqK7YrN0CcSiuJMJYzxtxiEoYKnUVinBcqs+ay
 ZU5sUNSQSmRuW3xecynlqkyz/W9/MzICDHfeYWJNp/owhhfUA1VBrFpry
 SmWOZtzHmg02WrahZPjKdXCOYnIm+ybyHtS8nw9JMgT/vbgTXzhrgMysf
 RDB5fKklXsaTiZJNIpR0S4MQsJ/rbrMI9wckB+WZ5cdVRUU23RQYl5LoS
 R4NzmuYitpS2PuGdWIACsVm6MGxTvABjRB0BY73f+eF95ZVW0ds+C1njg A==;
X-CSE-ConnectionGUID: LG5T6HpJRyudg2RbeVOWww==
X-CSE-MsgGUID: Dn0M0T5UTpO1nr3MCx8M6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="46302279"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208,217";a="46302279"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 08:40:26 -0700
X-CSE-ConnectionGUID: QzYgTfskQse5hcAaYHDxSA==
X-CSE-MsgGUID: J5DsmsH8S4C+WfI+kY6xVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208,217";a="78858342"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.197.87])
 ([10.245.197.87])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 08:40:23 -0700
Content-Type: multipart/alternative;
 boundary="------------bTuOsyafti4Vu4jbc3XE265m"
Message-ID: <a98d45c3-4f4a-4555-a435-7bc8ad4733ce@linux.intel.com>
Date: Fri, 18 Oct 2024 17:40:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_Improve_ufence_a?=
 =?UTF-8?Q?ddr_validation_and_error_handling_=28rev3=29?=
To: intel-xe@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20241016082304.66009-1-nirmoy.das@intel.com>
 <172913368338.1276639.8783864821751064855@2413ebb6fbb6>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <172913368338.1276639.8783864821751064855@2413ebb6fbb6>
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
--------------bTuOsyafti4Vu4jbc3XE265m
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/17/2024 4:54 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	Improve ufence addr validation and error handling (rev3)
> *URL:* 	https://patchwork.freedesktop.org/series/139991/
> *State:* 	failure
> *Details:* 	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/index.html
>
>
>   CI Bug Log - changes from xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519_full -> xe-pw-139991v3_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-139991v3_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-139991v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
> Here are the unknown changes that may have been introduced in xe-pw-139991v3_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a6:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-433/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a6.html> +1 other test fail
>  *
>
>     igt@xe_exec_reset@cm-close-fd:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-4/igt@xe_exec_reset@cm-close-fd.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-2/igt@xe_exec_reset@cm-close-fd.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-1/igt@xe_exec_reset@cm-close-fd.html>
>
Seen these for other patches so not related, https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140065v2/shard-adlp-8/igt@xe_exec_reset@cm-close-fd.html


Merged to drm-xe-next

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
>     igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-5/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html>
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-fast:
>
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-2/igt@kms_chamelium_hpd@vga-hpd-fast.html> (Intel XE#2252 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd-fast.html> +2 other tests skip
>  *
>
>     igt@kms_content_protection@content-type-change:
>
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-8/igt@kms_content_protection@content-type-change.html> (Intel XE#2341 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-5/igt@kms_content_protection@content-type-change.html>
>  *
>
>     igt@kms_cursor_crc@cursor-random-256x85:
>
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-5/igt@kms_cursor_crc@cursor-random-256x85.html> (Intel XE#2320 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-5/igt@kms_cursor_crc@cursor-random-256x85.html>
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>
>       o {shard-bmg}: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html>
>  *
>
>     igt@kms_feature_discovery@display-1x:
>
>       o {shard-bmg}: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-4/igt@kms_feature_discovery@display-1x.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-5/igt@kms_feature_discovery@display-1x.html> +13 other tests skip
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
>
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>  *
>
>     igt@kms_getfb@getfb2-accept-ccs:
>
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html> (Intel XE#2340 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-5/igt@kms_getfb@getfb2-accept-ccs.html>
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b:
>
>       o {shard-bmg}: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b.html>
>  *
>
>     igt@kms_scaling_modes@scaling-mode-full-aspect:
>
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html> (Intel XE#2413 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html>
>  *
>
>     igt@kms_vrr@seamless-rr-switch-virtual:
>
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html> (Intel XE#1499 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html>
>
>
>     New tests
>
> New tests have been introduced between xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519_full and xe-pw-139991v3_full:
>
>
>       New IGT tests (2)
>
>  *
>
>     igt@kms_vblank@ts-continuation-modeset@pipe-a-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.43] s
>  *
>
>     igt@kms_vblank@ts-continuation-modeset@pipe-d-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.37] s
>
>
>     Known issues
>
> Here are the changes found in xe-pw-139991v3_full that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>  *
>
>     igt@kms_big_fb@linear-32bpp-rotate-270:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-9/igt@kms_big_fb@linear-32bpp-rotate-270.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>  *
>
>     igt@kms_big_fb@x-tiled-16bpp-rotate-0:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +5 other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-0:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) +4 other tests fail
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +2 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>
>       o shard-adlp: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +8 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231> / Intel XE#3052 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2 other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-3840x2160p:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +9 other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +14 other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +41 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html> (Intel XE#2907 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +9 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>  *
>
>     igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-436/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html> (Intel XE#1152 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152>) +3 other tests skip
>  *
>
>     igt@kms_chamelium_audio@hdmi-audio-edid:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-464/igt@kms_chamelium_audio@hdmi-audio-edid.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1 other test skip
>  *
>
>     igt@kms_chamelium_color@ctm-red-to-blue:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-464/igt@kms_chamelium_color@ctm-red-to-blue.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1 other test skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-cmp-planes-random:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-4/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html> (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x170:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-9/igt@kms_cursor_crc@cursor-random-512x170.html> (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-random-max-size:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-433/igt@kms_cursor_crc@cursor-random-max-size.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +9 other tests skip
>  *
>
>     igt@kms_cursor_edge_walk@256x256-right-edge:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-3/igt@kms_cursor_edge_walk@256x256-right-edge.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-1/igt@kms_cursor_edge_walk@256x256-right-edge.html> (Intel XE#2577 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577>) +1 other test fail
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html> (Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +18 other tests skip
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-toggle:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-9/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html> (Intel XE#1475 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475>)
>  *
>
>     igt@kms_feature_discovery@display-1x:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_feature_discovery@display-1x.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +4 other tests skip
>  *
>
>     igt@kms_feature_discovery@display-4x:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-463/igt@kms_feature_discovery@display-4x.html> (Intel XE#1138 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
>  *
>
>     igt@kms_flip@flip-vs-suspend:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html> (Intel XE#2953 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953>) +1 other test dmesg-warn
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#2049 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> / Intel XE#2597 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>)
>  *
>
>     igt@kms_flip@flip-vs-suspend@c-dp4:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-463/igt@kms_flip@flip-vs-suspend@c-dp4.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@kms_flip@flip-vs-suspend@c-dp4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#2049 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049>)
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +9 other tests fail
>  *
>
>     igt@kms_flip@plain-flip-ts-check-interruptible:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-433/igt@kms_flip@plain-flip-ts-check-interruptible.html> (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +2 other tests dmesg-fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +10 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +13 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html> (Intel XE#1861 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>) +2 other tests fail
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +3 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +18 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +4 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +13 other tests skip
>  *
>
>     igt@kms_joiner@invalid-modeset-big-joiner:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@kms_joiner@invalid-modeset-big-joiner.html> (Intel XE#346 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>  *
>
>     igt@kms_plane@pixel-format-source-clamping:
>
>       o shard-adlp: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping.html> (Intel XE#1035 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035> / Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>  *
>
>     igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
>
>       o shard-adlp: NOTRUN -> WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html> (Intel XE#2078 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078>) +1 other test warn
>  *
>
>     igt@kms_plane@plane-position-covered@pipe-a-plane-1:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +2 other tests dmesg-fail
>  *
>
>     igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +7 other tests dmesg-warn
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +5 other tests skip
>  *
>
>     igt@kms_pm_backlight@fade-with-suspend:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html> (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) +1 other test skip
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-1/igt@kms_pm_dc@dc3co-vpb-simulation.html> (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html> (Intel XE#1430 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430>)
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html> (Intel XE#836 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>)
>  *
>
>     igt@kms_pm_rpm@universal-planes-dpms:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-1/igt@kms_pm_rpm@universal-planes-dpms.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms.html> (Intel XE#1620 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620> / Intel XE#2864 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864>)
>  *
>
>     igt@kms_pm_rpm@universal-planes-dpms@plane-32:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-1/igt@kms_pm_rpm@universal-planes-dpms@plane-32.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms@plane-32.html> (Intel XE#1620 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +6 other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-6/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +3 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-cursor-plane-move:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html> (Intel XE#2948 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948>) +1 other test fail
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-blt@edp-1:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-7/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-2/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html> (Intel XE#1649 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649>) +1 other test fail
>  *
>
>     igt@kms_psr@psr-cursor-plane-onoff:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-8/igt@kms_psr@psr-cursor-plane-onoff.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +5 other tests skip
>  *
>
>     igt@kms_psr@psr2-basic:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-433/igt@kms_psr@psr2-basic.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +8 other tests skip
>  *
>
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html> (Intel XE#2939 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (Intel XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>  *
>
>     igt@kms_setmode@basic:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-1/igt@kms_setmode@basic.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-6/igt@kms_setmode@basic.html> (Intel XE#2883 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883>) +1 other test fail
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#1729 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>)
>  *
>
>     igt@kms_writeback@writeback-check-output-xrgb2101010:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0x369:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0x369.html> (Intel XE#1126 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>) +1 other test skip
>  *
>
>     igt@xe_eudebug_online@resume-dss:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-433/igt@xe_eudebug_online@resume-dss.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +5 other tests skip
>  *
>
>     igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-9/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +3 other tests skip
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#402 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>)
>  *
>
>     igt@xe_evict@evict-large-multi-vm-cm:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html> (Intel XE#1600 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600>)
>  *
>
>     igt@xe_evict@evict-small-external-cm:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-6/igt@xe_evict@evict-small-external-cm.html> (Intel XE#261 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> / Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +4 other tests skip
>  *
>
>     igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-436/igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-433/igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>  *
>
>     igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-435/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +26 other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html> (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +4 other tests skip
>  *
>
>     igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-8/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-6/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html> (Intel XE#2754 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754>)
>  *
>
>     igt@xe_exec_fault_mode@many-basic-imm:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-4/igt@xe_exec_fault_mode@many-basic-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +8 other tests skip
>  *
>
>     igt@xe_exec_fault_mode@once-bindexecqueue-rebind:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +12 other tests skip
>  *
>
>     igt@xe_exec_fault_mode@once-rebind:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +5 other tests skip
>  *
>
>     igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html> (Intel XE#2360 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>  *
>
>     igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-8/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html> (Intel XE#2360 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>  *
>
>     igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-432/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html> (Intel XE#1638 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638> / Intel XE#358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/358>)
>  *
>
>     igt@xe_fault_injection@inject-fault-probe:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe.html> (Intel XE#2931 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2931>)
>  *
>
>     igt@xe_live_ktest@xe_migrate:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-2/igt@xe_live_ktest@xe_migrate.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-2/igt@xe_live_ktest@xe_migrate.html> (Intel XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192>)
>  *
>
>     igt@xe_oa@invalid-create-userspace-config:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-9/igt@xe_oa@invalid-create-userspace-config.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +1 other test skip
>  *
>
>     igt@xe_oa@whitelisted-registers-userspace-config:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-464/igt@xe_oa@whitelisted-registers-userspace-config.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +1 other test skip
>  *
>
>     igt@xe_pm@d3cold-mmap-vram:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>  *
>
>     igt@xe_pm@d3cold-mocs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-463/igt@xe_pm@d3cold-mocs.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>)
>  *
>
>     igt@xe_pm@s2idle-basic:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-464/igt@xe_pm@s2idle-basic.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-432/igt@xe_pm@s2idle-basic.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) +1 other test abort
>  *
>
>     igt@xe_pm@s4-exec-after:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-4/igt@xe_pm@s4-exec-after.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-9/igt@xe_pm@s4-exec-after.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>)
>  *
>
>     igt@xe_pm@s4-vm-bind-unbind-all:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html> (Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_query@multigpu-query-cs-cycles:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-464/igt@xe_query@multigpu-query-cs-cycles.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1 other test skip
>  *
>
>     igt@xe_spin_batch@spin-fixed-duration:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-4/igt@xe_spin_batch@spin-fixed-duration.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration.html> (Intel XE#1081 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip:
>
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip.html> +1 other test pass
>  *
>
>     igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html> (Intel XE#1701 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html> +1 other test pass
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html> (Intel XE#1426 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html> +1 other test pass
>  *
>
>     igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html> (Intel XE#1426 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html> +3 other tests pass
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> +3 other tests pass
>  *
>
>     igt@kms_cursor_edge_walk@128x128-left-edge:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-2/igt@kms_cursor_edge_walk@128x128-left-edge.html> (Intel XE#2577 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-3/igt@kms_cursor_edge_walk@128x128-left-edge.html> +1 other test pass
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-toggle:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
>
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html> +5 other tests pass
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html> +6 other tests pass
>  *
>
>     igt@kms_flip@basic-plain-flip:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_flip@basic-plain-flip.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-436/igt@kms_flip@basic-plain-flip.html> +6 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html> +5 other tests pass
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html>
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1.html> (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1.html> +1 other test pass
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
>
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html> +1 other test pass
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html> +6 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html> (Intel XE#1861 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html>
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc:
>
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-3/igt@kms_pipe_crc_basic@suspend-read-crc.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc.html>
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
>
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html> (Intel XE#3086 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html>
>  *
>
>     igt@kms_plane@plane-position-covered@pipe-a-plane-2:
>
>       o shard-lnl: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-2.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-a-plane-2.html>
>  *
>
>     igt@kms_plane@plane-position-covered@pipe-b-plane-1:
>
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html> +2 other tests pass
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a:
>
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a.html> +1 other test pass
>  *
>
>     igt@kms_pm_rpm@cursor-dpms:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_pm_rpm@cursor-dpms.html> (Intel XE#2446 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-435/igt@kms_pm_rpm@cursor-dpms.html>
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-4/igt@kms_pm_rpm@cursor-dpms.html> (Intel XE#2446 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-7/igt@kms_pm_rpm@cursor-dpms.html>
>  *
>
>     igt@kms_psr@psr2-cursor-plane-move@edp-1:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-4/igt@kms_psr@psr2-cursor-plane-move@edp-1.html> (Intel XE#1649 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-5/igt@kms_psr@psr2-cursor-plane-move@edp-1.html> +1 other test pass
>  *
>
>     igt@kms_sequence@get-idle:
>
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-4/igt@kms_sequence@get-idle.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-8/igt@kms_sequence@get-idle.html> +5 other tests pass
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak:
>
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak.html> (Intel XE#3007 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-1/igt@kms_universal_plane@cursor-fb-leak.html>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak.html> +1 other test pass
>  *
>
>     igt@kms_vrr@flip-basic:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-5/igt@kms_vrr@flip-basic.html> (Intel XE#2443 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-7/igt@kms_vrr@flip-basic.html> +3 other tests pass
>  *
>
>     igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:
>
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-432/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html> (Intel XE#2625 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-464/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html> +3 other tests pass
>  *
>
>     igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-3/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html> (Intel XE#2667 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-6/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html>
>  *
>
>     igt@xe_evict@evict-beng-threads-large:
>
>       o shard-dg2-set2: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html>
>  *
>
>     igt@xe_evict@evict-large-multi-vm-cm:
>
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-8/igt@xe_evict@evict-large-multi-vm-cm.html> (Intel XE#2364 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-1/igt@xe_evict@evict-large-multi-vm-cm.html>
>  *
>
>     igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-433/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate.html> +12 other tests pass
>  *
>
>     igt@xe_exec_queue_property@basic-get-property:
>
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-4/igt@xe_exec_queue_property@basic-get-property.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-4/igt@xe_exec_queue_property@basic-get-property.html> +16 other tests pass
>  *
>
>     igt@xe_exec_reset@gt-reset-stress:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-4/igt@xe_exec_reset@gt-reset-stress.html> (Intel XE#2895 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2895>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-9/igt@xe_exec_reset@gt-reset-stress.html>
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-7/igt@xe_exec_reset@gt-reset-stress.html> (Intel XE#2895 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2895>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-8/igt@xe_exec_reset@gt-reset-stress.html>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-435/igt@xe_exec_reset@gt-reset-stress.html> (Intel XE#2895 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2895>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-432/igt@xe_exec_reset@gt-reset-stress.html>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-1/igt@xe_exec_reset@gt-reset-stress.html> (Intel XE#2895 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2895>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-4/igt@xe_exec_reset@gt-reset-stress.html>
>  *
>
>     igt@xe_exec_reset@parallel-gt-reset:
>
>       o {shard-bmg}: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html> (Intel XE#2105 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html>
>  *
>
>     igt@xe_exec_threads@threads-shared-vm-userptr-rebind:
>
>       o shard-adlp: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-8/igt@xe_exec_threads@threads-shared-vm-userptr-rebind.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-6/igt@xe_exec_threads@threads-shared-vm-userptr-rebind.html> +5 other tests pass
>  *
>
>     igt@xe_live_ktest@xe_dma_buf:
>
>       o shard-lnl: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-5/igt@xe_live_ktest@xe_dma_buf.html> (Intel XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-7/igt@xe_live_ktest@xe_dma_buf.html>
>  *
>
>     igt@xe_pm@s4-multiple-execs:
>
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#402 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_big_fb@y-tiled-64bpp-rotate-270:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-adlp: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#402 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +1 other test skip
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>)
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
>
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html> (Intel XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +1 other test skip
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank:
>
>       o shard-adlp: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-8/igt@kms_flip@2x-flip-vs-expired-vblank.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-4/igt@kms_flip@2x-flip-vs-expired-vblank.html> (Intel XE#310 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>)
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +3 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
>
>       o shard-adlp: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +2 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +2 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
>
>       o shard-adlp: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
>
>       o shard-adlp: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +2 other tests skip
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel XE#356 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>)
>  *
>
>     igt@kms_plane@plane-position-hole:
>
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-1/igt@kms_plane@plane-position-hole.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-1/igt@kms_plane@plane-position-hole.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +2 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>  *
>
>     igt@kms_psr@pr-basic:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_psr@pr-basic.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-435/igt@kms_psr@pr-basic.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>  *
>
>     igt@kms_psr@pr-dpms:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-466/igt@kms_psr@pr-dpms.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_psr@pr-dpms.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +1 other test skip
>  *
>
>     igt@kms_psr@psr2-cursor-render:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-436/igt@kms_psr@psr2-cursor-render.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_psr@psr2-cursor-render.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>  *
>
>     igt@kms_scaling_modes@scaling-mode-full-aspect:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-466/igt@kms_scaling_modes@scaling-mode-full-aspect.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full-aspect.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +1 other test skip
>  *
>
>     igt@xe_compute_preempt@compute-preempt:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html> (Intel XE#1280 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_eudebug@multiple-sessions:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-463/igt@xe_eudebug@multiple-sessions.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@xe_eudebug@multiple-sessions.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-large:
>
>       o shard-dg2-set2: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-small:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +4 other tests skip
>  *
>
>     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +2 other tests skip
>  *
>
>     igt@xe_oa@invalid-oa-metric-set-id:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-434/igt@xe_oa@invalid-oa-metric-set-id.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@xe_oa@invalid-oa-metric-set-id.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_query@multigpu-query-topology-l3-bank-mask:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@xe_query@multigpu-query-topology-l3-bank-mask.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@xe_query@multigpu-query-topology-l3-bank-mask.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * IGT: IGT_8076 -> IGT_8077
>   * Linux: xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519 -> xe-pw-139991v3
>
> IGT_8076: e511df10a1201d0d83c03ccbcabc3d57191e5f8e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8077: 42f9e9702f74a4993318adea936baaa186084689 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519: 12e4970af1ecdeb76e94df2daf51a9c3d6b9f519
> xe-pw-139991v3: 139991v3
>
--------------bTuOsyafti4Vu4jbc3XE265m
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
    <div class="moz-cite-prefix">On 10/17/2024 4:54 AM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:172913368338.1276639.8783864821751064855@2413ebb6fbb6">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>Improve ufence addr validation and error handling (rev3)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/139991/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/139991/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519_full -&gt;
        xe-pw-139991v3_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-139991v3_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-139991v3_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-139991v3_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-433/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a6.html"
                moz-do-not-send="true">FAIL</a> +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@cm-close-fd:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-4/igt@xe_exec_reset@cm-close-fd.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html"
                moz-do-not-send="true">FAIL</a></li>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-2/igt@xe_exec_reset@cm-close-fd.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-1/igt@xe_exec_reset@cm-close-fd.html"
                moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>Seen these for other patches so not related,
<a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140065v2/shard-adlp-8/igt@xe_exec_reset@cm-close-fd.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140065v2/shard-adlp-8/igt@xe_exec_reset@cm-close-fd.html</a><br>
    </p>
    <p><br>
    </p>
    <p>Merged to drm-xe-next<br>
    </p>
    <blockquote type="cite"
      cite="mid:172913368338.1276639.8783864821751064855@2413ebb6fbb6">
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
          <p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-5/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html"
                moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-2/igt@kms_chamelium_hpd@vga-hpd-fast.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252"
                moz-do-not-send="true">Intel XE#2252</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd-fast.html"
                moz-do-not-send="true">SKIP</a> +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@content-type-change:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-8/igt@kms_content_protection@content-type-change.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341"
                moz-do-not-send="true">Intel XE#2341</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-5/igt@kms_content_protection@content-type-change.html"
                moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-256x85:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-5/igt@kms_cursor_crc@cursor-random-256x85.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320"
                moz-do-not-send="true">Intel XE#2320</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-5/igt@kms_cursor_crc@cursor-random-256x85.html"
                moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html"
                moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-1x:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-4/igt@kms_feature_discovery@display-1x.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-5/igt@kms_feature_discovery@display-1x.html"
                moz-do-not-send="true">SKIP</a> +13 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html"
                moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_getfb@getfb2-accept-ccs:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340"
                moz-do-not-send="true">Intel XE#2340</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-5/igt@kms_getfb@getfb2-accept-ccs.html"
                moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-b.html"
                moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413"
                moz-do-not-send="true">Intel XE#2413</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html"
                moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499"
                moz-do-not-send="true">Intel XE#1499</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html"
                moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between
        xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519_full and
        xe-pw-139991v3_full:</p>
      <h3>New IGT tests (2)</h3>
      <ul>
        <li>
          <p>igt@kms_vblank@ts-continuation-modeset@pipe-a-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.43] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-modeset@pipe-d-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.37] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-139991v3_full that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-9/igt@kms_big_fb@linear-32bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-16bpp-rotate-0:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"
                moz-do-not-send="true">Intel XE#1874</a>) +4 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204"
                moz-do-not-send="true">Intel XE#1204</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052"
                moz-do-not-send="true">Intel XE#3052</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +41 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907"
                moz-do-not-send="true">Intel XE#2907</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-436/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152"
                moz-do-not-send="true">Intel XE#1152</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-464/igt@kms_chamelium_audio@hdmi-audio-edid.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-464/igt@kms_chamelium_color@ctm-red-to-blue.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-4/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"
                moz-do-not-send="true">Intel XE#308</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x170:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-9/igt@kms_cursor_crc@cursor-random-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"
                moz-do-not-send="true">Intel XE#308</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-max-size:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-433/igt@kms_cursor_crc@cursor-random-max-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@256x256-right-edge:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-3/igt@kms_cursor_edge_walk@256x256-right-edge.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-1/igt@kms_cursor_edge_walk@256x256-right-edge.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577"
                moz-do-not-send="true">Intel XE#2577</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323"
                moz-do-not-send="true">Intel XE#323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309"
                moz-do-not-send="true">Intel XE#309</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +18 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-9/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475"
                moz-do-not-send="true">Intel XE#1475</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-1x:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_feature_discovery@display-1x.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-4x:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-463/igt@kms_feature_discovery@display-4x.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138"
                moz-do-not-send="true">Intel XE#1138</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953"
                moz-do-not-send="true">Intel XE#2953</a>) +1 other test
              dmesg-warn</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049"
                moz-do-not-send="true">Intel XE#2049</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597"
                moz-do-not-send="true">Intel XE#2597</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-463/igt@kms_flip@flip-vs-suspend@c-dp4.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@kms_flip@flip-vs-suspend@c-dp4.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049"
                moz-do-not-send="true">Intel XE#2049</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"
                moz-do-not-send="true">Intel XE#886</a>) +9 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-433/igt@kms_flip@plain-flip-ts-check-interruptible.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882"
                moz-do-not-send="true">Intel XE#2882</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) +2 other tests
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"
                moz-do-not-send="true">Intel XE#656</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861"
                moz-do-not-send="true">Intel XE#1861</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +18 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@kms_joiner@invalid-modeset-big-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346"
                moz-do-not-send="true">Intel XE#346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-source-clamping:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035"
                moz-do-not-send="true">Intel XE#1035</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-4/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html"
                moz-do-not-send="true">WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078"
                moz-do-not-send="true">Intel XE#2078</a>) +1 other test
              warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-covered@pipe-a-plane-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) +2 other tests
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) +7 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763"
                moz-do-not-send="true">Intel XE#2763</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763"
                moz-do-not-send="true">Intel XE#2763</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade-with-suspend:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870"
                moz-do-not-send="true">Intel XE#870</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-1/igt@kms_pm_dc@dc3co-vpb-simulation.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122"
                moz-do-not-send="true">Intel XE#1122</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430"
                moz-do-not-send="true">Intel XE#1430</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836"
                moz-do-not-send="true">Intel XE#836</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@universal-planes-dpms:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-1/igt@kms_pm_rpm@universal-planes-dpms.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620"
                moz-do-not-send="true">Intel XE#1620</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864"
                moz-do-not-send="true">Intel XE#2864</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@universal-planes-dpms@plane-32:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-1/igt@kms_pm_rpm@universal-planes-dpms@plane-32.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms@plane-32.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620"
                moz-do-not-send="true">Intel XE#1620</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-6/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948"
                moz-do-not-send="true">Intel XE#2948</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-sprite-blt@edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-7/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-2/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649"
                moz-do-not-send="true">Intel XE#1649</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-cursor-plane-onoff:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-8/igt@kms_psr@psr-cursor-plane-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-basic:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-433/igt@kms_psr@psr2-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939"
                moz-do-not-send="true">Intel XE#2939</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127"
                moz-do-not-send="true">Intel XE#1127</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-1/igt@kms_setmode@basic.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-6/igt@kms_setmode@basic.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883"
                moz-do-not-send="true">Intel XE#2883</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729"
                moz-do-not-send="true">Intel XE#1729</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756"
                moz-do-not-send="true">Intel XE#756</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0x369.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126"
                moz-do-not-send="true">Intel XE#1126</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@resume-dss:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-433/igt@xe_eudebug_online@resume-dss.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905"
                moz-do-not-send="true">Intel XE#2905</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-9/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905"
                moz-do-not-send="true">Intel XE#2905</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402"
                moz-do-not-send="true">Intel XE#402</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-large-multi-vm-cm:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600"
                moz-do-not-send="true">Intel XE#1600</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-small-external-cm:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-6/igt@xe_evict@evict-small-external-cm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261"
                moz-do-not-send="true">Intel XE#261</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688"
                moz-do-not-send="true">Intel XE#688</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-436/igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-433/igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-435/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) +26 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392"
                moz-do-not-send="true">Intel XE#1392</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-8/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-6/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754"
                moz-do-not-send="true">Intel XE#2754</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-basic-imm:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-4/igt@xe_exec_fault_mode@many-basic-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +12 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-rebind:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360"
                moz-do-not-send="true">Intel XE#2360</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-8/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360"
                moz-do-not-send="true">Intel XE#2360</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-432/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638"
                moz-do-not-send="true">Intel XE#1638</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358"
                moz-do-not-send="true">Intel XE#358</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@inject-fault-probe:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2931"
                moz-do-not-send="true">Intel XE#2931</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_migrate:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-2/igt@xe_live_ktest@xe_migrate.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-2/igt@xe_live_ktest@xe_migrate.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192"
                moz-do-not-send="true">Intel XE#1192</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@invalid-create-userspace-config:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-9/igt@xe_oa@invalid-create-userspace-config.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-464/igt@xe_oa@whitelisted-registers-userspace-config.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mmap-vram:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"
                moz-do-not-send="true">Intel XE#2284</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366"
                moz-do-not-send="true">Intel XE#366</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mocs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-463/igt@xe_pm@d3cold-mocs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"
                moz-do-not-send="true">Intel XE#2284</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-basic:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-464/igt@xe_pm@s2idle-basic.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-432/igt@xe_pm@s2idle-basic.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>) +1 other test
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-exec-after:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-4/igt@xe_pm@s4-exec-after.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-9/igt@xe_pm@s4-exec-after.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607"
                moz-do-not-send="true">Intel XE#1607</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-cs-cycles:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-464/igt@xe_query@multigpu-query-cs-cycles.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_spin_batch@spin-fixed-duration:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-4/igt@xe_spin_batch@spin-fixed-duration.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081"
                moz-do-not-send="true">Intel XE#1081</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701"
                moz-do-not-send="true">Intel XE#1701</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426"
                moz-do-not-send="true">Intel XE#1426</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426"
                moz-do-not-send="true">Intel XE#1426</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html"
                moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@128x128-left-edge:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-2/igt@kms_cursor_edge_walk@128x128-left-edge.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577"
                moz-do-not-send="true">Intel XE#2577</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-3/igt@kms_cursor_edge_walk@128x128-left-edge.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html"
                moz-do-not-send="true">FAIL</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html"
                moz-do-not-send="true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html"
                moz-do-not-send="true">PASS</a> +6 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@basic-plain-flip:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_flip@basic-plain-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-436/igt@kms_flip@basic-plain-flip.html"
                moz-do-not-send="true">PASS</a> +6 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"
                moz-do-not-send="true">Intel XE#886</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html"
                moz-do-not-send="true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html"
                moz-do-not-send="true">FAIL</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882"
                moz-do-not-send="true">Intel XE#2882</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"
                moz-do-not-send="true">Intel XE#1874</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html"
                moz-do-not-send="true">PASS</a> +6 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861"
                moz-do-not-send="true">Intel XE#1861</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-3/igt@kms_pipe_crc_basic@suspend-read-crc.html"
                moz-do-not-send="true">DMESG-WARN</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086"
                moz-do-not-send="true">Intel XE#3086</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-covered@pipe-a-plane-2:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-2.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-a-plane-2.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-covered@pipe-b-plane-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@cursor-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_pm_rpm@cursor-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446"
                moz-do-not-send="true">Intel XE#2446</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-435/igt@kms_pm_rpm@cursor-dpms.html"
                moz-do-not-send="true">PASS</a></li>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-4/igt@kms_pm_rpm@cursor-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446"
                moz-do-not-send="true">Intel XE#2446</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-7/igt@kms_pm_rpm@cursor-dpms.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-cursor-plane-move@edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-4/igt@kms_psr@psr2-cursor-plane-move@edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649"
                moz-do-not-send="true">Intel XE#1649</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-5/igt@kms_psr@psr2-cursor-plane-move@edp-1.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sequence@get-idle:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-4/igt@kms_sequence@get-idle.html"
                moz-do-not-send="true">SKIP</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-8/igt@kms_sequence@get-idle.html"
                moz-do-not-send="true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007"
                moz-do-not-send="true">Intel XE#3007</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-1/igt@kms_universal_plane@cursor-fb-leak.html"
                moz-do-not-send="true">PASS</a></li>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899"
                moz-do-not-send="true">Intel XE#899</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-basic:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-5/igt@kms_vrr@flip-basic.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443"
                moz-do-not-send="true">Intel XE#2443</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-7/igt@kms_vrr@flip-basic.html"
                moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-432/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625"
                moz-do-not-send="true">Intel XE#2625</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-464/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html"
                moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-3/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667"
                moz-do-not-send="true">Intel XE#2667</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-6/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-large-multi-vm-cm:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-8/igt@xe_evict@evict-large-multi-vm-cm.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364"
                moz-do-not-send="true">Intel XE#2364</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-1/igt@xe_evict@evict-large-multi-vm-cm.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-433/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-invalidate.html"
                moz-do-not-send="true">PASS</a> +12 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_queue_property@basic-get-property:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-4/igt@xe_exec_queue_property@basic-get-property.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-4/igt@xe_exec_queue_property@basic-get-property.html"
                moz-do-not-send="true">PASS</a> +16 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@gt-reset-stress:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-4/igt@xe_exec_reset@gt-reset-stress.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2895"
                moz-do-not-send="true">Intel XE#2895</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-9/igt@xe_exec_reset@gt-reset-stress.html"
                moz-do-not-send="true">PASS</a></li>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-7/igt@xe_exec_reset@gt-reset-stress.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2895"
                moz-do-not-send="true">Intel XE#2895</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-8/igt@xe_exec_reset@gt-reset-stress.html"
                moz-do-not-send="true">PASS</a></li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-435/igt@xe_exec_reset@gt-reset-stress.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2895"
                moz-do-not-send="true">Intel XE#2895</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-432/igt@xe_exec_reset@gt-reset-stress.html"
                moz-do-not-send="true">PASS</a></li>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-1/igt@xe_exec_reset@gt-reset-stress.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2895"
                moz-do-not-send="true">Intel XE#2895</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-4/igt@xe_exec_reset@gt-reset-stress.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@parallel-gt-reset:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105"
                moz-do-not-send="true">Intel XE#2105</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-shared-vm-userptr-rebind:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-8/igt@xe_exec_threads@threads-shared-vm-userptr-rebind.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-6/igt@xe_exec_threads@threads-shared-vm-userptr-rebind.html"
                moz-do-not-send="true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_dma_buf:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-5/igt@xe_live_ktest@xe_dma_buf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192"
                moz-do-not-send="true">Intel XE#1192</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-7/igt@xe_live_ktest@xe_dma_buf.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-multiple-execs:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607"
                moz-do-not-send="true">Intel XE#1607</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402"
                moz-do-not-send="true">Intel XE#402</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402"
                moz-do-not-send="true">Intel XE#402</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"
                moz-do-not-send="true">Intel XE#1874</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"
                moz-do-not-send="true">Intel XE#3113</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-8/igt@kms_flip@2x-flip-vs-expired-vblank.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-4/igt@kms_flip@2x-flip-vs-expired-vblank.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310"
                moz-do-not-send="true">Intel XE#310</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"
                moz-do-not-send="true">Intel XE#656</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356"
                moz-do-not-send="true">Intel XE#356</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-hole:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-lnl-1/igt@kms_plane@plane-position-hole.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-lnl-1/igt@kms_plane@plane-position-hole.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-basic:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@kms_psr@pr-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-435/igt@kms_psr@pr-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-466/igt@kms_psr@pr-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_psr@pr-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-cursor-render:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-436/igt@kms_psr@psr2-cursor-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_psr@psr2-cursor-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890"
                moz-do-not-send="true">Intel XE#2890</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-466/igt@kms_scaling_modes@scaling-mode-full-aspect.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full-aspect.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute_preempt@compute-preempt:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280"
                moz-do-not-send="true">Intel XE#1280</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@multiple-sessions:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-463/igt@xe_eudebug@multiple-sessions.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905"
                moz-do-not-send="true">Intel XE#2905</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@xe_eudebug@multiple-sessions.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-small:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html"
                moz-do-not-send="true">FAIL</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@invalid-oa-metric-set-id:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-434/igt@xe_oa@invalid-oa-metric-set-id.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-434/igt@xe_oa@invalid-oa-metric-set-id.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/shard-dg2-433/igt@xe_query@multigpu-query-topology-l3-bank-mask.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139991v3/shard-dg2-466/igt@xe_query@multigpu-query-topology-l3-bank-mask.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8076 -&gt; IGT_8077</li>
        <li>Linux: xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519
          -&gt; xe-pw-139991v3</li>
      </ul>
      <p>IGT_8076: e511df10a1201d0d83c03ccbcabc3d57191e5f8e @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_8077: 42f9e9702f74a4993318adea936baaa186084689 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519:
        12e4970af1ecdeb76e94df2daf51a9c3d6b9f519<br>
        xe-pw-139991v3: 139991v3</p>
    </blockquote>
  </body>
</html>

--------------bTuOsyafti4Vu4jbc3XE265m--
