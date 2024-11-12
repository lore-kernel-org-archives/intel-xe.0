Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CECDD32D82
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 10:04:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57D910E203;
	Tue, 12 Nov 2024 10:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TGJEOqLj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50F310E203
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 10:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731405877; x=1762941877;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=bp7iczVq5U/jferPHI60q7DpsWY5qOogfryXuaIpYl0=;
 b=TGJEOqLjQBoevqgm3sc1xiFcuE7hsC7Zuu3/AaPRxKYU1p1WoaBfDrtj
 ytcu714OSAtpn5xKE6QbBkVdjVMVvcDoltY5PA2bsFYIWGySLyZQHazSm
 2icC5WihyI+iv+uD46FEMoNTH1BwpGisEyfar3XypF34YUyZo58MiGXtO
 YeKhxUljd7qMdQQy8AentVgZaf6ztrABWKD7zyqtvELtUYqiW4Tn0jTOO
 2+fnrAFNFqgZav2z/bLdaIlQQrIpYlfO2w+oJ7Yp8eReLF+vJcd/LI2Dw
 DBfv9zRx07fZeLv/CfbaFznFZrPgMe6eXVqAH4T3o8RYKjMtwsUX0OjOX A==;
X-CSE-ConnectionGUID: LDtVbjsDRz2qPQO2TsYHvA==
X-CSE-MsgGUID: 3Y5YQ28SR26FOIyqs9+Xqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="41856172"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208,217";a="41856172"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 02:04:37 -0800
X-CSE-ConnectionGUID: VIQ4z1GGTBqUC2dDl/+z0g==
X-CSE-MsgGUID: 89/MHZ/zSXC04ZR39HG/aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208,217";a="92331052"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.134.205])
 ([10.245.134.205])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 02:04:35 -0800
Content-Type: multipart/alternative;
 boundary="------------8FwZA0MES2oxqs07PE2sqKOU"
Message-ID: <fab73ee0-d77d-4c90-8f75-48dd3ffc6abb@linux.intel.com>
Date: Tue, 12 Nov 2024 11:04:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Take_j?=
 =?UTF-8?Q?ob_list_lock_in_xe=5Fsched=5Ffirst=5Fpending=5Fjob_=28rev2=29?=
To: intel-xe@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20241105160327.2970277-1-nirmoy.das@intel.com>
 <173104694695.1425808.8756345102857807360@2413ebb6fbb6>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <173104694695.1425808.8756345102857807360@2413ebb6fbb6>
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
--------------8FwZA0MES2oxqs07PE2sqKOU
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/8/2024 7:22 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe: Take job list lock in xe_sched_first_pending_job (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/140957/
> *State:* 	failure
> *Details:* 	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/index.html
>
>
>   CI Bug Log - changes from xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3_full -> xe-pw-140957v2_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-140957v2_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-140957v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
> Here are the unknown changes that may have been introduced in xe-pw-140957v2_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_cursor_crc@cursor-suspend:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html> +1 other test dmesg-warn
>

Unrelated PM locking  warning

>  *
>
>  *
>
>     igt@kms_cursor_legacy@torture-move@all-pipes:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-463/igt@kms_cursor_legacy@torture-move@all-pipes.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-464/igt@kms_cursor_legacy@torture-move@all-pipes.html>
>
Existing warn for the LNL scheduling issue
>
>  *
>
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html> +1 other test skip
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-270:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-270.html>
>  *
>
>     igt@kms_vblank@query-forked-hang:
>
>       o shard-bmg: NOTRUN -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-8/igt@kms_vblank@query-forked-hang.html> +1 other test incomplete
>  *
>
>     igt@kms_vrr@flip-suspend@pipe-a-edp-1:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-5/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html> +1 other test fail
>
Unrelated.


Merged to drm-xe-next


>  *
>
>
>     New tests
>
> New tests have been introduced between xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3_full and xe-pw-140957v2_full:
>
>
>       New IGT tests (8)
>
>  *
>
>     igt@kms_color@ctm-signed@pipe-d-dp-5:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.88] s
>  *
>
>     igt@kms_flip@2x-absolute-wf_vblank@ab-hdmi-a6-dp5:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [5.55] s
>  *
>
>     igt@kms_flip@2x-absolute-wf_vblank@ac-hdmi-a6-dp5:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [5.54] s
>  *
>
>     igt@kms_flip@2x-absolute-wf_vblank@ad-hdmi-a6-dp5:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [5.52] s
>  *
>
>     igt@kms_flip@2x-absolute-wf_vblank@bc-hdmi-a6-dp5:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [5.35] s
>  *
>
>     igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a6-dp5:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [5.34] s
>  *
>
>     igt@kms_flip@2x-absolute-wf_vblank@cd-hdmi-a6-dp5:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [5.38] s
>  *
>
>     igt@kms_lease@lease-invalid-crtc@pipe-d-dp-5:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>
>
>     Known issues
>
> Here are the changes found in xe-pw-140957v2_full that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@intel_hwmon@hwmon-read:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@intel_hwmon@hwmon-read.html> (Intel XE#1125 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125>)
>  *
>
>     igt@kms_big_fb@4-tiled-32bpp-rotate-180:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#1407 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +2 other tests skip
>  *
>
>     igt@kms_big_fb@linear-32bpp-rotate-270:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-270.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1 other test skip
>  *
>
>     igt@kms_big_fb@y-tiled-8bpp-rotate-270:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1 other test skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +3 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4 other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html> (Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1 other test skip
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html> (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html> (Intel XE#2191 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-2560x1440p:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html> (Intel XE#1512 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512>)
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html> (Intel XE#2887 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +5 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +7 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#2887 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +25 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +11 other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-5:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-5.html> (Intel XE#616 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) +3 other tests fail
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +80 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html> (Intel XE#2907 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>)
>  *
>
>     igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html> (Intel XE#1152 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152>) +3 other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-0-50:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_chamelium_color@ctm-0-50.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_color@ctm-negative:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_chamelium_color@ctm-negative.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_color@degamma:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_chamelium_color@degamma.html> (Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_frames@dp-crc-single:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_chamelium_frames@dp-crc-single.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +3 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-1:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@kms_content_protection@dp-mst-lic-type-1.html> (Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>  *
>
>     igt@kms_content_protection@dp-mst-type-0:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html> (Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) +1 other test skip
>  *
>
>     igt@kms_content_protection@lic-type-1:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_content_protection@lic-type-1.html> (Intel XE#3278 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278>)
>  *
>
>     igt@kms_cursor_crc@cursor-random-max-size:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_cursor_crc@cursor-random-max-size.html> (Intel XE#1424 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x512:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x512.html> (Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>  *
>
>     igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html> (Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +3 other tests skip
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html> (Intel XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +2 other tests skip
>  *
>
>     igt@kms_cursor_legacy@torture-move:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-463/igt@kms_cursor_legacy@torture-move.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-464/igt@kms_cursor_legacy@torture-move.html> (Intel XE#3184 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184>)
>  *
>
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html> (Intel XE#1421 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +2 other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +1 other test fail
>  *
>
>     igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html> (Intel XE#310 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>) +2 other tests skip
>  *
>
>     igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>)
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +1 other test fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html> (Intel XE#1397 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397> / Intel XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html> (Intel XE#1397 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html> (Intel XE#1401 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> / Intel XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>) +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html> (Intel XE#1401 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>) +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +7 other tests skip
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
>  *
>
>     igt@kms_force_connector_basic@force-edid:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_force_connector_basic@force-edid.html> (Intel XE#352 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/352>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +2 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +8 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +15 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html> (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +7 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +9 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +10 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +2 other tests skip
>  *
>
>     igt@kms_hdr@static-toggle:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@kms_hdr@static-toggle.html> (Intel XE#1503 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>)
>  *
>
>     igt@kms_joiner@basic-force-ultra-joiner:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@kms_joiner@basic-force-ultra-joiner.html> (Intel XE#2934 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934>)
>  *
>
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html> (Intel XE#2927 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>  *
>
>     igt@kms_panel_fitting@legacy:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_panel_fitting@legacy.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +6 other tests skip
>  *
>
>     igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-1/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-1/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1.html> (Intel XE#2055 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055>) +1 other test dmesg-warn
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size:
>
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html> (Intel XE#361 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/361>) +1 other test fail
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +2 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1 other test skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html> (Intel XE#2763 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +7 other tests skip
>  *
>
>     igt@kms_pm_backlight@bad-brightness:
>
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-8/igt@kms_pm_backlight@bad-brightness.html> (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_pm_backlight@fade-with-dpms:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_pm_backlight@fade-with-dpms.html> (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_pm_dc@dc5-dpms:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html> (Intel XE#718 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>)
>  *
>
>     igt@kms_pm_dc@deep-pkgc:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_pm_dc@deep-pkgc.html> (Intel XE#2007 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007>)
>  *
>
>     igt@kms_pm_rpm@drm-resources-equal:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-3/igt@kms_pm_rpm@drm-resources-equal.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-6/igt@kms_pm_rpm@drm-resources-equal.html> (Intel XE#2042 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +3 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html> (Intel XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +3 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html> (Intel XE#2893 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>) +1 other test skip
>  *
>
>     igt@kms_psr@fbc-psr2-cursor-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-blt.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +3 other tests skip
>  *
>
>     igt@kms_psr@pr-cursor-plane-move:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_psr@pr-cursor-plane-move.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +2 other tests skip
>  *
>
>     igt@kms_psr@pr-sprite-plane-onoff:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_psr@pr-sprite-plane-onoff.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +2 other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html> (Intel XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>  *
>
>     igt@kms_sequence@get-busy:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-9/igt@kms_sequence@get-busy.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-8/igt@kms_sequence@get-busy.html> (Intel XE#3086 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086>) +1 other test dmesg-warn
>  *
>
>     igt@kms_vblank@ts-continuation-suspend:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html> (Intel XE#1034 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034> / Intel XE#2625 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625>)
>  *
>
>     igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-4.html> (Intel XE#1034 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034>)
>  *
>
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html> (Intel XE#2159 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159>) +1 other test fail
>  *
>
>     igt@kms_writeback@writeback-check-output:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_writeback@writeback-check-output.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>  *
>
>     igt@xe_ccs@block-multicopy-compressed:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@xe_ccs@block-multicopy-compressed.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#488 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/488>)
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0xfd:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html> (Intel XE#1126 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>  *
>
>     igt@xe_eudebug@discovery-race-vmbind:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@xe_eudebug@discovery-race-vmbind.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +1 other test skip
>  *
>
>     igt@xe_eudebug@sysfs-toggle:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@xe_eudebug@sysfs-toggle.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +3 other tests skip
>  *
>
>     igt@xe_eudebug_online@resume-dss:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@xe_eudebug_online@resume-dss.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +3 other tests skip
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-large:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>  *
>
>     igt@xe_evict@evict-threads-large:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@xe_evict@evict-threads-large.html> (Intel XE#261 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> / Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +2 other tests skip
>  *
>
>     igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html> (Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +3 other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html> (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +2 other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html> (Intel XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1 other test skip
>  *
>
>     igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html> (Intel XE#1630 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630>) +2 other tests fail
>  *
>
>     igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:
>
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-7/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html> (Intel XE#1630 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630>)
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +6 other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html> (Intel XE#3320 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3320>)
>  *
>
>     igt@xe_exec_fault_mode@once-rebind-imm:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@xe_exec_fault_mode@once-rebind-imm.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +5 other tests skip
>  *
>
>     igt@xe_exec_reset@cat-error:
>
>       o shard-adlp: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@xe_exec_reset@cat-error.html> (Intel XE#358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/358>)
>  *
>
>     igt@xe_gt_freq@freq_reset_multiple:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html> (Intel XE#3184 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184>)
>  *
>
>     igt@xe_module_load@many-reload:
>
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-3/igt@xe_module_load@many-reload.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-5/igt@xe_module_load@many-reload.html> (Intel XE#2910 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2910>)
>  *
>
>     igt@xe_noexec_ping_pong:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@xe_noexec_ping_pong.html> (Intel XE#379 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/379>)
>  *
>
>     igt@xe_oa@oa-unit-concurrent-oa-buffer-read:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +2 other tests skip
>  *
>
>     igt@xe_oa@syncs-syncobj-cfg:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@xe_oa@syncs-syncobj-cfg.html> (Intel XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +1 other test skip
>  *
>
>     igt@xe_pm@d3cold-basic:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@xe_pm@d3cold-basic.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>  *
>
>     igt@xe_pm@d3cold-mocs:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@xe_pm@d3cold-mocs.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>)
>  *
>
>     igt@xe_pm@s2idle-vm-bind-prefetch:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-prefetch.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html> (Intel XE#1694 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694>)
>  *
>
>     igt@xe_pm@s3-basic:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-464/igt@xe_pm@s3-basic.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-432/igt@xe_pm@s3-basic.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_pm@s3-basic-exec:
>
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@xe_pm@s3-basic-exec.html> (Intel XE#584 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/584>)
>  *
>
>     igt@xe_pm@s4-basic-exec:
>
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-2/igt@xe_pm@s4-basic-exec.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-9/igt@xe_pm@s4-basic-exec.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_pm@s4-mocs:
>
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-464/igt@xe_pm@s4-mocs.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-432/igt@xe_pm@s4-mocs.html> (Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_pm@vram-d3cold-threshold:
>
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html> (Intel XE#579 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
>  *
>
>     igt@xe_query@multigpu-query-invalid-cs-cycles:
>
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@xe_query@multigpu-query-invalid-cs-cycles.html> (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_wedged@basic-wedged:
>
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@xe_wedged@basic-wedged.html> (Intel XE#2919 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
>
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html> (Intel XE#3194 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html>
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html> (Intel XE#1426 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html> +1 other test pass
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html> (Intel XE#1426 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html> +1 other test pass
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
>
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html> (Intel XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html>
>  *
>
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html>
>  *
>
>     igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-4/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html> (Intel XE#1541 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
>
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html> +3 other tests pass
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html> +14 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html> +7 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-suspend@c-edp1:
>
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-4/igt@kms_flip@flip-vs-suspend@c-edp1.html> (Intel XE#2932 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@kms_flip@flip-vs-suspend@c-edp1.html> +3 other tests pass
>  *
>
>     igt@kms_flip@plain-flip-ts-check:
>
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-4/igt@kms_flip@plain-flip-ts-check.html> (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-8/igt@kms_flip@plain-flip-ts-check.html> +2 other tests pass
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-2/igt@kms_flip@plain-flip-ts-check.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-4/igt@kms_flip@plain-flip-ts-check.html> +2 other tests pass
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode:
>
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode.html> +2 other tests pass
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html> +1 other test pass
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html> (Intel XE#1430 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html>
>  *
>
>     igt@kms_setmode@basic@pipe-b-edp-1:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html> (Intel XE#2883 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html> +2 other tests pass
>  *
>
>     igt@xe_evict@evict-large-multi-vm-cm:
>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html> (Intel XE#1600 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html>
>  *
>
>     igt@xe_evict@evict-mixed-threads-large:
>
>       o shard-bmg: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-8/igt@xe_evict@evict-mixed-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#2472 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html>
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
>
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html> (Intel XE#1630 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html> +1 other test pass
>  *
>
>     igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:
>
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html> (Intel XE#1630 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html> +1 other test pass
>  *
>
>     igt@xe_pm@s2idle-basic:
>
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-3/igt@xe_pm@s2idle-basic.html> (Intel XE#3086 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-9/igt@xe_pm@s2idle-basic.html>
>  *
>
>     igt@xe_pm@s2idle-basic-exec:
>
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-432/igt@xe_pm@s2idle-basic-exec.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@xe_pm@s2idle-basic-exec.html>
>  *
>
>     igt@xe_pm@s2idle-vm-bind-userptr:
>
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html> (Intel XE#1694 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-userptr.html>
>  *
>
>     igt@xe_pm@s4-basic:
>
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-9/igt@xe_pm@s4-basic.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@xe_pm@s4-basic.html>
>  *
>
>     igt@xe_pm@s4-d3hot-basic-exec:
>
>       o shard-lnl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@xe_pm@s4-d3hot-basic-exec.html>
>  *
>
>     igt@xe_pm@s4-multiple-execs:
>
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html>
>  *
>
>     igt@xe_pm_residency@cpg-basic:
>
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-432/igt@xe_pm_residency@cpg-basic.html> (Intel XE#3363 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3363>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-466/igt@xe_pm_residency@cpg-basic.html>
>  *
>
>     igt@xe_pm_residency@toggle-gt-c6:
>
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html> (Intel XE#958 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/958>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip:
>
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html> (Intel XE#3194 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) +1 other test dmesg-fail
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (Intel XE#3194 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#3194 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231> / Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242>) +1 other test fail
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#2426 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#1729 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (Intel XE#2426 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (Intel XE#2509 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (Intel XE#362 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (Intel XE#1500 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500>)
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-large:
>
>       o shard-dg2-set2: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html> (Intel XE#1000 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000>)
>
>
>     Build changes
>
>   * Linux: xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3 -> xe-pw-140957v2
>
> IGT_8100: 84e42580f918da926481fd2fb37be01451d6ee9a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3: 5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3
> xe-pw-140957v2: 140957v2
>
--------------8FwZA0MES2oxqs07PE2sqKOU
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/8/2024 7:22 AM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:173104694695.1425808.8756345102857807360@2413ebb6fbb6">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe: Take job list lock in xe_sched_first_pending_job
              (rev2)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/140957/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/140957/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3_full -&gt;
        xe-pw-140957v2_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-140957v2_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-140957v2_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-140957v2_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_cursor_crc@cursor-suspend:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html"
                moz-do-not-send="true">DMESG-WARN</a> +1 other test
              dmesg-warn</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p><br>
    </p>
    <p>Unrelated PM locking  warning<br>
    </p>
    <blockquote type="cite"
      cite="mid:173104694695.1425808.8756345102857807360@2413ebb6fbb6">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@torture-move@all-pipes:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-463/igt@kms_cursor_legacy@torture-move@all-pipes.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-464/igt@kms_cursor_legacy@torture-move@all-pipes.html"
                moz-do-not-send="true">DMESG-WARN</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    Existing warn for the LNL scheduling issue<br>
    <blockquote type="cite"
      cite="mid:173104694695.1425808.8756345102857807360@2413ebb6fbb6">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html"
                moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-270:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-270.html"
                moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@query-forked-hang:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-8/igt@kms_vblank@query-forked-hang.html"
                moz-do-not-send="true">INCOMPLETE</a> +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-5/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html"
                moz-do-not-send="true">FAIL</a> +1 other test fail</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>Unrelated.</p>
    <p><br>
    </p>
    <p>Merged to drm-xe-next</p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:173104694695.1425808.8756345102857807360@2413ebb6fbb6">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between
        xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3_full and
        xe-pw-140957v2_full:</p>
      <h3>New IGT tests (8)</h3>
      <ul>
        <li>
          <p>igt@kms_color@ctm-signed@pipe-d-dp-5:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.88] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-absolute-wf_vblank@ab-hdmi-a6-dp5:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [5.55] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-absolute-wf_vblank@ac-hdmi-a6-dp5:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [5.54] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-absolute-wf_vblank@ad-hdmi-a6-dp5:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [5.52] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-absolute-wf_vblank@bc-hdmi-a6-dp5:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [5.35] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a6-dp5:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [5.34] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-absolute-wf_vblank@cd-hdmi-a6-dp5:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [5.38] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_lease@lease-invalid-crtc@pipe-d-dp-5:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-140957v2_full that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@intel_hwmon@hwmon-read:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@intel_hwmon@hwmon-read.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125"
                moz-do-not-send="true">Intel XE#1125</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407"
                moz-do-not-send="true">Intel XE#1407</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) +1 other test
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191"
                moz-do-not-send="true">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191"
                moz-do-not-send="true">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512"
                moz-do-not-send="true">Intel XE#1512</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887"
                moz-do-not-send="true">Intel XE#2887</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887"
                moz-do-not-send="true">Intel XE#2887</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +25 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-5:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-5.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616"
                moz-do-not-send="true">Intel XE#616</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +80 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907"
                moz-do-not-send="true">Intel XE#2907</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"
                moz-do-not-send="true">Intel XE#3113</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152"
                moz-do-not-send="true">Intel XE#1152</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-50:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_chamelium_color@ctm-0-50.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-negative:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_chamelium_color@ctm-negative.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@degamma:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_chamelium_color@degamma.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@dp-crc-single:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_chamelium_frames@dp-crc-single.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@kms_content_protection@dp-mst-lic-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307"
                moz-do-not-send="true">Intel XE#307</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-0:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307"
                moz-do-not-send="true">Intel XE#307</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_content_protection@lic-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278"
                moz-do-not-send="true">Intel XE#3278</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-max-size:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_cursor_crc@cursor-random-max-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424"
                moz-do-not-send="true">Intel XE#1424</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x512.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"
                moz-do-not-send="true">Intel XE#308</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309"
                moz-do-not-send="true">Intel XE#309</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309"
                moz-do-not-send="true">Intel XE#309</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@torture-move:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-463/igt@kms_cursor_legacy@torture-move.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-464/igt@kms_cursor_legacy@torture-move.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184"
                moz-do-not-send="true">Intel XE#3184</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421"
                moz-do-not-send="true">Intel XE#1421</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310"
                moz-do-not-send="true">Intel XE#310</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"
                moz-do-not-send="true">Intel XE#886</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397"
                moz-do-not-send="true">Intel XE#1397</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745"
                moz-do-not-send="true">Intel XE#1745</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397"
                moz-do-not-send="true">Intel XE#1397</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401"
                moz-do-not-send="true">Intel XE#1401</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745"
                moz-do-not-send="true">Intel XE#1745</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401"
                moz-do-not-send="true">Intel XE#1401</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"
                moz-do-not-send="true">Intel XE#1874</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@force-edid:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_force_connector_basic@force-edid.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352"
                moz-do-not-send="true">Intel XE#352</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"
                moz-do-not-send="true">Intel XE#656</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311"
                moz-do-not-send="true">Intel XE#2311</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"
                moz-do-not-send="true">Intel XE#656</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@kms_hdr@static-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"
                moz-do-not-send="true">Intel XE#1503</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-ultra-joiner:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@kms_joiner@basic-force-ultra-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934"
                moz-do-not-send="true">Intel XE#2934</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927"
                moz-do-not-send="true">Intel XE#2927</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@legacy:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_panel_fitting@legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-1/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-1/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-b-edp-1.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055"
                moz-do-not-send="true">Intel XE#2055</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361"
                moz-do-not-send="true">Intel XE#361</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763"
                moz-do-not-send="true">Intel XE#2763</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763"
                moz-do-not-send="true">Intel XE#2763</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763"
                moz-do-not-send="true">Intel XE#2763</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@bad-brightness:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-8/igt@kms_pm_backlight@bad-brightness.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870"
                moz-do-not-send="true">Intel XE#870</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade-with-dpms:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_pm_backlight@fade-with-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870"
                moz-do-not-send="true">Intel XE#870</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-dpms:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718"
                moz-do-not-send="true">Intel XE#718</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@deep-pkgc:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_pm_dc@deep-pkgc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007"
                moz-do-not-send="true">Intel XE#2007</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@drm-resources-equal:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-3/igt@kms_pm_rpm@drm-resources-equal.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-6/igt@kms_pm_rpm@drm-resources-equal.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042"
                moz-do-not-send="true">Intel XE#2042</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893"
                moz-do-not-send="true">Intel XE#2893</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-cursor-plane-move:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_psr@pr-cursor-plane-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"
                moz-do-not-send="true">Intel XE#1406</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-sprite-plane-onoff:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_psr@pr-sprite-plane-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"
                moz-do-not-send="true">Intel XE#2850</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127"
                moz-do-not-send="true">Intel XE#1127</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sequence@get-busy:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-9/igt@kms_sequence@get-busy.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-8/igt@kms_sequence@get-busy.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086"
                moz-do-not-send="true">Intel XE#3086</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034"
                moz-do-not-send="true">Intel XE#1034</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625"
                moz-do-not-send="true">Intel XE#2625</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-4.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034"
                moz-do-not-send="true">Intel XE#1034</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159"
                moz-do-not-send="true">Intel XE#2159</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-check-output:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_writeback@writeback-check-output.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756"
                moz-do-not-send="true">Intel XE#756</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_ccs@block-multicopy-compressed:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@xe_ccs@block-multicopy-compressed.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488"
                moz-do-not-send="true">Intel XE#488</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126"
                moz-do-not-send="true">Intel XE#1126</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@discovery-race-vmbind:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@xe_eudebug@discovery-race-vmbind.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905"
                moz-do-not-send="true">Intel XE#2905</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@sysfs-toggle:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@xe_eudebug@sysfs-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905"
                moz-do-not-send="true">Intel XE#2905</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@resume-dss:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@xe_eudebug_online@resume-dss.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905"
                moz-do-not-send="true">Intel XE#2905</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-threads-large:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@xe_evict@evict-threads-large.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261"
                moz-do-not-send="true">Intel XE#261</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688"
                moz-do-not-send="true">Intel XE#688</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688"
                moz-do-not-send="true">Intel XE#688</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392"
                moz-do-not-send="true">Intel XE#1392</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392"
                moz-do-not-send="true">Intel XE#1392</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630"
                moz-do-not-send="true">Intel XE#1630</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-7/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630"
                moz-do-not-send="true">Intel XE#1630</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3320"
                moz-do-not-send="true">Intel XE#3320</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-rebind-imm:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@xe_exec_fault_mode@once-rebind-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@cat-error:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@xe_exec_reset@cat-error.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358"
                moz-do-not-send="true">Intel XE#358</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_gt_freq@freq_reset_multiple:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184"
                moz-do-not-send="true">Intel XE#3184</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@many-reload:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-3/igt@xe_module_load@many-reload.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-5/igt@xe_module_load@many-reload.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2910"
                moz-do-not-send="true">Intel XE#2910</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_noexec_ping_pong:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@xe_noexec_ping_pong.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/379"
                moz-do-not-send="true">Intel XE#379</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@oa-unit-concurrent-oa-buffer-read:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@syncs-syncobj-cfg:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@xe_oa@syncs-syncobj-cfg.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-basic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@xe_pm@d3cold-basic.html"
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
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@xe_pm@d3cold-mocs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"
                moz-do-not-send="true">Intel XE#2284</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-prefetch.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694"
                moz-do-not-send="true">Intel XE#1694</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-basic:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-464/igt@xe_pm@s3-basic.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-432/igt@xe_pm@s3-basic.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-basic-exec:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@xe_pm@s3-basic-exec.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584"
                moz-do-not-send="true">Intel XE#584</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-basic-exec:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-2/igt@xe_pm@s4-basic-exec.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-9/igt@xe_pm@s4-basic-exec.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607"
                moz-do-not-send="true">Intel XE#1607</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-mocs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-464/igt@xe_pm@s4-mocs.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-432/igt@xe_pm@s4-mocs.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@vram-d3cold-threshold:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579"
                moz-do-not-send="true">Intel XE#579</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@xe_query@multigpu-query-invalid-cs-cycles.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_wedged@basic-wedged:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@xe_wedged@basic-wedged.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919"
                moz-do-not-send="true">Intel XE#2919</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194"
                moz-do-not-send="true">Intel XE#3194</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426"
                moz-do-not-send="true">Intel XE#1426</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426"
                moz-do-not-send="true">Intel XE#1426</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"
                moz-do-not-send="true">Intel XE#3113</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html"
                moz-do-not-send="true">INCOMPLETE</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-4/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541"
                moz-do-not-send="true">Intel XE#1541</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html"
                moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301"
                moz-do-not-send="true">Intel XE#301</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html"
                moz-do-not-send="true">PASS</a> +14 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"
                moz-do-not-send="true">Intel XE#886</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html"
                moz-do-not-send="true">PASS</a> +7 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend@c-edp1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-4/igt@kms_flip@flip-vs-suspend@c-edp1.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932"
                moz-do-not-send="true">Intel XE#2932</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-8/igt@kms_flip@flip-vs-suspend@c-edp1.html"
                moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-ts-check:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-4/igt@kms_flip@plain-flip-ts-check.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882"
                moz-do-not-send="true">Intel XE#2882</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-8/igt@kms_flip@plain-flip-ts-check.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-2/igt@kms_flip@plain-flip-ts-check.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"
                moz-do-not-send="true">Intel XE#886</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-4/igt@kms_flip@plain-flip-ts-check.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode.html"
                moz-do-not-send="true">DMESG-WARN</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-default-mode.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"
                moz-do-not-send="true">Intel XE#1874</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430"
                moz-do-not-send="true">Intel XE#1430</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883"
                moz-do-not-send="true">Intel XE#2883</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-large-multi-vm-cm:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600"
                moz-do-not-send="true">Intel XE#1600</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-threads-large:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-8/igt@xe_evict@evict-mixed-threads-large.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472"
                moz-do-not-send="true">Intel XE#2472</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630"
                moz-do-not-send="true">Intel XE#1630</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630"
                moz-do-not-send="true">Intel XE#1630</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race-imm.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-basic:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-3/igt@xe_pm@s2idle-basic.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086"
                moz-do-not-send="true">Intel XE#3086</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-9/igt@xe_pm@s2idle-basic.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-basic-exec:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-432/igt@xe_pm@s2idle-basic-exec.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@xe_pm@s2idle-basic-exec.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694"
                moz-do-not-send="true">Intel XE#1694</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-userptr.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-basic:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-9/igt@xe_pm@s4-basic.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607"
                moz-do-not-send="true">Intel XE#1607</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@xe_pm@s4-basic.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-d3hot-basic-exec:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607"
                moz-do-not-send="true">Intel XE#1607</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-lnl-7/igt@xe_pm@s4-d3hot-basic-exec.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-multiple-execs:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607"
                moz-do-not-send="true">Intel XE#1607</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@cpg-basic:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-432/igt@xe_pm_residency@cpg-basic.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3363"
                moz-do-not-send="true">Intel XE#3363</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-466/igt@xe_pm_residency@cpg-basic.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@toggle-gt-c6:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958"
                moz-do-not-send="true">Intel XE#958</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html"
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
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194"
                moz-do-not-send="true">Intel XE#3194</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a>) +1 other test
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194"
                moz-do-not-send="true">Intel XE#3194</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242"
                moz-do-not-send="true">Intel XE#1242</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194"
                moz-do-not-send="true">Intel XE#3194</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242"
                moz-do-not-send="true">Intel XE#1242</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426"
                moz-do-not-send="true">Intel XE#2426</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729"
                moz-do-not-send="true">Intel XE#1729</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-bmg: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426"
                moz-do-not-send="true">Intel XE#2426</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509"
                moz-do-not-send="true">Intel XE#2509</a>)</li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362"
                moz-do-not-send="true">Intel XE#362</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500"
                moz-do-not-send="true">Intel XE#1500</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140957v2/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000"
                moz-do-not-send="true">Intel XE#1000</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3
          -&gt; xe-pw-140957v2</li>
      </ul>
      <p>IGT_8100: 84e42580f918da926481fd2fb37be01451d6ee9a @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-2180-5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3:
        5ce87c5ad2cbfd2b89a0347e4e4f75de2762b7a3<br>
        xe-pw-140957v2: 140957v2</p>
    </blockquote>
  </body>
</html>

--------------8FwZA0MES2oxqs07PE2sqKOU--
