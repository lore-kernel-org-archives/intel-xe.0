Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08828C3DA41
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 10:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9074710E054;
	Thu, 11 Jul 2024 10:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZvzFQqxn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE3210E111
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 10:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720694462; x=1752230462;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=LjhyTxiYy2e/kgRax6kJ6t5SNzFciBT0fKu6BZnLXR0=;
 b=ZvzFQqxnXthzR6Uo3Pei3TWSld8et0jKMdGEX0VJEgVR/xX1yzvw6Qdg
 72fKybJxxc/3S3XGuP9s8Di1NhDF+peAx8svXeb2YDdJquAw7MbiYw3Vb
 D840gyvagO2O/THKEpvk/AFfx/91+RVhO4SFu+d/mmvWZ4LXvUl2YZ2vA
 VMKqCyBw3hiOwvp5n/jIuXuKQEsxe2xFs8nwzHjQ8KCCzVT3m2bj9LmQh
 NAw47dt9w+/2xhtsdleWuVTs11s6JiHMRNqvqvKigUa+hdDeo7nZNUE3M
 D/r0swhbzGOi5SqZIrMKKLKFZcO0XDHLL+Kl9b7OnIPzIag3HlfDpxt1r w==;
X-CSE-ConnectionGUID: qOcbnPtWQMuwKAH8u1kWEQ==
X-CSE-MsgGUID: DXWMoNvqRcyP1cCjpBuuaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18268172"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208,217";a="18268172"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 03:41:01 -0700
X-CSE-ConnectionGUID: NaGfBGNDSsqvpRzUvc7WUA==
X-CSE-MsgGUID: +Tiro4zpSeGlTkMYuO4B9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208,217";a="53460143"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.254.89])
 ([10.94.254.89])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 03:41:00 -0700
Content-Type: multipart/alternative;
 boundary="------------pFZRzSZVWfWw1Zy6Z42qCLO6"
Message-ID: <9467c6fe-50af-4150-8edf-4f4ac748204b@linux.intel.com>
Date: Thu, 11 Jul 2024 12:40:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/xe2=3A_Ma?=
 =?UTF-8?Q?ke_subsequent_L2_flush_sequential?=
To: intel-xe@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20240710052750.3031586-1-tejas.upadhyay@intel.com>
 <172059547166.88440.6904927547477774254@2413ebb6fbb6>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <172059547166.88440.6904927547477774254@2413ebb6fbb6>
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
--------------pFZRzSZVWfWw1Zy6Z42qCLO6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/10/2024 9:11 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe/xe2: Make subsequent L2 flush sequential
> *URL:* 	https://patchwork.freedesktop.org/series/135923/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/index.html
>
>
>   CI Bug Log - changes from
>   xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a_full ->
>   xe-pw-135923v1_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-135923v1_full absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-135923v1_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
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
> xe-pw-135923v1_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html>
>
Unrelated.

Merged to drm-xe-next


Thanks,

Nirmoy


>  *
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>   * igt@xe_exec_threads@threads-shared-vm-basic:
>       o {shard-lnl}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-lnl-2/igt@xe_exec_threads@threads-shared-vm-basic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-lnl-5/igt@xe_exec_threads@threads-shared-vm-basic.html>
>
>
>     Known issues
>
> Here are the changes found in xe-pw-135923v1_full that come from known 
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
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_big_fb@linear-16bpp-rotate-270:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-90:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>  *
>
>     igt@kms_big_fb@y-tiled-8bpp-rotate-180:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +13
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>)
>  *
>
>     igt@kms_chamelium_color@ctm-max:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_chamelium_color@ctm-max.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_frames@vga-frame-dump:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_chamelium_frames@vga-frame-dump.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-fast:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@dp-mst-type-0:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x512:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>  *
>
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +4
>         other tests skip
>  *
>
>     igt@kms_fbcon_fbt@psr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_fbcon_fbt@psr.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#776
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>)
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html>
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +7
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-suspend:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-suspend.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>)
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html>
>         (Intel XE#361
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/361>)
>  *
>
>     igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-plane-move:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +4
>         other tests skip
>  *
>
>     igt@kms_psr@pr-cursor-plane-move:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_psr@pr-cursor-plane-move.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>  *
>
>     igt@kms_setmode@clone-exclusive-crtc:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_setmode@clone-exclusive-crtc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@xe_ccs@block-multicopy-inplace:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@xe_ccs@block-multicopy-inplace.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#488
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/488>)
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-large:
>
>       o shard-dg2-set2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html>
>         (Intel XE#1041
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041> /
>         Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>)
>  *
>
>     igt@xe_evict@evict-beng-threads-large:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-null-rebind:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>  *
>
>     igt@xe_exec_fault_mode@many-userptr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@xe_exec_fault_mode@many-userptr.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +4
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@once-bindexecqueue-imm:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-dg2-464/igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-436/igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind.html>
>         (Intel XE#358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/358>)
>  *
>
>     igt@xe_pm@s3-vm-bind-prefetch:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-4/igt@xe_pm@s3-vm-bind-prefetch.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-4/igt@xe_pm@s3-vm-bind-prefetch.html>
>         (Intel XE#1924
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924> /
>         Intel XE#2028
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028>)
>  *
>
>     igt@xe_pm@s4-mocs:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-1/igt@xe_pm@s4-mocs.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-9/igt@xe_pm@s4-mocs.html>
>         (Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_pm@s4-multiple-execs:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html>
>         (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_wedged@wedged-at-any-timeout:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1760
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-dg2-436/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6.html>
>         (Intel XE#827
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/827>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-464/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6.html>
>         +2 other tests pass
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html>
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html>
>         +1 other test pass
>  *
>
>     igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-dg2-436/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html>
>         +1 other test pass
>  *
>
>     igt@kms_plane@plane-position-covered:
>
>       o {shard-lnl}: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-lnl-4/igt@kms_plane@plane-position-covered.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-lnl-6/igt@kms_plane@plane-position-covered.html>
>         +1 other test pass
>  *
>
>     {igt@kms_plane@plane-position-covered@pipe-b-plane-1}:
>
>       o {shard-lnl}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html>
>  *
>
>     igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-edp-1:
>
>       o {shard-lnl}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-lnl-8/igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-edp-1.html>
>         (Intel XE#1705
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-lnl-2/igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-edp-1.html>
>         +1 other test pass
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html>
>         (Intel XE#771
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/771> /
>         Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html>
>         (Intel XE#771
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/771> /
>         Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html>
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html>
>         (Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html>
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html>
>         (Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html>
>  *
>
>     igt@kms_vblank@ts-continuation-dpms-suspend:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1551
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend.html>
>         +1 other test pass
>  *
>
>     igt@xe_evict@evict-beng-mixed-threads-large:
>
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html>
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-small:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html>
>  *
>
>     igt@xe_pm@s4-basic:
>
>       o {shard-lnl}: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-lnl-2/igt@xe_pm@s4-basic.html>
>         (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#1607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-lnl-7/igt@xe_pm@s4-basic.html>
>  *
>
>     igt@xe_pm@s4-vm-bind-prefetch:
>
>       o shard-adlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html>
>         (Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html>
>  *
>
>     igt@xe_pm_residency@toggle-gt-c6:
>
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html>
>         (Intel XE#958
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/958>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (Intel XE#1204
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
>  *
>
>     igt@kms_content_protection@legacy@pipe-a-dp-4:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-dg2-466/igt@kms_content_protection@legacy@pipe-a-dp-4.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-435/igt@kms_content_protection@legacy@pipe-a-dp-4.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1
>         other test fail
>  *
>
>     igt@xe_wedged@wedged-at-any-timeout:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-2/igt@xe_wedged@wedged-at-any-timeout.html>
>         (Intel XE#1214
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> /
>         Intel XE#1760
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-8/igt@xe_wedged@wedged-at-any-timeout.html>
>         (Intel XE#1760
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * Linux: xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a ->
>     xe-pw-135923v1
>
> IGT_7920: 7920
> xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a: 
> 1c05c3d64de33058a86fa2c4ebb54d7c8bda573a
> xe-pw-135923v1: 135923v1
>
--------------pFZRzSZVWfWw1Zy6Z42qCLO6
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
    <div class="moz-cite-prefix">On 7/10/2024 9:11 AM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:172059547166.88440.6904927547477774254@2413ebb6fbb6">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe/xe2: Make subsequent L2 flush sequential</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/135923/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/135923/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a_full -&gt;
        xe-pw-135923v1_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-135923v1_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-135923v1_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (3 -&gt; 3)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-135923v1_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html"
                moz-do-not-send="true">ABORT</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>Unrelated.</p>
    <p>Merged to drm-xe-next</p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>Nirmoy<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:172059547166.88440.6904927547477774254@2413ebb6fbb6">
      <ul>
        <li>
          <ul>
          </ul>
        </li>
      </ul>
      <h4>Suppressed</h4>
      <p>The following results come from untrusted machines, tests, or
        statuses.<br>
        They do not affect the overall result.</p>
      <ul>
        <li>igt@xe_exec_threads@threads-shared-vm-basic:
          <ul>
            <li>{shard-lnl}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-lnl-2/igt@xe_exec_threads@threads-shared-vm-basic.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-lnl-5/igt@xe_exec_threads@threads-shared-vm-basic.html"
                moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-135923v1_full that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"
                moz-do-not-send="true">Intel XE#1214</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252"
                moz-do-not-send="true">Intel XE#1252</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-max:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_chamelium_color@ctm-max.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@vga-frame-dump:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_chamelium_frames@vga-frame-dump.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_chamelium_hpd@vga-hpd-fast.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-0:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307"
                moz-do-not-send="true">Intel XE#307</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_cursor_crc@cursor-sliding-512x512.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"
                moz-do-not-send="true">Intel XE#308</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_fbcon_fbt@psr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776"
                moz-do-not-send="true">Intel XE#776</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"
                moz-do-not-send="true">Intel XE#1874</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"
                moz-do-not-send="true">Intel XE#656</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361"
                moz-do-not-send="true">Intel XE#361</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-cursor-plane-move:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_psr@pr-cursor-plane-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@clone-exclusive-crtc:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_setmode@clone-exclusive-crtc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_ccs@block-multicopy-inplace:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@xe_ccs@block-multicopy-inplace.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488"
                moz-do-not-send="true">Intel XE#488</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041"
                moz-do-not-send="true">Intel XE#1041</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392"
                moz-do-not-send="true">Intel XE#392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392"
                moz-do-not-send="true">Intel XE#1392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-userptr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@xe_exec_fault_mode@many-userptr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-dg2-464/igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-436/igt@xe_exec_threads@threads-bal-shared-vm-userptr-rebind.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358"
                moz-do-not-send="true">Intel XE#358</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-vm-bind-prefetch:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-4/igt@xe_pm@s3-vm-bind-prefetch.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-4/igt@xe_pm@s3-vm-bind-prefetch.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924"
                moz-do-not-send="true">Intel XE#1924</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028"
                moz-do-not-send="true">Intel XE#2028</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-mocs:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-1/igt@xe_pm@s4-mocs.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-9/igt@xe_pm@s4-mocs.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-multiple-execs:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_wedged@wedged-at-any-timeout:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"
                moz-do-not-send="true">Intel XE#1214</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760"
                moz-do-not-send="true">Intel XE#1760</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-dg2-436/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827"
                moz-do-not-send="true">Intel XE#827</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-464/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"
                moz-do-not-send="true">Intel XE#1874</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-dg2-436/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-covered:</p>
          <ul>
            <li>{shard-lnl}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-lnl-4/igt@kms_plane@plane-position-covered.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-lnl-6/igt@kms_plane@plane-position-covered.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>{igt@kms_plane@plane-position-covered@pipe-b-plane-1}:</p>
          <ul>
            <li>{shard-lnl}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-edp-1:</p>
          <ul>
            <li>{shard-lnl}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-lnl-8/igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-edp-1.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705"
                moz-do-not-send="true">Intel XE#1705</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-lnl-2/igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-edp-1.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771"
                moz-do-not-send="true">Intel XE#771</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899"
                moz-do-not-send="true">Intel XE#899</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html"
                moz-do-not-send="true">PASS</a></li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771"
                moz-do-not-send="true">Intel XE#771</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899"
                moz-do-not-send="true">Intel XE#899</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899"
                moz-do-not-send="true">Intel XE#899</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899"
                moz-do-not-send="true">Intel XE#899</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"
                moz-do-not-send="true">Intel XE#1214</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551"
                moz-do-not-send="true">Intel XE#1551</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392"
                moz-do-not-send="true">Intel XE#392</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-small:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-basic:</p>
          <ul>
            <li>{shard-lnl}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-lnl-2/igt@xe_pm@s4-basic.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607"
                moz-do-not-send="true">Intel XE#1607</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-lnl-7/igt@xe_pm@s4-basic.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-prefetch:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@toggle-gt-c6:</p>
          <ul>
            <li>{shard-lnl}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958"
                moz-do-not-send="true">Intel XE#958</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204"
                moz-do-not-send="true">Intel XE#1204</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-dg2-466/igt@kms_content_protection@legacy@pipe-a-dp-4.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-dg2-435/igt@kms_content_protection@legacy@pipe-a-dp-4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178"
                moz-do-not-send="true">Intel XE#1178</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_wedged@wedged-at-any-timeout:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a/shard-adlp-2/igt@xe_wedged@wedged-at-any-timeout.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214"
                moz-do-not-send="true">Intel XE#1214</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760"
                moz-do-not-send="true">Intel XE#1760</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135923v1/shard-adlp-8/igt@xe_wedged@wedged-at-any-timeout.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760"
                moz-do-not-send="true">Intel XE#1760</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a
          -&gt; xe-pw-135923v1</li>
      </ul>
      <p>IGT_7920: 7920<br>
        xe-1584-1c05c3d64de33058a86fa2c4ebb54d7c8bda573a:
        1c05c3d64de33058a86fa2c4ebb54d7c8bda573a<br>
        xe-pw-135923v1: 135923v1</p>
    </blockquote>
  </body>
</html>

--------------pFZRzSZVWfWw1Zy6Z42qCLO6--
