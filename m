Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F019CE77180
	for <intel-xe@archiver.kernel.org>; Mon, 16 Dec 2024 15:07:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B286310E6C4;
	Mon, 16 Dec 2024 15:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O8AV8U0A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2028710E6C6
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Dec 2024 15:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734361641; x=1765897641;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=CcjRQU7TYf+Mkek2AL665i1RfLceewSUYVwJuhe3Raw=;
 b=O8AV8U0ATB3kw/C57uOXVKTTiua2Rsu2GcPVqflIOFaDBhayzBml2N0x
 sXKDv3zaXpCyAJpJPX7ZTGU3O3V6q3tkF7i4okoA5yYTLbuuxXnLqVqG2
 waUgZN005H/Y3xk2JG6mwpYWAImeyzIuxpxEpS+99ej+QG3Y+4YyyLY60
 Y3o/Eee3H2AAWSnuEYha+uOWtpg4BM+7DdxH/vJ+gpbf0AzvtadKaJP5I
 Bc59LRngCSkow3KnH0EGIgZTlequ4kM2fcBsof+RoLss/8bA2/2sRVqmY
 jyiL//jrMEMBTC5UFnhqmeU+G3VmwareFuNj/fCh0zpy8L6Pj8ZJrXxPO A==;
X-CSE-ConnectionGUID: v01AfnLZQAmQ3/fKznKt/Q==
X-CSE-MsgGUID: C6fyqjNeTZqDGzdq4nwHWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="38428389"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208,217";a="38428389"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 07:07:20 -0800
X-CSE-ConnectionGUID: UpsZDGj0T86mBGJNmcEcSQ==
X-CSE-MsgGUID: JlIdCoZhTq+bpcERssQWBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208,217";a="96993434"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.149.72])
 ([10.245.149.72])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 07:07:17 -0800
Content-Type: multipart/alternative;
 boundary="------------mE004pZ4Zwl1d0nmpWdi0UQU"
Message-ID: <a5d1b95f-4570-418e-b593-6e00bbc152dc@linux.intel.com>
Date: Mon, 16 Dec 2024 16:07:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_series_star?=
 =?UTF-8?Q?ting_with_=5Bv4=2C1/2=5D_drm/xe=3A_Use_non-interruptible_wait_whe?=
 =?UTF-8?Q?n_moving_BO_to_system?=
To: intel-xe@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20241213122415.3880017-1-nirmoy.das@intel.com>
 <173414437084.2359426.6812495677266822096@b555e5b46a47>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <173414437084.2359426.6812495677266822096@b555e5b46a47>
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
--------------mE004pZ4Zwl1d0nmpWdi0UQU
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 12/14/2024 3:46 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	series starting with [v4,1/2] drm/xe: Use non-interruptible wait when moving BO to system
> *URL:* 	https://patchwork.freedesktop.org/series/142559/
> *State:* 	failure
> *Details:* 	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/index.html
>
>
>   CI Bug Log - changes from xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5_full -> xe-pw-142559v1_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-142559v1_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-142559v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
> Here are the unknown changes that may have been introduced in xe-pw-142559v1_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-4:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-4.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-4.html> +1 other test incomplete
>  *
>
>     igt@kms_color@ctm-0-25@pipe-b-edp-1:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-lnl-6/igt@kms_color@ctm-0-25@pipe-b-edp-1.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-lnl-5/igt@kms_color@ctm-0-25@pipe-b-edp-1.html> +1 other test incomplete
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html>
>  *
>
>     igt@kms_flip@flip-vs-rmfb-interruptible@a-hdmi-a3:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@kms_flip@flip-vs-rmfb-interruptible@a-hdmi-a3.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@kms_flip@flip-vs-rmfb-interruptible@a-hdmi-a3.html> +1 other test incomplete
>  *
>
>     igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-lnl-5/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html> +1 other test fail
>  *
>
>     igt@xe_exec_reset@cat-error:
>
>       o shard-adlp: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-8/igt@xe_exec_reset@cat-error.html>
>
Waiting extra shouldn't cause any issue
>
>  *
>
>  *
>
>     igt@xe_wedged@basic-wedged:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-435/igt@xe_wedged@basic-wedged.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@xe_wedged@basic-wedged.html>
>
unrelated


Merged to drm-xe-next


Regards,

Nirmoy

>  *
>
>
>         Warnings
>
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html> (Intel XE#3467 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html>
>
>
>     New tests
>
> New tests have been introduced between xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5_full and xe-pw-142559v1_full:
>
>
>       New IGT tests (7)
>
>  *
>
>     igt@kms_content_protection@srm:
>
>       o Statuses : 1 fail(s) 1 incomplete(s) 2 skip(s)
>       o Exec time: [0.0, 112.77] s
>  *
>
>     igt@kms_content_protection@type1:
>
>       o Statuses : 4 skip(s)
>       o Exec time: [0.29, 2.56] s
>  *
>
>     igt@kms_content_protection@uevent:
>
>       o Statuses : 2 fail(s) 2 skip(s)
>       o Exec time: [0.27, 35.11] s
>  *
>
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
>
>       o Statuses : 4 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_psr2_su@page_flip-nv12:
>
>       o Statuses : 3 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_psr2_su@page_flip-p010:
>
>       o Statuses : 4 skip(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_psr2_su@page_flip-xrgb8888:
>
>       o Statuses : 4 skip(s)
>       o Exec time: [0.0] s
>
>
>     Known issues
>
> Here are the changes found in xe-pw-142559v1_full that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@core_hotunplug@hotreplug-lateclose:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-434/igt@core_hotunplug@hotreplug-lateclose.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@core_hotunplug@hotreplug-lateclose.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +3 other tests dmesg-warn
>  *
>
>     igt@intel_hwmon@hwmon-write:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-6/igt@intel_hwmon@hwmon-write.html> (Intel XE#1125 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125>)
>  *
>
>     igt@kms_async_flips@async-flip-suspend-resume:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_async_flips@async-flip-suspend-resume.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468> / Intel XE#3783 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3783>)
>  *
>
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html> (Intel XE#2385 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385>)
>  *
>
>     igt@kms_atomic_transition@modeset-transition:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_atomic_transition@modeset-transition.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@kms_atomic_transition@modeset-transition.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) +1 other test dmesg-warn
>  *
>
>     igt@kms_atomic_transition@modeset-transition@2x-outputs:
>
>       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@kms_atomic_transition@modeset-transition@2x-outputs.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) +1 other test dmesg-warn
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html> (Intel XE#1426 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) +1 other test fail
>  *
>
>     igt@kms_big_fb@linear-16bpp-rotate-270:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-6/igt@kms_big_fb@linear-16bpp-rotate-270.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>  *
>
>     igt@kms_big_fb@linear-16bpp-rotate-90:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +5 other tests skip
>  *
>
>     igt@kms_big_fb@linear-8bpp-rotate-180:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-8/igt@kms_big_fb@linear-8bpp-rotate-180.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-180.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +24 other tests dmesg-fail
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-433/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#402 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>)
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>       o shard-adlp: NOTRUN -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#3818 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3818>)
>  *
>
>     igt@kms_big_fb@y-tiled-32bpp-rotate-270:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +5 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#402 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) +4 other tests fail
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) +2 other tests fail
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html> (Intel XE#610 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +13 other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html> (Intel XE#2314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>)
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-1920x1080p:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-3/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +115 other tests skip
>  *
>
>     igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +33 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +14 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html> (Intel XE#2652 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +7 other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html> (Intel XE#2907 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>) +1 other test skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +9 other tests skip
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html> (Intel XE#2887 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +5 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#2692 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html> (Intel XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html> (Intel XE#2907 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>) +1 other test skip
>  *
>
>     igt@kms_cdclk@mode-transition:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_cdclk@mode-transition.html> (Intel XE#2724 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724>)
>  *
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-4/igt@kms_cdclk@mode-transition-all-outputs.html> (Intel XE#314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) +3 other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html> (Intel XE#314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>  *
>
>     igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html> (Intel XE#1152 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152>) +3 other tests skip
>  *
>
>     igt@kms_chamelium_audio@hdmi-audio-edid:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-3/igt@kms_chamelium_audio@hdmi-audio-edid.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2 other tests skip
>  *
>
>     igt@kms_chamelium_color@gamma:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@kms_chamelium_color@gamma.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +2 other tests skip
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_chamelium_color@gamma.html> (Intel XE#2325 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>)
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html> (Intel XE#2252 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +2 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +8 other tests skip
>  *
>
>     igt@kms_color@deep-color:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-3/igt@kms_color@deep-color.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_color@deep-color.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468> / Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
>  *
>
>     igt@kms_color@deep-color@pipe-a-dp-2-ctm:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-3/igt@kms_color@deep-color@pipe-a-dp-2-ctm.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_color@deep-color@pipe-a-dp-2-ctm.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468> / Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
>  *
>
>     igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html> (Intel XE#3304 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304>)
>  *
>
>     igt@kms_content_protection@srm (NEW):
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_content_protection@srm.html> (Intel XE#2341 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@kms_content_protection@srm.html> (Intel XE#2715 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-436/igt@kms_content_protection@srm.html> (Intel XE#2715 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@kms_content_protection@srm.html> (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>  *
>
>     igt@kms_content_protection@srm@pipe-a-dp-2:
>
>       o shard-bmg: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@kms_content_protection@srm@pipe-a-dp-2.html> (Intel XE#2715 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x170.html> (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html> (Intel XE#2321 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-dp-2:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-dp-2.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-dp-2.html> (Intel XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +1 other test dmesg-fail
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-64x21:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-64x21.html> (Intel XE#2320 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x170:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-9/igt@kms_cursor_crc@cursor-random-512x170.html> (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>  *
>
>     igt@kms_cursor_edge_walk@64x64-left-edge@pipe-a-dp-2:
>
>       o shard-bmg: NOTRUN -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_cursor_edge_walk@64x64-left-edge@pipe-a-dp-2.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +7 other tests dmesg-fail
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html> (Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +2 other tests skip
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html> (Intel XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) +2 other tests skip
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>  *
>
>     igt@kms_display_modes@extended-mode-basic:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html> (Intel XE#2425 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425>)
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html> (Intel XE#1340 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340>)
>  *
>
>     igt@kms_dsc@dsc-basic:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_dsc@dsc-basic.html> (Intel XE#2244 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>) +1 other test skip
>  *
>
>     igt@kms_feature_discovery@chamelium:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@kms_feature_discovery@chamelium.html> (Intel XE#701 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>)
>  *
>
>     igt@kms_feature_discovery@display-2x:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-5/igt@kms_feature_discovery@display-2x.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_feature_discovery@display-2x.html> (Intel XE#2373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373>)
>  *
>
>     igt@kms_feature_discovery@display-3x:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_feature_discovery@display-3x.html> (Intel XE#703 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>)
>  *
>
>     igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3:
>
>       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +30 other tests dmesg-warn
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-434/igt@kms_flip@2x-flip-vs-dpms.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-dpms.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#2955 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html> (Intel XE#3321 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) +1 other test fail
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html> (Intel XE#3321 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +12 other tests fail
>  *
>
>     igt@kms_flip@2x-flip-vs-modeset-vs-hang:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html> (Intel XE#310 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>) +1 other test skip
>  *
>
>     igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +134 other tests dmesg-warn
>  *
>
>     igt@kms_flip@2x-nonexisting-fb:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html> (Intel XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +4 other tests skip
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@c-dp4:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> / Intel XE#3321 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>)
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate-interruptible:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate-interruptible.html> (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>)
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2:
>
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2.html> (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>)
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +2 other tests fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +21 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html> (Intel XE#2293 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> / Intel XE#2380 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html> (Intel XE#2293 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +3 other tests dmesg-fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +8 other tests skip
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-8/igt@kms_flip_tiling@flip-change-tiling.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_flip_tiling@flip-change-tiling.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +1 other test incomplete
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-8/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +32 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +11 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
>
>       o shard-adlp: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html> (Intel XE#1861 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html> (Intel XE#1861 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>) +2 other tests fail
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html> (Intel XE#2333 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333>) +4 other tests fail
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +6 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +2 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +7 other tests skip
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +11 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +27 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +15 other tests skip
>  *
>
>     igt@kms_hdr@static-swap:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-435/igt@kms_hdr@static-swap.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_hdr@static-swap.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>  *
>
>     igt@kms_joiner@basic-force-big-joiner:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-3/igt@kms_joiner@basic-force-big-joiner.html> (Intel XE#3012 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012>)
>  *
>
>     igt@kms_joiner@basic-force-ultra-joiner:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@kms_joiner@basic-force-ultra-joiner.html> (Intel XE#2925 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925>)
>  *
>
>     igt@kms_joiner@invalid-modeset-big-joiner:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@kms_joiner@invalid-modeset-big-joiner.html> (Intel XE#346 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel XE#356 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>)
>  *
>
>     igt@kms_plane@pixel-format:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-8/igt@kms_plane@pixel-format.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_plane@pixel-format.html> (Intel XE#1035 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>  *
>
>     igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-3:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-3.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-3.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3452 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3452> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +1 other test incomplete
>  *
>
>     igt@kms_plane_multiple@tiling-y:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html> (Intel XE#2493 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493>)
>  *
>
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html> (Intel XE#2571 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571>)
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html> (Intel XE#361 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/361>)
>  *
>
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html> (Intel XE#2566 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +1 other test dmesg-warn
>  *
>
>     igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) +9 other tests dmesg-warn
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +9 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +5 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +8 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +2 other tests skip
>  *
>
>     igt@kms_pm_backlight@basic-brightness:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_pm_backlight@basic-brightness.html> (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_pm_dc@dc5-psr:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html> (Intel XE#718 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>)
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html> (Intel XE#908 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>)
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html> (Intel XE#1129 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129>)
>  *
>
>     igt@kms_pm_rpm@dpms-lpsp:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_pm_rpm@dpms-lpsp.html> (Intel XE#1439 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> / Intel XE#3141 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141> / Intel XE#836 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>)
>  *
>
>     igt@kms_pm_rpm@legacy-planes:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@kms_pm_rpm@legacy-planes.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +5 other tests dmesg-warn
>  *
>
>     igt@kms_pm_rpm@legacy-planes@plane-50:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@kms_pm_rpm@legacy-planes@plane-50.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +2 other tests dmesg-warn
>  *
>
>     igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-2/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +5 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +7 other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1 other test skip
>  *
>
>     igt@kms_psr2_su@frontbuffer-xrgb8888 (NEW):
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html> (Intel XE#2387 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387>)
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html> (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html> (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>  *
>
>     igt@kms_psr@fbc-psr2-basic:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-1/igt@kms_psr@fbc-psr2-basic.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +7 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-plane-move:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +18 other tests skip
>  *
>
>     igt@kms_psr@psr-sprite-plane-onoff:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_psr@psr-sprite-plane-onoff.html> (Intel XE#2234 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> / Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +5 other tests skip
>  *
>
>     igt@kms_psr@psr2-primary-render:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_psr@psr2-primary-render.html> (Intel XE#2234 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234>)
>  *
>
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html> (Intel XE#2414 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html> (Intel XE#2939 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939>)
>  *
>
>     igt@kms_rotation_crc@bad-pixel-format:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-2/igt@kms_rotation_crc@bad-pixel-format.html> (Intel XE#3414 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (Intel XE#2330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (Intel XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html> (Intel XE#3414 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>)
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-270:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-270.html> (Intel XE#3414 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>) +2 other tests skip
>  *
>
>     igt@kms_setmode@invalid-clone-exclusive-crtc:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html> (Intel XE#1435 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>  *
>
>     igt@kms_tv_load_detect@load-detect:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html> (Intel XE#330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
>  *
>
>     igt@kms_vblank@query-forked-busy-hang@pipe-a-hdmi-a-1:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-2/igt@kms_vblank@query-forked-busy-hang@pipe-a-hdmi-a-1.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-2/igt@kms_vblank@query-forked-busy-hang@pipe-a-hdmi-a-1.html> (Intel XE#3086 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086>) +7 other tests dmesg-warn
>  *
>
>     igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-5/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +8 other tests dmesg-warn
>  *
>
>     igt@kms_writeback@writeback-pixel-formats:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>  *
>
>     igt@xe_copy_basic@mem-copy-linear-0x3fff:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x3fff.html> (Intel XE#1123 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>  *
>
>     igt@xe_copy_basic@mem-copy-linear-0xfd:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0xfd.html> (Intel XE#1123 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0xfffe:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html> (Intel XE#1126 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>) +2 other tests skip
>  *
>
>     igt@xe_eudebug_online@single-step-one:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@xe_eudebug_online@single-step-one.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +1 other test skip
>  *
>
>     igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +8 other tests skip
>  *
>
>     igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-6/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +2 other tests skip
>  *
>
>     igt@xe_evict@evict-beng-small-multi-vm:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-3/igt@xe_evict@evict-beng-small-multi-vm.html> (Intel XE#261 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> / Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +5 other tests skip
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-small:
>
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>  *
>
>     igt@xe_evict@evict-small-cm:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@xe_evict@evict-small-cm.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@xe_evict@evict-small-cm.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +2 other tests dmesg-warn
>  *
>
>     igt@xe_exec_balancer@many-parallel-rebind:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-4/igt@xe_exec_balancer@many-parallel-rebind.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-4/igt@xe_exec_balancer@many-parallel-rebind.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) +2 other tests timeout
>  *
>
>     igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr.html> (Intel XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html> (Intel XE#2322 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +5 other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
>
>       o shard-adlp: NOTRUN -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>  *
>
>     igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-6/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html> (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1 other test skip
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +11 other tests skip
>  *
>
>     igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +32 other tests skip
>  *
>
>     igt@xe_exec_threads@threads-shared-vm-userptr-invalidate:
>
>       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>  *
>
>     igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html> (Intel XE#3467 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467>) +3 other tests dmesg-warn
>  *
>
>     igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html> (Intel XE#3343 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343>)
>  *
>
>     igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html> (Intel XE#3343 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +1 other test dmesg-warn
>  *
>
>     igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html> (Intel XE#3467 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>  *
>
>     igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html> (Intel XE#3467 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467>) +1 other test dmesg-warn
>  *
>
>     igt@xe_live_ktest@xe_dma_buf:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@xe_live_ktest@xe_dma_buf.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@xe_live_ktest@xe_dma_buf.html> (Intel XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192>)
>  *
>
>     igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html> (Intel XE#1999 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999>) +2 other tests fail
>  *
>
>     igt@xe_module_load@reload:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-466/igt@xe_module_load@reload.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@xe_module_load@reload.html> (Intel XE#3467 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467>) +1 other test dmesg-warn
>  *
>
>     igt@xe_oa@invalid-map-oa-buffer:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-2/igt@xe_oa@invalid-map-oa-buffer.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541> / Intel XE#3573 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +2 other tests skip
>  *
>
>     igt@xe_oa@whitelisted-registers-userspace-config:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@xe_oa@whitelisted-registers-userspace-config.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541> / Intel XE#3573 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +6 other tests skip
>  *
>
>     igt@xe_pm@d3cold-mmap-vram:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +1 other test skip
>  *
>
>     igt@xe_pm@s2idle-vm-bind-unbind-all:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-5/igt@xe_pm@s2idle-vm-bind-unbind-all.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@xe_pm@s2idle-vm-bind-unbind-all.html> (Intel XE#1616 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-unbind-all.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-unbind-all.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>  *
>
>     igt@xe_pm@s3-mocs:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-5/igt@xe_pm@s3-mocs.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@xe_pm@s3-mocs.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>  *
>
>     igt@xe_pm@s3-vm-bind-prefetch:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@xe_pm@s3-vm-bind-prefetch.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@xe_pm@s3-vm-bind-prefetch.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468> / Intel XE#569 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>) +1 other test dmesg-warn
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-436/igt@xe_pm@s3-vm-bind-prefetch.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468> / Intel XE#569 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>) +1 other test dmesg-warn
>  *
>
>     igt@xe_pm@s4-mocs:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-4/igt@xe_pm@s4-mocs.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-9/igt@xe_pm@s4-mocs.html> (Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_pm@s4-vm-bind-prefetch:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-lnl-7/igt@xe_pm@s4-vm-bind-prefetch.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html> (Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_pm@s4-vm-bind-userptr:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-lnl-5/igt@xe_pm@s4-vm-bind-userptr.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html> (Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_pm_residency@toggle-gt-c6:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html> (Intel XE#958 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/958>)
>  *
>
>     igt@xe_query@multigpu-query-invalid-extension:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@xe_query@multigpu-query-invalid-extension.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1 other test skip
>  *
>
>     igt@xe_query@multigpu-query-invalid-query:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-1/igt@xe_query@multigpu-query-invalid-query.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1 other test skip
>  *
>
>     igt@xe_query@multigpu-query-mem-usage:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@xe_query@multigpu-query-mem-usage.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_sriov_flr@flr-vf1-clear:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@xe_sriov_flr@flr-vf1-clear.html> (Intel XE#3342 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342>)
>  *
>
>     igt@xe_vm@mixed-userptr-binds-1611661312:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-435/igt@xe_vm@mixed-userptr-binds-1611661312.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@xe_vm@mixed-userptr-binds-1611661312.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) +7 other tests dmesg-warn
>  *
>
>     igt@xe_wedged@wedged-at-any-timeout:
>
>       o shard-dg2-set2: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html> (Intel XE#3421 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_addfb_basic@unused-modifier:
>
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-3/igt@kms_addfb_basic@unused-modifier.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_addfb_basic@unused-modifier.html> +3 other tests pass
>  *
>
>     igt@kms_async_flips@async-flip-suspend-resume:
>
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#3086 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume.html>
>  *
>
>     igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:
>
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html> (Intel XE#3086 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html> +3 other tests pass
>  *
>
>     igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1:
>
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1.html> +1 other test pass
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events:
>
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html> +3 other tests pass
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html> (Intel XE#911 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/911>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html> +3 other tests pass
>  *
>
>     igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-433/igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-6.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-6.html> +7 other tests pass
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-0:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html> +5 other tests pass
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html> (Intel XE#3600 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3600>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231> / Intel XE#3052 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>  *
>
>     igt@kms_cursor_crc@cursor-suspend:
>
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-4/igt@kms_cursor_crc@cursor-suspend.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_cursor_crc@cursor-suspend.html> +2 other tests pass
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend.html> +1 other test pass
>  *
>
>     igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-dp-2:
>
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-dp-2.html> (Intel XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-dp-2.html> +1 other test pass
>  *
>
>     igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html> (Intel XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html> +2 other tests pass
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html>
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html> +6 other tests pass
>  *
>
>     igt@kms_cursor_legacy@torture-bo:
>
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-436/igt@kms_cursor_legacy@torture-bo.html> (Intel XE#2932 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@kms_cursor_legacy@torture-bo.html> +1 other test pass
>  *
>
>     igt@kms_dp_linktrain_fallback@dp-fallback:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html> (Intel XE#3070 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html> (Intel XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html> +4 other tests pass
>  *
>
>     igt@kms_flip@blocking-wf_vblank:
>
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@kms_flip@blocking-wf_vblank.html> (Intel XE#2635 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@kms_flip@blocking-wf_vblank.html>
>  *
>
>     igt@kms_flip@blocking-wf_vblank@b-hdmi-a3:
>
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@kms_flip@blocking-wf_vblank@b-hdmi-a3.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@kms_flip@blocking-wf_vblank@b-hdmi-a3.html> +1 other test pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
>
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html> +73 other tests pass
>  *
>
>     igt@kms_flip@wf_vblank-ts-check-interruptible:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-434/igt@kms_flip@wf_vblank-ts-check-interruptible.html> (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_flip@wf_vblank-ts-check-interruptible.html>
>  *
>
>     igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html> +1 other test pass
>  *
>
>     igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a6:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-434/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a6.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a6.html>
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
>
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html> +16 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html> (Intel XE#1861 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html> +1 other test pass
>  *
>
>     igt@kms_lease@possible-crtcs-filtering:
>
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@kms_lease@possible-crtcs-filtering.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_lease@possible-crtcs-filtering.html> +6 other tests pass
>  *
>
>     igt@kms_plane@pixel-format-source-clamping:
>
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-5/igt@kms_plane@pixel-format-source-clamping.html> (Intel XE#1035 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035> / Intel XE#2566 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_plane@pixel-format-source-clamping.html>
>  *
>
>     igt@kms_plane@plane-panning-bottom-right-suspend:
>
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-3/igt@kms_plane@plane-panning-bottom-right-suspend.html> (Intel XE#1035 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_plane@plane-panning-bottom-right-suspend.html> +1 other test pass
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend.html> (Intel XE#1035 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@kms_plane@plane-panning-bottom-right-suspend.html> +1 other test pass
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html> (Intel XE#361 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/361>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html>
>  *
>
>     igt@kms_setmode@clone-exclusive-crtc:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html> (Intel XE#1435 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html>
>  *
>
>     igt@kms_vrr@max-min:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-lnl-5/igt@kms_vrr@max-min.html> (Intel XE#1522 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-lnl-1/igt@kms_vrr@max-min.html> +1 other test pass
>  *
>
>     igt@xe_ccs@suspend-resume:
>
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-434/igt@xe_ccs@suspend-resume.html> (Intel XE#1616 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@xe_ccs@suspend-resume.html>
>  *
>
>     igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:
>
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-434/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html> +4 other tests pass
>  *
>
>     igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-vram01:
>
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-434/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-vram01.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-vram01.html> +1 other test pass
>  *
>
>     igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01:
>
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html> +6 other tests pass
>       o shard-dg2-set2: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-434/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html> +2 other tests pass
>  *
>
>     igt@xe_evict@evict-beng-cm-threads-small:
>
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@xe_evict@evict-beng-cm-threads-small.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@xe_evict@evict-beng-cm-threads-small.html>
>  *
>
>     igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
>
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html> (Intel XE#3343 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html>
>  *
>
>     igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
>
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html> (Intel XE#3086 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086> / Intel XE#3343 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html>
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html> (Intel XE#3343 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html>
>  *
>
>     igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:
>
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html> (Intel XE#3467 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html>
>  *
>
>     igt@xe_module_load@reload-no-display:
>
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-4/igt@xe_module_load@reload-no-display.html> (Intel XE#3467 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@xe_module_load@reload-no-display.html>
>  *
>
>     igt@xe_pm@s2idle-multiple-execs:
>
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-4/igt@xe_pm@s2idle-multiple-execs.html> (Intel XE#1616 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@xe_pm@s2idle-multiple-execs.html>
>  *
>
>     igt@xe_pm@s4-basic:
>
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-9/igt@xe_pm@s4-basic.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-2/igt@xe_pm@s4-basic.html>
>  *
>
>     igt@xe_pm@s4-basic-exec:
>
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-9/igt@xe_pm@s4-basic-exec.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-8/igt@xe_pm@s4-basic-exec.html> +1 other test pass
>  *
>
>     igt@xe_pm@s4-vm-bind-unbind-all:
>
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@xe_pm@s4-vm-bind-unbind-all.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#2280 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@xe_pm@s4-vm-bind-unbind-all.html>
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-463/igt@xe_pm@s4-vm-bind-unbind-all.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#2280 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@xe_pm@s4-vm-bind-unbind-all.html> +1 other test pass
>  *
>
>     igt@xe_pm_residency@gt-c6-freeze:
>
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-463/igt@xe_pm_residency@gt-c6-freeze.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3088 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@xe_pm_residency@gt-c6-freeze.html> +1 other test pass
>
>
>         Warnings
>
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>  *
>
>     igt@kms_content_protection@srm@pipe-a-dp-4:
>
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-436/igt@kms_content_protection@srm@pipe-a-dp-4.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@kms_content_protection@srm@pipe-a-dp-4.html> (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html> (Intel XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>  *
>
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html> (Intel XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank:
>
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html> (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html> (Intel XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html> (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:
>
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html> (Intel XE#3321 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
>
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +1 other test incomplete
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
>
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html> (Intel XE#2333 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +12 other tests dmesg-fail
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
>
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html> (Intel XE#2333 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333>) +7 other tests fail
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +1 other test dmesg-fail
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
>
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html> (Intel XE#2333 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#2050 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html> (Intel XE#2333 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333>) +6 other tests fail
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
>
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html> (Intel XE#2333 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +4 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +14 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +9 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +11 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +8 other tests skip
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_pm_dc@dc6-dpms.html> (Intel XE#1430 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>  *
>
>     igt@kms_pm_rpm@cursor-dpms:
>
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-466/igt@kms_pm_rpm@cursor-dpms.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@kms_pm_rpm@cursor-dpms.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>  *
>
>     igt@kms_pm_rpm@dpms-non-lpsp:
>
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-433/igt@kms_pm_rpm@dpms-non-lpsp.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@kms_pm_rpm@dpms-non-lpsp.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>  *
>
>     igt@kms_pm_rpm@modeset-stress-extra-wait:
>
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-463/igt@kms_pm_rpm@modeset-stress-extra-wait.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_pm_rpm@modeset-stress-extra-wait.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#2864 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (Intel XE#1500 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (Intel XE#362 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
>
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>  *
>
>     igt@xe_evict@evict-beng-mixed-threads-large:
>
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@xe_evict@evict-beng-mixed-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@xe_evict@evict-beng-mixed-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +1 other test incomplete
>  *
>
>     igt@xe_evict@evict-beng-threads-large:
>
>       o shard-bmg: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@xe_evict@evict-beng-threads-large.html> (Intel XE#1000 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000>)
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-large:
>
>       o shard-bmg: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-small:
>
>       o shard-bmg: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#2472 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>  *
>
>     igt@xe_evict@evict-mixed-threads-large:
>
>       o shard-bmg: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-8/igt@xe_evict@evict-mixed-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#2472 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@xe_evict@evict-mixed-threads-large.html> (Intel XE#1000 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000>)
>  *
>
>     igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
>
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html> (Intel XE#3467 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html> (Intel XE#3467 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +1 other test dmesg-warn
>  *
>
>     igt@xe_fault_injection@vm-create-fail-xe_pt_create:
>
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html> (Intel XE#3467 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467> / Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html> (Intel XE#3467 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467>)
>  *
>
>     igt@xe_live_ktest@xe_bo:
>
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-435/igt@xe_live_ktest@xe_bo.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@xe_live_ktest@xe_bo.html> (Intel XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192>)
>  *
>
>     igt@xe_wedged@wedged-at-any-timeout:
>
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html> (Intel XE#3421 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421> / Intel XE#3467 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467>) -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html> (Intel XE#3765 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3765>)
>
>
>     Build changes
>
>   * IGT: IGT_8154 -> IGT_8155
>   * Linux: xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5 -> xe-pw-142559v1
>
> IGT_8154: 8603734a61b57f766ee60f24e63d18f88232a3c6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8155: f33cf6456706ad5d454a87a773104b4fca7d81e3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5: 8f7b64e137723da601f3c07d0cda22566cf994d5
> xe-pw-142559v1: 142559v1
>
--------------mE004pZ4Zwl1d0nmpWdi0UQU
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
    <div class="moz-cite-prefix">On 12/14/2024 3:46 AM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:173414437084.2359426.6812495677266822096@b555e5b46a47">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>series starting with [v4,1/2] drm/xe: Use
              non-interruptible wait when moving BO to system</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/142559/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/142559/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5_full -&gt;
        xe-pw-142559v1_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-142559v1_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-142559v1_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-142559v1_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-4.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-4.html"
                moz-do-not-send="true">INCOMPLETE</a> +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@ctm-0-25@pipe-b-edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-lnl-6/igt@kms_color@ctm-0-25@pipe-b-edp-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-lnl-5/igt@kms_color@ctm-0-25@pipe-b-edp-1.html"
                moz-do-not-send="true">INCOMPLETE</a> +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html"
                moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-rmfb-interruptible@a-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@kms_flip@flip-vs-rmfb-interruptible@a-hdmi-a3.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@kms_flip@flip-vs-rmfb-interruptible@a-hdmi-a3.html"
                moz-do-not-send="true">INCOMPLETE</a> +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-lnl-5/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html"
                moz-do-not-send="true">FAIL</a> +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@cat-error:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-8/igt@xe_exec_reset@cat-error.html"
                moz-do-not-send="true">DMESG-WARN</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    Waiting extra shouldn't cause any issue<br>
    <blockquote type="cite"
      cite="mid:173414437084.2359426.6812495677266822096@b555e5b46a47">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
        <li>
          <p>igt@xe_wedged@basic-wedged:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-435/igt@xe_wedged@basic-wedged.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@xe_wedged@basic-wedged.html"
                moz-do-not-send="true">DMESG-WARN</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>unrelated</p>
    <p><br>
    </p>
    <p>Merged to drm-xe-next</p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Nirmoy<br>
    </p>
    <blockquote type="cite"
      cite="mid:173414437084.2359426.6812495677266822096@b555e5b46a47">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467"
                moz-do-not-send="true">Intel XE#3467</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html"
                moz-do-not-send="true">DMESG-WARN</a></li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between
        xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5_full and
        xe-pw-142559v1_full:</p>
      <h3>New IGT tests (7)</h3>
      <ul>
        <li>
          <p>igt@kms_content_protection@srm:</p>
          <ul>
            <li>Statuses : 1 fail(s) 1 incomplete(s) 2 skip(s)</li>
            <li>Exec time: [0.0, 112.77] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@type1:</p>
          <ul>
            <li>Statuses : 4 skip(s)</li>
            <li>Exec time: [0.29, 2.56] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent:</p>
          <ul>
            <li>Statuses : 2 fail(s) 2 skip(s)</li>
            <li>Exec time: [0.27, 35.11] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
          <ul>
            <li>Statuses : 4 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-nv12:</p>
          <ul>
            <li>Statuses : 3 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-p010:</p>
          <ul>
            <li>Statuses : 4 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
          <ul>
            <li>Statuses : 4 skip(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-142559v1_full that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@core_hotunplug@hotreplug-lateclose:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-434/igt@core_hotunplug@hotreplug-lateclose.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@core_hotunplug@hotreplug-lateclose.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) +3 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@intel_hwmon@hwmon-write:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-6/igt@intel_hwmon@hwmon-write.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125"
                moz-do-not-send="true">Intel XE#1125</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-suspend-resume:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_async_flips@async-flip-suspend-resume.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_async_flips@async-flip-suspend-resume.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3783"
                moz-do-not-send="true">Intel XE#3783</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385"
                moz-do-not-send="true">Intel XE#2385</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@modeset-transition:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_atomic_transition@modeset-transition.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@kms_atomic_transition@modeset-transition.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@modeset-transition@2x-outputs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@kms_atomic_transition@modeset-transition@2x-outputs.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426"
                moz-do-not-send="true">Intel XE#1426</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-6/igt@kms_big_fb@linear-16bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-8/igt@kms_big_fb@linear-8bpp-rotate-180.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-180.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) +24 other
              tests dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-433/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402"
                moz-do-not-send="true">Intel XE#402</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3818"
                moz-do-not-send="true">Intel XE#3818</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402"
                moz-do-not-send="true">Intel XE#402</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"
                moz-do-not-send="true">Intel XE#1874</a>) +4 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610"
                moz-do-not-send="true">Intel XE#610</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314"
                moz-do-not-send="true">Intel XE#2314</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894"
                moz-do-not-send="true">Intel XE#2894</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-3/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +115 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +33 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652"
                moz-do-not-send="true">Intel XE#2652</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907"
                moz-do-not-send="true">Intel XE#2907</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887"
                moz-do-not-send="true">Intel XE#2887</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692"
                moz-do-not-send="true">Intel XE#2692</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"
                moz-do-not-send="true">Intel XE#3113</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907"
                moz-do-not-send="true">Intel XE#2907</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_cdclk@mode-transition.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724"
                moz-do-not-send="true">Intel XE#2724</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition-all-outputs:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-4/igt@kms_cdclk@mode-transition-all-outputs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314"
                moz-do-not-send="true">Intel XE#314</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314"
                moz-do-not-send="true">Intel XE#314</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152"
                moz-do-not-send="true">Intel XE#1152</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-3/igt@kms_chamelium_audio@hdmi-audio-edid.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@gamma:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@kms_chamelium_color@gamma.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>) +2 other tests
              skip</li>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_chamelium_color@gamma.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325"
                moz-do-not-send="true">Intel XE#2325</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252"
                moz-do-not-send="true">Intel XE#2252</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@deep-color:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-3/igt@kms_color@deep-color.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_color@deep-color.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@deep-color@pipe-a-dp-2-ctm:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-3/igt@kms_color@deep-color@pipe-a-dp-2-ctm.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_color@deep-color@pipe-a-dp-2-ctm.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304"
                moz-do-not-send="true">Intel XE#3304</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm (NEW):</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_content_protection@srm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341"
                moz-do-not-send="true">Intel XE#2341</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@kms_content_protection@srm.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715"
                moz-do-not-send="true">Intel XE#2715</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>)</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-436/igt@kms_content_protection@srm.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715"
                moz-do-not-send="true">Intel XE#2715</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@kms_content_protection@srm.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178"
                moz-do-not-send="true">Intel XE#1178</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@kms_content_protection@srm@pipe-a-dp-2.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715"
                moz-do-not-send="true">Intel XE#2715</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"
                moz-do-not-send="true">Intel XE#308</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321"
                moz-do-not-send="true">Intel XE#2321</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-dp-2.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-dp-2.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705"
                moz-do-not-send="true">Intel XE#2705</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) +1 other test
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-64x21.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320"
                moz-do-not-send="true">Intel XE#2320</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x170:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-9/igt@kms_cursor_crc@cursor-random-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"
                moz-do-not-send="true">Intel XE#308</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@64x64-left-edge@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_cursor_edge_walk@64x64-left-edge@pipe-a-dp-2.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) +7 other tests
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323"
                moz-do-not-send="true">Intel XE#323</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309"
                moz-do-not-send="true">Intel XE#309</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291"
                moz-do-not-send="true">Intel XE#2291</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323"
                moz-do-not-send="true">Intel XE#323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_display_modes@extended-mode-basic:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425"
                moz-do-not-send="true">Intel XE#2425</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340"
                moz-do-not-send="true">Intel XE#1340</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-basic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_dsc@dsc-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244"
                moz-do-not-send="true">Intel XE#2244</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@chamelium:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@kms_feature_discovery@chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701"
                moz-do-not-send="true">Intel XE#701</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-2x:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-5/igt@kms_feature_discovery@display-2x.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_feature_discovery@display-2x.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373"
                moz-do-not-send="true">Intel XE#2373</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-3x:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_feature_discovery@display-3x.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703"
                moz-do-not-send="true">Intel XE#703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) +30 other
              tests dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-434/igt@kms_flip@2x-flip-vs-dpms.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-dpms.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955"
                moz-do-not-send="true">Intel XE#2955</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321"
                moz-do-not-send="true">Intel XE#3321</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321"
                moz-do-not-send="true">Intel XE#3321</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) +12 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310"
                moz-do-not-send="true">Intel XE#310</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) +134 other
              tests dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-nonexisting-fb:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"
                moz-do-not-send="true">Intel XE#2316</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321"
                moz-do-not-send="true">Intel XE#3321</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate-interruptible.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882"
                moz-do-not-send="true">Intel XE#2882</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882"
                moz-do-not-send="true">Intel XE#2882</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-edp1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"
                moz-do-not-send="true">Intel XE#886</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +21 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293"
                moz-do-not-send="true">Intel XE#2293</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380"
                moz-do-not-send="true">Intel XE#2380</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293"
                moz-do-not-send="true">Intel XE#2293</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) +3 other tests
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-8/igt@kms_flip_tiling@flip-change-tiling.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_flip_tiling@flip-change-tiling.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-8/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705"
                moz-do-not-send="true">Intel XE#2705</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +32 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311"
                moz-do-not-send="true">Intel XE#2311</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861"
                moz-do-not-send="true">Intel XE#1861</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861"
                moz-do-not-send="true">Intel XE#1861</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333"
                moz-do-not-send="true">Intel XE#2333</a>) +4 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"
                moz-do-not-send="true">Intel XE#2312</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +7 other tests
              skip</li>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313"
                moz-do-not-send="true">Intel XE#2313</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +27 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"
                moz-do-not-send="true">Intel XE#656</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-swap:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-435/igt@kms_hdr@static-swap.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_hdr@static-swap.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-big-joiner:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-3/igt@kms_joiner@basic-force-big-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012"
                moz-do-not-send="true">Intel XE#3012</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-ultra-joiner:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@kms_joiner@basic-force-ultra-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925"
                moz-do-not-send="true">Intel XE#2925</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@kms_joiner@invalid-modeset-big-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346"
                moz-do-not-send="true">Intel XE#346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356"
                moz-do-not-send="true">Intel XE#356</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-8/igt@kms_plane@pixel-format.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_plane@pixel-format.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035"
                moz-do-not-send="true">Intel XE#1035</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-3:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-3.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-3.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3452"
                moz-do-not-send="true">Intel XE#3452</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-y:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493"
                moz-do-not-send="true">Intel XE#2493</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571"
                moz-do-not-send="true">Intel XE#2571</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361"
                moz-do-not-send="true">Intel XE#361</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566"
                moz-do-not-send="true">Intel XE#2566</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>) +9 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763"
                moz-do-not-send="true">Intel XE#2763</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763"
                moz-do-not-send="true">Intel XE#2763</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763"
                moz-do-not-send="true">Intel XE#2763</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763"
                moz-do-not-send="true">Intel XE#2763</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763"
                moz-do-not-send="true">Intel XE#2763</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@basic-brightness:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_pm_backlight@basic-brightness.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870"
                moz-do-not-send="true">Intel XE#870</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-psr:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718"
                moz-do-not-send="true">Intel XE#718</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908"
                moz-do-not-send="true">Intel XE#908</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"
                moz-do-not-send="true">Intel XE#1129</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-lpsp:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_pm_rpm@dpms-lpsp.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439"
                moz-do-not-send="true">Intel XE#1439</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141"
                moz-do-not-send="true">Intel XE#3141</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836"
                moz-do-not-send="true">Intel XE#836</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@legacy-planes:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@kms_pm_rpm@legacy-planes.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) +5 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@legacy-planes@plane-50:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@kms_pm_rpm@legacy-planes@plane-50.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-2/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@frontbuffer-xrgb8888 (NEW):</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387"
                moz-do-not-send="true">Intel XE#2387</a>)</li>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122"
                moz-do-not-send="true">Intel XE#1122</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122"
                moz-do-not-send="true">Intel XE#1122</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-basic:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-1/igt@kms_psr@fbc-psr2-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) +18 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-sprite-plane-onoff:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_psr@psr-sprite-plane-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234"
                moz-do-not-send="true">Intel XE#2234</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-primary-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_psr@psr2-primary-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234"
                moz-do-not-send="true">Intel XE#2234</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414"
                moz-do-not-send="true">Intel XE#2414</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939"
                moz-do-not-send="true">Intel XE#2939</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@bad-pixel-format:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-2/igt@kms_rotation_crc@bad-pixel-format.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414"
                moz-do-not-send="true">Intel XE#3414</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330"
                moz-do-not-send="true">Intel XE#2330</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127"
                moz-do-not-send="true">Intel XE#1127</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414"
                moz-do-not-send="true">Intel XE#3414</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-270:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414"
                moz-do-not-send="true">Intel XE#3414</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435"
                moz-do-not-send="true">Intel XE#1435</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tv_load_detect@load-detect:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330"
                moz-do-not-send="true">Intel XE#330</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@query-forked-busy-hang@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-2/igt@kms_vblank@query-forked-busy-hang@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-2/igt@kms_vblank@query-forked-busy-hang@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086"
                moz-do-not-send="true">Intel XE#3086</a>) +7 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-5/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) +8 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-pixel-formats:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756"
                moz-do-not-send="true">Intel XE#756</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x3fff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123"
                moz-do-not-send="true">Intel XE#1123</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0xfd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123"
                moz-do-not-send="true">Intel XE#1123</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126"
                moz-do-not-send="true">Intel XE#1126</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@single-step-one:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@xe_eudebug_online@single-step-one.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905"
                moz-do-not-send="true">Intel XE#2905</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905"
                moz-do-not-send="true">Intel XE#2905</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-6/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905"
                moz-do-not-send="true">Intel XE#2905</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-small-multi-vm:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-3/igt@xe_evict@evict-beng-small-multi-vm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261"
                moz-do-not-send="true">Intel XE#261</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688"
                moz-do-not-send="true">Intel XE#688</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-small:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-small-cm:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@xe_evict@evict-small-cm.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@xe_evict@evict-small-cm.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@many-parallel-rebind:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-4/igt@xe_exec_balancer@many-parallel-rebind.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-4/igt@xe_exec_balancer@many-parallel-rebind.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>) +2 other tests
              timeout</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705"
                moz-do-not-send="true">Intel XE#2705</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322"
                moz-do-not-send="true">Intel XE#2322</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-6/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392"
                moz-do-not-send="true">Intel XE#1392</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +32 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-shared-vm-userptr-invalidate:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467"
                moz-do-not-send="true">Intel XE#3467</a>) +3 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343"
                moz-do-not-send="true">Intel XE#3343</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343"
                moz-do-not-send="true">Intel XE#3343</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467"
                moz-do-not-send="true">Intel XE#3467</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467"
                moz-do-not-send="true">Intel XE#3467</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_dma_buf:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@xe_live_ktest@xe_dma_buf.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@xe_live_ktest@xe_dma_buf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192"
                moz-do-not-send="true">Intel XE#1192</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999"
                moz-do-not-send="true">Intel XE#1999</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@reload:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-466/igt@xe_module_load@reload.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@xe_module_load@reload.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467"
                moz-do-not-send="true">Intel XE#3467</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@invalid-map-oa-buffer:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-2/igt@xe_oa@invalid-map-oa-buffer.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573"
                moz-do-not-send="true">Intel XE#3573</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@xe_oa@whitelisted-registers-userspace-config.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573"
                moz-do-not-send="true">Intel XE#3573</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mmap-vram:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"
                moz-do-not-send="true">Intel XE#2284</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366"
                moz-do-not-send="true">Intel XE#366</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-5/igt@xe_pm@s2idle-vm-bind-unbind-all.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@xe_pm@s2idle-vm-bind-unbind-all.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616"
                moz-do-not-send="true">Intel XE#1616</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>)</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-unbind-all.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-unbind-all.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-mocs:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-5/igt@xe_pm@s3-mocs.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@xe_pm@s3-mocs.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-vm-bind-prefetch:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@xe_pm@s3-vm-bind-prefetch.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@xe_pm@s3-vm-bind-prefetch.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569"
                moz-do-not-send="true">Intel XE#569</a>) +1 other test
              dmesg-warn</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-436/igt@xe_pm@s3-vm-bind-prefetch.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569"
                moz-do-not-send="true">Intel XE#569</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-mocs:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-4/igt@xe_pm@s4-mocs.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-9/igt@xe_pm@s4-mocs.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-prefetch:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-lnl-7/igt@xe_pm@s4-vm-bind-prefetch.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607"
                moz-do-not-send="true">Intel XE#1607</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-userptr:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-lnl-5/igt@xe_pm@s4-vm-bind-userptr.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@toggle-gt-c6:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958"
                moz-do-not-send="true">Intel XE#958</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-extension:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@xe_query@multigpu-query-invalid-extension.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-query:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-1/igt@xe_query@multigpu-query-invalid-query.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-mem-usage:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@xe_query@multigpu-query-mem-usage.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-vf1-clear:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@xe_sriov_flr@flr-vf1-clear.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342"
                moz-do-not-send="true">Intel XE#3342</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_vm@mixed-userptr-binds-1611661312:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-435/igt@xe_vm@mixed-userptr-binds-1611661312.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@xe_vm@mixed-userptr-binds-1611661312.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>) +7 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_wedged@wedged-at-any-timeout:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421"
                moz-do-not-send="true">Intel XE#3421</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_addfb_basic@unused-modifier:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-3/igt@kms_addfb_basic@unused-modifier.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_addfb_basic@unused-modifier.html"
                moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-suspend-resume:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086"
                moz-do-not-send="true">Intel XE#3086</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086"
                moz-do-not-send="true">Intel XE#3086</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html"
                moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911"
                moz-do-not-send="true">Intel XE#911</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html"
                moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-433/igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">PASS</a> +7 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"
                moz-do-not-send="true">Intel XE#1874</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html"
                moz-do-not-send="true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3600"
                moz-do-not-send="true">Intel XE#3600</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052"
                moz-do-not-send="true">Intel XE#3052</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-suspend:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-4/igt@kms_cursor_crc@cursor-suspend.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_cursor_crc@cursor-suspend.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-dp-2.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705"
                moz-do-not-send="true">Intel XE#2705</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-dp-2.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291"
                moz-do-not-send="true">Intel XE#2291</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html"
                moz-do-not-send="true">DMESG-WARN</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html"
                moz-do-not-send="true">PASS</a> +6 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@torture-bo:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-436/igt@kms_cursor_legacy@torture-bo.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932"
                moz-do-not-send="true">Intel XE#2932</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@kms_cursor_legacy@torture-bo.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070"
                moz-do-not-send="true">Intel XE#3070</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"
                moz-do-not-send="true">Intel XE#2316</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html"
                moz-do-not-send="true">PASS</a> +4 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@blocking-wf_vblank:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@kms_flip@blocking-wf_vblank.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635"
                moz-do-not-send="true">Intel XE#2635</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@kms_flip@blocking-wf_vblank.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@blocking-wf_vblank@b-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@kms_flip@blocking-wf_vblank@b-hdmi-a3.html"
                moz-do-not-send="true">INCOMPLETE</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@kms_flip@blocking-wf_vblank@b-hdmi-a3.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html"
                moz-do-not-send="true">PASS</a> +73 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-434/igt@kms_flip@wf_vblank-ts-check-interruptible.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882"
                moz-do-not-send="true">Intel XE#2882</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_flip@wf_vblank-ts-check-interruptible.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"
                moz-do-not-send="true">Intel XE#886</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-434/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a6.html"
                moz-do-not-send="true">FAIL</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a6.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html"
                moz-do-not-send="true">PASS</a> +16 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861"
                moz-do-not-send="true">Intel XE#1861</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_lease@possible-crtcs-filtering:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@kms_lease@possible-crtcs-filtering.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_lease@possible-crtcs-filtering.html"
                moz-do-not-send="true">PASS</a> +6 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-source-clamping:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-5/igt@kms_plane@pixel-format-source-clamping.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035"
                moz-do-not-send="true">Intel XE#1035</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566"
                moz-do-not-send="true">Intel XE#2566</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_plane@pixel-format-source-clamping.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-3/igt@kms_plane@plane-panning-bottom-right-suspend.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035"
                moz-do-not-send="true">Intel XE#1035</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_plane@plane-panning-bottom-right-suspend.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035"
                moz-do-not-send="true">Intel XE#1035</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@kms_plane@plane-panning-bottom-right-suspend.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361"
                moz-do-not-send="true">Intel XE#361</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@clone-exclusive-crtc:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435"
                moz-do-not-send="true">Intel XE#1435</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@max-min:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-lnl-5/igt@kms_vrr@max-min.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522"
                moz-do-not-send="true">Intel XE#1522</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-lnl-1/igt@kms_vrr@max-min.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_ccs@suspend-resume:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-434/igt@xe_ccs@suspend-resume.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616"
                moz-do-not-send="true">Intel XE#1616</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@xe_ccs@suspend-resume.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-434/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html"
                moz-do-not-send="true">PASS</a> +4 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-vram01:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-434/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-vram01.html"
                moz-do-not-send="true">INCOMPLETE</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-vram01.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html"
                moz-do-not-send="true">PASS</a> +6 other tests pass</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-434/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-cm-threads-small:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@xe_evict@evict-beng-cm-threads-small.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@xe_evict@evict-beng-cm-threads-small.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343"
                moz-do-not-send="true">Intel XE#3343</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086"
                moz-do-not-send="true">Intel XE#3086</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343"
                moz-do-not-send="true">Intel XE#3343</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html"
                moz-do-not-send="true">PASS</a></li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343"
                moz-do-not-send="true">Intel XE#3343</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467"
                moz-do-not-send="true">Intel XE#3467</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@reload-no-display:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-4/igt@xe_module_load@reload-no-display.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467"
                moz-do-not-send="true">Intel XE#3467</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@xe_module_load@reload-no-display.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-multiple-execs:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-4/igt@xe_pm@s2idle-multiple-execs.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616"
                moz-do-not-send="true">Intel XE#1616</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@xe_pm@s2idle-multiple-execs.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-basic:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-9/igt@xe_pm@s4-basic.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607"
                moz-do-not-send="true">Intel XE#1607</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-2/igt@xe_pm@s4-basic.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-basic-exec:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-9/igt@xe_pm@s4-basic-exec.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607"
                moz-do-not-send="true">Intel XE#1607</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-8/igt@xe_pm@s4-basic-exec.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@xe_pm@s4-vm-bind-unbind-all.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280"
                moz-do-not-send="true">Intel XE#2280</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@xe_pm@s4-vm-bind-unbind-all.html"
                moz-do-not-send="true">PASS</a></li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-463/igt@xe_pm@s4-vm-bind-unbind-all.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280"
                moz-do-not-send="true">Intel XE#2280</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@xe_pm@s4-vm-bind-unbind-all.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@gt-c6-freeze:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-463/igt@xe_pm_residency@gt-c6-freeze.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088"
                moz-do-not-send="true">Intel XE#3088</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@xe_pm_residency@gt-c6-freeze.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html"
                moz-do-not-send="true">INCOMPLETE</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-436/igt@kms_content_protection@srm@pipe-a-dp-4.html"
                moz-do-not-send="true">INCOMPLETE</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-434/igt@kms_content_protection@srm@pipe-a-dp-4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178"
                moz-do-not-send="true">Intel XE#1178</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291"
                moz-do-not-send="true">Intel XE#2291</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"
                moz-do-not-send="true">Intel XE#2316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882"
                moz-do-not-send="true">Intel XE#2882</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"
                moz-do-not-send="true">Intel XE#2316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882"
                moz-do-not-send="true">Intel XE#2882</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321"
                moz-do-not-send="true">Intel XE#3321</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333"
                moz-do-not-send="true">Intel XE#2333</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) +12 other
              tests dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333"
                moz-do-not-send="true">Intel XE#2333</a>) +7 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"
                moz-do-not-send="true">Intel XE#2312</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) +1 other test
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333"
                moz-do-not-send="true">Intel XE#2333</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050"
                moz-do-not-send="true">Intel XE#2050</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"
                moz-do-not-send="true">Intel XE#2312</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"
                moz-do-not-send="true">Intel XE#2312</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333"
                moz-do-not-send="true">Intel XE#2333</a>) +6 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333"
                moz-do-not-send="true">Intel XE#2333</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"
                moz-do-not-send="true">Intel XE#2312</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"
                moz-do-not-send="true">Intel XE#2312</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311"
                moz-do-not-send="true">Intel XE#2311</a>) +14 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311"
                moz-do-not-send="true">Intel XE#2311</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"
                moz-do-not-send="true">Intel XE#2312</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"
                moz-do-not-send="true">Intel XE#2312</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313"
                moz-do-not-send="true">Intel XE#2313</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313"
                moz-do-not-send="true">Intel XE#2313</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"
                moz-do-not-send="true">Intel XE#2312</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@kms_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430"
                moz-do-not-send="true">Intel XE#1430</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@cursor-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-466/igt@kms_pm_rpm@cursor-dpms.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@kms_pm_rpm@cursor-dpms.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-433/igt@kms_pm_rpm@dpms-non-lpsp.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-435/igt@kms_pm_rpm@dpms-non-lpsp.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-463/igt@kms_pm_rpm@modeset-stress-extra-wait.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-433/igt@kms_pm_rpm@modeset-stress-extra-wait.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864"
                moz-do-not-send="true">Intel XE#2864</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500"
                moz-do-not-send="true">Intel XE#1500</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362"
                moz-do-not-send="true">Intel XE#362</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-6/igt@xe_evict@evict-beng-mixed-threads-large.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@xe_evict@evict-beng-mixed-threads-large.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-threads-large:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@xe_evict@evict-beng-threads-large.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000"
                moz-do-not-send="true">Intel XE#1000</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-large:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-large.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-large.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-small:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472"
                moz-do-not-send="true">Intel XE#2472</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-threads-large:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-8/igt@xe_evict@evict-mixed-threads-large.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472"
                moz-do-not-send="true">Intel XE#2472</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-8/igt@xe_evict@evict-mixed-threads-large.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000"
                moz-do-not-send="true">Intel XE#1000</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467"
                moz-do-not-send="true">Intel XE#3467</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467"
                moz-do-not-send="true">Intel XE#3467</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467"
                moz-do-not-send="true">Intel XE#3467</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"
                moz-do-not-send="true">Intel XE#3468</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467"
                moz-do-not-send="true">Intel XE#3467</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-dg2-435/igt@xe_live_ktest@xe_bo.html"
                moz-do-not-send="true">INCOMPLETE</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-dg2-463/igt@xe_live_ktest@xe_bo.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192"
                moz-do-not-send="true">Intel XE#1192</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_wedged@wedged-at-any-timeout:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/shard-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421"
                moz-do-not-send="true">Intel XE#3421</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467"
                moz-do-not-send="true">Intel XE#3467</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142559v1/shard-bmg-2/igt@xe_wedged@wedged-at-any-timeout.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3765"
                moz-do-not-send="true">Intel XE#3765</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8154 -&gt; IGT_8155</li>
        <li>Linux: xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5
          -&gt; xe-pw-142559v1</li>
      </ul>
      <p>IGT_8154: 8603734a61b57f766ee60f24e63d18f88232a3c6 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_8155: f33cf6456706ad5d454a87a773104b4fca7d81e3 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5:
        8f7b64e137723da601f3c07d0cda22566cf994d5<br>
        xe-pw-142559v1: 142559v1</p>
    </blockquote>
  </body>
</html>

--------------mE004pZ4Zwl1d0nmpWdi0UQU--
