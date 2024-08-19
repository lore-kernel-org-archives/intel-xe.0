Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7101AC3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 08:00:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B52510E1E2;
	Mon, 19 Aug 2024 08:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uvu1paEA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414D210E1E2
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 08:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724054402; x=1755590402;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to;
 bh=ak/Lm6V/IsIuQCUjQOUpQX8UabnQ49WiGvI/VuAr/O8=;
 b=Uvu1paEA4ipq4dcpu6QBxzwlnXcHc1ouu3090zEbZ+0SL92CPTuZ3yj7
 8RboM2YzzXXJiMjs7zcaZvhu+kXAlygKUVZDhRrQclnDg5BkaPxsqImNI
 V/F6LWsTXttst2DQRQwkVGyIAs1pTU7pgX8R2Q5rQt2i7pwctre/IC+oa
 HosCKVXtpwRg0l9GOirtlkRUbGiBocWpR7bj0UEn3mafXddkC32P8o3wK
 4+Vox2JVfgVMyjW3FouOG4mj+rBLWUDbhlYTE65HOEXvaVk2MQ1K5jJNG
 RmAk+8tQ+mM/TkpWhmdIzQzl/AjIFO5GgmeSEGn3IOzQP3eQXLeuvWp9A g==;
X-CSE-ConnectionGUID: ksFihUL7QVeRvP4BItRMHg==
X-CSE-MsgGUID: 7jTSD/BzSB+NOxeLrnEupQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="22253807"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208,217";a="22253807"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 01:00:00 -0700
X-CSE-ConnectionGUID: eIh7jNTcRh28tdyaqibwhA==
X-CSE-MsgGUID: i6CiRgN+Rm6RaJYTE0ijxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208,217";a="60347886"
Received: from bpartyka-mobl1.ger.corp.intel.com (HELO [10.245.80.42])
 ([10.245.80.42])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 00:59:57 -0700
Content-Type: multipart/alternative;
 boundary="------------IXTMX22z9236sossZyZMbuSF"
Message-ID: <ebd68973-c4dd-4d14-b8fe-2b79e3b7273e@linux.intel.com>
Date: Mon, 19 Aug 2024 09:59:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Remove?=
 =?UTF-8?Q?_redundant_param_from_xe=5Fbo=5Fcreate=5Fuser?=
To: intel-xe@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20240816102248.25628-1-nirmoy.das@intel.com>
 <172384272157.659321.11137759759456750863@2413ebb6fbb6>
Content-Language: en-US
Cc: Matthew Brost <matthew.brost@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <172384272157.659321.11137759759456750863@2413ebb6fbb6>
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
--------------IXTMX22z9236sossZyZMbuSF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/16/2024 11:12 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe: Remove redundant param from xe_bo_create_user
> *URL:* 	https://patchwork.freedesktop.org/series/137383/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/index.html
>
>
>   CI Bug Log - changes from
>   xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c_full ->
>   xe-pw-137383v1_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-137383v1_full absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-137383v1_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 4)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-137383v1_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@xe_vm@mmap-style-bind-either-side-full:
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-6/igt@xe_vm@mmap-style-bind-either-side-full.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-7/igt@xe_vm@mmap-style-bind-either-side-full.html>
>

No functional change in this patch. Merged to drm-xe-next

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
>  *
>
>     igt@kms_cursor_legacy@single-move@pipe-b:
>
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-6/igt@kms_cursor_legacy@single-move@pipe-b.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-bmg-1/igt@kms_cursor_legacy@single-move@pipe-b.html>
>  *
>
>     igt@kms_flip@flip-vs-suspend:
>
>       o {shard-bmg}: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html>
>         +1 other test incomplete
>
>
>     Known issues
>
> Here are the changes found in xe-pw-137383v1_full that come from known 
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
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>)
>  *
>
>     igt@kms_atomic_interruptible@universal-setplane-primary:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-463/igt@kms_atomic_interruptible@universal-setplane-primary.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-463/igt@kms_atomic_interruptible@universal-setplane-primary.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1
>         other test incomplete
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (Intel XE#1426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) +1
>         other test fail
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html>
>         (Intel XE#1659
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659>) +2
>         other tests fail
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +13
>         other tests skip
>  *
>
>     igt@kms_content_protection@srm@pipe-a-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-4.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1
>         other test fail
>  *
>
>     igt@kms_cursor_legacy@torture-bo@pipe-a:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_cursor_legacy@torture-bo@pipe-a.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_cursor_legacy@torture-bo@pipe-a.html>
>         (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) +1
>         other test dmesg-warn
>  *
>
>     igt@kms_fbcon_fbt@psr-suspend:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html>
>         (Intel XE#776
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>)
>  *
>
>     igt@kms_feature_discovery@display-3x:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_feature_discovery@display-3x.html>
>         (Intel XE#703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>)
>  *
>
>     igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +1
>         other test fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html>
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) +3
>         other tests fail
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-suspend:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html>
>         (Intel XE#2028
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028>) +5
>         other tests fail
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +4
>         other tests skip
>  *
>
>     igt@kms_hdmi_inject@inject-audio:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html>
>         (Intel XE#417
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/417>)
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162>)
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html>
>         (Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html>
>         (Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318>) +2
>         other tests skip
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>         (Intel XE#1211
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211>)
>  *
>
>     igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html>
>         (Intel XE#771
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/771> /
>         Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>)
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html>
>         (Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) +1
>         other test fail
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html>
>         (Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>)
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) +2
>         other tests timeout
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-small:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) +1
>         other test incomplete
>  *
>
>     igt@xe_exec_basic@once-userptr:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-2/igt@xe_exec_basic@once-userptr.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-adlp-6/igt@xe_exec_basic@once-userptr.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
>  *
>
>     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +3
>         other tests skip
>  *
>
>     igt@xe_gt_freq@freq_reset_multiple:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-5/igt@xe_gt_freq@freq_reset_multiple.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html>
>         (Intel XE#1620
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620>)
>  *
>
>     igt@xe_oa@blocking:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@xe_oa@blocking.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>)
>  *
>
>     igt@xe_pm@s4-basic:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-8/igt@xe_pm@s4-basic.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-adlp-9/igt@xe_pm@s4-basic.html>
>         (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#1607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>)
>  *
>
>     igt@xe_pm@s4-exec-after:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-3/igt@xe_pm@s4-exec-after.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-2/igt@xe_pm@s4-exec-after.html>
>         (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#1607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>)
>  *
>
>     igt@xe_pm@s4-vm-bind-unbind-all:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html>
>         (Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_pm_residency@toggle-gt-c6:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html>
>         (Intel XE#958
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/958>)
>  *
>
>     igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-adlp-4/igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full.html>
>         (Intel XE#2226
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226>) +3
>         other tests dmesg-warn
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html>
>         +1 other test pass
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>         (Intel XE#1426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>         +1 other test pass
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html>
>         (Intel XE#1426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html>
>         +1 other test pass
>  *
>
>     igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html>
>         (Intel XE#1426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html>
>         +1 other test pass
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-dp-2:
>
>       o {shard-bmg}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-dp-2.html>
>         (Intel XE#2436
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-dp-2.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html>
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html>
>         +3 other tests pass
>  *
>
>     igt@kms_flip@wf_vblank-ts-check:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_flip@wf_vblank-ts-check.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_flip@wf_vblank-ts-check.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html>
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html>
>         +4 other tests pass
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html>
>         (Intel XE#2019
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html>
>  *
>
>     igt@kms_plane@plane-position-covered:
>
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-4/igt@kms_plane@plane-position-covered.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-1/igt@kms_plane@plane-position-covered.html>
>         +2 other tests pass
>  *
>
>     igt@kms_plane_cursor@viewport:
>
>       o {shard-bmg}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-2/igt@kms_plane_cursor@viewport.html>
>         (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-bmg-2/igt@kms_plane_cursor@viewport.html>
>         +5 other tests pass
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html>
>         (Intel XE#361
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/361>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html>
>  *
>
>     igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-7/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1.html>
>  *
>
>     igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html>
>         (Intel XE#2028
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-7/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html>
>         +7 other tests pass
>  *
>
>     igt@xe_evict@evict-beng-mixed-threads-large:
>
>       o {shard-bmg}: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-1/igt@xe_evict@evict-beng-mixed-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-bmg-1/igt@xe_evict@evict-beng-mixed-threads-large.html>
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html>
>  *
>
>     igt@xe_exec_balancer@once-virtual-userptr-invalidate-race:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@xe_exec_balancer@once-virtual-userptr-invalidate-race.html>
>         (Intel XE#2226
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-adlp-4/igt@xe_exec_balancer@once-virtual-userptr-invalidate-race.html>
>         +4 other tests pass
>
>
>         Warnings
>
>  *
>
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (Intel XE#623
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/623>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#623
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/623>)
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#801
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/801>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html>
>         (Intel XE#801
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/801>) +23
>         other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +7
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +7
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#619
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html>
>         (Intel XE#619
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>)
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>         (Intel XE#610
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#610
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>  *
>
>     igt@kms_big_joiner@basic:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@kms_big_joiner@basic.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_big_joiner@basic.html>
>         (Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +3
>         other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +62
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html>
>         (Intel XE#1252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>)
>  *
>
>     igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +17
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +17
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +62
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-0-75:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-75.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_color@gamma:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_chamelium_color@gamma.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_chamelium_color@gamma.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-fast:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-fast.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-fast.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +5
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +6
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>  *
>
>     igt@kms_fbcon_fbt@psr:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_fbcon_fbt@psr.html>
>         (Intel XE#776
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@kms_fbcon_fbt@psr.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#776
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>)
>  *
>
>     igt@kms_feature_discovery@display-4x:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_feature_discovery@display-4x.html>
>         (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_feature_discovery@display-4x.html>
>         (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +14
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +12
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +21
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +22
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +20
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-stridechange:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +20
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html>
>         (Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html>
>         (Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318>) +2
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html>
>         (Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318>) +2
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html>
>         (Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_pm_backlight@fade-with-dpms:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html>
>         (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_pm_backlight@fade-with-suspend:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html>
>         (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@kms_pm_backlight@fade-with-suspend.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2
>         other tests skip
>  *
>
>     igt@kms_psr2_su@page_flip-nv12:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>  *
>
>     igt@kms_psr@fbc-pr-dpms:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html>
>         (Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@kms_psr@fbc-pr-dpms.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +10
>         other tests skip
>  *
>
>     igt@kms_psr@psr-dpms:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_psr@psr-dpms.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_psr@psr-dpms.html>
>         (Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +10
>         other tests skip
>  *
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#1149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#1149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html>
>         (Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) +4
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1500
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#1500
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500>)
>  *
>
>     igt@kms_vrr@lobf:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_vrr@lobf.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_vrr@lobf.html>
>         (Intel XE#2168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>)
>  *
>
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-off:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_copy_basic@mem-copy-linear-0x3fff:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html>
>         (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html>
>         (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0xfd:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>) +1
>         other test skip
>  *
>
>     igt@xe_exec_fault_mode@twice-invalid-fault:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@xe_exec_fault_mode@twice-invalid-fault.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +19
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +16
>         other tests skip
>  *
>
>     igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html>
>         (Intel XE#2360
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2360
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
>  *
>
>     igt@xe_huc_copy@huc_copy:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_huc_copy@huc_copy.html>
>         (Intel XE#255
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/255>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@xe_huc_copy@huc_copy.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#255
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/255>)
>  *
>
>     igt@xe_oa@non-privileged-map-oa-buffer:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +3
>         other tests skip
>  *
>
>     igt@xe_oa@oa-regs-whitelisted:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_oa@oa-regs-whitelisted.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@xe_oa@oa-regs-whitelisted.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +3
>         other tests skip
>  *
>
>     igt@xe_pat@pat-index-xelpg:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html>
>         (Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>  *
>
>     igt@xe_pm@vram-d3cold-threshold:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#579
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#579
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
>  *
>
>     igt@xe_query@multigpu-query-invalid-cs-cycles:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>  *
>
>     igt@xe_query@multigpu-query-uc-fw-version-guc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * Linux: xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c ->
>     xe-pw-137383v1
>
> IGT_7972: c34e13f766d0ed48c8b62ad9d8c29f11a8441b8b @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c: 
> 70d6d55dea574b7b78ccf714699cc5d8d62fcc2c
> xe-pw-137383v1: 137383v1
>
--------------IXTMX22z9236sossZyZMbuSF
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
    <div class="moz-cite-prefix">On 8/16/2024 11:12 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:172384272157.659321.11137759759456750863@2413ebb6fbb6">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe: Remove redundant param from xe_bo_create_user</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/137383/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/137383/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c_full -&gt;
        xe-pw-137383v1_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-137383v1_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-137383v1_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-137383v1_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@xe_vm@mmap-style-bind-either-side-full:
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-6/igt@xe_vm@mmap-style-bind-either-side-full.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-7/igt@xe_vm@mmap-style-bind-either-side-full.html"
                moz-do-not-send="true">TIMEOUT</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p><br>
    </p>
    <p>No functional change in this patch. Merged to drm-xe-next <br>
    </p>
    <p>Thanks,</p>
    <p>Nirmoy<br>
    </p>
    <blockquote type="cite"
      cite="mid:172384272157.659321.11137759759456750863@2413ebb6fbb6">
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
          <p>igt@kms_cursor_legacy@single-move@pipe-b:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-6/igt@kms_cursor_legacy@single-move@pipe-b.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-bmg-1/igt@kms_cursor_legacy@single-move@pipe-b.html"
                moz-do-not-send="true">DMESG-WARN</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html"
                moz-do-not-send="true">INCOMPLETE</a> +1 other test
              incomplete</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-137383v1_full that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_interruptible@universal-setplane-primary:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-463/igt@kms_atomic_interruptible@universal-setplane-primary.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-463/igt@kms_atomic_interruptible@universal-setplane-primary.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426"
                moz-do-not-send="true">Intel XE#1426</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659"
                moz-do-not-send="true">Intel XE#1659</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191"
                moz-do-not-send="true">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178"
                moz-do-not-send="true">Intel XE#1178</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@torture-bo@pipe-a:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_cursor_legacy@torture-bo@pipe-a.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_cursor_legacy@torture-bo@pipe-a.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr-suspend:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776"
                moz-do-not-send="true">Intel XE#776</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-3x:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_feature_discovery@display-3x.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703"
                moz-do-not-send="true">Intel XE#703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"
                moz-do-not-send="true">Intel XE#886</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"
                moz-do-not-send="true">Intel XE#1874</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028"
                moz-do-not-send="true">Intel XE#2028</a>) +5 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdmi_inject@inject-audio:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417"
                moz-do-not-send="true">Intel XE#417</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162"
                moz-do-not-send="true">Intel XE#1162</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318"
                moz-do-not-send="true">Intel XE#2318</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318"
                moz-do-not-send="true">Intel XE#2318</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-6/igt@kms_pm_rpm@modeset-lpsp-stress.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-7/igt@kms_pm_rpm@modeset-lpsp-stress.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211"
                moz-do-not-send="true">Intel XE#1211</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771"
                moz-do-not-send="true">Intel XE#771</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899"
                moz-do-not-send="true">Intel XE#899</a>)</li>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899"
                moz-do-not-send="true">Intel XE#899</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899"
                moz-do-not-send="true">Intel XE#899</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>) +2 other tests
              timeout</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-small:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@once-userptr:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-2/igt@xe_exec_basic@once-userptr.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-adlp-6/igt@xe_exec_basic@once-userptr.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_gt_freq@freq_reset_multiple:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-5/igt@xe_gt_freq@freq_reset_multiple.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620"
                moz-do-not-send="true">Intel XE#1620</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@blocking:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@xe_oa@blocking.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-basic:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-8/igt@xe_pm@s4-basic.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-adlp-9/igt@xe_pm@s4-basic.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607"
                moz-do-not-send="true">Intel XE#1607</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-exec-after:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-3/igt@xe_pm@s4-exec-after.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-2/igt@xe_pm@s4-exec-after.html"
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
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@toggle-gt-c6:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958"
                moz-do-not-send="true">Intel XE#958</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-adlp-4/igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226"
                moz-do-not-send="true">Intel XE#2226</a>) +3 other tests
              dmesg-warn</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426"
                moz-do-not-send="true">Intel XE#1426</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426"
                moz-do-not-send="true">Intel XE#1426</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426"
                moz-do-not-send="true">Intel XE#1426</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-dp-2:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-dp-2.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436"
                moz-do-not-send="true">Intel XE#2436</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-dp-2.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"
                moz-do-not-send="true">Intel XE#886</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html"
                moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_flip@wf_vblank-ts-check.html"
                moz-do-not-send="true">INCOMPLETE</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_flip@wf_vblank-ts-check.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"
                moz-do-not-send="true">Intel XE#1874</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html"
                moz-do-not-send="true">PASS</a> +4 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019"
                moz-do-not-send="true">Intel XE#2019</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-covered:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-4/igt@kms_plane@plane-position-covered.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-1/igt@kms_plane@plane-position-covered.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@viewport:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-2/igt@kms_plane_cursor@viewport.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-bmg-2/igt@kms_plane_cursor@viewport.html"
                moz-do-not-send="true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361"
                moz-do-not-send="true">Intel XE#361</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1.html"
                moz-do-not-send="true">FAIL</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-7/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028"
                moz-do-not-send="true">Intel XE#2028</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-lnl-7/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html"
                moz-do-not-send="true">PASS</a> +7 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-bmg-1/igt@xe_evict@evict-beng-mixed-threads-large.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-bmg-1/igt@xe_evict@evict-beng-mixed-threads-large.html"
                moz-do-not-send="true">PASS</a></li>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@once-virtual-userptr-invalidate-race:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@xe_exec_balancer@once-virtual-userptr-invalidate-race.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226"
                moz-do-not-send="true">Intel XE#2226</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-adlp-4/igt@xe_exec_balancer@once-virtual-userptr-invalidate-race.html"
                moz-do-not-send="true">PASS</a> +4 other tests pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623"
                moz-do-not-send="true">Intel XE#623</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623"
                moz-do-not-send="true">Intel XE#623</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801"
                moz-do-not-send="true">Intel XE#801</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801"
                moz-do-not-send="true">Intel XE#801</a>) +23 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619"
                moz-do-not-send="true">Intel XE#619</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619"
                moz-do-not-send="true">Intel XE#619</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610"
                moz-do-not-send="true">Intel XE#610</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610"
                moz-do-not-send="true">Intel XE#610</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_joiner@basic:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@kms_big_joiner@basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346"
                moz-do-not-send="true">Intel XE#346</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_big_joiner@basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346"
                moz-do-not-send="true">Intel XE#346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191"
                moz-do-not-send="true">Intel XE#2191</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191"
                moz-do-not-send="true">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +62 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252"
                moz-do-not-send="true">Intel XE#1252</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252"
                moz-do-not-send="true">Intel XE#1252</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +17 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +17 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +62 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-75:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-75.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@gamma:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_chamelium_color@gamma.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_chamelium_color@gamma.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-fast.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-fast.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323"
                moz-do-not-send="true">Intel XE#323</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323"
                moz-do-not-send="true">Intel XE#323</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323"
                moz-do-not-send="true">Intel XE#323</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323"
                moz-do-not-send="true">Intel XE#323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_fbcon_fbt@psr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776"
                moz-do-not-send="true">Intel XE#776</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@kms_fbcon_fbt@psr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776"
                moz-do-not-send="true">Intel XE#776</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-4x:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_feature_discovery@display-4x.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138"
                moz-do-not-send="true">Intel XE#1138</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_feature_discovery@display-4x.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138"
                moz-do-not-send="true">Intel XE#1138</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +12 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +21 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +22 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +20 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-stridechange:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +20 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318"
                moz-do-not-send="true">Intel XE#2318</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318"
                moz-do-not-send="true">Intel XE#2318</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318"
                moz-do-not-send="true">Intel XE#2318</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318"
                moz-do-not-send="true">Intel XE#2318</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318"
                moz-do-not-send="true">Intel XE#2318</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318"
                moz-do-not-send="true">Intel XE#2318</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318"
                moz-do-not-send="true">Intel XE#2318</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318"
                moz-do-not-send="true">Intel XE#2318</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade-with-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870"
                moz-do-not-send="true">Intel XE#870</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870"
                moz-do-not-send="true">Intel XE#870</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade-with-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870"
                moz-do-not-send="true">Intel XE#870</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@kms_pm_backlight@fade-with-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870"
                moz-do-not-send="true">Intel XE#870</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-nv12:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122"
                moz-do-not-send="true">Intel XE#1122</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122"
                moz-do-not-send="true">Intel XE#1122</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@kms_psr@fbc-pr-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_psr@psr-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_psr@psr-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149"
                moz-do-not-send="true">Intel XE#1149</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149"
                moz-do-not-send="true">Intel XE#1149</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327"
                moz-do-not-send="true">Intel XE#327</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327"
                moz-do-not-send="true">Intel XE#327</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327"
                moz-do-not-send="true">Intel XE#327</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327"
                moz-do-not-send="true">Intel XE#327</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127"
                moz-do-not-send="true">Intel XE#1127</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127"
                moz-do-not-send="true">Intel XE#1127</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500"
                moz-do-not-send="true">Intel XE#1500</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500"
                moz-do-not-send="true">Intel XE#1500</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@lobf:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@kms_vrr@lobf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168"
                moz-do-not-send="true">Intel XE#2168</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@kms_vrr@lobf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168"
                moz-do-not-send="true">Intel XE#2168</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756"
                moz-do-not-send="true">Intel XE#756</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@kms_writeback@writeback-fb-id-xrgb2101010.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756"
                moz-do-not-send="true">Intel XE#756</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091"
                moz-do-not-send="true">Intel XE#1091</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091"
                moz-do-not-send="true">Intel XE#1091</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123"
                moz-do-not-send="true">Intel XE#1123</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123"
                moz-do-not-send="true">Intel XE#1123</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126"
                moz-do-not-send="true">Intel XE#1126</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126"
                moz-do-not-send="true">Intel XE#1126</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@xe_exec_fault_mode@twice-invalid-fault.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +19 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +16 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360"
                moz-do-not-send="true">Intel XE#2360</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360"
                moz-do-not-send="true">Intel XE#2360</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_huc_copy@huc_copy:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_huc_copy@huc_copy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255"
                moz-do-not-send="true">Intel XE#255</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@xe_huc_copy@huc_copy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255"
                moz-do-not-send="true">Intel XE#255</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@oa-regs-whitelisted:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_oa@oa-regs-whitelisted.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-434/igt@xe_oa@oa-regs-whitelisted.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xelpg:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979"
                moz-do-not-send="true">Intel XE#979</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979"
                moz-do-not-send="true">Intel XE#979</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@vram-d3cold-threshold:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579"
                moz-do-not-send="true">Intel XE#579</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579"
                moz-do-not-send="true">Intel XE#579</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137383v1/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c
          -&gt; xe-pw-137383v1</li>
      </ul>
      <p>IGT_7972: c34e13f766d0ed48c8b62ad9d8c29f11a8441b8b @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-1781-70d6d55dea574b7b78ccf714699cc5d8d62fcc2c:
        70d6d55dea574b7b78ccf714699cc5d8d62fcc2c<br>
        xe-pw-137383v1: 137383v1</p>
    </blockquote>
  </body>
</html>

--------------IXTMX22z9236sossZyZMbuSF--
