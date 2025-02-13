Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6179C0219D
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 12:20:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2F110EA8C;
	Thu, 13 Feb 2025 12:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tga17HNF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3436D10EA7D
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 12:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739449204; x=1770985204;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=vPBkPehjN7lLZibU7hl/kTFdms073F7ASehq6WYVqO4=;
 b=Tga17HNF9ZfSerd0xgnAcAEwdklfAlsaS0rXPzwpiP5+LX2+HwYJZQ7s
 nIxMu9RJkHrR1GqIqqeg7XI3Nq2LGwp1hxVT+BoPD/7sSWuN49m5t3bD5
 xlc+1cCHenBFL1+4DecQKLwHOfarziCgVD7QeTUzkuerGIdyP+jnF/ax4
 s1U3b0u4ZA3A5GVU6pVjRUWJucRlGciqzxyixLxMiK1/7Do0xoVi9XQx2
 xoe5UhY0FcdDf1PF0hON+/TmFDaNw6UA/Jz3JP8tMVYs6sgkZFuuNnqIx
 qgRgDrF6l9+VwBeocidLCowqokiSX+l+LcjyKUhtosQp51gmJc3nHeJEr Q==;
X-CSE-ConnectionGUID: cIATTC7uR2WjIosTxT2pMQ==
X-CSE-MsgGUID: 5J+wM8qzTPqbsycWIj5vSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="51129530"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="51129530"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 04:20:04 -0800
X-CSE-ConnectionGUID: 3h5cnCY7RB2QmS/rqfia0g==
X-CSE-MsgGUID: iqcjOKVpTnS2mLNJgUpERA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="118063296"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.3.119])
 ([10.246.3.119])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 04:20:02 -0800
Message-ID: <89e73047-7aee-479d-b36d-3097ea113003@linux.intel.com>
Date: Thu, 13 Feb 2025 13:20:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBWRjogQXZvaWQg?=
 =?UTF-8?Q?reading_inaccessible_RING=5FTIMESTAMP_=28rev2=29?=
To: intel-xe@lists.freedesktop.org
References: <20250205191644.2550879-1-marcin.bernatowicz@linux.intel.com>
 <173879854932.1700188.7303980998703728801@b555e5b46a47>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <173879854932.1700188.7303980998703728801@b555e5b46a47>
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



On 2/6/2025 12:35 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	VF: Avoid reading inaccessible RING_TIMESTAMP (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/144335/ <https:// 
> patchwork.freedesktop.org/series/144335/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/ 
> index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe_full -> xe-
>   pw-144335v2_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-144335v2_full absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-144335v2_full, please notify your bug team (I915-ci- 
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
> pw-144335v2_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@core_getversion@all-cards:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-434/
>         igt@core_getversion@all-cards.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-dg2-464/
>         igt@core_getversion@all-cards.html>
>   *
> 
>     igt@core_getversion@basic:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-464/
>         igt@core_getversion@basic.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-144335v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-
>         indfb-scaledprimary.html>
>

Not related to the change.
--
marcin

> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   * {igt@xe_eudebug@discovery-race-sigint}:
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@xe_eudebug@discovery-race-sigint.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-463/igt@xe_eudebug@discovery-race-sigint.html>
> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-144335v2_full that come from known 
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
>     igt@fbdev@info:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-435/
>         igt@fbdev@info.html> -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-dg2-464/igt@fbdev@info.html>
>         (Intel XE#2134 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2134>)
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-
>     hdmi-a-6-4-mc-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-463/
>         igt@kms_async_flips@async-flip-with-page-flip-events-
>         atomic@pipe-b-hdmi-a-6-4-mc-ccs.html> (Intel XE#3767 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3767>) +15 other
>         tests skip
>   *
> 
>     igt@kms_async_flips@invalid-async-flip:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-5/igt@kms_async_flips@invalid-
>         async-flip.html> (Intel XE#873 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/873>)
>   *
> 
>     igt@kms_atomic_interruptible@legacy-cursor@pipe-a-dp-2:
> 
>       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-bmg-1/
>         igt@kms_atomic_interruptible@legacy-cursor@pipe-a-dp-2.html>
>         (Intel XE#4172 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4172>) +13 other tests dmesg-warn
>   *
> 
>     igt@kms_atomic_transition@plane-toggle-modeset-transition:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-adlp-2/
>         igt@kms_atomic_transition@plane-toggle-modeset-transition.html>
>         -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-144335v2/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-
>         modeset-transition.html> (Intel XE#3908 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3908>) +1 other test
>         fail
>   *
> 
>     igt@kms_big_fb@linear-64bpp-rotate-90:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-5/igt@kms_big_fb@linear-64bpp-
>         rotate-90.html> (Intel XE#2327 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2327>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-436/
>         igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-464/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) +9 other tests skip
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>       o shard-adlp: NOTRUN -> DMESG-FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-adlp-9/igt@kms_big_fb@x-
>         tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1033>)
>   *
> 
>     igt@kms_big_fb@y-tiled-64bpp-rotate-90:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-adlp-9/igt@kms_big_fb@y-
>         tiled-64bpp-rotate-90.html> (Intel XE#316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-434/igt@kms_big_fb@y-
>         tiled-max-hw-stride-64bpp-rotate-0-async-flip.html> (Intel
>         XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-
>         hw-stride-32bpp-rotate-180.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +5 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-adlp-9/igt@kms_big_fb@yf-tiled-
>         max-hw-stride-64bpp-rotate-180-async-flip.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1
>         other test skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-adlp-9/igt@kms_bw@connected-
>         linear-tiling-2-displays-2160x1440p.html> (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-5/
>         igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html> -
>          > SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-144335v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-
>         displays-2560x1440p.html> (Intel XE#2314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
>         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>)
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-4/igt@kms_bw@connected-linear-
>         tiling-4-displays-2160x1440p.html> (Intel XE#2314 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel
>         XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>)
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-2160x1440p:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-5/igt@kms_bw@linear-tiling-2-
>         displays-2160x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1 other test skip
>   *
> 
>     igt@kms_bw@linear-tiling-2-displays-3840x2160p:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-adlp-9/igt@kms_bw@linear-tiling-2-
>         displays-3840x2160p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_bw@linear-tiling-4-displays-3840x2160p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-434/igt@kms_bw@linear-
>         tiling-4-displays-3840x2160p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>   *
> 
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-463/igt@kms_ccs@bad-
>         pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html> (Intel
>         XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +153 other tests skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-6/igt@kms_ccs@bad-pixel-
>         format-y-tiled-gen12-mc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +8 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-adlp-9/igt@kms_ccs@crc-primary-
>         rotation-180-4-tiled-bmg-ccs.html> (Intel XE#2907 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-5/igt@kms_ccs@crc-primary-
>         rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html> (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +13 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-y-tiled-ccs:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-adlp-9/igt@kms_ccs@random-ccs-
>         data-y-tiled-ccs.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +7
>         other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-adlp-9/igt@kms_ccs@random-ccs-
>         data-y-tiled-ccs@pipe-b-hdmi-a-1.html> (Intel XE#787 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +11 other
>         tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-436/igt@kms_ccs@random-
>         ccs-data-yf-tiled-ccs@pipe-d-dp-4.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +23
>         other tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-blue-to-red:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-434/
>         igt@kms_chamelium_color@ctm-blue-to-red.html> (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_color@degamma:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-6/
>         igt@kms_chamelium_color@degamma.html> (Intel XE#2325 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2325>) +2 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-2/igt@kms_chamelium_hpd@dp-
>         hpd.html> (Intel XE#2252 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2252>) +4 other tests skip
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-434/
>         igt@kms_chamelium_hpd@dp-hpd.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1 other test skip
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-storm-disable:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-adlp-9/igt@kms_chamelium_hpd@dp-
>         hpd-storm-disable.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1 other test skip
>   *
> 
>     igt@kms_content_protection@atomic@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-436/
>         igt@kms_content_protection@atomic@pipe-a-dp-4.html> (Intel
>         XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>   *
> 
>     igt@kms_content_protection@legacy:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-5/
>         igt@kms_content_protection@legacy.html> (Intel XE#1178 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +4 other
>         tests fail
>   *
> 
>     igt@kms_content_protection@uevent@pipe-a-dp-2:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-1/
>         igt@kms_content_protection@uevent@pipe-a-dp-2.html> (Intel
>         XE#1188 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>)
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-6/igt@kms_cursor_crc@cursor-
>         onscreen-512x512.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-32x32:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-5/igt@kms_cursor_crc@cursor-
>         rapid-movement-32x32.html> (Intel XE#2320 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2320>)
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-4/
>         igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html> (Intel
>         XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2291>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-7/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html> (Intel
>         XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2291>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-adlp-9/
>         igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html> (Intel
>         XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-4/
>         igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-
>         transitions.html> (Intel XE#1475 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1475>)
>   *
> 
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-5/igt@kms_dirtyfb@drrs-
>         dirtyfb-ioctl.html> (Intel XE#1508 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1508>)
>   *
> 
>     igt@kms_fbcon_fbt@psr-suspend:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-2/igt@kms_fbcon_fbt@psr-
>         suspend.html> (Intel XE#776 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/776>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-434/
>         igt@kms_fbcon_fbt@psr-suspend.html> (Intel XE#776 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/776>)
>   *
> 
>     igt@kms_feature_discovery@chamelium:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-5/
>         igt@kms_feature_discovery@chamelium.html> (Intel XE#2372
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372>)
>   *
> 
>     igt@kms_feature_discovery@display-4x:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-adlp-9/
>         igt@kms_feature_discovery@display-4x.html> (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-2/
>         igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-
>         a3.html> (Intel XE#3321 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/3321>) +1 other test fail
>   *
> 
>     igt@kms_flip@2x-plain-flip:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-5/
>         igt@kms_flip@2x-plain-flip.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-bmg-6/
>         igt@kms_flip@2x-plain-flip.html> (Intel XE#2316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +6 other
>         tests skip
>   *
> 
>     igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-463/igt@kms_flip@2x-
>         plain-flip-fb-recreate@ab-hdmi-a6-dp4.html> (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>)
>   *
> 
>     igt@kms_flip@2x-plain-flip-interruptible@cd-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-dg2-436/
>         igt@kms_flip@2x-plain-flip-interruptible@cd-hdmi-a6-dp4.html>
>         (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1033>) +19 other tests dmesg-warn
>   *
> 
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-adlp-9/igt@kms_flip@2x-plain-flip-
>         ts-check-interruptible.html> (Intel XE#310 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/310>)
>   *
> 
>     igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-4/igt@kms_flip@2x-single-
>         buffer-flip-vs-dpms-off-vs-modeset.html> (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +1
>         other test skip
>   *
> 
>     igt@kms_flip@dpms-vs-vblank-race-interruptible:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-4/
>         igt@kms_flip@dpms-vs-vblank-race-interruptible.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         bmg-2/igt@kms_flip@dpms-vs-vblank-race-interruptible.html>
>         (Intel XE#3098 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3098>) +1 other test fail
>   *
> 
>     igt@kms_flip@flip-vs-panning@d-dp2:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-8/
>         igt@kms_flip@flip-vs-panning@d-dp2.html> -> DMESG-WARN <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-bmg-4/
>         igt@kms_flip@flip-vs-panning@d-dp2.html> (Intel XE#4172
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172>) +25
>         other tests dmesg-warn
>   *
> 
>     igt@kms_flip@plain-flip-fb-recreate:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-8/
>         igt@kms_flip@plain-flip-fb-recreate.html> -> FAIL <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-bmg-4/
>         igt@kms_flip@plain-flip-fb-recreate.html> (Intel XE#2882
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) +2
>         other tests fail
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-4/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-
>         downscaling.html> (Intel XE#2293 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2293> / Intel
>         XE#2380 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-
>     downscaling@pipe-a-valid-mode:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-4/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-
>         downscaling@pipe-a-valid-mode.html> (Intel XE#2293 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2293>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-
>     downscaling@pipe-a-valid-mode:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-436/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-
>         downscaling@pipe-a-valid-mode.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +8 other tests
>         skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-adlp-9/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-
>         mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-
>         blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-
>         render.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2311>) +11 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-
>         move.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +16 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-
>         fullscreen.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) +10 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html> (Intel
>         XE#4141 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4141>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbc-tiling-y.html> (Intel XE#2352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-
>         blt.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4208>) +128 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html>
>         (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2313>) +7 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-adlp-9/
>         igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-
>         mmap-wc.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/653>) +3 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-adlp-9/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-
>         fullscreen.html> (Intel XE#656 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/656>) +8 other tests skip
>   *
> 
>     igt@kms_lease@lease-invalid-crtc:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-466/
>         igt@kms_lease@lease-invalid-crtc.html> -> SKIP <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-dg2-464/
>         igt@kms_lease@lease-invalid-crtc.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +78 other tests skip
>   *
> 
>     igt@kms_panel_fitting@legacy:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-5/
>         igt@kms_panel_fitting@legacy.html> (Intel XE#2486 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2486>)
>   *
> 
>     igt@kms_plane@pixel-format@pipe-a-plane-3:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-dg2-434/
>         igt@kms_plane@pixel-format@pipe-a-plane-3.html> (Intel XE#1035
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035>) +1
>         other test incomplete
>   *
> 
>     igt@kms_plane_lowres@tiling-y:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-2/igt@kms_plane_lowres@tiling-
>         y.html> (Intel XE#2393 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2393>)
>   *
> 
>     igt@kms_plane_lowres@tiling-yf:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-adlp-9/
>         igt@kms_plane_lowres@tiling-yf.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2 other tests
>         skip
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-dg2-436/
>         igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html>
>         (Intel XE#4212 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4212>) +1 other test dmesg-warn
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-
>     format@pipe-b:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-463/
>         igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-
>         format@pipe-b.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +8 other
>         tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-464/
>         igt@kms_plane_scaling@plane-downscale-factor-0-5-with-
>         modifiers.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +44 other
>         tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-463/
>         igt@kms_plane_scaling@planes-downscale-factor-0-25-
>         upscale-20x20@pipe-d.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2
>         other tests skip
>   *
> 
>     igt@kms_pm_backlight@basic-brightness:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-434/
>         igt@kms_pm_backlight@basic-brightness.html> (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_backlight@brightness-with-dpms:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-5/
>         igt@kms_pm_backlight@brightness-with-dpms.html> (Intel XE#2938
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938>)
>   *
> 
>     igt@kms_pm_dc@dc5-psr:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-4/igt@kms_pm_dc@dc5-psr.html>
>         (Intel XE#2392 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2392>)
>   *
> 
>     igt@kms_pm_rpm@dpms-mode-unset-lpsp:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-
>         unset-lpsp.html> (Intel XE#1439 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1439> / Intel XE#836 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/836>)
>   *
> 
>     igt@kms_pm_rpm@i2c:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-adlp-8/
>         igt@kms_pm_rpm@i2c.html> -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-adlp-8/
>         igt@kms_pm_rpm@i2c.html> (Intel XE#4173 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4173>) +3 other
>         tests dmesg-warn
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-
>         cursor-plane-move-continuous-sf.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2 other
>         tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-adlp-9/igt@kms_psr2_sf@fbc-psr2-
>         cursor-plane-update-sf.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1 other test
>         skip
>   *
> 
>     igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-434/igt@kms_psr2_sf@pr-
>         overlay-primary-update-sf-dmg-area.html> (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>   *
> 
>     igt@kms_psr2_su@page_flip-xrgb8888:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-4/igt@kms_psr2_su@page_flip-
>         xrgb8888.html> (Intel XE#2387 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2387>) +1 other test skip
>   *
> 
>     igt@kms_psr@fbc-pr-sprite-render:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-adlp-9/igt@kms_psr@fbc-pr-sprite-
>         render.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2850> / Intel XE#929 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +3 other tests
>         skip
>   *
> 
>     igt@kms_psr@psr-basic:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-5/igt@kms_psr@psr-basic.html>
>         (Intel XE#2234 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2234> / Intel XE#2850 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2850>) +8 other tests skip
>   *
> 
>     igt@kms_psr@psr-primary-page-flip:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-434/igt@kms_psr@psr-
>         primary-page-flip.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +2
>         other tests skip
>   *
> 
>     igt@kms_rotation_crc@bad-pixel-format:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-5/igt@kms_rotation_crc@bad-
>         pixel-format.html> (Intel XE#3414 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3414> / Intel
>         XE#3904 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>)
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-434/
>         igt@kms_rotation_crc@sprite-rotation-270.html> (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>)
>   *
> 
>     igt@kms_setmode@clone-exclusive-crtc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-4/igt@kms_setmode@clone-
>         exclusive-crtc.html> (Intel XE#1435 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1435>) +2 other
>         tests skip
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-adlp-2/
>         igt@kms_universal_plane@cursor-fb-leak.html> -> FAIL <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-adlp-6/
>         igt@kms_universal_plane@cursor-fb-leak.html> (Intel XE#771
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/771> /
>         Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/899>)
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-lnl-4/
>         igt@kms_universal_plane@cursor-fb-leak.html> -> FAIL <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-lnl-1/
>         igt@kms_universal_plane@cursor-fb-leak.html> (Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) +1
>         other test fail
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-adlp-2/
>         igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-
>         a-1.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/899>)
>   *
> 
>     igt@kms_vrr@max-min:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-2/igt@kms_vrr@max-min.html>
>         (Intel XE#1499 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1499>)
>   *
> 
>     igt@xe_compute_preempt@compute-threadgroup-preempt@engine-
>     drm_xe_engine_class_compute:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-436/
>         igt@xe_compute_preempt@compute-threadgroup-preempt@engine-
>         drm_xe_engine_class_compute.html> (Intel XE#1280 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1280> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>   *
> 
>     igt@xe_copy_basic@mem-set-linear-0x369:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-434/
>         igt@xe_copy_basic@mem-set-linear-0x369.html> (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>   *
> 
>     igt@xe_create@multigpu-create-massive-size:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-5/igt@xe_create@multigpu-
>         create-massive-size.html> (Intel XE#2504 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2504>)
>   *
> 
>     igt@xe_eudebug@basic-exec-queues-enable:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-adlp-9/igt@xe_eudebug@basic-exec-
>         queues-enable.html> (Intel XE#2905 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +2 other
>         tests skip
>   *
> 
>     igt@xe_eudebug@exec-queue-placements:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-2/igt@xe_eudebug@exec-queue-
>         placements.html> (Intel XE#2905 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2905>) +6 other tests skip
>   *
> 
>     igt@xe_eudebug@sysfs-toggle:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-434/igt@xe_eudebug@sysfs-
>         toggle.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2905>) +2 other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-
>     userptr:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-5/igt@xe_exec_basic@multigpu-
>         many-execqueues-many-vm-bindexecqueue-userptr.html> (Intel
>         XE#2322 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2322>) +4 other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-adlp-9/igt@xe_exec_basic@multigpu-
>         many-execqueues-many-vm-userptr-invalidate.html> (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +2
>         other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-
>     invalidate-imm:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-adlp-9/
>         igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-
>         invalidate-imm.html> (Intel XE#288 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +6 other tests
>         skip
>   *
> 
>     igt@xe_exec_fault_mode@once-rebind-prefetch:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-434/
>         igt@xe_exec_fault_mode@once-rebind-prefetch.html> (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +3
>         other tests skip
>   *
> 
>     igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-434/
>         igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html> (Intel
>         XE#2360 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>   *
> 
>     igt@xe_exec_threads@threads-hang-fd-rebind:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-434/
>         igt@xe_exec_threads@threads-hang-fd-rebind.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-466/igt@xe_exec_threads@threads-hang-fd-rebind.html> (Intel
>         XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>)
>   *
> 
>     igt@xe_live_ktest@xe_migrate:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-4/
>         igt@xe_live_ktest@xe_migrate.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-bmg-2/
>         igt@xe_live_ktest@xe_migrate.html> (Intel XE#1192 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1192>)
>   *
> 
>     igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-464/
>         igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html> (Intel
>         XE#1999 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1999>) +2 other tests fail
>   *
> 
>     igt@xe_module_load@force-load:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-adlp-9/igt@xe_module_load@force-
>         load.html> (Intel XE#378 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/378>)
>   *
> 
>     igt@xe_oa@invalid-oa-exponent:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-434/igt@xe_oa@invalid-oa-
>         exponent.html> (Intel XE#2541 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2541> / Intel XE#3573 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +1 other test
>         skip
>   *
> 
>     igt@xe_oa@syncs-syncobj-wait:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-adlp-9/igt@xe_oa@syncs-syncobj-
>         wait.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2541> / Intel XE#3573 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3573>)
>   *
> 
>     igt@xe_pat@pat-index-xehpc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-434/igt@xe_pat@pat-index-
>         xehpc.html> (Intel XE#2838 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2838> / Intel XE#979 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>   *
> 
>     igt@xe_pm@d3cold-mmap-system:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-adlp-9/igt@xe_pm@d3cold-mmap-
>         system.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284> / Intel XE#366 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>   *
> 
>     igt@xe_pm@s2idle-d3cold-basic-exec:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-6/igt@xe_pm@s2idle-d3cold-
>         basic-exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2284>) +1 other test skip
>   *
> 
>     igt@xe_pm@s2idle-exec-after:
> 
>       o shard-adlp: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-adlp-9/igt@xe_pm@s2idle-exec-
>         after.html> (Intel XE#4173 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4173>)
>   *
> 
>     igt@xe_pm@s4-basic:
> 
>       o shard-adlp: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-adlp-9/igt@xe_pm@s4-basic.html>
>         (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1607>)
>   *
> 
>     igt@xe_pm@s4-exec-after:
> 
>       o shard-bmg: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-2/igt@xe_pm@s4-exec-
>         after.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1358> / Intel XE#1607 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel
>         XE#4172 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172>)
>       o shard-dg2-set2: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-434/igt@xe_pm@s4-exec-
>         after.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1033> / Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358>)
>   *
> 
>     igt@xe_query@multigpu-query-config:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-adlp-9/igt@xe_query@multigpu-
>         query-config.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_query@multigpu-query-hwconfig:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-5/igt@xe_query@multigpu-query-
>         hwconfig.html> (Intel XE#944 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/944>)
>   *
> 
>     igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-463/
>         igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-
>         partial.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-464/igt@xe_vm@munmap-style-unbind-
>         userptr-inval-many-either-side-partial.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +198
>         other tests skip
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@fbdev@read:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@fbdev@read.html> (Intel XE#2134 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2134>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-463/igt@fbdev@read.html> +2 other tests pass
>   *
> 
>     igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_atomic_transition@modeset-transition-nonblocking-
>         fencing.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-463/igt@kms_atomic_transition@modeset-transition-
>         nonblocking-fencing.html> +120 other tests pass
>   *
> 
>     igt@kms_big_fb@linear-32bpp-rotate-0:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-
>         adlp-6/igt@kms_big_fb@linear-32bpp-rotate-0.html> -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         adlp-2/igt@kms_big_fb@linear-32bpp-rotate-0.html> +2 other tests
>         pass
>   *
> 
>     igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-4/
>         igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html>
>         (Intel XE#2314 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2314> / Intel XE#2894 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2894>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-bmg-7/
>         igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html>
>         +1 other test pass
>   *
> 
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-7/
>         igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html> (Intel
>         XE#3862 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3862>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-
>         tiled-bmg-ccs.html> +1 other test pass
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-
>         dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#3124 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3124> / Intel XE#4010 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4010>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-
>         dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-
>         dp-4.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1727> / Intel XE#3113 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3113> / Intel
>         XE#3124 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3124> / Intel XE#4010 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4010>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-dg2-434/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html>
>   *
> 
>     igt@kms_cursor_crc@cursor-random-256x256:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-8/
>         igt@kms_cursor_crc@cursor-random-256x256.html> -> PASS <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-bmg-4/
>         igt@kms_cursor_crc@cursor-random-256x256.html> +1 other test pass
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-4/
>         igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html> (Intel
>         XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2291>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-
>         flipb-varying-size.html> +4 other tests pass
>   *
> 
>     igt@kms_dp_aux_dev:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-6/
>         igt@kms_dp_aux_dev.html> (Intel XE#3009 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3009>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         bmg-1/igt@kms_dp_aux_dev.html>
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-463/
>         igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html>
>         (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-144335v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-
>         vblank@ad-hdmi-a6-dp4.html> +2 other tests pass
>   *
> 
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-6/
>         igt@kms_flip@2x-plain-flip-ts-check-interruptible.html> (Intel
>         XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2316>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-
>         check-interruptible.html> +11 other tests pass
>   *
> 
>     igt@kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-5/
>         igt@kms_flip@2x-wf_vblank-ts-check@ac-dp2-hdmi-a3.html> (Intel
>         XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2882>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-
>         check@ac-dp2-hdmi-a3.html>
>   *
> 
>     igt@kms_flip@flip-vs-suspend:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-7/
>         igt@kms_flip@flip-vs-suspend.html> (Intel XE#2049 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2049> / Intel
>         XE#2597 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2597>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html>
>         +2 other tests pass
>   *
> 
>     igt@kms_flip@plain-flip-fb-recreate@a-edp1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-lnl-1/
>         igt@kms_flip@plain-flip-fb-recreate@a-edp1.html> (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html> +1
>         other test pass
>   *
> 
>     igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-adlp-2/
>         igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html> (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-adlp-6/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html> +1
>         other test pass
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-
>         upscaling.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-
>         linear-upscaling.html> +13 other tests pass
>   *
> 
>     igt@kms_joiner@basic-force-big-joiner:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-6/
>         igt@kms_joiner@basic-force-big-joiner.html> (Intel XE#3012
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html>
>   *
> 
>     igt@kms_plane@plane-panning-bottom-right-suspend:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-
>         adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html>
>         (Intel XE#4173 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4173>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-adlp-2/igt@kms_plane@plane-panning-
>         bottom-right-suspend.html> +4 other tests pass
>   *
> 
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-4/
>         igt@kms_plane_scaling@2x-scaler-multi-pipe.html> (Intel XE#2571
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>   *
> 
>     igt@kms_setmode@invalid-clone-single-crtc-stealing:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-4/
>         igt@kms_setmode@invalid-clone-single-crtc-stealing.html> (Intel
>         XE#1435 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1435>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-bmg-7/igt@kms_setmode@invalid-clone-
>         single-crtc-stealing.html>
>   *
> 
>     igt@xe_exec_balancer@twice-virtual-basic:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@xe_exec_balancer@twice-virtual-basic.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-463/igt@xe_exec_balancer@twice-virtual-basic.html>
>         +262 other tests pass
>   *
> 
>     igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-
>         dg2-435/igt@xe_fault_injection@vm-bind-fail-
>         xe_pt_update_ops_prepare.html> (Intel XE#1033 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-466/igt@xe_fault_injection@vm-bind-fail-
>         xe_pt_update_ops_prepare.html> +1 other test pass
>   *
> 
>     igt@xe_module_load@many-reload:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-
>         adlp-9/igt@xe_module_load@many-reload.html> (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-adlp-9/igt@xe_module_load@many-reload.html>
>   *
> 
>     igt@xe_module_load@reload:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@xe_module_load@reload.html> -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-dg2-436/
>         igt@xe_module_load@reload.html> +2 other tests pass
>   *
> 
>     igt@xe_oa@mmio-triggered-reports:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-1/
>         igt@xe_oa@mmio-triggered-reports.html> (Intel XE#4172 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4172>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         bmg-7/igt@xe_oa@mmio-triggered-reports.html> +12 other tests pass
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_big_fb@4-tiled-8bpp-rotate-270:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_big_fb@4-tiled-8bpp-rotate-270.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html>
>         (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/316>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-434/
>         igt@kms_big_fb@4-tiled-8bpp-rotate-90.html> (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-464/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html> (Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_big_fb@linear-16bpp-rotate-90:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_big_fb@linear-16bpp-rotate-90.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-463/igt@kms_big_fb@linear-16bpp-
>         rotate-90.html> (Intel XE#316 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/316>) +3 other tests skip
>   *
> 
>     igt@kms_big_fb@linear-32bpp-rotate-0:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-
>         dg2-434/igt@kms_big_fb@linear-32bpp-rotate-0.html> (Intel
>         XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1033>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-464/igt@kms_big_fb@linear-32bpp-
>         rotate-0.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) +5 other tests skip
>   *
> 
>     igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-435/
>         igt@kms_big_fb@linear-8bpp-rotate-270.html> (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-464/igt@kms_big_fb@linear-8bpp-rotate-270.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-463/
>         igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html> (Intel
>         XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/607>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-144335v2/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-
>         offset-overflow.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_big_fb@y-tiled-addfb-size-overflow.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-overflow.html>
>         (Intel XE#610 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/610>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-
>         flip.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-
>         hflip-async-flip.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-436/
>         igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) +5 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-466/
>         igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html>
>         (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) +7 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_big_fb@yf-tiled-addfb.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-
>         addfb.html> (Intel XE#619 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/619>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-
>         size-offset-overflow.html> (Intel XE#607 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-
>         async-flip.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-dg2-463/
>         igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-
>         async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1124>) +9 other tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-dg2-463/
>         igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2191>) +1 other test skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-436/
>         igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html>
>         (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2191>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-464/igt@kms_bw@connected-linear-
>         tiling-4-displays-3840x2160p.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +2 other tests skip
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-2160x1440p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_bw@linear-tiling-3-displays-2160x1440p.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-dg2-463/
>         igt@kms_bw@linear-tiling-3-displays-2160x1440p.html> (Intel
>         XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/367>) +4 other tests skip
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-3840x2160p:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-463/
>         igt@kms_bw@linear-tiling-3-displays-3840x2160p.html> (Intel
>         XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-144335v2/shard-dg2-464/igt@kms_bw@linear-tiling-3-
>         displays-3840x2160p.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +2 other tests skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-463/
>         igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-144335v2/shard-dg2-464/igt@kms_ccs@bad-pixel-format-yf-
>         tiled-ccs.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) +11 other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-436/
>         igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html> (Intel XE#2907
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) +1 other test skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html> (Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-dg2-463/
>         igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) +8 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-
>         basic-4-tiled-lnl-ccs.html> (Intel XE#2907 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-434/
>         igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-144335v2/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-yf-
>         tiled-ccs.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +1 other test
>         skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-
>         dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727> / Intel XE#3124 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3124> / Intel XE#4010 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4010>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-
>         tiled-mtl-rc-ccs.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +10
>         other tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-0-50:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_chamelium_color@ctm-0-50.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-144335v2/shard-dg2-463/igt@kms_chamelium_color@ctm-0-50.html>
>         (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/306>) +2 other tests skip
>   *
> 
>     igt@kms_chamelium_color@gamma:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-434/
>         igt@kms_chamelium_color@gamma.html> (Intel XE#306 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/306>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-464/igt@kms_chamelium_color@gamma.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>) +1 other test skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-436/
>         igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html> (Intel
>         XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/373>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-144335v2/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-
>         with-enabled-mode.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +11 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_chamelium_hpd@vga-hpd.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-144335v2/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html>
>         (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/373>) +14 other tests skip
>   *
> 
>     igt@kms_content_protection@atomic:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-5/
>         igt@kms_content_protection@atomic.html> (Intel XE#1178 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         bmg-6/igt@kms_content_protection@atomic.html> (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_content_protection@atomic.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-144335v2/shard-dg2-436/
>         igt@kms_content_protection@atomic.html> (Intel XE#1178 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-1:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-463/
>         igt@kms_content_protection@dp-mst-lic-type-1.html> (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_content_protection@dp-mst-type-1:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_content_protection@dp-mst-type-1.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-463/igt@kms_content_protection@dp-
>         mst-type-1.html> (Intel XE#307 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/307>)
>   *
> 
>     igt@kms_content_protection@lic-type-0:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-6/
>         igt@kms_content_protection@lic-type-0.html> (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-bmg-1/igt@kms_content_protection@lic-type-0.html> (Intel
>         XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>   *
> 
>     igt@kms_content_protection@uevent:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-6/
>         igt@kms_content_protection@uevent.html> (Intel XE#2341 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         bmg-1/igt@kms_content_protection@uevent.html> (Intel XE#1188
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-434/
>         igt@kms_cursor_crc@cursor-offscreen-512x170.html> (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x170.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) +2 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_cursor_crc@cursor-offscreen-512x512.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-463/igt@kms_cursor_crc@cursor-
>         offscreen-512x512.html> (Intel XE#308 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-64x64:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-
>         dg2-434/igt@kms_cursor_crc@cursor-onscreen-64x64.html> (Intel
>         XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1033>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-464/igt@kms_cursor_crc@cursor-
>         onscreen-64x64.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +8 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-random-32x10:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-435/
>         igt@kms_cursor_crc@cursor-random-32x10.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-464/igt@kms_cursor_crc@cursor-random-32x10.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) +6 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-7/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-
>         varying-size.html> (Intel XE#877 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-
>         varying-size.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>)
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-8/
>         igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-
>         varying-size.html> (Intel XE#4172 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4172>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-
>         varying-size.html> (Intel XE#2291 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2291>)
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-435/
>         igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>         transitions.html> (Intel XE#323 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/323>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-464/
>         igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-
>         transitions.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>   *
> 
>     igt@kms_fbcon_fbt@psr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-435/
>         igt@kms_fbcon_fbt@psr.html> (Intel XE#776 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/776>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-464/igt@kms_fbcon_fbt@psr.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_feature_discovery@dp-mst:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_feature_discovery@dp-mst.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-144335v2/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html>
>         (Intel XE#1137 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1137>)
>   *
> 
>     igt@kms_feature_discovery@psr1:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_feature_discovery@psr1.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-144335v2/shard-dg2-463/igt@kms_feature_discovery@psr1.html>
>         (Intel XE#1135 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1135>)
>   *
> 
>     igt@kms_flip@2x-plain-flip-fb-recreate:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_flip@2x-plain-flip-fb-recreate.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-
>         recreate.html> (Intel XE#886 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/886>)
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-436/
>         igt@kms_flip@flip-vs-expired-vblank.html> (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-
>         dg2-436/igt@kms_flip@flip-vs-suspend.html> (Intel XE#2955
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-464/igt@kms_flip@flip-vs-suspend.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-2/
>         igt@kms_flip@flip-vs-suspend-interruptible.html> (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2597>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-2/igt@kms_flip@flip-vs-
>         suspend-interruptible.html> (Intel XE#4172 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4172>)
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-
>         dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html> (Intel
>         XE#2049 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2049> / Intel XE#2597 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2597>) -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-dg2-434/
>         igt@kms_flip@flip-vs-suspend-interruptible.html> (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) +1
>         other test dmesg-warn
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>     downscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-466/
>         igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>         downscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-464/
>         igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
>         downscaling.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-
>         downscaling.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-
>         yftile-downscaling.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +4 other tests
>         skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-
>         downscaling.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-436/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-
>         downscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455>) +4 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-
>     downscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-463/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-
>         downscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-464/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-
>         downscaling.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +2 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html>
>         (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-144335v2/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) +23 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-8/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#2311 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2311>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) +19 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-435/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-
>         fullscreen.html> (Intel XE#651 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-
>         fullscreen.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +7 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-
>         render.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-
>         render.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4141>) +15 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         onoff.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4141>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-
>         onoff.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2312>) +6 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html>
>         (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/651>) +27 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-
>         mmap-wc.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-
>         mmap-wc.html> (Intel XE#2311 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2311>) +29 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-
>         blt.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-
>         pgflip-blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/651>) +16 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-
>         blt.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-dg2-463/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +31 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-435/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-
>         blt.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +4 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-435/
>         igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-144335v2/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) +24 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-8/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-
>         blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2312>) +13 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-
>         blt.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2351> / Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-
>         msflip-blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/653>) +13 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-
>         fullscreen.html> (Intel XE#2312 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-bmg-1/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-
>         fullscreen.html> (Intel XE#2313 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2313>) +30 other tests skip
>   *
> 
>     igt@kms_hdr@brightness-with-hdr:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-1/
>         igt@kms_hdr@brightness-with-hdr.html> (Intel XE#3544 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3544>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         bmg-8/igt@kms_hdr@brightness-with-hdr.html> (Intel XE#3374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374> /
>         Intel XE#3544 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3544>)
>   *
> 
>     igt@kms_joiner@basic-big-joiner:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-463/
>         igt@kms_joiner@basic-big-joiner.html> (Intel XE#346 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/346>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-464/igt@kms_joiner@basic-big-joiner.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_joiner@basic-ultra-joiner:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_joiner@basic-ultra-joiner.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-463/igt@kms_joiner@basic-ultra-joiner.html> (Intel XE#2927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>   *
> 
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_joiner@invalid-modeset-force-ultra-joiner.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-463/igt@kms_joiner@invalid-modeset-
>         force-ultra-joiner.html> (Intel XE#2925 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2925>)
>   *
> 
>     igt@kms_plane_cursor@primary:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-
>         dg2-436/igt@kms_plane_cursor@primary.html> (Intel XE#3966
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3966>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-464/igt@kms_plane_cursor@primary.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>)
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_plane_scaling@intel-max-src-size.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-dg2-436/
>         igt@kms_plane_scaling@intel-max-src-size.html> (Intel XE#4212
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-
>         format.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4208> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-
>         pixel-format.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2
>         other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-436/
>         igt@kms_plane_scaling@planes-upscale-20x20-downscale-
>         factor-0-25.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-
>         downscale-factor-0-25.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +2 other tests skip
>   *
> 
>     igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-434/
>         igt@kms_pm_dc@dc3co-vpb-simulation.html> (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html> (Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_pm_dc@dc6-dpms.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html>
>         (Intel XE#908 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/908>)
>   *
> 
>     igt@kms_pm_dc@dc6-psr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_pm_dc@dc6-psr.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#1129 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1129>)
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-434/
>         igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-
>         fully-sf.html> (Intel XE#1489 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1489>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-dg2-464/
>         igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-
>         fully-sf.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) +7 other tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-
>         fully-sf.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-dg2-436/
>         igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-
>         fully-sf.html> (Intel XE#1489 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1489>) +12 other tests skip
>   *
> 
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_psr2_su@frontbuffer-xrgb8888.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-463/igt@kms_psr2_su@frontbuffer-xrgb8888.html> (Intel
>         XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>   *
> 
>     igt@kms_psr@fbc-pr-cursor-plane-move:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-435/
>         igt@kms_psr@fbc-pr-cursor-plane-move.html> (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/929>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-144335v2/shard-dg2-464/igt@kms_psr@fbc-pr-cursor-plane-
>         move.html> (Intel XE#4208 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/4208>) +11 other tests skip
>   *
> 
>     igt@kms_psr@fbc-pr-sprite-plane-onoff:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_psr@fbc-pr-sprite-plane-onoff.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-436/igt@kms_psr@fbc-pr-sprite-plane-
>         onoff.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2850> / Intel XE#929 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +2 other tests
>         skip
>   *
> 
>     igt@kms_psr@psr-sprite-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-434/
>         igt@kms_psr@psr-sprite-blt.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-464/igt@kms_psr@psr-sprite-blt.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) +6 other tests skip
>   *
> 
>     igt@kms_psr@psr2-basic:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_psr@psr2-basic.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-436/igt@kms_psr@psr2-basic.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +18
>         other tests skip
>   *
> 
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-463/
>         igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (Intel XE#2939 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2939>)
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-dg2-436/
>         igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html> (Intel
>         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-463/
>         igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html> (Intel
>         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1127>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-464/igt@kms_rotation_crc@primary-y-
>         tiled-reflect-x-180.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-90:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_rotation_crc@sprite-rotation-90.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-463/igt@kms_rotation_crc@sprite-
>         rotation-90.html> (Intel XE#3414 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3414>) +1 other test
>         skip
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-434/
>         igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html> (Intel
>         XE#3414 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3414>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-464/igt@kms_rotation_crc@sprite-
>         rotation-90-pos-100-0.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         +1 other test skip
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-1/
>         igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2509 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2509>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-bmg-8/igt@kms_tiled_display@basic-test-
>         pattern-with-chamelium.html> (Intel XE#2426 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2426>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-dg2-463/
>         igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#362 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/362>)
>   *
> 
>     igt@kms_vblank@query-busy-hang:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_vblank@query-busy-hang.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-144335v2/shard-dg2-436/igt@kms_vblank@query-busy-hang.html>
>         (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1033>) +5 other tests dmesg-warn
>   *
> 
>     igt@kms_vrr@cmrr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-463/
>         igt@kms_vrr@cmrr.html> (Intel XE#2168 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2168>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-464/igt@kms_vrr@cmrr.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_vrr@flip-dpms:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_vrr@flip-dpms.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-144335v2/shard-dg2-436/igt@kms_vrr@flip-dpms.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455>) +8 other tests skip
>   *
> 
>     igt@kms_writeback@writeback-invalid-parameters:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@kms_writeback@writeback-invalid-parameters.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-dg2-463/
>         igt@kms_writeback@writeback-invalid-parameters.html> (Intel
>         XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>   *
> 
>     igt@testdisplay:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@testdisplay.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-436/igt@testdisplay.html> (Intel XE#2705 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2705> / Intel
>         XE#4212 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212>)
>   *
> 
>     igt@xe_compute_preempt@compute-preempt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@xe_compute_preempt@compute-preempt.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html>
>         (Intel XE#1280 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1280> / Intel XE#455 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/455>) +1 other test skip
>   *
> 
>     igt@xe_compute_preempt@compute-preempt-many:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-436/
>         igt@xe_compute_preempt@compute-preempt-many.html> (Intel XE#1280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> /
>         Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-144335v2/shard-dg2-464/igt@xe_compute_preempt@compute-
>         preempt-many.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@xe_copy_basic@mem-set-linear-0xfd:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@xe_copy_basic@mem-set-linear-0xfd.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html> (Intel
>         XE#1126 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>   *
> 
>     igt@xe_eudebug@basic-close:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@xe_eudebug@basic-close.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-463/igt@xe_eudebug@basic-close.html> (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +13
>         other tests skip
>   *
> 
>     igt@xe_eudebug@basic-vm-access-parameters-userptr:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-466/
>         igt@xe_eudebug@basic-vm-access-parameters-userptr.html> (Intel
>         XE#3889 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3889>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-464/igt@xe_eudebug@basic-vm-access-
>         parameters-userptr.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-
>         ufence-sigint-client.html> (Intel XE#3889 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3889>)
>   *
> 
>     igt@xe_eudebug_online@interrupt-other-debuggable:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-463/
>         igt@xe_eudebug_online@interrupt-other-debuggable.html> (Intel
>         XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2905>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-464/igt@xe_eudebug_online@interrupt-
>         other-debuggable.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +11 other
>         tests skip
>   *
> 
>     igt@xe_exec_compute_mode@many-userptr-invalidate:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@xe_exec_compute_mode@many-userptr-invalidate.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-144335v2/shard-dg2-436/
>         igt@xe_exec_compute_mode@many-userptr-invalidate.html> (Intel
>         XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1033>) +4 other tests dmesg-warn
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-434/
>         igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html>
>         (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-144335v2/shard-dg2-464/igt@xe_exec_fault_mode@twice-
>         userptr-invalidate-race.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) +28 other
>         tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-436/igt@xe_exec_fault_mode@twice-
>         userptr-rebind-imm.html> (Intel XE#288 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +34 other
>         tests skip
>   *
> 
>     igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-463/igt@xe_exec_mix_modes@exec-
>         simple-batch-store-dma-fence.html> (Intel XE#2360 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>   *
> 
>     igt@xe_live_ktest@xe_bo:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@xe_live_ktest@xe_bo.html> (Intel XE#2229 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2229> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-436/igt@xe_live_ktest@xe_bo.html> (Intel XE#1192
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192>)
>   *
> 
>     igt@xe_live_ktest@xe_eudebug:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-bmg-7/
>         igt@xe_live_ktest@xe_eudebug.html> (Intel XE#2833 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2833>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         bmg-6/igt@xe_live_ktest@xe_eudebug.html> (Intel XE#1192
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192>)
>   *
> 
>     igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-434/
>         igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html> (Intel
>         XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2541> / Intel XE#3573 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3573>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-dg2-464/
>         igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) +5 other tests skip
>   *
> 
>     igt@xe_oa@whitelisted-registers-userspace-config:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@xe_oa@whitelisted-registers-userspace-config.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-144335v2/shard-dg2-436/igt@xe_oa@whitelisted-registers-
>         userspace-config.html> (Intel XE#2541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2541> / Intel
>         XE#3573 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3573>) +11 other tests skip
>   *
> 
>     igt@xe_pat@display-vs-wb-transient:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-435/
>         igt@xe_pat@display-vs-wb-transient.html> (Intel XE#1337
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-464/igt@xe_pat@display-vs-wb-transient.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@xe_peer2peer@read:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-434/
>         igt@xe_peer2peer@read.html> (Intel XE#1173 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1173>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-464/igt@xe_peer2peer@read.html> (Intel XE#1061 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1061> / Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@xe_pm@d3cold-basic:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@xe_pm@d3cold-basic.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-463/igt@xe_pm@d3cold-basic.html> (Intel XE#2284 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>   *
> 
>     igt@xe_pm@d3cold-mocs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@xe_pm@d3cold-mocs.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-463/igt@xe_pm@d3cold-mocs.html> (Intel XE#2284 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2284>)
>   *
> 
>     igt@xe_pm@d3cold-multiple-execs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-463/
>         igt@xe_pm@d3cold-multiple-execs.html> (Intel XE#2284 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-464/igt@xe_pm@d3cold-multiple-execs.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@xe_pm@s3-basic-exec:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@xe_pm@s3-basic-exec.html> (Intel XE#4208 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-463/igt@xe_pm@s3-basic-exec.html> (Intel XE#1033 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>)
>   *
> 
>     igt@xe_pm@s3-vm-bind-prefetch:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-
>         dg2-436/igt@xe_pm@s3-vm-bind-prefetch.html> (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#569 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/569>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-144335v2/shard-dg2-464/igt@xe_pm@s3-vm-bind-prefetch.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>)
>   *
> 
>     igt@xe_pm@s3-vm-bind-userptr:
> 
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-
>         dg2-434/igt@xe_pm@s3-vm-bind-userptr.html> (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
>         Intel XE#569 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/569>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-144335v2/shard-dg2-464/igt@xe_pm@s3-vm-bind-userptr.html>
>         (Intel XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>)
>   *
> 
>     igt@xe_pm@vram-d3cold-threshold:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-435/
>         igt@xe_pm@vram-d3cold-threshold.html> (Intel XE#579 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/579>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-
>         dg2-464/igt@xe_pm@vram-d3cold-threshold.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>)
>   *
> 
>     igt@xe_query@multigpu-query-cs-cycles:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-436/
>         igt@xe_query@multigpu-query-cs-cycles.html> (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-464/igt@xe_query@multigpu-query-cs-cycles.html> (Intel
>         XE#4208 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/4208>) +1 other test skip
>   *
> 
>     igt@xe_query@multigpu-query-engines:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@xe_query@multigpu-query-engines.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-463/igt@xe_query@multigpu-query-engines.html> (Intel
>         XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/944>) +2 other tests skip
>   *
> 
>     igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@xe_sriov_auto_provisioning@resources-released-on-vfs-
>         disabling.html> (Intel XE#4208 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4208>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-144335v2/shard-dg2-463/
>         igt@xe_sriov_auto_provisioning@resources-released-on-vfs-
>         disabling.html> (Intel XE#4130 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/4130>)
>   *
> 
>     igt@xe_sriov_flr@flr-each-isolation:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe/shard-dg2-464/
>         igt@xe_sriov_flr@flr-each-isolation.html> (Intel XE#4208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144335v2/
>         shard-dg2-436/igt@xe_sriov_flr@flr-each-isolation.html> (Intel
>         XE#3342 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * Linux: xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe -> xe-
>     pw-144335v2
> 
> IGT_8224: c659b986ba648584d36b3cfece897bc84a33dcbb @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2605-5592bc56322b20198056d88dd12fc86ebb0dfcbe: 
> 5592bc56322b20198056d88dd12fc86ebb0dfcbe
> xe-pw-144335v2: 144335v2
> 

