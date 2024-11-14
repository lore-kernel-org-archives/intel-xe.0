Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BB7D65C7B
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 11:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F2F10E24D;
	Thu, 14 Nov 2024 11:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EzCT06tk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E074110E27B
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 11:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731583949; x=1763119949;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=ACMd6qUF6zYxQOxx0YQ7QLpeMZw0Vq4C68AkhLUaoUI=;
 b=EzCT06tkPTw1JOTatTVo8KAbd3lhzbzdC26fhfXPyChUlZ96piMMkFzy
 IyRvo3VBYZRYEU/UdD/UbiG9Ilz0CTMbRhD2VnxkgnSAXQ5N0Icniut/H
 PhDRQvV/YXiMxpEmsHaKXOC4zB/n2xRftWoHC0QRBpyCJY46Yb4da0dWo
 QCO4g/LkQuCdsF2yqQ1rwrdW8pBP/kJZr0YRi/2TilriMiAGkwGqDl0d8
 irDVW0hBJwaqRGLGMyDqshm+z5wnwLRGo4ooQGC1N5fasX9txBwoO4RtU
 5hgGp4t07EIQ6cb3Fx+39jZLu1GX2XQzetd0xW3ZLUVVyyymW93wEz4vv w==;
X-CSE-ConnectionGUID: JEEG+OOeQDGvHTheWQyCYA==
X-CSE-MsgGUID: nVX7//x0SC+Uigcs/8gsMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="35228868"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208,217";a="35228868"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 03:32:29 -0800
X-CSE-ConnectionGUID: iiuPhmIBRrqDlZb9lPF4bg==
X-CSE-MsgGUID: FSMGoJOyQrCXEnEXFZCybA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208,217";a="87731484"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.160.100])
 ([10.245.160.100])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 03:32:25 -0800
Content-Type: multipart/alternative;
 boundary="------------HqKW0luDzpBXARC0BqMU0OrW"
Message-ID: <699bdcb4-0e79-478f-935f-55d093d36775@linux.intel.com>
Date: Thu, 14 Nov 2024 12:32:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Ignore?=
 =?UTF-8?Q?_GGTT_TLB_inval_errors_during_GT_reset_=28rev2=29?=
To: intel-xe@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20241112170123.1236443-1-nirmoy.das@intel.com>
 <173149495384.3538884.10362218334736607043@2413ebb6fbb6>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <173149495384.3538884.10362218334736607043@2413ebb6fbb6>
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
--------------HqKW0luDzpBXARC0BqMU0OrW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/13/2024 11:49 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe: Ignore GGTT TLB inval errors during GT reset (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/141228/
> *State:* 	failure
> *Details:* 	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/index.html
>
>
>   CI Bug Log - changes from xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b_full -> xe-pw-141228v2_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-141228v2_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-141228v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
> Here are the unknown changes that may have been introduced in xe-pw-141228v2_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html> +3 other tests incomplete
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html>
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html> +2 other tests fail
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html> +2 other tests fail
>  *
>
>     igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-6/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-5/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html>
>
Unrelated failures


Merged to drm-xe-next

>  *
>
>
>         Warnings
>
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html> (Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html>
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html> +2 other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
>
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html> +2 other tests fail
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@a-dp4:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html>
>
>
>     Known issues
>
> Here are the changes found in xe-pw-141228v2_full that come from known issues:
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
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-433/igt@core_hotunplug@hotreplug-lateclose.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@core_hotunplug@hotreplug-lateclose.html> (Intel XE#1885 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885>) +1 other test skip
>  *
>
>     igt@fbdev@write:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@fbdev@write.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@fbdev@write.html> (Intel XE#2134 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134>)
>  *
>
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (Intel XE#2233 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (Intel XE#1466 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466>)
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html> (Intel XE#3194 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194>) +3 other tests dmesg-warn
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html> (Intel XE#911 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/911>) +3 other tests fail
>  *
>
>     igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +115 other tests skip
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition.html> (Intel XE#3279 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279>)
>  *
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html> (Intel XE#2327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +2 other tests skip
>  *
>
>     igt@kms_big_fb@linear-16bpp-rotate-90:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-90.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +2 other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-adlp: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231> / Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242>)
>  *
>
>     igt@kms_big_fb@y-tiled-16bpp-rotate-0:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-8/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231> / Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242>) +1 other test fail
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html> (Intel XE#3052 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1 other test skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html> (Intel XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html> (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html> (Intel XE#2887 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +5 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +13 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html> (Intel XE#2652 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +8 other tests skip
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +30 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +3 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +159 other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html> (Intel XE#2907 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1 other test incomplete
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html> (Intel XE#2887 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +6 other tests skip
>  *
>
>     igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-4/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html> (Intel XE#2252 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +3 other tests skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-aspect-ratio:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-9/igt@kms_chamelium_frames@hdmi-aspect-ratio.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2 other tests skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-single:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-3/igt@kms_chamelium_frames@hdmi-crc-single.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>  *
>
>     igt@kms_content_protection@lic-type-0:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_content_protection@lic-type-0.html> (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>  *
>
>     igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html> (Intel XE#3304 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html> (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-32x10:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-4/igt@kms_cursor_crc@cursor-onscreen-32x10.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@kms_cursor_crc@cursor-random-64x21:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-1/igt@kms_cursor_crc@cursor-random-64x21.html> (Intel XE#2320 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-6/igt@kms_cursor_crc@cursor-random-64x21.html> (Intel XE#1424 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x512:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html> (Intel XE#2321 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>) +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html> (Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html> (Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>  *
>
>     igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html> (Intel XE#2141 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141>) +2 other tests fail
>  *
>
>     igt@kms_feature_discovery@dp-mst:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-8/igt@kms_feature_discovery@dp-mst.html> (Intel XE#2375 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html> (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) +4 other tests fail
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +7 other tests fail
>  *
>
>     igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-9/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html> (Intel XE#310 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>)
>  *
>
>     igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-8/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html> (Intel XE#2635 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635>) +1 other test incomplete
>  *
>
>     igt@kms_flip@2x-nonexisting-fb-interruptible:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-4/igt@kms_flip@2x-nonexisting-fb-interruptible.html> (Intel XE#1421 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>)
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +4 other tests fail
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate@c-edp1:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html> (Intel XE#3403 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3403> / Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html> (Intel XE#1401 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> / Intel XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html> (Intel XE#1401 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html> (Intel XE#2293 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293>) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html> (Intel XE#2293 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> / Intel XE#2380 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html> (Intel XE#3194 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194>) +1 other test dmesg-fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +9 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +6 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +9 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +7 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
>
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html> (Intel XE#2333 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333>) +3 other tests fail
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html> (Intel XE#1861 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +29 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +4 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +9 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@plane-fbc-rte:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html> (Intel XE#2350 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +7 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +1 other test skip
>  *
>
>     igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-2/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-3/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) +2 other tests dmesg-warn
>  *
>
>     igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3:
>
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-1/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3.html> (Intel XE#3312 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3312>)
>  *
>
>     igt@kms_joiner@basic-force-ultra-joiner:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-3/igt@kms_joiner@basic-force-ultra-joiner.html> (Intel XE#2925 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925>)
>  *
>
>     igt@kms_lease@invalid-create-leases:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_lease@invalid-create-leases.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +20 other tests skip
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel XE#356 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>)
>  *
>
>     igt@kms_plane@pixel-format-source-clamping:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-1/igt@kms_plane@pixel-format-source-clamping.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-2/igt@kms_plane@pixel-format-source-clamping.html> (Intel XE#2566 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566> / Intel XE#2929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929>)
>  *
>
>     igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-1/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-2/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html> (Intel XE#2929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929>)
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +2 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +4 other tests skip
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html> (Intel XE#1430 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430>)
>  *
>
>     igt@kms_pm_rpm@basic-rte:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_pm_rpm@basic-rte.html> (Intel XE#2446 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446>)
>  *
>
>     igt@kms_pm_rpm@legacy-planes-dpms@plane-59:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-4/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-8/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html> (Intel XE#3184 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184>) +1 other test dmesg-warn
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html> (Intel XE#1439 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> / Intel XE#3141 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141>)
>  *
>
>     igt@kms_pm_rpm@system-suspend-modeset:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_pm_rpm@system-suspend-modeset.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html> (Intel XE#2446 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446>) +5 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-9/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1 other test skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +21 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>  *
>
>     igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>  *
>
>     igt@kms_psr@pr-sprite-plane-onoff:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-8/igt@kms_psr@pr-sprite-plane-onoff.html> (Intel XE#2234 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> / Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +2 other tests skip
>  *
>
>     igt@kms_psr@pr-suspend:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-6/igt@kms_psr@pr-suspend.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +2 other tests skip
>  *
>
>     igt@kms_psr@psr-sprite-plane-move:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@kms_psr@psr-sprite-plane-move.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +2 other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html> (Intel XE#3414 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>)
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-180:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-4/igt@kms_rotation_crc@sprite-rotation-180.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-8/igt@kms_rotation_crc@sprite-rotation-180.html> (Intel XE#2055 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055>)
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>)
>  *
>
>     igt@kms_vblank@accuracy-idle:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-3/igt@kms_vblank@accuracy-idle.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-5/igt@kms_vblank@accuracy-idle.html> (Intel XE#1523 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523>) +1 other test fail
>  *
>
>     igt@kms_vrr@cmrr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@kms_vrr@cmrr.html> (Intel XE#2168 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>)
>  *
>
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html> (Intel XE#2159 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159>) +1 other test fail
>  *
>
>     igt@xe_compute@ccs-mode-basic:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-1/igt@xe_compute@ccs-mode-basic.html> (Intel XE#1447 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447>)
>  *
>
>     igt@xe_copy_basic@mem-copy-linear-0xfd:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html> (Intel XE#1123 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>  *
>
>     igt@xe_eudebug_online@single-step:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@xe_eudebug_online@single-step.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +1 other test skip
>  *
>
>     igt@xe_eudebug_online@single-step-one:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-7/igt@xe_eudebug_online@single-step-one.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +2 other tests skip
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>  *
>
>     igt@xe_evict@evict-small-external:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-1/igt@xe_evict@evict-small-external.html> (Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>  *
>
>     igt@xe_evict@evict-threads-large:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-9/igt@xe_evict@evict-threads-large.html> (Intel XE#261 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> / Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +1 other test skip
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html> (Intel XE#2322 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +4 other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html> (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1 other test skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +35 other tests skip
>  *
>
>     igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-9/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-3/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate.html> (Intel XE#3086 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086>)
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-rebind:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-rebind.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +2 other tests skip
>  *
>
>     igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +8 other tests skip
>  *
>
>     igt@xe_fault_injection@inject-fault-probe@function-xe_guc_ads_init:
>
>       o shard-adlp: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe@function-xe_guc_ads_init.html> (Intel XE#3343 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343>) +6 other tests dmesg-warn
>  *
>
>     igt@xe_live_ktest@xe_bo:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_live_ktest@xe_bo.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@xe_live_ktest@xe_bo.html> (Intel XE#2961 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961> / Intel XE#3191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191>) +1 other test timeout
>  *
>
>     igt@xe_module_load@reload-no-display:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_module_load@reload-no-display.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>  *
>
>     igt@xe_oa@map-oa-buffer:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@xe_oa@map-oa-buffer.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>)
>  *
>
>     igt@xe_oa@mmio-triggered-reports:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-7/igt@xe_oa@mmio-triggered-reports.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-5/igt@xe_oa@mmio-triggered-reports.html> (Intel XE#2249 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249>)
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-3/igt@xe_oa@mmio-triggered-reports.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-7/igt@xe_oa@mmio-triggered-reports.html> (Intel XE#2249 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249>)
>  *
>
>     igt@xe_oa@mmio-triggered-reports@ccs-0:
>
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-5/igt@xe_oa@mmio-triggered-reports@ccs-0.html> (Intel XE#2249 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249>)
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-7/igt@xe_oa@mmio-triggered-reports@ccs-0.html> (Intel XE#2249 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249>)
>  *
>
>     igt@xe_oa@unprivileged-single-ctx-counters:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-9/igt@xe_oa@unprivileged-single-ctx-counters.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +1 other test skip
>  *
>
>     igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html> (Intel XE#1173 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173>)
>  *
>
>     igt@xe_pm@d3hot-basic-exec:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-3/igt@xe_pm@d3hot-basic-exec.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-8/igt@xe_pm@d3hot-basic-exec.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) +2 other tests dmesg-warn
>  *
>
>     igt@xe_pm@d3hot-mmap-vram:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-9/igt@xe_pm@d3hot-mmap-vram.html> (Intel XE#1948 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948>)
>  *
>
>     igt@xe_pm@s3-d3hot-basic-exec:
>
>       o shard-bmg: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-6/igt@xe_pm@s3-d3hot-basic-exec.html> (Intel XE#569 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>)
>  *
>
>     igt@xe_pm@s4-vm-bind-userptr:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html> (Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_pm_residency@toggle-gt-c6:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html> (Intel XE#958 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/958>)
>  *
>
>     igt@xe_spin_batch@spin-fixed-duration-with-preempter:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-3/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html> (Intel XE#1081 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081>)
>  *
>
>     igt@xe_vm@munmap-style-unbind-many-either-side-partial:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-433/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +186 other tests skip
>
>
>         Possible fixes
>
>  *
>
>     igt@core_getstats:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@core_getstats.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@core_getstats.html> +1 other test pass
>  *
>
>     igt@core_hotunplug@hotreplug:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@core_hotunplug@hotreplug.html> (Intel XE#1885 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@core_hotunplug@hotreplug.html> +1 other test pass
>  *
>
>     igt@fbdev@info:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@fbdev@info.html> (Intel XE#2134 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@fbdev@info.html> +1 other test pass
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
>
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3194 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html>
>  *
>
>     igt@kms_async_flips@async-flip-suspend-resume:
>
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-1/igt@kms_async_flips@async-flip-suspend-resume.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html> +2 other tests pass
>  *
>
>     igt@kms_color@ctm-signed:
>
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-3/igt@kms_color@ctm-signed.html> (Intel XE#2929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-3/igt@kms_color@ctm-signed.html>
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> (Intel XE#1475 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-toggle:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html> (Intel XE#1475 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html> (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html> +2 other tests pass
>  *
>
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4.html> (Intel XE#3335 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3335>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4.html> +3 other tests pass
>  *
>
>     igt@kms_flip@blocking-wf_vblank:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_flip@blocking-wf_vblank.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@kms_flip@blocking-wf_vblank.html> +100 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-suspend:
>
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html> +1 other test pass
>  *
>
>     igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html> (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-3/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html> +1 other test pass
>  *
>
>     igt@kms_flip@wf_vblank-ts-check@a-edp1:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@a-edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html> +2 other tests pass
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html> +15 other tests pass
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html> (Intel XE#3194 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html> +3 other tests pass
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html> +8 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html> +27 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:
>
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html> (Intel XE#3086 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html>
>  *
>
>     igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-3/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-9/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html> +1 other test pass
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html> (Intel XE#2446 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp.html> +3 other tests pass
>  *
>
>     igt@kms_pm_rpm@universal-planes:
>
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html> (Intel XE#2042 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html>
>  *
>
>     igt@kms_pm_rpm@universal-planes@plane-59:
>
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-59.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-4/igt@kms_pm_rpm@universal-planes@plane-59.html> +1 other test pass
>  *
>
>     igt@kms_psr@fbc-psr-primary-page-flip@edp-1:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-8/igt@kms_psr@fbc-psr-primary-page-flip@edp-1.html> (Intel XE#2808 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2808>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-1/igt@kms_psr@fbc-psr-primary-page-flip@edp-1.html> +1 other test pass
>  *
>
>     igt@xe_ccs@block-copy-compressed-inc-dimension:
>
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-6/igt@xe_ccs@block-copy-compressed-inc-dimension.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-3/igt@xe_ccs@block-copy-compressed-inc-dimension.html>
>  *
>
>     igt@xe_exec_balancer@once-parallel-rebind:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@xe_exec_balancer@once-parallel-rebind.html> +169 other tests pass
>  *
>
>     igt@xe_exec_threads@threads-hang-fd-basic:
>
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-6/igt@xe_exec_threads@threads-hang-fd-basic.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-1/igt@xe_exec_threads@threads-hang-fd-basic.html>
>  *
>
>     igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
>
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-5/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html>
>  *
>
>     igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html> (Intel XE#2229 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html> +1 other test pass
>  *
>
>     igt@xe_module_load@reload:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_module_load@reload.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@xe_module_load@reload.html>
>  *
>
>     igt@xe_pm@s4-basic:
>
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-9/igt@xe_pm@s4-basic.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-4/igt@xe_pm@s4-basic.html>
>  *
>
>     igt@xe_pm@s4-basic-exec:
>
>       o shard-lnl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-2/igt@xe_pm@s4-basic-exec.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-1/igt@xe_pm@s4-basic-exec.html>
>  *
>
>     igt@xe_sriov_flr@flr-each-isolation:
>
>       o shard-adlp: WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-6/igt@xe_sriov_flr@flr-each-isolation.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-1/igt@xe_sriov_flr@flr-each-isolation.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (Intel XE#623 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/623>)
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip:
>
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3194 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>  *
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-90:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +2 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1 other test skip
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +2 other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#3194 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231> / Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242>)
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#402 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>)
>  *
>
>     igt@kms_big_fb@y-tiled-64bpp-rotate-180:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +3 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +5 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html> (Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242> / Intel XE#3052 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231> / Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242> / Intel XE#3052 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +2 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html> (Intel XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +15 other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +7 other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html> (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) +3 other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html> (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +1 other test skip
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +5 other tests skip
>  *
>
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +4 other tests skip
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +3 other tests skip
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +8 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +2 other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html> (Intel XE#2907 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>) +3 other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html> (Intel XE#616 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html> (Intel XE#2907 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>  *
>
>     igt@kms_ccs@random-ccs-data-y-tiled-ccs:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +10 other tests skip
>  *
>
>     igt@kms_chamelium_audio@dp-audio:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-433/igt@kms_chamelium_audio@dp-audio.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_chamelium_audio@dp-audio.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +11 other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-0-75:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_chamelium_color@ctm-0-75.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@kms_chamelium_color@ctm-0-75.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1 other test skip
>  *
>
>     igt@kms_chamelium_color@ctm-negative:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_chamelium_color@ctm-negative.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_chamelium_color@ctm-negative.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +10 other tests skip
>  *
>
>     igt@kms_content_protection@atomic:
>
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-1/igt@kms_content_protection@atomic.html> (Intel XE#2715 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-1/igt@kms_content_protection@atomic.html> (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1 other test fail
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-1:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-1.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-1.html> (Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>  *
>
>     igt@kms_content_protection@dp-mst-type-0:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html> (Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_content_protection@lic-type-1:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-433/igt@kms_content_protection@lic-type-1.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_content_protection@lic-type-1.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +9 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x170.html> (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html> (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-max-size:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-max-size.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +4 other tests skip
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) +1 other test skip
>  *
>
>     igt@kms_dsc@dsc-with-output-formats-with-bpc:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_dsc@dsc-with-output-formats-with-bpc.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +6 other tests skip
>  *
>
>     igt@kms_fbcon_fbt@psr-suspend:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html> (Intel XE#776 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +1 other test skip
>  *
>
>     igt@kms_feature_discovery@display-4x:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_feature_discovery@display-4x.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_feature_discovery@display-4x.html> (Intel XE#1138 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html> (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>)
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate.html> (Intel XE#3403 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3403> / Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +3 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +21 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +26 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-suspend:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +9 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html> (Intel XE#1861 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html> (Intel XE#658 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +5 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html> (Intel XE#658 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>) +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +7 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +28 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +8 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +31 other tests skip
>  *
>
>     igt@kms_joiner@basic-force-ultra-joiner:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html> (Intel XE#2925 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925>)
>  *
>
>     igt@kms_plane_cursor@overlay:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_plane_cursor@overlay.html> (Intel XE#616 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_plane_cursor@overlay.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +1 other test skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +2 other tests skip
>  *
>
>     igt@kms_pm_backlight@bad-brightness:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_pm_backlight@bad-brightness.html> (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>)
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html> (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>  *
>
>     igt@kms_pm_dc@dc5-retention-flops:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html> (Intel XE#3309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309>)
>  *
>
>     igt@kms_pm_rpm@basic-pci-d3-state:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_pm_rpm@basic-pci-d3-state.html> (Intel XE#2446 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@kms_pm_rpm@basic-pci-d3-state.html> (Intel XE#3129 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3129>)
>  *
>
>     igt@kms_psr2_sf@pr-cursor-plane-update-sf:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +10 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +8 other tests skip
>  *
>
>     igt@kms_psr2_su@page_flip-nv12:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html> (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>  *
>
>     igt@kms_psr2_su@page_flip-p010:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html> (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +1 other test skip
>  *
>
>     igt@kms_psr@fbc-psr-sprite-plane-move:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-plane-move.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-move.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) +3 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr-sprite-plane-onoff:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-onoff.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +5 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-primary-render:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-render.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) +13 other tests skip
>  *
>
>     igt@kms_psr@psr2-dpms:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_psr@psr2-dpms.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@kms_psr@psr2-dpms.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +9 other tests skip
>  *
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html> (Intel XE#2136 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136> / Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html> (Intel XE#2939 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html> (Intel XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html> (Intel XE#3414 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (Intel XE#1500 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500>)
>  *
>
>     igt@kms_tv_load_detect@load-detect:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html> (Intel XE#330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
>  *
>
>     igt@kms_writeback@writeback-check-output:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_writeback@writeback-check-output.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@kms_writeback@writeback-check-output.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>  *
>
>     igt@kms_writeback@writeback-check-output-xrgb2101010:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>  *
>
>     igt@xe_compute_preempt@compute-preempt-many:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html> (Intel XE#1280 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +2 other tests skip
>  *
>
>     igt@xe_copy_basic@mem-copy-linear-0x369:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html> (Intel XE#1123 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0x3fff:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x3fff.html> (Intel XE#1126 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>  *
>
>     igt@xe_eudebug@basic-close:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_eudebug@basic-close.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@xe_eudebug@basic-close.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +13 other tests skip
>  *
>
>     igt@xe_eudebug@multiple-sessions:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-466/igt@xe_eudebug@multiple-sessions.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_eudebug@multiple-sessions.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +10 other tests skip
>  *
>
>     igt@xe_evict@evict-large-multi-vm-cm:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-464/igt@xe_evict@evict-large-multi-vm-cm.html> (Intel XE#1600 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-large:
>
>       o shard-dg2-set2: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +30 other tests skip
>  *
>
>     igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +31 other tests skip
>  *
>
>     igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html> (Intel XE#2360 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html> (Intel XE#2360 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>  *
>
>     igt@xe_huc_copy@huc_copy:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@xe_huc_copy@huc_copy.html> (Intel XE#255 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/255>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_huc_copy@huc_copy.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_mmap@small-bar:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_mmap@small-bar.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@xe_mmap@small-bar.html> (Intel XE#512 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>)
>  *
>
>     igt@xe_oa@closed-fd-and-unmapped-access:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@xe_oa@closed-fd-and-unmapped-access.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +10 other tests skip
>  *
>
>     igt@xe_oa@non-privileged-access-vaddr:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-464/igt@xe_oa@non-privileged-access-vaddr.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_oa@non-privileged-access-vaddr.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +10 other tests skip
>  *
>
>     igt@xe_pat@pat-index-xehpc:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html> (Intel XE#2838 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838> / Intel XE#979 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_peer2peer@read:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_peer2peer@read.html> (Intel XE#1061 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@xe_peer2peer@read.html> (Intel XE#1173 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173>)
>  *
>
>     igt@xe_pm@d3cold-basic-exec:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-464/igt@xe_pm@d3cold-basic-exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_pm@d3cold-mocs:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@xe_pm@d3cold-mocs.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_pm@d3cold-mocs.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_pm@s2idle-d3cold-basic-exec:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +2 other tests skip
>  *
>
>     igt@xe_query@multigpu-query-invalid-cs-cycles:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@xe_query@multigpu-query-invalid-cs-cycles.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +4 other tests skip
>  *
>
>     igt@xe_query@multigpu-query-oa-units:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-466/igt@xe_query@multigpu-query-oa-units.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_query@multigpu-query-oa-units.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +2 other tests skip
>  *
>
>     igt@xe_wedged@wedged-at-any-timeout:
>
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html> (Intel XE#3421 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>  *
>
>     igt@xe_wedged@wedged-mode-toggle:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@xe_wedged@wedged-mode-toggle.html> (Intel XE#3075 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075> / Intel XE#3084 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084>)
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * IGT: IGT_8104 -> IGT_8105
>   * Linux: xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b -> xe-pw-141228v2
>
> IGT_8104: 5da2928391abd9625dd87b4a3fb6c35a54a0d948 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8105: 8105
> xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b: 26f5fe99791def93b32e27e79e71dbd0666c117b
> xe-pw-141228v2: 141228v2
>
--------------HqKW0luDzpBXARC0BqMU0OrW
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
    <div class="moz-cite-prefix">On 11/13/2024 11:49 AM, Patchwork
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:173149495384.3538884.10362218334736607043@2413ebb6fbb6">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe: Ignore GGTT TLB inval errors during GT reset
              (rev2)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/141228/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/141228/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b_full -&gt;
        xe-pw-141228v2_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-141228v2_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-141228v2_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-141228v2_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html"
                moz-do-not-send="true">INCOMPLETE</a> +3 other tests
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html"
                moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html"
                moz-do-not-send="true">SKIP</a></li>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html"
                moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html"
                moz-do-not-send="true">FAIL</a> +2 other tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html"
                moz-do-not-send="true">FAIL</a> +2 other tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-6/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-5/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html"
                moz-do-not-send="true">DMESG-WARN</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>Unrelated failures</p>
    <p><br>
    </p>
    <p>Merged to drm-xe-next<br>
    </p>
    <blockquote type="cite"
      cite="mid:173149495384.3538884.10362218334736607043@2413ebb6fbb6">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242"
                moz-do-not-send="true">Intel XE#1242</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">DMESG-FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html"
                moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html"
                moz-do-not-send="true">SKIP</a> +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html"
                moz-do-not-send="true">FAIL</a> +2 other tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html"
                moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-141228v2_full that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@core_hotunplug@hotreplug-lateclose:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-433/igt@core_hotunplug@hotreplug-lateclose.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@core_hotunplug@hotreplug-lateclose.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885"
                moz-do-not-send="true">Intel XE#1885</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@fbdev@write:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@fbdev@write.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@fbdev@write.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134"
                moz-do-not-send="true">Intel XE#2134</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233"
                moz-do-not-send="true">Intel XE#2233</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466"
                moz-do-not-send="true">Intel XE#1466</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194"
                moz-do-not-send="true">Intel XE#3194</a>) +3 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911"
                moz-do-not-send="true">Intel XE#911</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +115 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279"
                moz-do-not-send="true">Intel XE#3279</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327"
                moz-do-not-send="true">Intel XE#2327</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242"
                moz-do-not-send="true">Intel XE#1242</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-8/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242"
                moz-do-not-send="true">Intel XE#1242</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052"
                moz-do-not-send="true">Intel XE#3052</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"
                moz-do-not-send="true">Intel XE#1874</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607"
                moz-do-not-send="true">Intel XE#607</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191"
                moz-do-not-send="true">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887"
                moz-do-not-send="true">Intel XE#2887</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a>) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652"
                moz-do-not-send="true">Intel XE#2652</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +30 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +159 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907"
                moz-do-not-send="true">Intel XE#2907</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887"
                moz-do-not-send="true">Intel XE#2887</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-4/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252"
                moz-do-not-send="true">Intel XE#2252</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-9/igt@kms_chamelium_frames@hdmi-aspect-ratio.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-3/igt@kms_chamelium_frames@hdmi-crc-single.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-0:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_content_protection@lic-type-0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178"
                moz-do-not-send="true">Intel XE#1178</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304"
                moz-do-not-send="true">Intel XE#3304</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"
                moz-do-not-send="true">Intel XE#308</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-4/igt@kms_cursor_crc@cursor-onscreen-32x10.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-64x21:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-1/igt@kms_cursor_crc@cursor-random-64x21.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320"
                moz-do-not-send="true">Intel XE#2320</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-6/igt@kms_cursor_crc@cursor-random-64x21.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424"
                moz-do-not-send="true">Intel XE#1424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321"
                moz-do-not-send="true">Intel XE#2321</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309"
                moz-do-not-send="true">Intel XE#309</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309"
                moz-do-not-send="true">Intel XE#309</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141"
                moz-do-not-send="true">Intel XE#2141</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@dp-mst:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-8/igt@kms_feature_discovery@dp-mst.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375"
                moz-do-not-send="true">Intel XE#2375</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882"
                moz-do-not-send="true">Intel XE#2882</a>) +4 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) +7 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-9/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310"
                moz-do-not-send="true">Intel XE#310</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-8/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635"
                moz-do-not-send="true">Intel XE#2635</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-4/igt@kms_flip@2x-nonexisting-fb-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421"
                moz-do-not-send="true">Intel XE#1421</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"
                moz-do-not-send="true">Intel XE#886</a>) +4 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate@c-edp1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3403"
                moz-do-not-send="true">Intel XE#3403</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"
                moz-do-not-send="true">Intel XE#886</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401"
                moz-do-not-send="true">Intel XE#1401</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745"
                moz-do-not-send="true">Intel XE#1745</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401"
                moz-do-not-send="true">Intel XE#1401</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293"
                moz-do-not-send="true">Intel XE#2293</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293"
                moz-do-not-send="true">Intel XE#2293</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380"
                moz-do-not-send="true">Intel XE#2380</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194"
                moz-do-not-send="true">Intel XE#3194</a>) +1 other test
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311"
                moz-do-not-send="true">Intel XE#2311</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333"
                moz-do-not-send="true">Intel XE#2333</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861"
                moz-do-not-send="true">Intel XE#1861</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) +29 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"
                moz-do-not-send="true">Intel XE#656</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313"
                moz-do-not-send="true">Intel XE#2313</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350"
                moz-do-not-send="true">Intel XE#2350</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"
                moz-do-not-send="true">Intel XE#656</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-2/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-3/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>) +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-1/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3312"
                moz-do-not-send="true">Intel XE#3312</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-ultra-joiner:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-3/igt@kms_joiner@basic-force-ultra-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925"
                moz-do-not-send="true">Intel XE#2925</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_lease@invalid-create-leases:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_lease@invalid-create-leases.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +20 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356"
                moz-do-not-send="true">Intel XE#356</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-source-clamping:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-1/igt@kms_plane@pixel-format-source-clamping.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-2/igt@kms_plane@pixel-format-source-clamping.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566"
                moz-do-not-send="true">Intel XE#2566</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929"
                moz-do-not-send="true">Intel XE#2929</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-1/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-2/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929"
                moz-do-not-send="true">Intel XE#2929</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763"
                moz-do-not-send="true">Intel XE#2763</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763"
                moz-do-not-send="true">Intel XE#2763</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763"
                moz-do-not-send="true">Intel XE#2763</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430"
                moz-do-not-send="true">Intel XE#1430</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@basic-rte:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_pm_rpm@basic-rte.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446"
                moz-do-not-send="true">Intel XE#2446</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@legacy-planes-dpms@plane-59:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-4/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-8/igt@kms_pm_rpm@legacy-planes-dpms@plane-59.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184"
                moz-do-not-send="true">Intel XE#3184</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439"
                moz-do-not-send="true">Intel XE#1439</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141"
                moz-do-not-send="true">Intel XE#3141</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@system-suspend-modeset:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_pm_rpm@system-suspend-modeset.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446"
                moz-do-not-send="true">Intel XE#2446</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-9/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) +21 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-sprite-plane-onoff:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-8/igt@kms_psr@pr-sprite-plane-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234"
                moz-do-not-send="true">Intel XE#2234</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-suspend:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-6/igt@kms_psr@pr-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-sprite-plane-move:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@kms_psr@psr-sprite-plane-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414"
                moz-do-not-send="true">Intel XE#3414</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-180:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-4/igt@kms_rotation_crc@sprite-rotation-180.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-8/igt@kms_rotation_crc@sprite-rotation-180.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055"
                moz-do-not-send="true">Intel XE#2055</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899"
                moz-do-not-send="true">Intel XE#899</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@accuracy-idle:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-3/igt@kms_vblank@accuracy-idle.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-5/igt@kms_vblank@accuracy-idle.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523"
                moz-do-not-send="true">Intel XE#1523</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@cmrr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@kms_vrr@cmrr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168"
                moz-do-not-send="true">Intel XE#2168</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159"
                moz-do-not-send="true">Intel XE#2159</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute@ccs-mode-basic:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-1/igt@xe_compute@ccs-mode-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447"
                moz-do-not-send="true">Intel XE#1447</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123"
                moz-do-not-send="true">Intel XE#1123</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@single-step:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@xe_eudebug_online@single-step.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905"
                moz-do-not-send="true">Intel XE#2905</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@single-step-one:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-7/igt@xe_eudebug_online@single-step-one.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905"
                moz-do-not-send="true">Intel XE#2905</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-small-external:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-1/igt@xe_evict@evict-small-external.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688"
                moz-do-not-send="true">Intel XE#688</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-threads-large:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-9/igt@xe_evict@evict-threads-large.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261"
                moz-do-not-send="true">Intel XE#261</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688"
                moz-do-not-send="true">Intel XE#688</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322"
                moz-do-not-send="true">Intel XE#2322</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392"
                moz-do-not-send="true">Intel XE#1392</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) +35 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-9/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-3/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086"
                moz-do-not-send="true">Intel XE#3086</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-rebind:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-rebind.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@inject-fault-probe@function-xe_guc_ads_init:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe@function-xe_guc_ads_init.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343"
                moz-do-not-send="true">Intel XE#3343</a>) +6 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_live_ktest@xe_bo.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@xe_live_ktest@xe_bo.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961"
                moz-do-not-send="true">Intel XE#2961</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191"
                moz-do-not-send="true">Intel XE#3191</a>) +1 other test
              timeout</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@reload-no-display:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_module_load@reload-no-display.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@map-oa-buffer:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@xe_oa@map-oa-buffer.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@mmio-triggered-reports:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-7/igt@xe_oa@mmio-triggered-reports.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-5/igt@xe_oa@mmio-triggered-reports.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249"
                moz-do-not-send="true">Intel XE#2249</a>)</li>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-3/igt@xe_oa@mmio-triggered-reports.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-7/igt@xe_oa@mmio-triggered-reports.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249"
                moz-do-not-send="true">Intel XE#2249</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@mmio-triggered-reports@ccs-0:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-5/igt@xe_oa@mmio-triggered-reports@ccs-0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249"
                moz-do-not-send="true">Intel XE#2249</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-7/igt@xe_oa@mmio-triggered-reports@ccs-0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249"
                moz-do-not-send="true">Intel XE#2249</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-9/igt@xe_oa@unprivileged-single-ctx-counters.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173"
                moz-do-not-send="true">Intel XE#1173</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3hot-basic-exec:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-3/igt@xe_pm@d3hot-basic-exec.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-8/igt@xe_pm@d3hot-basic-exec.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>) +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3hot-mmap-vram:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-9/igt@xe_pm@d3hot-mmap-vram.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948"
                moz-do-not-send="true">Intel XE#1948</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-d3hot-basic-exec:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-6/igt@xe_pm@s3-d3hot-basic-exec.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569"
                moz-do-not-send="true">Intel XE#569</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-userptr:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@toggle-gt-c6:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958"
                moz-do-not-send="true">Intel XE#958</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_spin_batch@spin-fixed-duration-with-preempter:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-3/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081"
                moz-do-not-send="true">Intel XE#1081</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_vm@munmap-style-unbind-many-either-side-partial:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-433/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) +186 other
              tests skip</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@core_getstats:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@core_getstats.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@core_getstats.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@core_hotunplug@hotreplug:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@core_hotunplug@hotreplug.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885"
                moz-do-not-send="true">Intel XE#1885</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@core_hotunplug@hotreplug.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@fbdev@info:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@fbdev@info.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134"
                moz-do-not-send="true">Intel XE#2134</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@fbdev@info.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194"
                moz-do-not-send="true">Intel XE#3194</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-suspend-resume:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-1/igt@kms_async_flips@async-flip-suspend-resume.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@ctm-signed:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-3/igt@kms_color@ctm-signed.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929"
                moz-do-not-send="true">Intel XE#2929</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-3/igt@kms_color@ctm-signed.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475"
                moz-do-not-send="true">Intel XE#1475</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475"
                moz-do-not-send="true">Intel XE#1475</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882"
                moz-do-not-send="true">Intel XE#2882</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3335"
                moz-do-not-send="true">Intel XE#3335</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4.html"
                moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@blocking-wf_vblank:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_flip@blocking-wf_vblank.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@kms_flip@blocking-wf_vblank.html"
                moz-do-not-send="true">PASS</a> +100 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html"
                moz-do-not-send="true">DMESG-WARN</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882"
                moz-do-not-send="true">Intel XE#2882</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-3/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@a-edp1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"
                moz-do-not-send="true">Intel XE#886</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check@a-edp1.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html"
                moz-do-not-send="true">PASS</a> +15 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194"
                moz-do-not-send="true">Intel XE#3194</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"
                moz-do-not-send="true">Intel XE#1874</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html"
                moz-do-not-send="true">PASS</a> +8 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html"
                moz-do-not-send="true">PASS</a> +27 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086"
                moz-do-not-send="true">Intel XE#3086</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-3/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html"
                moz-do-not-send="true">FAIL</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-9/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446"
                moz-do-not-send="true">Intel XE#2446</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp.html"
                moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@universal-planes:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042"
                moz-do-not-send="true">Intel XE#2042</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@universal-planes@plane-59:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-59.html"
                moz-do-not-send="true">DMESG-WARN</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-4/igt@kms_pm_rpm@universal-planes@plane-59.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-primary-page-flip@edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-8/igt@kms_psr@fbc-psr-primary-page-flip@edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2808"
                moz-do-not-send="true">Intel XE#2808</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-1/igt@kms_psr@fbc-psr-primary-page-flip@edp-1.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_ccs@block-copy-compressed-inc-dimension:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-6/igt@xe_ccs@block-copy-compressed-inc-dimension.html"
                moz-do-not-send="true">INCOMPLETE</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-3/igt@xe_ccs@block-copy-compressed-inc-dimension.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@once-parallel-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@xe_exec_balancer@once-parallel-rebind.html"
                moz-do-not-send="true">PASS</a> +169 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-hang-fd-basic:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-6/igt@xe_exec_threads@threads-hang-fd-basic.html"
                moz-do-not-send="true">FAIL</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-1/igt@xe_exec_threads@threads-hang-fd-basic.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html"
                moz-do-not-send="true">DMESG-FAIL</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-5/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229"
                moz-do-not-send="true">Intel XE#2229</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@reload:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_module_load@reload.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@xe_module_load@reload.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-basic:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-9/igt@xe_pm@s4-basic.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607"
                moz-do-not-send="true">Intel XE#1607</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-4/igt@xe_pm@s4-basic.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-basic-exec:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-2/igt@xe_pm@s4-basic-exec.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607"
                moz-do-not-send="true">Intel XE#1607</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-1/igt@xe_pm@s4-basic-exec.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-each-isolation:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-6/igt@xe_sriov_flr@flr-each-isolation.html"
                moz-do-not-send="true">WARN</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-1/igt@xe_sriov_flr@flr-each-isolation.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623"
                moz-do-not-send="true">Intel XE#623</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194"
                moz-do-not-send="true">Intel XE#3194</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194"
                moz-do-not-send="true">Intel XE#3194</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242"
                moz-do-not-send="true">Intel XE#1242</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"
                moz-do-not-send="true">Intel XE#1874</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html"
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
          <p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242"
                moz-do-not-send="true">Intel XE#1242</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052"
                moz-do-not-send="true">Intel XE#3052</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242"
                moz-do-not-send="true">Intel XE#1242</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052"
                moz-do-not-send="true">Intel XE#3052</a>)</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607"
                moz-do-not-send="true">Intel XE#607</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) +15 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191"
                moz-do-not-send="true">Intel XE#2191</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191"
                moz-do-not-send="true">Intel XE#2191</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html"
                moz-do-not-send="true">SKIP</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907"
                moz-do-not-send="true">Intel XE#2907</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616"
                moz-do-not-send="true">Intel XE#616</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907"
                moz-do-not-send="true">Intel XE#2907</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_audio@dp-audio:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-433/igt@kms_chamelium_audio@dp-audio.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_chamelium_audio@dp-audio.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-75:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_chamelium_color@ctm-0-75.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@kms_chamelium_color@ctm-0-75.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-negative:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_chamelium_color@ctm-negative.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_chamelium_color@ctm-negative.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-1/igt@kms_content_protection@atomic.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715"
                moz-do-not-send="true">Intel XE#2715</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-1/igt@kms_content_protection@atomic.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178"
                moz-do-not-send="true">Intel XE#1178</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307"
                moz-do-not-send="true">Intel XE#307</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-0:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@kms_content_protection@dp-mst-type-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307"
                moz-do-not-send="true">Intel XE#307</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-1:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-433/igt@kms_content_protection@lic-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_content_protection@lic-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"
                moz-do-not-send="true">Intel XE#308</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"
                moz-do-not-send="true">Intel XE#308</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-max-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323"
                moz-do-not-send="true">Intel XE#323</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_dsc@dsc-with-output-formats-with-bpc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776"
                moz-do-not-send="true">Intel XE#776</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-4x:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_feature_discovery@display-4x.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_feature_discovery@display-4x.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138"
                moz-do-not-send="true">Intel XE#1138</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882"
                moz-do-not-send="true">Intel XE#2882</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"
                moz-do-not-send="true">Intel XE#886</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3403"
                moz-do-not-send="true">Intel XE#3403</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"
                moz-do-not-send="true">Intel XE#886</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) +21 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +26 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861"
                moz-do-not-send="true">Intel XE#1861</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658"
                moz-do-not-send="true">Intel XE#658</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658"
                moz-do-not-send="true">Intel XE#658</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +28 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) +31 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-ultra-joiner:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925"
                moz-do-not-send="true">Intel XE#2925</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@overlay:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_plane_cursor@overlay.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616"
                moz-do-not-send="true">Intel XE#616</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_plane_cursor@overlay.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763"
                moz-do-not-send="true">Intel XE#2763</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763"
                moz-do-not-send="true">Intel XE#2763</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@bad-brightness:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_pm_backlight@bad-brightness.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870"
                moz-do-not-send="true">Intel XE#870</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122"
                moz-do-not-send="true">Intel XE#1122</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-retention-flops:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html"
                moz-do-not-send="true">SKIP</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309"
                moz-do-not-send="true">Intel XE#3309</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_pm_rpm@basic-pci-d3-state.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446"
                moz-do-not-send="true">Intel XE#2446</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@kms_pm_rpm@basic-pci-d3-state.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3129"
                moz-do-not-send="true">Intel XE#3129</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-nv12:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122"
                moz-do-not-send="true">Intel XE#1122</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-p010:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122"
                moz-do-not-send="true">Intel XE#1122</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-plane-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-primary-render:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_psr@psr2-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@kms_psr@psr2-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136"
                moz-do-not-send="true">Intel XE#2136</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"
                moz-do-not-send="true">Intel XE#2351</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939"
                moz-do-not-send="true">Intel XE#2939</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127"
                moz-do-not-send="true">Intel XE#1127</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414"
                moz-do-not-send="true">Intel XE#3414</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500"
                moz-do-not-send="true">Intel XE#1500</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tv_load_detect@load-detect:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330"
                moz-do-not-send="true">Intel XE#330</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-check-output:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@kms_writeback@writeback-check-output.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@kms_writeback@writeback-check-output.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756"
                moz-do-not-send="true">Intel XE#756</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756"
                moz-do-not-send="true">Intel XE#756</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423"
                moz-do-not-send="true">Intel XE#2423</a> / <a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"
                moz-do-not-send="true">i915#2575</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute_preempt@compute-preempt-many:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280"
                moz-do-not-send="true">Intel XE#1280</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123"
                moz-do-not-send="true">Intel XE#1123</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x3fff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126"
                moz-do-not-send="true">Intel XE#1126</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-close:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_eudebug@basic-close.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-464/igt@xe_eudebug@basic-close.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905"
                moz-do-not-send="true">Intel XE#2905</a>) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@multiple-sessions:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-466/igt@xe_eudebug@multiple-sessions.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905"
                moz-do-not-send="true">Intel XE#2905</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_eudebug@multiple-sessions.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-large-multi-vm-cm:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-464/igt@xe_evict@evict-large-multi-vm-cm.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600"
                moz-do-not-send="true">Intel XE#1600</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +30 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) +31 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360"
                moz-do-not-send="true">Intel XE#2360</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360"
                moz-do-not-send="true">Intel XE#2360</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_huc_copy@huc_copy:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-435/igt@xe_huc_copy@huc_copy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255"
                moz-do-not-send="true">Intel XE#255</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_huc_copy@huc_copy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_mmap@small-bar:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_mmap@small-bar.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-433/igt@xe_mmap@small-bar.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512"
                moz-do-not-send="true">Intel XE#512</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_oa@closed-fd-and-unmapped-access.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@xe_oa@closed-fd-and-unmapped-access.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@non-privileged-access-vaddr:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-464/igt@xe_oa@non-privileged-access-vaddr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_oa@non-privileged-access-vaddr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xehpc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838"
                moz-do-not-send="true">Intel XE#2838</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979"
                moz-do-not-send="true">Intel XE#979</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_peer2peer@read:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_peer2peer@read.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061"
                moz-do-not-send="true">Intel XE#1061</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@xe_peer2peer@read.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173"
                moz-do-not-send="true">Intel XE#1173</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-basic-exec:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-464/igt@xe_pm@d3cold-basic-exec.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"
                moz-do-not-send="true">Intel XE#2284</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366"
                moz-do-not-send="true">Intel XE#366</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mocs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-463/igt@xe_pm@d3cold-mocs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"
                moz-do-not-send="true">Intel XE#2284</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_pm@d3cold-mocs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"
                moz-do-not-send="true">Intel XE#2284</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366"
                moz-do-not-send="true">Intel XE#366</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-435/igt@xe_query@multigpu-query-invalid-cs-cycles.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-oa-units:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-466/igt@xe_query@multigpu-query-oa-units.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_query@multigpu-query-oa-units.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_wedged@wedged-at-any-timeout:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421"
                moz-do-not-send="true">Intel XE#3421</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_wedged@wedged-mode-toggle:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130"
                moz-do-not-send="true">Intel XE#1130</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141228v2/shard-dg2-463/igt@xe_wedged@wedged-mode-toggle.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075"
                moz-do-not-send="true">Intel XE#3075</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084"
                moz-do-not-send="true">Intel XE#3084</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8104 -&gt; IGT_8105</li>
        <li>Linux: xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b
          -&gt; xe-pw-141228v2</li>
      </ul>
      <p>IGT_8104: 5da2928391abd9625dd87b4a3fb6c35a54a0d948 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_8105: 8105<br>
        xe-2218-26f5fe99791def93b32e27e79e71dbd0666c117b:
        26f5fe99791def93b32e27e79e71dbd0666c117b<br>
        xe-pw-141228v2: 141228v2</p>
    </blockquote>
  </body>
</html>

--------------HqKW0luDzpBXARC0BqMU0OrW--
