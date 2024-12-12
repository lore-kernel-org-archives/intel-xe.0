Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25907E77180
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 11:56:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1AA10ED6B;
	Thu, 12 Dec 2024 11:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fOWzdlKJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBF910ED6B;
 Thu, 12 Dec 2024 11:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734004563; x=1765540563;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=6lEaZbX8NK0CVBTeBqOXQRkoIIxNvHgp2H6ATHUjidQ=;
 b=fOWzdlKJZIsPFdtuHmYhAtejx531Ga6OcQ9ltoYWazLAyaNqibWnKhNv
 NtsWXTNMGVmRJ/HXyMT3elvMzFrUVoGxmbaUZPwEQHN8IMav4braPXy9S
 IAKqA4l2QR7b3VF+4HwIy5oAN7RVgD0NwczSubtuEAwOFhVH+0iTYrMpf
 80YVgT5i45OybjR9BTSBLlXCJelhL8CWH5Csg7wNGhJErc0cqzctsVjUJ
 E3052Wl34c26mZWEi28GjmnL8EG02lNVRMTWwG6tSrAhQeXPdaPktI8j/
 m29Oht5t6z76DoWq2Ssp7YN0ZRMtegLSsphc+F9U+KJysyDpPS2EwBhTb g==;
X-CSE-ConnectionGUID: iLLp74quSfekRVa4fLdQvw==
X-CSE-MsgGUID: JD/49CibRkacbIPxT54hdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34463178"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="34463178"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 03:56:03 -0800
X-CSE-ConnectionGUID: mRQwug/VS9eDHIQ0sEhl6w==
X-CSE-MsgGUID: 76V9Ap0STqq/deK7bkrNEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100762675"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.0.63])
 ([10.246.0.63])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 03:56:00 -0800
Message-ID: <72f5e14b-5e10-4fa4-96e8-3eb972946ae6@linux.intel.com>
Date: Thu, 12 Dec 2024 12:55:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBWRjogQXZvaWQg?=
 =?UTF-8?Q?reading_inaccessible_registers_=28rev2=29?=
To: intel-xe@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20241211064211.781820-1-marcin.bernatowicz@linux.intel.com>
 <173390605717.1143111.14752770458168021256@b555e5b46a47>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <173390605717.1143111.14752770458168021256@b555e5b46a47>
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



On 12/11/2024 9:34 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	VF: Avoid reading inaccessible registers (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/142196/ <https:// 
> patchwork.freedesktop.org/series/142196/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/ 
> index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080_full -> xe-
>   pw-142196v2_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-142196v2_full absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-142196v2_full, please notify your bug team (I915-ci- 
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
> pw-142196v2_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-prefetch:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-7/
>         igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-
>         prefetch.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-4/igt@xe_exec_fault_mode@many-
>         execqueues-bindexecqueue-prefetch.html> +1 other test dmesg-warn
>   *
> 
>     igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@bcs:
> 
>       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-142196v2/shard-bmg-4/
>         igt@xe_sysfs_preempt_timeout@preempt_timeout_us-
>         timeout@bcs.html> +3 other tests dmesg-warn
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_async_flips@crc-atomic:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-
>         adlp-4/igt@kms_async_flips@crc-atomic.html> (Intel XE#3086
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086>) ->
>         WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/
>         shard-adlp-1/igt@kms_async_flips@crc-atomic.html>
>   *
> 
>     igt@xe_ccs@block-multicopy-inplace@tile64-compressed-compfmt0-
>     vram01-vram01-multicopy:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@xe_ccs@block-multicopy-inplace@tile64-compressed-compfmt0-
>         vram01-vram01-multicopy.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
>         bmg-4/igt@xe_ccs@block-multicopy-inplace@tile64-compressed-
>         compfmt0-vram01-vram01-multicopy.html> +1 other test dmesg-warn
>   *
> 
>     igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate-race:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate-
>         race.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3468>) -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-4/
>         igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate-race.html>
> 

Not related to the change.
--
marcin

> 
>     Known issues
> 
> Here are the changes found in xe-pw-142196v2_full that come from known 
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
>     igt@kms_addfb_basic@unused-handle:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@kms_addfb_basic@unused-handle.html> -> DMESG-WARN <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-4/
>         igt@kms_addfb_basic@unused-handle.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +11 other
>         tests dmesg-warn
>   *
> 
>     igt@kms_async_flips@async-flip-suspend-resume:
> 
>       o shard-adlp: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-adlp-3/igt@kms_async_flips@async-
>         flip-suspend-resume.html> (Intel XE#1033 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel
>         XE#3673 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673>)
>   *
> 
>     igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-adlp-3/igt@kms_async_flips@async-
>         flip-suspend-resume@pipe-a-hdmi-a-1.html> (Intel XE#3673
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673>)
>   *
> 
>     igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-142196v2/shard-adlp-3/
>         igt@kms_async_flips@async-flip-suspend-resume@pipe-b-hdmi-
>         a-1.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1033>) +1 other test dmesg-warn
>   *
> 
>     igt@kms_async_flips@invalid-async-flip-atomic:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-4/igt@kms_async_flips@invalid-
>         async-flip-atomic.html> (Intel XE#3768 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3768>)
>   *
> 
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-adlp-3/igt@kms_atomic@plane-
>         primary-overlay-mutable-zpos.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>   *
> 
>     igt@kms_big_fb@4-tiled-32bpp-rotate-90:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-lnl-6/igt@kms_big_fb@4-
>         tiled-32bpp-rotate-90.html> (Intel XE#1407 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1407>)
>   *
> 
>     igt@kms_big_fb@x-tiled-64bpp-rotate-90:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-adlp-3/igt@kms_big_fb@x-
>         tiled-64bpp-rotate-90.html> (Intel XE#316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-adlp-8/
>         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-
>         flip.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-
>         hw-stride-64bpp-rotate-0-async-flip.html> (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-adlp-3/igt@kms_big_fb@yf-
>         tiled-16bpp-rotate-0.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-
>         hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2
>         other tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
>         igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html> -
>          > SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-142196v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-
>         displays-2560x1440p.html> (Intel XE#2314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
>         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2894>) +1 other test skip
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-3840x2160p:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-lnl-6/igt@kms_bw@linear-tiling-3-
>         displays-3840x2160p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_bw@linear-tiling-4-displays-3840x2160p:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-adlp-3/igt@kms_bw@linear-tiling-4-
>         displays-3840x2160p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-8/igt@kms_ccs@crc-primary-
>         basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html> (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +7 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-lnl-6/igt@kms_ccs@crc-primary-
>         rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html> (Intel XE#2669
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669>) +3
>         other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-lnl-6/igt@kms_ccs@crc-sprite-
>         planes-basic-4-tiled-mtl-rc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-4/igt@kms_ccs@random-ccs-
>         data-4-tiled-dg2-rc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-
>         hpd-after-hibernate.html> (Intel XE#2252 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2252>)
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-lnl-6/igt@kms_chamelium_hpd@vga-
>         hpd.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/373>)
>   *
> 
>     igt@kms_content_protection@atomic@pipe-a-dp-2:
> 
>       o shard-bmg: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-142196v2/shard-bmg-7/
>         igt@kms_content_protection@atomic@pipe-a-dp-2.html> (Intel
>         XE#2715 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2715> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_content_protection@legacy@pipe-a-dp-2:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-7/
>         igt@kms_content_protection@legacy@pipe-a-dp-2.html> (Intel
>         XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-512x512:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-lnl-6/igt@kms_cursor_crc@cursor-
>         rapid-movement-512x512.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
>         igt@kms_cursor_crc@cursor-suspend.html> -> INCOMPLETE <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-2/
>         igt@kms_cursor_crc@cursor-suspend.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) +1 other test incomplete
>   *
> 
>     igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@kms_cursor_legacy@basic-flip-before-cursor-varying-
>         size.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-4/igt@kms_cursor_legacy@basic-
>         flip-before-cursor-varying-size.html> (Intel XE#2705 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2705> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
>         bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html> (Intel
>         XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2291>) +4 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-adlp-3/
>         igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html> (Intel
>         XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-lnl-6/
>         igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html>
>         (Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/309>)
>   *
> 
>     igt@kms_draw_crc@draw-method-mmap-wc:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
>         igt@kms_draw_crc@draw-method-mmap-wc.html> -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
>         bmg-2/igt@kms_draw_crc@draw-method-mmap-wc.html> (Intel XE#3468
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +1
>         other test dmesg-fail
>   *
> 
>     igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
>         igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html> ->
>         DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-142196v2/shard-bmg-2/igt@kms_draw_crc@draw-method-mmap-
>         wc@rgb565-4tiled.html> (Intel XE#2705 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2705>)
>   *
> 
>     igt@kms_draw_crc@draw-method-mmap-wc@xrgb8888-4tiled:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
>         igt@kms_draw_crc@draw-method-mmap-wc@xrgb8888-4tiled.html> ->
>         DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-142196v2/shard-bmg-2/igt@kms_draw_crc@draw-method-mmap-
>         wc@xrgb8888-4tiled.html> (Intel XE#2705 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2705> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_feature_discovery@display-2x:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
>         igt@kms_feature_discovery@display-2x.html> -> SKIP <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-5/
>         igt@kms_feature_discovery@display-2x.html> (Intel XE#2373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373>)
>   *
> 
>     igt@kms_feature_discovery@display-4x:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-4/
>         igt@kms_feature_discovery@display-4x.html> (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
>   *
> 
>     igt@kms_flip@2x-nonexisting-fb:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@kms_flip@2x-nonexisting-fb.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-6/
>         igt@kms_flip@2x-nonexisting-fb.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +6 other
>         tests skip
>   *
> 
>     igt@kms_flip@2x-plain-flip-fb-recreate@ab-dp2-hdmi-a3:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-7/igt@kms_flip@2x-plain-flip-
>         fb-recreate@ab-dp2-hdmi-a3.html> (Intel XE#2882 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2882>)
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-3/igt@kms_flip@flip-vs-
>         expired-vblank@c-hdmi-a3.html> (Intel XE#3321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3321>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-render:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-lnl-6/
>         igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-
>         render.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-adlp-3/
>         igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html>
>         (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/651>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-adlp-3/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-
>         blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/656>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-adlp-3/
>         igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>)
>   *
> 
>     igt@kms_hdr@bpc-switch-suspend:
> 
>       o shard-bmg: NOTRUN -> DMESG-FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-142196v2/shard-bmg-4/igt@kms_hdr@bpc-switch-
>         suspend.html> (Intel XE#2705 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2705> / Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_hdr@static-toggle-suspend:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
>         igt@kms_hdr@static-toggle-suspend.html> -> SKIP <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-5/
>         igt@kms_hdr@static-toggle-suspend.html> (Intel XE#1503 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1503>)
>   *
> 
>     igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-8/
>         igt@kms_joiner@invalid-modeset-force-big-joiner.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
>         bmg-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>         (Intel XE#3012 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3012>)
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-3:
> 
>       o shard-bmg: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-142196v2/shard-bmg-6/
>         igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-3.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_plane_multiple@tiling-4:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-7/
>         igt@kms_plane_multiple@tiling-4.html> -> DMESG-WARN <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-4/
>         igt@kms_plane_multiple@tiling-4.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2705> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_plane_multiple@tiling-4@pipe-a-dp-2:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-7/
>         igt@kms_plane_multiple@tiling-4@pipe-a-dp-2.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
>         bmg-4/igt@kms_plane_multiple@tiling-4@pipe-a-dp-2.html> (Intel
>         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-lnl-6/
>         igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-
>         factor-0-25.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +3 other
>         tests skip
>   *
> 
>     igt@kms_pm_backlight@basic-brightness:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-4/igt@kms_pm_backlight@basic-
>         brightness.html> (Intel XE#870 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_rpm@legacy-planes@plane-68:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-adlp-8/
>         igt@kms_pm_rpm@legacy-planes@plane-68.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
>         adlp-1/igt@kms_pm_rpm@legacy-planes@plane-68.html> (Intel
>         XE#2953 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2953> / Intel XE#3086 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3086>) +1 other test dmesg-warn
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-lnl-6/igt@kms_pm_rpm@modeset-non-
>         lpsp-stress.html> (Intel XE#1439 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1439> / Intel
>         XE#3141 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141>)
>   *
> 
>     igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-4/igt@kms_psr2_sf@psr2-
>         overlay-primary-update-sf-dmg-area.html> (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>   *
> 
>     igt@kms_psr@psr-no-drrs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-6/igt@kms_psr@psr-no-
>         drrs.html> (Intel XE#2234 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2234> / Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850>)
>   *
> 
>     igt@kms_setmode@invalid-clone-single-crtc-stealing:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-8/
>         igt@kms_setmode@invalid-clone-single-crtc-stealing.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
>         bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html>
>         (Intel XE#1435 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1435>) +1 other test skip
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-lnl-1/
>         igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/
>         shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-
>         edp-1.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/899>)
>   *
> 
>     igt@kms_vblank@wait-forked-busy@pipe-a-dp-2:
> 
>       o shard-bmg: NOTRUN -> DMESG-FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-142196v2/shard-bmg-7/igt@kms_vblank@wait-
>         forked-busy@pipe-a-dp-2.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) +4 other
>         tests dmesg-fail
>   *
> 
>     igt@xe_compute@ccs-mode-basic:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-7/
>         igt@xe_compute@ccs-mode-basic.html> -> DMESG-WARN <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-4/
>         igt@xe_compute@ccs-mode-basic.html> (Intel XE#2705 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2705>)
>   *
> 
>     igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-adlp-3/igt@xe_evict@evict-beng-
>         mixed-threads-large-multi-vm.html> (Intel XE#261 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/261> / Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>   *
> 
>     igt@xe_exec_balancer@once-cm-parallel-userptr-rebind:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-adlp-2/
>         igt@xe_exec_balancer@once-cm-parallel-userptr-rebind.html> ->
>         TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-142196v2/shard-adlp-8/igt@xe_exec_balancer@once-cm-parallel-
>         userptr-rebind.html> (Intel XE#1033 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel
>         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727>) +2 other tests timeout
>   *
> 
>     igt@xe_exec_basic@twice-bindexecqueue-userptr:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@xe_exec_basic@twice-bindexecqueue-userptr.html> -> DMESG-
>         WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/
>         shard-bmg-6/igt@xe_exec_basic@twice-bindexecqueue-userptr.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727>)
>   *
> 
>     igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-adlp-8/
>         igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html>
>         -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-142196v2/shard-adlp-1/igt@xe_fault_injection@vm-create-fail-
>         xe_vm_create_scratch.html> (Intel XE#3086 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3086>)
>   *
> 
>     igt@xe_module_load@reload-no-display:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@xe_module_load@reload-no-display.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
>         bmg-4/igt@xe_module_load@reload-no-display.html> (Intel XE#3467
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467>) +1
>         other test dmesg-warn
>   *
> 
>     igt@xe_pm@s2idle-d3hot-basic-exec:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@xe_pm@s2idle-d3hot-basic-exec.html> -> ABORT <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-3/
>         igt@xe_pm@s2idle-d3hot-basic-exec.html> (Intel XE#1616 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1616>)
>   *
> 
>     igt@xe_pm@s4-mocs:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-adlp-4/
>         igt@xe_pm@s4-mocs.html> -> ABORT <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-142196v2/shard-adlp-9/igt@xe_pm@s4-
>         mocs.html> (Intel XE#1794 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_query@multigpu-query-topology-l3-bank-mask:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-adlp-3/igt@xe_query@multigpu-
>         query-topology-l3-bank-mask.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
> 
>       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-142196v2/shard-bmg-4/
>         igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html>
>         (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) +16 other tests dmesg-warn
>   *
> 
>     igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@rcs:
> 
>       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-142196v2/shard-bmg-4/
>         igt@xe_sysfs_preempt_timeout@preempt_timeout_us-
>         timeout@rcs.html> (Intel XE#2705 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2705>)
>   *
> 
>     igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@vecs:
> 
>       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-142196v2/shard-bmg-4/
>         igt@xe_sysfs_preempt_timeout@preempt_timeout_us-
>         timeout@vecs.html> (Intel XE#2705 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2705> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_big_fb@linear-8bpp-rotate-180:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-8/
>         igt@kms_big_fb@linear-8bpp-rotate-180.html> (Intel XE#3468
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/
>         shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate-180.html> +6 other
>         tests pass
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-adlp-4/
>         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-
>         flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1231>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-142196v2/shard-adlp-8/igt@kms_big_fb@y-
>         tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>   *
> 
>     igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-8/
>         igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html>
>         (Intel XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2705>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-142196v2/shard-bmg-6/igt@kms_bw@connected-linear-
>         tiling-1-displays-2560x1440p.html>
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-
>         varying-size.html> (Intel XE#877 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
>         bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-
>         varying-size.html>
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-6/
>         igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html> (Intel
>         XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2291>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-142196v2/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-
>         flipb-legacy.html> +7 other tests pass
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-6/
>         igt@kms_dither@fb-8bpc-vs-panel-6bpc.html> (Intel XE#1340
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/
>         shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>   *
> 
>     igt@kms_flip@2x-blocking-wf_vblank:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-6/
>         igt@kms_flip@2x-blocking-wf_vblank.html> (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/
>         shard-bmg-8/igt@kms_flip@2x-blocking-wf_vblank.html> +11 other
>         tests pass
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-
>         downscaling.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2705> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-6/
>         igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-
>         downscaling.html> +1 other test pass
>   *
> 
>     igt@kms_hdr@static-swap:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-5/
>         igt@kms_hdr@static-swap.html> (Intel XE#1503 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
>         bmg-4/igt@kms_hdr@static-swap.html> +1 other test pass
>   *
> 
>     igt@kms_lease@cursor-implicit-plane:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-
>         adlp-4/igt@kms_lease@cursor-implicit-plane.html> (Intel XE#3086
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/
>         shard-adlp-1/igt@kms_lease@cursor-implicit-plane.html> +2 other
>         tests pass
>   *
> 
>     igt@kms_plane@plane-panning-top-left@pipe-a:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
>         igt@kms_plane@plane-panning-top-left@pipe-a.html> -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
>         bmg-2/igt@kms_plane@plane-panning-top-left@pipe-a.html>
>   *
> 
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-6/
>         igt@kms_plane_scaling@2x-scaler-multi-pipe.html> (Intel XE#2571
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/
>         shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>   *
> 
>     igt@xe_exec_basic@twice-userptr-rebind:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@xe_exec_basic@twice-userptr-rebind.html> (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/
>         shard-bmg-4/igt@xe_exec_basic@twice-userptr-rebind.html> +1
>         other test pass
>   *
> 
>     igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-
>         invalidate-race.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
>         bmg-6/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-
>         invalidate-race.html> +21 other tests pass
>   *
> 
>     igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@xe_fault_injection@inject-fault-probe-function-
>         wait_for_lmem_ready.html> (Intel XE#3467 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3467>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
>         bmg-4/igt@xe_fault_injection@inject-fault-probe-function-
>         wait_for_lmem_ready.html>
>   *
> 
>     igt@xe_module_load@many-reload:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-
>         adlp-4/igt@xe_module_load@many-reload.html> (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#3086 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3086>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-142196v2/shard-adlp-1/igt@xe_module_load@many-reload.html>
>   *
> 
>     igt@xe_pm@s4-basic-exec:
> 
>       o shard-lnl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-lnl-2/
>         igt@xe_pm@s4-basic-exec.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel
>         XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-lnl-6/igt@xe_pm@s4-
>         basic-exec.html>
>   *
> 
>     igt@xe_pm@s4-d3hot-basic-exec:
> 
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-adlp-9/
>         igt@xe_pm@s4-d3hot-basic-exec.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel
>         XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1607>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-142196v2/shard-adlp-3/igt@xe_pm@s4-d3hot-basic-exec.html>
>   *
> 
>     igt@xe_vm@large-userptr-split-binds-134217728:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@xe_vm@large-userptr-split-binds-134217728.html> -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
>         bmg-4/igt@xe_vm@large-userptr-split-binds-134217728.html> +2
>         other tests pass
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_big_fb@linear-64bpp-rotate-180:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-7/
>         igt@kms_big_fb@linear-64bpp-rotate-180.html> (Intel XE#3468
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468> /
>         Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/877>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-4/igt@kms_big_fb@linear-64bpp-
>         rotate-180.html> (Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468> / Intel XE#877 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
>   *
> 
>     igt@kms_big_fb@x-tiled-16bpp-rotate-0:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
>         igt@kms_big_fb@x-tiled-16bpp-rotate-0.html> (Intel XE#3468
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-142196v2/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-
>         rotate-0.html> (Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>) +5 other tests dmesg-warn
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
>         igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-
>         flip.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1727> / Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
>         bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-
>         async-flip.html> (Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-adlp-9/
>         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-
>         flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1231>) -> DMESG-FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-adlp-3/
>         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-
>         flip.html> (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/324>) +1 other test dmesg-fail
>   *
> 
>     igt@kms_content_protection@atomic:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-5/
>         igt@kms_content_protection@atomic.html> (Intel XE#2341 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
>         bmg-7/igt@kms_content_protection@atomic.html> (Intel XE#2715
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715> /
>         Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>)
>   *
> 
>     igt@kms_content_protection@legacy:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-5/
>         igt@kms_content_protection@legacy.html> (Intel XE#2341 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
>         bmg-7/igt@kms_content_protection@legacy.html> (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>   *
> 
>     igt@kms_content_protection@uevent:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-8/
>         igt@kms_content_protection@uevent.html> (Intel XE#1188 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1188>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
>         bmg-5/igt@kms_content_protection@uevent.html> (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-8/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html> (Intel
>         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-142196v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-
>         flipa-atomic.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>)
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-4/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html> (Intel
>         XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2291>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-7/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html> (Intel
>         XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-8/
>         igt@kms_flip@2x-flip-vs-expired-vblank.html> (Intel XE#3468
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/
>         shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html> (Intel
>         XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2882>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-142196v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-
>         vblank-interruptible.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-rmfb:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@kms_flip@2x-flip-vs-rmfb.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
>         bmg-6/igt@kms_flip@2x-flip-vs-rmfb.html> (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html> (Intel
>         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-4/
>         igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html> (Intel
>         XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
>   *
> 
>     igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-5/
>         igt@kms_flip@2x-plain-flip-fb-recreate.html> (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/
>         shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html> (Intel
>         XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>)
>   *
> 
>     igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-5/
>         igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-
>         interruptible.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
>         bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-
>         interruptible.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-
>     upscaling@pipe-a-valid-mode:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
>         igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-
>         upscaling@pipe-a-valid-mode.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-2/
>         igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-
>         upscaling@pipe-a-valid-mode.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) +1 other test incomplete
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
>         igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-
>         downscaling.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2705> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>) -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-2/
>         igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-
>         downscaling.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2705> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>) +1 other test incomplete
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-
>         blt.html> (Intel XE#2333 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2333>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-142196v2/shard-bmg-7/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-
>         blt.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/3468>) +1 other test dmesg-fail
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/3468>) -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-
>         blt.html> (Intel XE#2333 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2333>) +1 other test fail
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-adlp-2/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-
>         render.html> (Intel XE#1861 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1861>) -> TIMEOUT <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-142196v2/shard-adlp-8/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-
>         render.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1033> / Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-
>         fullscreen.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-3/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-
>         fullscreen.html> (Intel XE#2333 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2333>) +9 other tests fail
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
> 
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-7/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-
>         onoff.html> (Intel XE#3468 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3468>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-142196v2/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-
>         onoff.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) +6 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-
>         blt.html> (Intel XE#2333 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2333>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-8/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         move.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1727> / Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
>         bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         move.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-adlp-2/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-
>         blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) -> TIMEOUT <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-142196v2/shard-adlp-8/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-
>         blt.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1033> / Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-7/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-
>         blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2311>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +23 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-
>         render.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-142196v2/shard-bmg-3/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-
>         render.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2311>) +27 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-7/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) +28 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-adlp-2/
>         igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html>
>         (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/653>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-142196v2/shard-adlp-8/
>         igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html>
>         (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-3/
>         igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-
>         onoff.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2313>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-142196v2/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-
>         onoff.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) +19 other tests skip
>   *
> 
>     igt@kms_plane_lowres@tiling-4:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@kms_plane_lowres@tiling-4.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
>         bmg-4/igt@kms_plane_lowres@tiling-4.html> (Intel XE#2705
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705> /
>         Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>)
>   *
> 
>     igt@kms_properties@connector-properties-atomic:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@kms_properties@connector-properties-atomic.html> (Intel
>         XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2705>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-4/
>         igt@kms_properties@connector-properties-atomic.html> (Intel
>         XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2705> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_vblank@ts-continuation-dpms-rpm:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@kms_vblank@ts-continuation-dpms-rpm.html> (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-4/igt@kms_vblank@ts-
>         continuation-dpms-rpm.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2.html> (Intel
>         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>) -> DMESG-FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-4/
>         igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2.html> (Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@kms_vblank@wait-forked-busy:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-5/
>         igt@kms_vblank@wait-forked-busy.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
>         bmg-7/igt@kms_vblank@wait-forked-busy.html> (Intel XE#3468
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@xe_ccs@block-multicopy-inplace:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@xe_ccs@block-multicopy-inplace.html> (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-142196v2/shard-bmg-4/igt@xe_ccs@block-multicopy-inplace.html>
>         (Intel XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) +1 other test dmesg-warn
>   *
> 
>     igt@xe_evict@evict-beng-threads-large:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-5/
>         igt@xe_evict@evict-beng-threads-large.html> (Intel XE#1000
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000>) ->
>         TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-142196v2/shard-bmg-7/igt@xe_evict@evict-beng-threads-
>         large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1473>)
>   *
> 
>     igt@xe_evict@evict-threads-large:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-8/
>         igt@xe_evict@evict-threads-large.html> (Intel XE#1000 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1000>) -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
>         bmg-6/igt@xe_evict@evict-threads-large.html> (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#2472 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2472>)
>   *
> 
>     igt@xe_exec_reset@parallel-gt-reset:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@xe_exec_reset@parallel-gt-reset.html> (Intel XE#3468
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-142196v2/shard-bmg-4/igt@xe_exec_reset@parallel-gt-
>         reset.html> (Intel XE#2705 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2705>)
>   *
> 
>     igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-8/
>         igt@xe_fault_injection@inject-fault-probe-function-
>         xe_guc_log_init.html> (Intel XE#3343 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3343> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-6/
>         igt@xe_fault_injection@inject-fault-probe-function-
>         xe_guc_log_init.html> (Intel XE#3343 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3343>)
>   *
> 
>     igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@xe_fault_injection@inject-fault-probe-function-
>         xe_guc_relay_init.html> (Intel XE#3343 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3343> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-142196v2/shard-bmg-6/
>         igt@xe_fault_injection@inject-fault-probe-function-
>         xe_guc_relay_init.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#3343 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343>)
>   *
> 
>     igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-5/
>         igt@xe_fault_injection@inject-fault-probe-function-
>         xe_wa_init.html> (Intel XE#3467 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3467>) -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-7/
>         igt@xe_fault_injection@inject-fault-probe-function-
>         xe_wa_init.html> (Intel XE#3467 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3467> / Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@xe_pm@s3-vm-bind-userptr:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-8/
>         igt@xe_pm@s3-vm-bind-userptr.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3468> / Intel XE#569 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/569>) -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-6/igt@xe_pm@s3-
>         vm-bind-userptr.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468> / Intel XE#569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>)
>   *
> 
>     igt@xe_pm@s4-vm-bind-unbind-all:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@xe_pm@s4-vm-bind-unbind-all.html> (Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel
>         XE#2280 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2280> / Intel XE#3468 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3468>) -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-bmg-4/igt@xe_pm@s4-
>         vm-bind-unbind-all.html> (Intel XE#2280 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2280> / Intel
>         XE#3468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468>)
>   *
> 
>     igt@xe_wedged@wedged-mode-toggle:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080/shard-bmg-2/
>         igt@xe_wedged@wedged-mode-toggle.html> (Intel XE#3468 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3468>) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/shard-
>         bmg-6/igt@xe_wedged@wedged-mode-toggle.html> (Intel XE#3467
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467>)
> 
> 
>     Build changes
> 
>   * Linux: xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080 -> xe-
>     pw-142196v2
> 
> IGT_8147: df65b61f81a5cc919c10ff9c5ed516b45364135c @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080: 
> 7bbcd7df9387f0d9004f997df33f7a9472d9c080
> xe-pw-142196v2: 142196v2
> 

