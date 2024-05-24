Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32359C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 14:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2497F88E45;
	Fri, 24 May 2024 14:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iyUbF1P0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED4910E0D5
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 14:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716561005; x=1748097005;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=xdkcg0xFWFTX8ywCdW9p0cXCpA1WwHt+PixMVNNtfMY=;
 b=iyUbF1P0L5sHAp+Q39UZYqeRirsWxM6+aoNT5GDfr2YPdbFOa5DZGiLx
 dH9b9EUNJa0LWyX1e3LYRhnKGwlzS+IfiPql+hjFu4bwgK2ZG0+yp5JtR
 77ee78czEZZEw7VxdzqFsZqxOYne4Jd6jXlfY6+foMAbvfk1sTiMQ1Kvi
 KqJ4xGJI3bZ043tKXINnspmUc+bNLzDMey2sYPv2jE8T5r+NK3XZM/t5I
 g3rlrYBTGH2yuv6L15KsuS5kSZlu/lXCTC1FpDi17AcPhU4aRI567AT8N
 /xhSA6nXj0ClOLqo0iN4ECRCKMXegxNDL+N1OAqaXzgRYKW/0J5rUPCW8 w==;
X-CSE-ConnectionGUID: t87gaX9oSF+EnXb2H1AeZg==
X-CSE-MsgGUID: E+97QJvyTKKB5LUYfpXNxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="24352087"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="24352087"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 07:30:04 -0700
X-CSE-ConnectionGUID: FSsO7tAUSiGbWnE2jEOZUQ==
X-CSE-MsgGUID: uEBs0S/TTc+2yoNBGygykQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="34020663"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.4.197])
 ([10.246.4.197])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 07:30:03 -0700
Message-ID: <335a7663-0cdb-4154-8f23-92089f9cd545@intel.com>
Date: Fri, 24 May 2024 16:30:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=C3=A2_CI=2EFULL=3A_failure_for_drm/xe=3A_flush_gtt?=
 =?UTF-8?Q?_before_signalling_user_fence_on_all_engines?=
To: intel-xe@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>
References: <20240522-xu_flush_vcs_before_ufence-v2-1-9ac3e9af0323@intel.com>
 <171637407413.2166914.3506346982695263428@8e613ede5ea5>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <171637407413.2166914.3506346982695263428@8e613ede5ea5>
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

On 22.05.2024 12:34, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe: flush gtt before signalling user fence on all engines
> *URL:*	https://patchwork.freedesktop.org/series/133906/ 
> <https://patchwork.freedesktop.org/series/133906/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/index.html 
> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd_full ->
>   xe-pw-133906v1_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-133906v1_full absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-133906v1_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
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
> Here are the unknown changes that may have been introduced in 
> xe-pw-133906v1_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_flip@2x-flip-vs-rmfb@ab-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-466/igt@kms_flip@2x-flip-vs-rmfb@ab-hdmi-a6-dp4.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-rmfb@ab-hdmi-a6-dp4.html> +2 other tests abort
>   *
> 
>     igt@xe_exec_reset@virtual-close-fd-no-exec:
> 
>       o shard-dg2-set2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-432/igt@xe_exec_reset@virtual-close-fd-no-exec.html>
> 
> 
>         Warnings
> 
>   * igt@kms_cursor_crc@cursor-onscreen-128x42:
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-128x42.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-128x42.html> +1 other test abort


All errors due to the same issue as in case of BAT tests[1], re-test 
already submitted.

[1]: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1908

Regards
Andrzej

 >



> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   *
> 
>     igt@kms_bw@linear-tiling-1-displays-3840x2160p:
> 
>       o {shard-lnl}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-lnl-7/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html> (Intel XE#1650 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1650>) -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-lnl-8/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html>
>   *
> 
>     igt@kms_flip@blocking-wf_vblank:
> 
>       o {shard-lnl}: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html> +2 other tests abort
>   *
> 
>     igt@kms_psr@psr2-basic:
> 
>       o {shard-lnl}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-lnl-8/igt@kms_psr@psr2-basic.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-lnl-2/igt@kms_psr@psr2-basic.html> +2 other tests abort
>   *
> 
>     igt@kms_rmfb@close-fd@pipe-a-edp-1:
> 
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-lnl-3/igt@kms_rmfb@close-fd@pipe-a-edp-1.html> (Intel XE#294 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/294>) -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-lnl-7/igt@kms_rmfb@close-fd@pipe-a-edp-1.html> +1 other test abort
> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-133906v1_full that come from known 
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
>     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3 other tests skip
>   *
> 
>     igt@kms_big_fb@linear-64bpp-rotate-270:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-6/igt@kms_big_fb@linear-64bpp-rotate-270.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +4 other tests skip
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
>   *
> 
>     igt@kms_big_fb@y-tiled-8bpp-rotate-180:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>   *
> 
>     igt@kms_big_joiner@basic:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-6/igt@kms_big_joiner@basic.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#346 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-1920x1080p:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-6/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-3840x2160p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +27 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-6/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +9 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +14 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +7 other tests skip
>   *
> 
>     igt@kms_chamelium_color@gamma:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@kms_chamelium_color@gamma.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_frames@hdmi-aspect-ratio:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-6/igt@kms_chamelium_frames@hdmi-aspect-ratio.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +5 other tests skip
>   *
> 
>     igt@kms_chamelium_frames@hdmi-crc-planes-random:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@kms_chamelium_frames@hdmi-crc-planes-random.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1 other test skip
>   *
> 
>     igt@kms_content_protection@lic-type-0:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@kms_content_protection@lic-type-0.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) +1 other test fail
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +6 other tests dmesg-warn
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html> (Intel XE#1191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> / Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) +1 other test dmesg-warn
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>)
>   *
> 
>     igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-panning:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-8/igt@kms_flip@2x-flip-vs-panning.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#310 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>) +3 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +13 other tests skip
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) +1 other test fail
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
> 
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html> (Intel XE#1861 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>) +1 other test fail
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-suspend:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-suspend.html> (Intel XE#616 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +6 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +17 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +7 other tests skip
>   *
> 
>     igt@kms_hdr@invalid-hdr:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-463/igt@kms_hdr@invalid-hdr.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-436/igt@kms_hdr@invalid-hdr.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +1 other test skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +2 other tests skip
>   *
> 
>     igt@kms_pm_backlight@bad-brightness:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@kms_pm_backlight@bad-brightness.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_backlight@fade:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-6/igt@kms_pm_backlight@fade.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) +1 other test skip
>   *
> 
>     igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1211 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211>)
>   *
> 
>     igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-8/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +4 other tests skip
>   *
> 
>     igt@kms_psr@fbc-pr-primary-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-6/igt@kms_psr@fbc-pr-primary-blt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +7 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr-basic:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-432/igt@kms_psr@fbc-psr-basic.html> (Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>   *
> 
>     igt@kms_psr@psr-primary-render:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@kms_psr@psr-primary-render.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +4 other tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html> (Intel XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>   *
> 
>     igt@kms_vrr@flipline:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@kms_vrr@flipline.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +9 other tests skip
>   *
> 
>     igt@xe_compute@ccs-mode-compute-kernel:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-6/igt@xe_compute@ccs-mode-compute-kernel.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1447 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447>)
>   *
> 
>     igt@xe_copy_basic@mem-copy-linear-0xfffe:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0xfffe.html> (Intel XE#1123 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@xe_copy_basic@mem-set-linear-0x369:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x369.html> (Intel XE#1126 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@xe_copy_basic@mem-set-linear-0xfd:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0xfd.html> (Intel XE#1126 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@xe_evict@evict-beng-cm-threads-large:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@xe_evict@evict-beng-cm-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) +1 other test timeout
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#402 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>)
>   *
> 
>     igt@xe_evict@evict-threads-large-multi-vm:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-6/igt@xe_evict@evict-threads-large-multi-vm.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#261 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261>) +2 other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-once-userptr:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-6/igt@xe_exec_basic@multigpu-once-userptr.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +4 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +6 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>)
>   *
> 
>     igt@xe_exec_fault_mode@once-bindexecqueue:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-6/igt@xe_exec_fault_mode@once-bindexecqueue.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +5 other tests skip
>   *
> 
>     igt@xe_live_ktest@xe_bo:
> 
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-6/igt@xe_live_ktest@xe_bo.html> (Intel XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@xe_pm@d3cold-basic-exec:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@xe_pm@d3cold-basic-exec.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +1 other test skip
>   *
> 
>     igt@xe_pm@d3hot-basic:
> 
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-8/igt@xe_pm@d3hot-basic.html> (Intel XE#355 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/355>)
>   *
> 
>     igt@xe_pm@s2idle-d3hot-basic-exec:
> 
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-434/igt@xe_pm@s2idle-d3hot-basic-exec.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@xe_pm@s2idle-d3hot-basic-exec.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>)
>   *
> 
>     igt@xe_pm@s4-d3hot-basic-exec:
> 
>       o shard-adlp: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>)
>   *
> 
>     igt@xe_pm_residency@toggle-gt-c6:
> 
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html> (Intel XE#958 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/958>)
>   *
> 
>     igt@xe_query@multigpu-query-invalid-size:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-432/igt@xe_query@multigpu-query-invalid-size.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@core_setmaster@master-drop-set-root:
> 
>       o shard-dg2-set2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@core_setmaster@master-drop-set-root.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@core_setmaster@master-drop-set-root.html> +2 other tests pass
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4.html> (Intel XE#827 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/827>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4.html> +1 other test pass
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#1659 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>   *
> 
>     igt@kms_color@deep-color:
> 
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-463/igt@kms_color@deep-color.html> (Intel XE#1150 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150> / Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-436/igt@kms_color@deep-color.html>
>   *
> 
>     igt@kms_cursor_crc@cursor-dpms@pipe-d-hdmi-a-6:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-466/igt@kms_cursor_crc@cursor-dpms@pipe-d-hdmi-a-6.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-463/igt@kms_cursor_crc@cursor-dpms@pipe-d-hdmi-a-6.html> +3 other tests pass
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html> (Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html>
>   *
> 
>     igt@kms_cursor_legacy@torture-bo@pipe-a:
> 
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-adlp-2/igt@kms_cursor_legacy@torture-bo@pipe-a.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-6/igt@kms_cursor_legacy@torture-bo@pipe-a.html> +1 other test pass
>   *
> 
>     igt@kms_fbcon_fbt@psr-suspend:
> 
>       o {shard-lnl}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-lnl-3/igt@kms_fbcon_fbt@psr-suspend.html> (Intel XE#1830 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-lnl-3/igt@kms_fbcon_fbt@psr-suspend.html> +2 other tests pass
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
> 
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html> +1 other test pass
>   *
> 
>     igt@kms_psr@psr-cursor-plane-move:
> 
>       o {shard-lnl}: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-lnl-4/igt@kms_psr@psr-cursor-plane-move.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-lnl-6/igt@kms_psr@psr-cursor-plane-move.html> +4 other tests pass
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html> (Intel XE#771 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/771> / Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html>
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html>
>   *
> 
>     igt@xe_evict@evict-large-multi-vm-cm:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html> (Intel XE#1600 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html>
>   *
> 
>     igt@xe_evict@evict-small-cm:
> 
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-466/igt@xe_evict@evict-small-cm.html> (Intel XE#1069 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-435/igt@xe_evict@evict-small-cm.html>
>   *
> 
>     igt@xe_gt_freq@freq_fixed_exec:
> 
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-lnl-4/igt@xe_gt_freq@freq_fixed_exec.html> (Intel XE#1414 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-lnl-8/igt@xe_gt_freq@freq_fixed_exec.html>
>   *
> 
>     igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer:
> 
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-lnl-4/igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer.html> (Intel XE#1081 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-lnl-2/igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@core_hotunplug@hotunplug-rescan:
> 
>       o shard-adlp: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-adlp-9/igt@core_hotunplug@hotunplug-rescan.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1365 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365> / Intel XE#1451 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451>) -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-4/igt@core_hotunplug@hotunplug-rescan.html> (Intel XE#1548 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548> / Intel XE#1717 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717> / Intel XE#1760 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>)
>   *
> 
>     igt@kms_async_flips@invalid-async-flip:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-464/igt@kms_async_flips@invalid-async-flip.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#873 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html> (Intel XE#873 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>)
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-270:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-464/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +5 other tests skip
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +4 other tests skip
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-3840x2160p:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-2560x1440p:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2 other tests skip
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +48 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +7 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +13 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +27 other tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-limited-range:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1 other test skip
>   *
> 
>     igt@kms_chamelium_frames@vga-frame-dump:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-464/igt@kms_chamelium_frames@vga-frame-dump.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-432/igt@kms_chamelium_frames@vga-frame-dump.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +4 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +4 other tests skip
>   *
> 
>     igt@kms_content_protection@dp-mst-type-0:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html> (Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x170.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html> (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>   *
> 
>     igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html> (Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282> / Intel XE#910 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/910>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282> / Intel XE#910 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/910>)
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html> (Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>)
>   *
> 
>     igt@kms_cursor_legacy@single-bo@all-pipes:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@kms_cursor_legacy@single-bo@all-pipes.html> (Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-434/igt@kms_cursor_legacy@single-bo@all-pipes.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +7 other tests dmesg-warn
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / i915#3804 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html> (i915#3804 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>   *
> 
>     igt@kms_dsc@dsc-with-bpc-formats:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3 other tests skip
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible:
> 
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html> (Intel XE#1191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> / Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#927 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/927>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
> 
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html> (Intel XE#1191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> / Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>   *
> 
>     igt@kms_force_connector_basic@prune-stale-modes:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#5274 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / i915#5274 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +15 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +14 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +14 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +15 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@plane-fbc-rte:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html> (Intel XE#1158 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@kms_frontbuffer_tracking@plane-fbc-rte.html> (Intel XE#1158 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-464/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#356 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel XE#356 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>)
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc:
> 
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc.html> (Intel XE#1191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> / Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#927 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/927>)
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
> 
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-adlp-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html> (Intel XE#1191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191> / Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-render:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html> (Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-render.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +9 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-suspend:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-464/igt@kms_psr@fbc-psr2-suspend.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-432/igt@kms_psr@fbc-psr2-suspend.html> (Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +9 other tests skip
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#362 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@kms_vrr@flip-dpms:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-464/igt@kms_vrr@flip-dpms.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-432/igt@kms_vrr@flip-dpms.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +8 other tests skip
>   *
> 
>     igt@xe_compute_preempt@compute-preempt-many:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html> (Intel XE#1280 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1280 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>   *
> 
>     igt@xe_copy_basic@mem-copy-linear-0xfffe:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfffe.html> (Intel XE#1123 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html> (Intel XE#1123 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>   *
> 
>     igt@xe_exec_fault_mode@once-invalid-userptr-fault:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +11 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +12 other tests skip
>   *
> 
>     igt@xe_exec_reset@gt-reset-stress:
> 
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1638 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-2/igt@xe_exec_reset@gt-reset-stress.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330> / Intel XE#1638 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638>)
>   *
> 
>     igt@xe_module_load@load:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@xe_module_load@load.html> (Intel XE#378 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-434/igt@xe_module_load@load.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#378 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>   *
> 
>     igt@xe_pat@pat-index-xehpc:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-464/igt@xe_pat@pat-index-xehpc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#979 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html> (Intel XE#979 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>   *
> 
>     igt@xe_pm@s2idle-vm-bind-prefetch:
> 
>       o shard-adlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-prefetch.html> (Intel XE#1608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608> / Intel XE#1694 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-prefetch.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>)
>   *
> 
>     igt@xe_pm@s2idle-vm-bind-userptr:
> 
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-userptr.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1608 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-9/igt@xe_pm@s2idle-vm-bind-userptr.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>   *
> 
>     igt@xe_pm@s3-d3cold-basic-exec:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html> (Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@xe_pm@s3-d3cold-basic-exec.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>   *
> 
>     igt@xe_pm@s3-vm-bind-userptr:
> 
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-adlp-2/igt@xe_pm@s3-vm-bind-userptr.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-1/igt@xe_pm@s3-vm-bind-userptr.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>   *
> 
>     igt@xe_pm@s4-multiple-execs:
> 
>       o shard-adlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>)
>   *
> 
>     igt@xe_query@multigpu-query-invalid-cs-cycles:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-464/igt@xe_query@multigpu-query-invalid-cs-cycles.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1 other test skip
>   *
> 
>     igt@xe_query@multigpu-query-mem-usage:
> 
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@xe_query@multigpu-query-mem-usage.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_wedged@wedged-at-any-timeout:
> 
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd/shard-dg2-432/igt@xe_wedged@wedged-at-any-timeout.html> (Intel XE#1760 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133906v1/shard-dg2-464/igt@xe_wedged@wedged-at-any-timeout.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1760 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * Linux: xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd ->
>     xe-pw-133906v1
> 
> IGT_7867: f3006a13799e3bc45d754aa8ad318394277d69ac @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1323-b134db8544f8d5b8a960b368afe12820c3cbe8cd: 
> b134db8544f8d5b8a960b368afe12820c3cbe8cd
> xe-pw-133906v1: 133906v1
> 

