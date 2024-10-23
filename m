Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B592CCDDE6F
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 11:30:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AC410E13D;
	Wed, 23 Oct 2024 11:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="arA87uw3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471CE10E7AE
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 11:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729683046; x=1761219046;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=Yyzhrd+afWlbrxijQfZMmoSbWoNLifXuAD4LOoWieSg=;
 b=arA87uw3l4UiVQtRGiTFjntcpyPKs+AtLPWhEtpkdc/3G+QlE9s0jcEE
 /JqaEhe1xmGgj3/AeDE508/BsZiu4v1mvdifJlF8tdZFNC0Vk7i0/QWYi
 QczcBgo9ZsxquPavs4AvJHbP9hd1Phm9LCe5xh/dekRKTDMGFX16FcWIV
 2uPWt/pEhPvEbtyeoxaiN7MxCw/f7IyQm/UUF4KEWEzHQ2+vYodKriIPw
 xs5P/pbm1fjfujDrKR1d9Jo0H9GZLH+74IvKwQ6dSb429VsfF2DyrKV2t
 iKtQErARygx33HPfNvzCzI9OgftsJt48BTL6km1rgkCI2cm4eMgFM9Z2M A==;
X-CSE-ConnectionGUID: vE+IxJpIRvSyCz947bteVw==
X-CSE-MsgGUID: faMOSJXOSDmz1Ulqp43HeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="29365724"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208,217";a="29365724"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 04:30:46 -0700
X-CSE-ConnectionGUID: fKQlnIYUR6y2l/tXShqsZg==
X-CSE-MsgGUID: yqZivi56QEe6XdWTiZbr1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208,217";a="80244168"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.169.36])
 ([10.245.169.36])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 04:30:43 -0700
Content-Type: multipart/alternative;
 boundary="------------llFqIYGcI4f8UGIxm9AgVNOj"
Message-ID: <ba5d5f21-c4c1-4417-87bb-88d715534a8a@linux.intel.com>
Date: Wed, 23 Oct 2024 13:30:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBDSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGU6IERvbid0?=
 =?UTF-8?Q?_restart_parallel_queues_multiple_times_on_GT_reset_=28rev2=29?=
To: intel-xe@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20241022103555.731557-1-nirmoy.das@intel.com>
 <172960768353.1310194.15999743475700491114@2413ebb6fbb6>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <172960768353.1310194.15999743475700491114@2413ebb6fbb6>
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
--------------llFqIYGcI4f8UGIxm9AgVNOj
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/22/2024 4:34 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe: Don't restart parallel queues multiple times on GT reset (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/140280/
> *State:* 	failure
> *Details:* 	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/index.html
>
>
>   CI Bug Log - changes from xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52_full -> xe-pw-140280v2_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-140280v2_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-140280v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
> Here are the unknown changes that may have been introduced in xe-pw-140280v2_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_big_fb@x-tiled-16bpp-rotate-0:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-2/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-4/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html> +1 other test dmesg-warn
>  *
>
>     igt@kms_flip@blocking-wf_vblank@a-dp2:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-bmg-4/igt@kms_flip@blocking-wf_vblank@a-dp2.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-4/igt@kms_flip@blocking-wf_vblank@a-dp2.html>
>  *
>
>     igt@kms_vrr@flip-dpms:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-6/igt@kms_vrr@flip-dpms.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-1/igt@kms_vrr@flip-dpms.html> +1 other test fail
>
Unrelated failure. Merged to drm-xe-next
>
>  *
>
>
>     Known issues
>
> Here are the changes found in xe-pw-140280v2_full that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1 other test incomplete
>  *
>
>     igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html> (Intel XE#1426 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) +1 other test fail
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-7/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html> (Intel XE#2327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>)
>  *
>
>     igt@kms_big_fb@linear-64bpp-rotate-0:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-4/igt@kms_big_fb@linear-64bpp-rotate-0.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-6/igt@kms_big_fb@linear-64bpp-rotate-0.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#402 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>)
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>
>       o shard-adlp: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html> (Intel XE#3194 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194>)
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html> (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html> (Intel XE#1512 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512>)
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-2/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html> (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +5 other tests skip
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +20 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +2 other tests incomplete
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#2692 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692>) +1 other test incomplete
>  *
>
>     igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-4/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1 other test skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-planes-random:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-planes-random.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2 other tests skip
>  *
>
>     igt@kms_content_protection@dp-mst-type-1:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html> (Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>  *
>
>     igt@kms_cursor_crc@cursor-random-128x128:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-8/igt@kms_cursor_crc@cursor-random-128x128.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-6/igt@kms_cursor_crc@cursor-random-128x128.html> (Intel XE#2953 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953>)
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3 other tests skip
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html> (Intel XE#1475 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475>) +1 other test fail
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html> (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>  *
>
>     igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-7/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-4/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html> (Intel XE#1541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541>) +1 other test fail
>  *
>
>     igt@kms_feature_discovery@psr2:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-2/igt@kms_feature_discovery@psr2.html> (Intel XE#1135 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +2 other tests fail
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>)
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp4.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +1 other test fail
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html> (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) +4 other tests fail
>  *
>
>     igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-2/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-4/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html> (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) +1 other test fail
>  *
>
>     igt@kms_flip@blocking-wf_vblank@c-edp1:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-8/igt@kms_flip@blocking-wf_vblank@c-edp1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-4/igt@kms_flip@blocking-wf_vblank@c-edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +1 other test fail
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +8 other tests skip
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-suspend:
>
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-suspend.html> (Intel XE#2333 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +8 other tests skip
>  *
>
>     igt@kms_hdr@static-toggle-dpms:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-4/igt@kms_hdr@static-toggle-dpms.html> (Intel XE#1503 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503> / Intel XE#599 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-2/igt@kms_hdr@static-toggle-dpms.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html> (Intel XE#2927 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html> (Intel XE#2927 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>  *
>
>     igt@kms_plane_cursor@viewport:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-435/igt@kms_plane_cursor@viewport.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-435/igt@kms_plane_cursor@viewport.html> (Intel XE#616 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) +1 other test fail
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html> (Intel XE#361 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/361>)
>  *
>
>     igt@kms_pm_dc@dc5-psr:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html> (Intel XE#2392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html> (Intel XE#1129 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129>)
>  *
>
>     igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-436/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2 other tests skip
>  *
>
>     igt@kms_psr2_su@page_flip-nv12:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html> (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>  *
>
>     igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html> (Intel XE#2948 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948>) +1 other test fail
>  *
>
>     igt@kms_psr@pr-sprite-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-436/igt@kms_psr@pr-sprite-blt.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +4 other tests skip
>  *
>
>     igt@kms_psr@psr-cursor-blt:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-7/igt@kms_psr@psr-cursor-blt.html> (Intel XE#2234 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> / Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>)
>  *
>
>     igt@kms_psr@psr-cursor-render@edp-1:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-3/igt@kms_psr@psr-cursor-render@edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-5/igt@kms_psr@psr-cursor-render@edp-1.html> (Intel XE#2808 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2808>) +1 other test fail
>  *
>
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html> (Intel XE#2414 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html> (Intel XE#2939 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939>)
>  *
>
>     igt@kms_rotation_crc@bad-tiling:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html> (Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>  *
>
>     igt@kms_sequence@queue-idle@pipe-a-hdmi-a-1:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-8/igt@kms_sequence@queue-idle@pipe-a-hdmi-a-1.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-8/igt@kms_sequence@queue-idle@pipe-a-hdmi-a-1.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) +3 other tests timeout
>  *
>
>     igt@kms_setmode@basic:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-bmg-8/igt@kms_setmode@basic.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-8/igt@kms_setmode@basic.html> (Intel XE#2883 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883>) +3 other tests fail
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) +1 other test fail
>  *
>
>     igt@xe_eudebug@basic-vm-bind-ufence:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>)
>  *
>
>     igt@xe_eudebug@multigpu-basic-client-many:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@xe_eudebug@multigpu-basic-client-many.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +1 other test skip
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-small:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>  *
>
>     igt@xe_evict@evict-mixed-threads-large:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html> (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html> (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>  *
>
>     igt@xe_exec_fault_mode@many-rebind-prefetch:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-2/igt@xe_exec_fault_mode@many-rebind-prefetch.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>)
>  *
>
>     igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +5 other tests skip
>  *
>
>     igt@xe_oa@mi-rpc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@xe_oa@mi-rpc.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +1 other test skip
>  *
>
>     igt@xe_oa@mmio-triggered-reports@rcs-0:
>
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-8/igt@xe_oa@mmio-triggered-reports@rcs-0.html> (Intel XE#2249 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249>)
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-5/igt@xe_oa@mmio-triggered-reports@rcs-0.html> (Intel XE#2249 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249>)
>  *
>
>     igt@xe_pm@d3cold-multiple-execs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@xe_pm@d3cold-multiple-execs.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>  *
>
>     igt@xe_pm@s4-exec-after:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-3/igt@xe_pm@s4-exec-after.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-9/igt@xe_pm@s4-exec-after.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>) +1 other test abort
>  *
>
>     igt@xe_pm@s4-vm-bind-unbind-all:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html> (Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_pm@vram-d3cold-threshold:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold.html> (Intel XE#579 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
>  *
>
>     igt@xe_pm_residency@toggle-gt-c6:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html> (Intel XE#958 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/958>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html> (Intel XE#827 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/827>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html>
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events:
>
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html> (Intel XE#3194 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events.html> +3 other tests pass
>  *
>
>     igt@kms_big_fb@linear-64bpp-rotate-0:
>
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-0.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-0.html>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
>
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html>
>  *
>
>     igt@kms_color@deep-color:
>
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-6/igt@kms_color@deep-color.html> (Intel XE#2929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-6/igt@kms_color@deep-color.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
>
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html> +3 other tests pass
>  *
>
>     igt@kms_flip@blocking-wf_vblank:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-436/igt@kms_flip@blocking-wf_vblank.html> (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-433/igt@kms_flip@blocking-wf_vblank.html>
>  *
>
>     igt@kms_flip@blocking-wf_vblank@a-hdmi-a6:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-436/igt@kms_flip@blocking-wf_vblank@a-hdmi-a6.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-433/igt@kms_flip@blocking-wf_vblank@a-hdmi-a6.html>
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html> +4 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html> +1 other test pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html> +4 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-suspend:
>
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#2049 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> / Intel XE#2597 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html>
>  *
>
>     igt@kms_flip@flip-vs-suspend@d-dp4:
>
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-434/igt@kms_flip@flip-vs-suspend@d-dp4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#2049 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html>
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-linear:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-linear.html> (Intel XE#1491 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-linear.html> +2 other tests pass
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html> +3 other tests pass
>  *
>
>     igt@kms_force_connector_basic@force-edid:
>
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-9/igt@kms_force_connector_basic@force-edid.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-2/igt@kms_force_connector_basic@force-edid.html> +1 other test pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
>
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html> +2 other tests pass
>  *
>
>     igt@kms_plane@pixel-format-source-clamping:
>
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-bmg-4/igt@kms_plane@pixel-format-source-clamping.html> (Intel XE#2566 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566> / Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-5/igt@kms_plane@pixel-format-source-clamping.html>
>  *
>
>     igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3:
>
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-bmg-4/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-5/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3.html>
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html> (Intel XE#361 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/361>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html>
>  *
>
>     igt@kms_pm_dc@deep-pkgc:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html> (Intel XE#2029 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html>
>  *
>
>     igt@kms_rotation_crc@primary-rotation-180:
>
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-7/igt@kms_rotation_crc@primary-rotation-180.html> (Intel XE#2055 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-1/igt@kms_rotation_crc@primary-rotation-180.html>
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html> (Intel XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html>
>  *
>
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html> +1 other test pass
>  *
>
>     igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-3/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html> (Intel XE#2667 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html>
>  *
>
>     igt@xe_evict@evict-large-multi-vm-cm:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html> (Intel XE#1600 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html>
>  *
>
>     igt@xe_evict@evict-threads-large:
>
>       o shard-dg2-set2: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-466/igt@xe_evict@evict-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@xe_evict@evict-threads-large.html>
>  *
>
>     igt@xe_exec_reset@parallel-gt-reset:
>
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html>
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html>
>  *
>
>     igt@xe_pm@s4-mocs:
>
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-9/igt@xe_pm@s4-mocs.html> (Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-8/igt@xe_pm@s4-mocs.html>
>  *
>
>     igt@xe_pm@s4-multiple-execs:
>
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html>
>       o shard-lnl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-4/igt@xe_pm@s4-multiple-execs.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html> (Intel XE#827 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/827>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip.html> (Intel XE#3194 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194>)
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204> / Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#402 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>)
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231> / Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#3194 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#3194 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231> / Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> / Intel XE#402 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:
>
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#362 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#1729 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (Intel XE#1500 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (Intel XE#362 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
>
>
>     Build changes
>
>   * Linux: xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52 -> xe-pw-140280v2
>
> IGT_8081: 9b8c0f6da8898f760bfaa2113455eb84b68a69f4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52: beaeaccd284ba3b69b6dbfdc18bb89441fc99a52
> xe-pw-140280v2: 140280v2
>
--------------llFqIYGcI4f8UGIxm9AgVNOj
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
    <div class="moz-cite-prefix">On 10/22/2024 4:34 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:172960768353.1310194.15999743475700491114@2413ebb6fbb6">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe: Don't restart parallel queues multiple times on
              GT reset (rev2)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/140280/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/140280/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52_full -&gt;
        xe-pw-140280v2_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-140280v2_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-140280v2_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-140280v2_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@x-tiled-16bpp-rotate-0:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-2/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-4/igt@kms_big_fb@x-tiled-16bpp-rotate-0.html"
                moz-do-not-send="true">DMESG-WARN</a> +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@blocking-wf_vblank@a-dp2:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-bmg-4/igt@kms_flip@blocking-wf_vblank@a-dp2.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-4/igt@kms_flip@blocking-wf_vblank@a-dp2.html"
                moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-dpms:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-6/igt@kms_vrr@flip-dpms.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-1/igt@kms_vrr@flip-dpms.html"
                moz-do-not-send="true">FAIL</a> +1 other test fail</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    Unrelated failure. Merged to drm-xe-next<br>
    <blockquote type="cite"
      cite="mid:172960768353.1310194.15999743475700491114@2413ebb6fbb6">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-140280v2_full that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426"
                moz-do-not-send="true">Intel XE#1426</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-7/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327"
                moz-do-not-send="true">Intel XE#2327</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-4/igt@kms_big_fb@linear-64bpp-rotate-0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-6/igt@kms_big_fb@linear-64bpp-rotate-0.html"
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
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194"
                moz-do-not-send="true">Intel XE#3194</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191"
                moz-do-not-send="true">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512"
                moz-do-not-send="true">Intel XE#1512</a>)</li>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-2/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191"
                moz-do-not-send="true">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +20 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>) +2 other tests
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692"
                moz-do-not-send="true">Intel XE#2692</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-4/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-crc-planes-random:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-planes-random.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-1:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307"
                moz-do-not-send="true">Intel XE#307</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-128x128:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-8/igt@kms_cursor_crc@cursor-random-128x128.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-6/igt@kms_cursor_crc@cursor-random-128x128.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953"
                moz-do-not-send="true">Intel XE#2953</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475"
                moz-do-not-send="true">Intel XE#1475</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323"
                moz-do-not-send="true">Intel XE#323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-7/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-4/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541"
                moz-do-not-send="true">Intel XE#1541</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@psr2:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-2/igt@kms_feature_discovery@psr2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135"
                moz-do-not-send="true">Intel XE#1135</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204"
                moz-do-not-send="true">Intel XE#1204</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882"
                moz-do-not-send="true">Intel XE#2882</a>) +4 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-2/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-4/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882"
                moz-do-not-send="true">Intel XE#2882</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@blocking-wf_vblank@c-edp1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-8/igt@kms_flip@blocking-wf_vblank@c-edp1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-4/igt@kms_flip@blocking-wf_vblank@c-edp1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"
                moz-do-not-send="true">Intel XE#886</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"
                moz-do-not-send="true">Intel XE#1874</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"
                moz-do-not-send="true">Intel XE#656</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"
                moz-do-not-send="true">Intel XE#656</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +8 other tests
              skip</li>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311"
                moz-do-not-send="true">Intel XE#2311</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-suspend.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333"
                moz-do-not-send="true">Intel XE#2333</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313"
                moz-do-not-send="true">Intel XE#2313</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-dpms:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-4/igt@kms_hdr@static-toggle-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"
                moz-do-not-send="true">Intel XE#1503</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599"
                moz-do-not-send="true">Intel XE#599</a>)</li>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-2/igt@kms_hdr@static-toggle-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927"
                moz-do-not-send="true">Intel XE#2927</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927"
                moz-do-not-send="true">Intel XE#2927</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@viewport:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-435/igt@kms_plane_cursor@viewport.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-435/igt@kms_plane_cursor@viewport.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616"
                moz-do-not-send="true">Intel XE#616</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361"
                moz-do-not-send="true">Intel XE#361</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-psr:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392"
                moz-do-not-send="true">Intel XE#2392</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"
                moz-do-not-send="true">Intel XE#1129</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-436/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-nv12:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122"
                moz-do-not-send="true">Intel XE#1122</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948"
                moz-do-not-send="true">Intel XE#2948</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-sprite-blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-436/igt@kms_psr@pr-sprite-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-cursor-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-7/igt@kms_psr@psr-cursor-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234"
                moz-do-not-send="true">Intel XE#2234</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-cursor-render@edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-3/igt@kms_psr@psr-cursor-render@edp-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-5/igt@kms_psr@psr-cursor-render@edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2808"
                moz-do-not-send="true">Intel XE#2808</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414"
                moz-do-not-send="true">Intel XE#2414</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939"
                moz-do-not-send="true">Intel XE#2939</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@bad-tiling:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327"
                moz-do-not-send="true">Intel XE#327</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sequence@queue-idle@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-8/igt@kms_sequence@queue-idle@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-8/igt@kms_sequence@queue-idle@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>) +3 other tests
              timeout</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-bmg-8/igt@kms_setmode@basic.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-8/igt@kms_setmode@basic.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883"
                moz-do-not-send="true">Intel XE#2883</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899"
                moz-do-not-send="true">Intel XE#899</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905"
                moz-do-not-send="true">Intel XE#2905</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@multigpu-basic-client-many:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@xe_eudebug@multigpu-basic-client-many.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905"
                moz-do-not-send="true">Intel XE#2905</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-small:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-threads-large:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392"
                moz-do-not-send="true">Intel XE#1392</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392"
                moz-do-not-send="true">Intel XE#1392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-rebind-prefetch:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-2/igt@xe_exec_fault_mode@many-rebind-prefetch.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@mi-rpc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@xe_oa@mi-rpc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@mmio-triggered-reports@rcs-0:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-8/igt@xe_oa@mmio-triggered-reports@rcs-0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249"
                moz-do-not-send="true">Intel XE#2249</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-5/igt@xe_oa@mmio-triggered-reports@rcs-0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249"
                moz-do-not-send="true">Intel XE#2249</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-multiple-execs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@xe_pm@d3cold-multiple-execs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"
                moz-do-not-send="true">Intel XE#2284</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366"
                moz-do-not-send="true">Intel XE#366</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-exec-after:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-3/igt@xe_pm@s4-exec-after.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-9/igt@xe_pm@s4-exec-after.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607"
                moz-do-not-send="true">Intel XE#1607</a>) +1 other test
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@vram-d3cold-threshold:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579"
                moz-do-not-send="true">Intel XE#579</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@toggle-gt-c6:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958"
                moz-do-not-send="true">Intel XE#958</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827"
                moz-do-not-send="true">Intel XE#827</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194"
                moz-do-not-send="true">Intel XE#3194</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events.html"
                moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-0.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"
                moz-do-not-send="true">Intel XE#3113</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color@deep-color:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-6/igt@kms_color@deep-color.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929"
                moz-do-not-send="true">Intel XE#2929</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-6/igt@kms_color@deep-color.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html"
                moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@blocking-wf_vblank:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-436/igt@kms_flip@blocking-wf_vblank.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882"
                moz-do-not-send="true">Intel XE#2882</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-433/igt@kms_flip@blocking-wf_vblank.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@blocking-wf_vblank@a-hdmi-a6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-436/igt@kms_flip@blocking-wf_vblank@a-hdmi-a6.html"
                moz-do-not-send="true">FAIL</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-433/igt@kms_flip@blocking-wf_vblank@a-hdmi-a6.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"
                moz-do-not-send="true">Intel XE#886</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html"
                moz-do-not-send="true">PASS</a> +4 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html"
                moz-do-not-send="true">PASS</a> +4 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049"
                moz-do-not-send="true">Intel XE#2049</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597"
                moz-do-not-send="true">Intel XE#2597</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-436/igt@kms_flip@flip-vs-suspend.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-434/igt@kms_flip@flip-vs-suspend@d-dp4.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049"
                moz-do-not-send="true">Intel XE#2049</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-linear:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-linear.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491"
                moz-do-not-send="true">Intel XE#1491</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-4-rc-ccs-to-linear.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"
                moz-do-not-send="true">Intel XE#1874</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html"
                moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@force-edid:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-9/igt@kms_force_connector_basic@force-edid.html"
                moz-do-not-send="true">DMESG-WARN</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-2/igt@kms_force_connector_basic@force-edid.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html"
                moz-do-not-send="true">DMESG-WARN</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-source-clamping:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-bmg-4/igt@kms_plane@pixel-format-source-clamping.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566"
                moz-do-not-send="true">Intel XE#2566</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-5/igt@kms_plane@pixel-format-source-clamping.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-bmg-4/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-5/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361"
                moz-do-not-send="true">Intel XE#361</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@deep-pkgc:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029"
                moz-do-not-send="true">Intel XE#2029</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-rotation-180:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-7/igt@kms_rotation_crc@primary-rotation-180.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055"
                moz-do-not-send="true">Intel XE#2055</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-1/igt@kms_rotation_crc@primary-rotation-180.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899"
                moz-do-not-send="true">Intel XE#899</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html"
                moz-do-not-send="true">FAIL</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-3/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667"
                moz-do-not-send="true">Intel XE#2667</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-large-multi-vm-cm:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600"
                moz-do-not-send="true">Intel XE#1600</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-466/igt@xe_evict@evict-threads-large.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@xe_evict@evict-threads-large.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@parallel-gt-reset:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html"
                moz-do-not-send="true">ABORT</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html"
                moz-do-not-send="true">PASS</a></li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html"
                moz-do-not-send="true">ABORT</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-mocs:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-9/igt@xe_pm@s4-mocs.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-8/igt@xe_pm@s4-mocs.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-multiple-execs:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607"
                moz-do-not-send="true">Intel XE#1607</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html"
                moz-do-not-send="true">PASS</a></li>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607"
                moz-do-not-send="true">Intel XE#1607</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-lnl-4/igt@xe_pm@s4-multiple-execs.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827"
                moz-do-not-send="true">Intel XE#827</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194"
                moz-do-not-send="true">Intel XE#3194</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204"
                moz-do-not-send="true">Intel XE#1204</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242"
                moz-do-not-send="true">Intel XE#1242</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html"
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
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242"
                moz-do-not-send="true">Intel XE#1242</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194"
                moz-do-not-send="true">Intel XE#3194</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194"
                moz-do-not-send="true">Intel XE#3194</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242"
                moz-do-not-send="true">Intel XE#1242</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"
                moz-do-not-send="true">Intel XE#1874</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html"
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
          <p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362"
                moz-do-not-send="true">Intel XE#362</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729"
                moz-do-not-send="true">Intel XE#1729</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500"
                moz-do-not-send="true">Intel XE#1500</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140280v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362"
                moz-do-not-send="true">Intel XE#362</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52
          -&gt; xe-pw-140280v2</li>
      </ul>
      <p>IGT_8081: 9b8c0f6da8898f760bfaa2113455eb84b68a69f4 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-2107-beaeaccd284ba3b69b6dbfdc18bb89441fc99a52:
        beaeaccd284ba3b69b6dbfdc18bb89441fc99a52<br>
        xe-pw-140280v2: 140280v2</p>
    </blockquote>
  </body>
</html>

--------------llFqIYGcI4f8UGIxm9AgVNOj--
