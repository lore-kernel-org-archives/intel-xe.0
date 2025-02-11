Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DECC0219B
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 09:38:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0E789CAD;
	Tue, 11 Feb 2025 09:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JN99TJVI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA38C10E148
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 09:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739266710; x=1770802710;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=8jaXltxTOzuibpYHOmhgwf5fGB/Jgrz378wJV5MKKg4=;
 b=JN99TJVI7/leQjJsUEAZLZSwlQW7ar6boq5uFLXLxQwTHxF62jAQMius
 nl09hpdzzSZpAk2wPMoO8NfvREBcHzrnnpZoMr2mxT2ee7UaBycAPnRkF
 QhK+aW1+oyBipvY3rgHRM/TWbC4y2LcMNTzIFJ55x0MikGT3yYWoVUGlx
 M4Rjc/K8g6gsMHU/ChWccbgwngrT+cLmZgD3roIsemskFCu2ZzDhTNMMF
 01LJsS7omByqJqvCFq1hKdNxEWUERKiKscWKi0ikUXrty2dnF9Tu9xRtv
 d7WqvpP4e/mswAptxZWRn3zwctgg65Fs6NLdZKZfLSHvbqsdp0q1AcPMz w==;
X-CSE-ConnectionGUID: 4W7lNCmISmSfCmY+bjYZig==
X-CSE-MsgGUID: Cm2liUUjQ9SEqathLc0ghg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="43534488"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208,217";a="43534488"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 01:38:30 -0800
X-CSE-ConnectionGUID: 6v+/PkZvTd+5rXXG1qY85Q==
X-CSE-MsgGUID: r4iAAqOwRvOjF+kJgOLSPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
 d="scan'208,217";a="135710377"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.163.201])
 ([10.245.163.201])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 01:38:27 -0800
Content-Type: multipart/alternative;
 boundary="------------awiyNXS8rmUAk4uBE4vGGkBK"
Message-ID: <9cfe9e85-8e27-4bff-84e7-780ce648a345@linux.intel.com>
Date: Tue, 11 Feb 2025 10:38:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGU6IENh?=
 =?UTF-8?Q?rve_out_wopcm_portion_from_the_stolen_memory_=28rev2=29?=
To: intel-xe@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20250210143654.2076747-1-nirmoy.das@intel.com>
 <173922635391.547860.1841886949939952098@b555e5b46a47>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <173922635391.547860.1841886949939952098@b555e5b46a47>
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
--------------awiyNXS8rmUAk4uBE4vGGkBK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2/10/2025 11:25 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe: Carve out wopcm portion from the stolen memory (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/144520/
> *State:* 	failure
> *Details:* 	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/index.html
>
>
>   CI Bug Log - changes from xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237_full -> xe-pw-144520v2_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-144520v2_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-144520v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
> Here are the unknown changes that may have been introduced in xe-pw-144520v2_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@kms_invalid_mode@clock-too-high:
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-adlp-6/igt@kms_invalid_mode@clock-too-high.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-adlp-6/igt@kms_invalid_mode@clock-too-high.html> +1 other test dmesg-warn
>
<3> [394.135441] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did not complete or timeout within 10ms (status 0xad40023f)

<3> [394.145711] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI B/PHY B: did not complete or timeout within 10ms (status 0xad40023f)

Unrelated errors. Merged to drm-xe-next


Regards,

Nirmoy

>  *
>
>
>     Known issues
>
> Here are the changes found in xe-pw-144520v2_full that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html> (Intel XE#3767 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767>) +15 other tests skip
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html> (Intel XE#3908 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908>) +1 other test fail
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>  *
>
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2 other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html> (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html> (Intel XE#2314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html> (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-1920x1080p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +11 other tests skip
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +36 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html> (Intel XE#2652 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +11 other tests skip
>  *
>
>     igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html> (Intel XE#1152 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152>) +3 other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-red-to-blue:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_chamelium_color@ctm-red-to-blue.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-fast:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_chamelium_hpd@dp-hpd-fast.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>  *
>
>     igt@kms_color@degamma@pipe-c-hdmi-a-3:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-7/igt@kms_color@degamma@pipe-c-hdmi-a-3.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-6/igt@kms_color@degamma@pipe-c-hdmi-a-3.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) +2 other tests dmesg-warn
>  *
>
>     igt@kms_content_protection@atomic@pipe-a-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-436/igt@kms_content_protection@atomic@pipe-a-dp-4.html> (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>  *
>
>     igt@kms_cursor_crc@cursor-random-32x10:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_cursor_crc@cursor-random-32x10.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-suspend:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_cursor_crc@cursor-suspend.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) +7 other tests dmesg-warn
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html> (Intel XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) +7 other tests skip
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html> (Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +2 other tests skip
>  *
>
>     igt@kms_dp_aux_dev:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-5/igt@kms_dp_aux_dev.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-6/igt@kms_dp_aux_dev.html> (Intel XE#3009 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009>)
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html> (Intel XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +7 other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-466/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html> (Intel XE#310 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>) +1 other test skip
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +2 other tests fail
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html> (Intel XE#3321 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) +2 other tests fail
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3:
>
>       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html> (Intel XE#4172 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172>)
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html> (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) +1 other test fail
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@d-dp2:
>
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html> (Intel XE#3321 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) +2 other tests fail
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html> (Intel XE#2049 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> / Intel XE#2597 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) +1 other test incomplete
>  *
>
>     igt@kms_force_connector_basic@force-connector-state:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-adlp-3/igt@kms_force_connector_basic@force-connector-state.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-adlp-2/igt@kms_force_connector_basic@force-connector-state.html> (Intel XE#2953 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) +2 other tests dmesg-warn
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +2 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +5 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +5 other tests skip
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-7/igt@kms_hdr@invalid-hdr.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-1/igt@kms_hdr@invalid-hdr.html> (Intel XE#1503 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>)
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html> (Intel XE#4212 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212>)
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +2 other tests skip
>  *
>
>     igt@kms_pm_backlight@fade-with-dpms:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html> (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html> (Intel XE#836 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2 other tests skip
>  *
>
>     igt@kms_psr@fbc-pr-sprite-render:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_psr@fbc-pr-sprite-render.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +2 other tests skip
>  *
>
>     igt@kms_vblank@ts-continuation-dpms-suspend:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-7/igt@kms_vblank@ts-continuation-dpms-suspend.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend.html> (Intel XE#4172 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172> / Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
>  *
>
>     igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-7/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3.html> (Intel XE#4172 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172>)
>  *
>
>     igt@xe_eudebug_online@stopped-thread:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@xe_eudebug_online@stopped-thread.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +1 other test skip
>  *
>
>     igt@xe_exec_fault_mode@once-userptr-rebind:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr-rebind.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +5 other tests skip
>  *
>
>     igt@xe_exec_reset@cm-gt-reset:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-2/igt@xe_exec_reset@cm-gt-reset.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-4/igt@xe_exec_reset@cm-gt-reset.html> (Intel XE#3592 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3592>)
>  *
>
>     igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html> (Intel XE#4173 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173>)
>  *
>
>     igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html> (Intel XE#2229 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>  *
>
>     igt@xe_live_ktest@xe_migrate:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-4/igt@xe_live_ktest@xe_migrate.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html> (Intel XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192>)
>  *
>
>     igt@xe_oa@missing-sample-flags:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@xe_oa@missing-sample-flags.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541> / Intel XE#3573 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>)
>  *
>
>     igt@xe_pm@s3-vm-bind-prefetch:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@xe_pm@s3-vm-bind-prefetch.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#569 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>)
>  *
>
>     igt@xe_query@multigpu-query-cs-cycles:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_sriov_auto_provisioning@fair-allocation:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@xe_sriov_auto_provisioning@fair-allocation.html> (Intel XE#4130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-464/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html> (Intel XE#2314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> / Intel XE#2894 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html> (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124> / Intel XE#4010 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
>
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html> (Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> / Intel XE#3124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124> / Intel XE#4010 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html>
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html> (Intel XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html> +5 other tests pass
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html> (Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html> +5 other tests pass
>  *
>
>     igt@kms_display_modes@extended-mode-basic:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-436/igt@kms_display_modes@extended-mode-basic.html>
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html> (Intel XE#1340 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>  *
>
>     igt@kms_dp_aux_dev:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_dp_aux_dev.html> (Intel XE#3009 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_dp_aux_dev.html>
>  *
>
>     igt@kms_feature_discovery@display-2x:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_feature_discovery@display-2x.html> (Intel XE#702 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/702>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-436/igt@kms_feature_discovery@display-2x.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
>
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html> (Intel XE#3321 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html> +2 other tests pass
>  *
>
>     igt@kms_flip@2x-nonexisting-fb:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html> (Intel XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html> +8 other tests pass
>  *
>
>     igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html> (Intel XE#310 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-436/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html> +3 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank.html> +1 other test pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@a-dp4:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> / Intel XE#3321 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html> +3 other tests pass
>  *
>
>     igt@kms_joiner@basic-force-big-joiner:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html> (Intel XE#3012 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-7/igt@kms_joiner@basic-force-big-joiner.html>
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html> (Intel XE#836 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>  *
>
>     igt@kms_setmode@invalid-clone-single-crtc-stealing:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html> (Intel XE#1435 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html> +1 other test pass
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html>
>  *
>
>     igt@kms_vblank@ts-continuation-suspend:
>
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html> (Intel XE#2953 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html> +1 other test pass
>  *
>
>     igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-lnl-3/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-lnl-1/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html> +1 other test pass
>  *
>
>     igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind:
>
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-2/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html> (Intel XE#4172 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-8/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html> +9 other tests pass
>  *
>
>     igt@xe_exec_threads@threads-hang-rebind:
>
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@xe_exec_threads@threads-hang-rebind.html> (Intel XE#3876 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-464/igt@xe_exec_threads@threads-hang-rebind.html>
>  *
>
>     igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
>
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html> (Intel XE#4173 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html> +2 other tests pass
>  *
>
>     igt@xe_live_ktest@xe_bo:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-6/igt@xe_live_ktest@xe_bo.html> (Intel XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-8/igt@xe_live_ktest@xe_bo.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +9 other tests skip
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +7 other tests skip
>  *
>
>     igt@kms_content_protection@atomic:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_content_protection@atomic.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-436/igt@kms_content_protection@atomic.html> (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>  *
>
>     igt@kms_content_protection@uevent:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-436/igt@kms_content_protection@uevent.html> (Intel XE#1188 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-464/igt@kms_content_protection@uevent.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-7/igt@kms_content_protection@uevent.html> (Intel XE#1188 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-6/igt@kms_content_protection@uevent.html> (Intel XE#2341 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html> (Intel XE#2291 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html> (Intel XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html> (Intel XE#3321 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>)
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend-interruptible:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html> (Intel XE#2316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html> (Intel XE#4172 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +25 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +9 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +8 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +6 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html> (Intel XE#4141 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +14 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +20 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +13 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +25 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +10 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html> (Intel XE#2312 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +25 other tests skip
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size:
>
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html> (Intel XE#2705 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705> / Intel XE#4212 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html> (Intel XE#4212 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212>)
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-bmg: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-2/igt@kms_pm_dc@dc6-dpms.html> (Intel XE#4172 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-8/igt@kms_pm_dc@dc6-dpms.html> (Intel XE#1430 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#2426 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#1729 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>)
>  *
>
>     igt@xe_live_ktest@xe_mocs:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-adlp-3/igt@xe_live_ktest@xe_mocs.html> (Intel XE#1999 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-adlp-2/igt@xe_live_ktest@xe_mocs.html> (Intel XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192>)
>  *
>
>     igt@xe_pm@s4-basic:
>
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-2/igt@xe_pm@s4-basic.html> (Intel XE#4172 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172> / Intel XE#4268 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268>) -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-8/igt@xe_pm@s4-basic.html> (Intel XE#4268 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268>)
>
>
>     Build changes
>
>   * Linux: xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237 -> xe-pw-144520v2
>
> IGT_8227: 8227
> xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237: 656e731586e568a8633c0bd16d28dcec8d67f237
> xe-pw-144520v2: 144520v2
>
--------------awiyNXS8rmUAk4uBE4vGGkBK
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
    <div class="moz-cite-prefix">On 2/10/2025 11:25 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:173922635391.547860.1841886949939952098@b555e5b46a47">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe: Carve out wopcm portion from the stolen memory
              (rev2)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/144520/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/144520/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237_full -&gt;
        xe-pw-144520v2_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-144520v2_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-144520v2_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-144520v2_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@kms_invalid_mode@clock-too-high:
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-adlp-6/igt@kms_invalid_mode@clock-too-high.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-adlp-6/igt@kms_invalid_mode@clock-too-high.html"
                moz-do-not-send="true">DMESG-WARN</a> +1 other test
              dmesg-warn</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    &lt;3&gt; [394.135441] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI
    B/PHY B: did not complete or timeout within 10ms (status 0xad40023f)<br>
    <p>&lt;3&gt; [394.145711] xe 0000:00:02.0: [drm] *ERROR* AUX B/DDI
      B/PHY B: did not complete or timeout within 10ms (status
      0xad40023f)</p>
    <p>Unrelated errors. Merged to drm-xe-next</p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Nirmoy<br>
    </p>
    <blockquote type="cite"
      cite="mid:173922635391.547860.1841886949939952098@b555e5b46a47">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-144520v2_full that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767"
                moz-do-not-send="true">Intel XE#3767</a>) +15 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908"
                moz-do-not-send="true">Intel XE#3908</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191"
                moz-do-not-send="true">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314"
                moz-do-not-send="true">Intel XE#2314</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894"
                moz-do-not-send="true">Intel XE#2894</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191"
                moz-do-not-send="true">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +36 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652"
                moz-do-not-send="true">Intel XE#2652</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152"
                moz-do-not-send="true">Intel XE#1152</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_chamelium_color@ctm-red-to-blue.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_chamelium_hpd@dp-hpd-fast.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@degamma@pipe-c-hdmi-a-3:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-7/igt@kms_color@degamma@pipe-c-hdmi-a-3.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-6/igt@kms_color@degamma@pipe-c-hdmi-a-3.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>) +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-436/igt@kms_content_protection@atomic@pipe-a-dp-4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178"
                moz-do-not-send="true">Intel XE#1178</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-32x10:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_cursor_crc@cursor-random-32x10.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-suspend:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_cursor_crc@cursor-suspend.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a>) +7 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291"
                moz-do-not-send="true">Intel XE#2291</a>) +7 other tests
              skip</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309"
                moz-do-not-send="true">Intel XE#309</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_aux_dev:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-5/igt@kms_dp_aux_dev.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-6/igt@kms_dp_aux_dev.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009"
                moz-do-not-send="true">Intel XE#3009</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"
                moz-do-not-send="true">Intel XE#2316</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-466/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310"
                moz-do-not-send="true">Intel XE#310</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321"
                moz-do-not-send="true">Intel XE#3321</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172"
                moz-do-not-send="true">Intel XE#4172</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882"
                moz-do-not-send="true">Intel XE#2882</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@d-dp2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321"
                moz-do-not-send="true">Intel XE#3321</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049"
                moz-do-not-send="true">Intel XE#2049</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597"
                moz-do-not-send="true">Intel XE#2597</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@force-connector-state:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-adlp-3/igt@kms_force_connector_basic@force-connector-state.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-adlp-2/igt@kms_force_connector_basic@force-connector-state.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953"
                moz-do-not-send="true">Intel XE#2953</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a>) +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"
                moz-do-not-send="true">Intel XE#656</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-7/igt@kms_hdr@invalid-hdr.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-1/igt@kms_hdr@invalid-hdr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"
                moz-do-not-send="true">Intel XE#1503</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212"
                moz-do-not-send="true">Intel XE#4212</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763"
                moz-do-not-send="true">Intel XE#2763</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763"
                moz-do-not-send="true">Intel XE#2763</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade-with-dpms:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870"
                moz-do-not-send="true">Intel XE#870</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836"
                moz-do-not-send="true">Intel XE#836</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-sprite-render:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_psr@fbc-pr-sprite-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-7/igt@kms_vblank@ts-continuation-dpms-suspend.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172"
                moz-do-not-send="true">Intel XE#4172</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-7/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-3.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172"
                moz-do-not-send="true">Intel XE#4172</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@stopped-thread:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@xe_eudebug_online@stopped-thread.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905"
                moz-do-not-send="true">Intel XE#2905</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-userptr-rebind:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr-rebind.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@cm-gt-reset:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-2/igt@xe_exec_reset@cm-gt-reset.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-4/igt@xe_exec_reset@cm-gt-reset.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3592"
                moz-do-not-send="true">Intel XE#3592</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173"
                moz-do-not-send="true">Intel XE#4173</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-8/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229"
                moz-do-not-send="true">Intel XE#2229</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_migrate:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-4/igt@xe_live_ktest@xe_migrate.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192"
                moz-do-not-send="true">Intel XE#1192</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@missing-sample-flags:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@xe_oa@missing-sample-flags.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573"
                moz-do-not-send="true">Intel XE#3573</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-vm-bind-prefetch:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@xe_pm@s3-vm-bind-prefetch.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569"
                moz-do-not-send="true">Intel XE#569</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-cs-cycles:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@xe_sriov_auto_provisioning@fair-allocation.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130"
                moz-do-not-send="true">Intel XE#4130</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-464/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314"
                moz-do-not-send="true">Intel XE#2314</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894"
                moz-do-not-send="true">Intel XE#2894</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191"
                moz-do-not-send="true">Intel XE#2191</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124"
                moz-do-not-send="true">Intel XE#3124</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010"
                moz-do-not-send="true">Intel XE#4010</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"
                moz-do-not-send="true">Intel XE#3113</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124"
                moz-do-not-send="true">Intel XE#3124</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010"
                moz-do-not-send="true">Intel XE#4010</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291"
                moz-do-not-send="true">Intel XE#2291</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html"
                moz-do-not-send="true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309"
                moz-do-not-send="true">Intel XE#309</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html"
                moz-do-not-send="true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_display_modes@extended-mode-basic:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-436/igt@kms_display_modes@extended-mode-basic.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340"
                moz-do-not-send="true">Intel XE#1340</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_aux_dev:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_dp_aux_dev.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009"
                moz-do-not-send="true">Intel XE#3009</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_dp_aux_dev.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-2x:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_feature_discovery@display-2x.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702"
                moz-do-not-send="true">Intel XE#702</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-436/igt@kms_feature_discovery@display-2x.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321"
                moz-do-not-send="true">Intel XE#3321</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-nonexisting-fb:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"
                moz-do-not-send="true">Intel XE#2316</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html"
                moz-do-not-send="true">PASS</a> +8 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310"
                moz-do-not-send="true">Intel XE#310</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-436/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html"
                moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321"
                moz-do-not-send="true">Intel XE#3321</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"
                moz-do-not-send="true">Intel XE#656</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html"
                moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-big-joiner:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012"
                moz-do-not-send="true">Intel XE#3012</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-7/igt@kms_joiner@basic-force-big-joiner.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836"
                moz-do-not-send="true">Intel XE#836</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435"
                moz-do-not-send="true">Intel XE#1435</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899"
                moz-do-not-send="true">Intel XE#899</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-suspend:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953"
                moz-do-not-send="true">Intel XE#2953</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-lnl-3/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html"
                moz-do-not-send="true">FAIL</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-lnl-1/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-2/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172"
                moz-do-not-send="true">Intel XE#4172</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-8/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html"
                moz-do-not-send="true">PASS</a> +9 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-hang-rebind:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@xe_exec_threads@threads-hang-rebind.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876"
                moz-do-not-send="true">Intel XE#3876</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-464/igt@xe_exec_threads@threads-hang-rebind.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173"
                moz-do-not-send="true">Intel XE#4173</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-6/igt@xe_live_ktest@xe_bo.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192"
                moz-do-not-send="true">Intel XE#1192</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-8/igt@xe_live_ktest@xe_bo.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_content_protection@atomic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-436/igt@kms_content_protection@atomic.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178"
                moz-do-not-send="true">Intel XE#1178</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-436/igt@kms_content_protection@uevent.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188"
                moz-do-not-send="true">Intel XE#1188</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-464/igt@kms_content_protection@uevent.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>)</li>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-7/igt@kms_content_protection@uevent.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188"
                moz-do-not-send="true">Intel XE#1188</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-6/igt@kms_content_protection@uevent.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341"
                moz-do-not-send="true">Intel XE#2341</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291"
                moz-do-not-send="true">Intel XE#2291</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"
                moz-do-not-send="true">Intel XE#2316</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321"
                moz-do-not-send="true">Intel XE#3321</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316"
                moz-do-not-send="true">Intel XE#2316</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172"
                moz-do-not-send="true">Intel XE#4172</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"
                moz-do-not-send="true">Intel XE#2312</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311"
                moz-do-not-send="true">Intel XE#2311</a>) +25 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"
                moz-do-not-send="true">Intel XE#656</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"
                moz-do-not-send="true">Intel XE#656</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141"
                moz-do-not-send="true">Intel XE#4141</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"
                moz-do-not-send="true">Intel XE#2312</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"
                moz-do-not-send="true">Intel XE#2312</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141"
                moz-do-not-send="true">Intel XE#4141</a>) +14 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311"
                moz-do-not-send="true">Intel XE#2311</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"
                moz-do-not-send="true">Intel XE#2312</a>) +20 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"
                moz-do-not-send="true">Intel XE#656</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"
                moz-do-not-send="true">Intel XE#2312</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313"
                moz-do-not-send="true">Intel XE#2313</a>) +25 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"
                moz-do-not-send="true">Intel XE#656</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313"
                moz-do-not-send="true">Intel XE#2313</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312"
                moz-do-not-send="true">Intel XE#2312</a>) +25 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705"
                moz-do-not-send="true">Intel XE#2705</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212"
                moz-do-not-send="true">Intel XE#4212</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212"
                moz-do-not-send="true">Intel XE#4212</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-2/igt@kms_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172"
                moz-do-not-send="true">Intel XE#4172</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-8/igt@kms_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430"
                moz-do-not-send="true">Intel XE#1430</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426"
                moz-do-not-send="true">Intel XE#2426</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729"
                moz-do-not-send="true">Intel XE#1729</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_mocs:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-adlp-3/igt@xe_live_ktest@xe_mocs.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999"
                moz-do-not-send="true">Intel XE#1999</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-adlp-2/igt@xe_live_ktest@xe_mocs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192"
                moz-do-not-send="true">Intel XE#1192</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-basic:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237/shard-bmg-2/igt@xe_pm@s4-basic.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172"
                moz-do-not-send="true">Intel XE#4172</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268"
                moz-do-not-send="true">Intel XE#4268</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v2/shard-bmg-8/igt@xe_pm@s4-basic.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268"
                moz-do-not-send="true">Intel XE#4268</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237
          -&gt; xe-pw-144520v2</li>
      </ul>
      <p>IGT_8227: 8227<br>
        xe-2629-656e731586e568a8633c0bd16d28dcec8d67f237:
        656e731586e568a8633c0bd16d28dcec8d67f237<br>
        xe-pw-144520v2: 144520v2</p>
    </blockquote>
  </body>
</html>

--------------awiyNXS8rmUAk4uBE4vGGkBK--
