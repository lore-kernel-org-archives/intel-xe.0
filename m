Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C13CD5BD4
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 16:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF7C10E7FE;
	Thu,  5 Sep 2024 16:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ixfiKQSy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97D810E7FE
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 16:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725553888; x=1757089888;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to;
 bh=py7sFLq/SMpU+v3dZqEOrCe97ysRx9D0N6cwdNTzC8I=;
 b=ixfiKQSywCdh8XXSAAdFqSDMYiujZN6vnaJjbajwaD0amHw7H+zBxAN0
 vG8nw/3aO/8UyB31ZSvwUPU+fUNzHToPi44xw97Nwy5RIzIMUQPS4JjIX
 /44uDQoExd6OuIoRJUKDy3AE9DeGY9G3VzIfuDX39/d1tS5B9jZXNVGow
 /ivHnRC1FDqENWAuF99PM3pSGLnqxYliSEkaDA2H2sCFWVvKmkw0yihv3
 R9WlkhHt3GmzHUu4amtI2978n1HZkSBowhN6LABoAk8Vd/VCNklDDdxRH
 FCabDhmwKe0z6wPOjVqJ2Db+PuGlbViMbGYaYQVXuKkqXzWh577ht8quM Q==;
X-CSE-ConnectionGUID: yJ61v0pAS0aYLR4stPkjpw==
X-CSE-MsgGUID: dvGqNO++QFextZ1hcgQ5JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24477428"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208,217";a="24477428"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 09:31:27 -0700
X-CSE-ConnectionGUID: hRaj4F1tRgqJBoHHq3HgnQ==
X-CSE-MsgGUID: Mp79fb36T1CuH73vpYp1mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208,217";a="65388940"
Received: from mkatz4-mobl.ger.corp.intel.com (HELO [10.245.166.175])
 ([10.245.166.175])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 09:31:24 -0700
Content-Type: multipart/alternative;
 boundary="------------0bqkfFu1lAZCHku0DWaUt9gK"
Message-ID: <e676f0e5-41d5-4521-9a57-3cd8d57ea61a@linux.intel.com>
Date: Thu, 5 Sep 2024 18:31:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Replac?=
 =?UTF-8?Q?e_double_space_with_single_space_after_comma_=28rev2=29?=
To: intel-xe@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>,
 Nitin Gote <nitin.r.gote@intel.com>
References: <20240823080643.2461992-1-nitin.r.gote@intel.com>
 <172443147844.747146.11482977468081875817@2413ebb6fbb6>
Content-Language: en-US
Cc: Andi Shyti <andi.shyti@linux.intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <172443147844.747146.11482977468081875817@2413ebb6fbb6>
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
--------------0bqkfFu1lAZCHku0DWaUt9gK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/23/2024 6:44 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe: Replace double space with single space after comma 
> (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/137692/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/index.html
>
>
>   CI Bug Log - changes from
>   xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70_full ->
>   xe-pw-137692v2_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-137692v2_full absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-137692v2_full, please notify your bug team 
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
> xe-pw-137692v2_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@xe_exec_threads@threads-hang-shared-vm-rebind:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-7/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-1/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html>
>  *
>
>     igt@xe_pm@s3-mocs:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_pm@s3-mocs.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@xe_pm@s3-mocs.html>
>
No functional change. Pushed to drm-xe-next.


>  *
>
>
>         Warnings
>
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html>
>         +1 other test skip
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>  *
>
>     igt@kms_async_flips@test-time-stamp@pipe-d-dp-2:
>
>       o {shard-bmg}: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@kms_async_flips@test-time-stamp@pipe-d-dp-2.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-1/igt@kms_async_flips@test-time-stamp@pipe-d-dp-2.html>)
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-5/igt@kms_async_flips@test-time-stamp@pipe-d-dp-2.html>
>         +1 other test dmesg-warn
>  *
>
>     igt@kms_plane_lowres@tiling-x@pipe-c-dp-2:
>
>       o {shard-bmg}: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-3/igt@kms_plane_lowres@tiling-x@pipe-c-dp-2.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-5/igt@kms_plane_lowres@tiling-x@pipe-c-dp-2.html>)
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-6/igt@kms_plane_lowres@tiling-x@pipe-c-dp-2.html>
>         +2 other tests incomplete
>
>
>     Known issues
>
> Here are the changes found in xe-pw-137692v2_full that come from known 
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
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html>
>         (Intel XE#911
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/911>) +3
>         other tests fail
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
>
>       o shard-adlp: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html>)
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>)
>  *
>
>     igt@kms_atomic_transition@plane-toggle-modeset-transition:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html>
>         (Intel XE#1426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) +1
>         other test fail
>  *
>
>     igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
>
>       o shard-lnl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html>)
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html>
>         (Intel XE#1426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) +1
>         other test fail
>  *
>
>     igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html>
>         (Intel XE#1426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) +1
>         other test fail
>  *
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html>
>         (Intel XE#1659
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659>)
>  *
>
>     igt@kms_big_fb@linear-16bpp-rotate-270:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>
>       o shard-adlp: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>)
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>)
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1204
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) +1
>         other test fail
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +6
>         other tests skip
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +34
>         other tests skip
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +9
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-green-to-red:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_frames@dp-crc-single:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_chamelium_frames@dp-crc-single.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html>
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
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>  *
>
>     igt@kms_content_protection@uevent:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_content_protection@uevent.html>
>         (Intel XE#1188
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>) +1
>         other test fail
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x170.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_edge_walk@128x128-top-edge:
>
>       o shard-adlp: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_cursor_edge_walk@128x128-top-edge.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_cursor_edge_walk@128x128-top-edge.html>)
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@kms_cursor_edge_walk@128x128-top-edge.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1
>         other test incomplete
>  *
>
>     igt@kms_feature_discovery@dp-mst:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html>
>         (Intel XE#1137
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
>
>       o shard-adlp: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html>)
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html>
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
>  *
>
>     igt@kms_force_connector_basic@prune-stale-modes:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html>
>         (i915#5274
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
>
>       o shard-adlp: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html>)
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html>
>         (Intel XE#1861
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>) +1
>         other test fail
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html>
>         (Intel XE#1861
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +10
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +12
>         other tests skip
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162>)
>  *
>
>     igt@kms_plane@plane-position-covered@pipe-a-plane-3:
>
>       o shard-lnl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html>)
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_plane@plane-position-covered@pipe-b-plane-4:
>
>       o shard-lnl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html>)
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +5
>         other tests dmesg-warn
>  *
>
>     igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) +3
>         other tests fail
>  *
>
>     igt@kms_plane_lowres@tiling-x:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_plane_lowres@tiling-x.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@kms_plane_lowres@tiling-x.html>
>         (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1
>         other test incomplete
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318>) +2
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>  *
>
>     igt@kms_psr2_sf@cursor-plane-update-sf:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-435/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_psr@fbc-psr2-cursor-plane-onoff:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +4
>         other tests skip
>  *
>
>     igt@kms_psr@psr-cursor-plane-onoff:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_psr@psr-cursor-plane-onoff.html>
>         (Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html>
>         (Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>  *
>
>     igt@kms_vblank@ts-continuation-suspend:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html>
>         (Intel XE#2019
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019>) +5
>         other tests dmesg-warn
>  *
>
>     igt@kms_vblank@wait-idle:
>
>       o shard-adlp: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@kms_vblank@wait-idle.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_vblank@wait-idle.html>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@kms_vblank@wait-idle.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +4
>         other tests skip
>  *
>
>     igt@kms_vrr@flip-dpms:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@kms_vrr@flip-dpms.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3
>         other tests skip
>  *
>
>     igt@kms_vrr@flipline:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_vrr@flipline.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +2
>         other tests skip
>  *
>
>     igt@xe_copy_basic@mem-copy-linear-0xfd:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfd.html>
>         (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_evict@evict-beng-large-multi-vm-cm:
>
>       o shard-dg2-set2: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html>)
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@xe_evict@evict-beng-large-multi-vm-cm.html>
>         (Intel XE#1600
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600>)
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
>         Intel XE#402
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>)
>  *
>
>     igt@xe_evict@evict-threads-large:
>
>       o shard-dg2-set2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@xe_evict@evict-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>  *
>
>     igt@xe_exec_balancer@many-parallel-userptr-rebind:
>
>       o shard-adlp: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@xe_exec_balancer@many-parallel-userptr-rebind.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@xe_exec_balancer@many-parallel-userptr-rebind.html>)
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@xe_exec_balancer@many-parallel-userptr-rebind.html>
>         (Intel XE#2226
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226>) +6
>         other tests dmesg-warn
>  *
>
>     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +8
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_reset@parallel-gt-reset:
>
>       o shard-dg2-set2: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html>)
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html>
>         (Intel XE#2105
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105>)
>  *
>
>     igt@xe_exec_threads@threads-bal-basic:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_exec_threads@threads-bal-basic.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@xe_exec_threads@threads-bal-basic.html>
>         (Intel XE#2226
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226>)
>  *
>
>     igt@xe_gt_freq@freq_fixed_exec:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_gt_freq@freq_fixed_exec.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@xe_gt_freq@freq_fixed_exec.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#2226
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226>)
>  *
>
>     igt@xe_gt_freq@freq_suspend:
>
>       o shard-adlp: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@xe_gt_freq@freq_suspend.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@xe_gt_freq@freq_suspend.html>)
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html>
>         (Intel XE#2028
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028>) +1
>         other test fail
>  *
>
>     igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>  *
>
>     igt@xe_oa@invalid-create-userspace-config:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-435/igt@xe_oa@invalid-create-userspace-config.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>)
>  *
>
>     igt@xe_oa@invalid-remove-userspace-config:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@xe_oa@invalid-remove-userspace-config.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +1
>         other test skip
>  *
>
>     igt@xe_oa@mmio-triggered-reports:
>
>       o shard-lnl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@xe_oa@mmio-triggered-reports.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_oa@mmio-triggered-reports.html>)
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-8/igt@xe_oa@mmio-triggered-reports.html>
>         (Intel XE#2249
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249>)
>  *
>
>     igt@xe_oa@mmio-triggered-reports@ccs-0:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_oa@mmio-triggered-reports@ccs-0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-8/igt@xe_oa@mmio-triggered-reports@ccs-0.html>
>         (Intel XE#2249
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249>)
>  *
>
>     igt@xe_oa@oa-regs-whitelisted:
>
>       o shard-lnl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted.html>)
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted.html>
>         (Intel XE#2514
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514>)
>  *
>
>     igt@xe_oa@oa-regs-whitelisted@rcs-0:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted@rcs-0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted@rcs-0.html>
>         (Intel XE#2514
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514>)
>  *
>
>     igt@xe_pat@pat-index-xe2:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@xe_pat@pat-index-xe2.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#977
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
>  *
>
>     igt@xe_pm@s2idle-d3hot-basic-exec:
>
>       o shard-lnl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@xe_pm@s2idle-d3hot-basic-exec.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_pm@s2idle-d3hot-basic-exec.html>)
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-8/igt@xe_pm@s2idle-d3hot-basic-exec.html>
>         (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#1616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616>)
>  *
>
>     igt@xe_pm@s3-multiple-execs:
>
>       o shard-dg2-set2: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_pm@s3-multiple-execs.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_pm@s3-multiple-execs.html>)
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@xe_pm@s3-multiple-execs.html>
>         (Intel XE#1551
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551> /
>         Intel XE#569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>)
>  *
>
>     igt@xe_pm@s3-vm-bind-prefetch:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@xe_pm@s3-vm-bind-prefetch.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html>
>         (Intel XE#569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>)
>  *
>
>     igt@xe_pm@s4-d3hot-basic-exec:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html>
>         (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#1607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>)
>  *
>
>     igt@xe_pm@s4-mocs:
>
>       o shard-lnl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@xe_pm@s4-mocs.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@xe_pm@s4-mocs.html>)
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-2/igt@xe_pm@s4-mocs.html>
>         (Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_pm@s4-vm-bind-prefetch:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html>
>         (Intel XE#1607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> /
>         Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_query@multigpu-query-invalid-query:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@xe_query@multigpu-query-invalid-query.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_spin_batch@spin-fixed-duration:
>
>       o shard-adlp: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_spin_batch@spin-fixed-duration.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration.html>)
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration.html>
>         (Intel XE#1081
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>
>       o shard-adlp: (DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html>)
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html>
>  *
>
>     igt@kms_atomic_transition@modeset-transition-nonblocking:
>
>       o shard-lnl: (FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html>)
>         (Intel XE#1701
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html>
>         +1 other test pass
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
>
>       o shard-lnl: (FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html>)
>         (Intel XE#1426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html>
>         +1 other test pass
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
>
>       o {shard-bmg}: (FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html>)
>         (Intel XE#1426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html>
>         +1 other test pass
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html>)
>         (Intel XE#1426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html>
>         +1 other test pass
>  *
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-180:
>
>       o {shard-bmg}: (INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-3/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-1/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html>
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>
>       o shard-adlp: (FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html>,
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html>)
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231> /
>         Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html>
>         +1 other test pass
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>
>       o {shard-bmg}: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html>)
>         (Intel XE#2436
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html>
>         +1 other test pass
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>
>       o {shard-bmg}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html>
>  *
>
>     igt@kms_cursor_legacy@torture-move@pipe-b:
>
>       o shard-dg2-set2: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-b.html>,
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_cursor_legacy@torture-move@pipe-b.html>)
>         (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@kms_cursor_legacy@torture-move@pipe-b.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@bd-dp2-hdmi-a3:
>
>       o {shard-bmg}: (DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@bd-dp2-hdmi-a3.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@bd-dp2-hdmi-a3.html>)
>         (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@bd-dp2-hdmi-a3.html>
>         +4 other tests pass
>  *
>
>     igt@kms_flip@2x-flip-vs-panning-interruptible:
>
>       o {shard-bmg}: (DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-interruptible.html>,
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-interruptible.html>)
>         (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-interruptible.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ad-dp2-hdmi-a3:
>
>       o {shard-bmg}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ad-dp2-hdmi-a3.html>
>         (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ad-dp2-hdmi-a3.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@wf_vblank-ts-check@b-edp1:
>
>       o shard-lnl: (FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@b-edp1.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@b-edp1.html>)
>         (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@b-edp1.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
>
>       o shard-adlp: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html>)
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html>
>         +3 other tests pass
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>
>       o shard-adlp: (FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html>)
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html>
>         +10 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
>
>       o shard-adlp: (FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html>)
>         (Intel XE#1861
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#1861
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html>
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o {shard-bmg}: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@kms_hdr@invalid-hdr.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-6/igt@kms_hdr@invalid-hdr.html>)
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-7/igt@kms_hdr@invalid-hdr.html>
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
>
>       o shard-dg2-set2: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html>
>         (Intel XE#2019
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html>
>         +1 other test pass
>  *
>
>     igt@kms_plane@plane-position-covered@pipe-b-plane-1:
>
>       o shard-lnl: (DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html>)
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html>
>         +1 other test pass
>  *
>
>     igt@kms_plane@plane-position-hole@pipe-a-plane-1:
>
>       o shard-lnl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-1.html>,
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-1.html>)
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-1.html>
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-dp-2:
>
>       o {shard-bmg}: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-dp-2.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-dp-2.html>
>         +1 other test pass
>  *
>
>     igt@kms_pm_rpm@i2c:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_pm_rpm@i2c.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@kms_pm_rpm@i2c.html>
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html>
>         (Intel XE#771
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/771> /
>         Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html>
>  *
>
>     igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html>
>         (Intel XE#899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html>
>         +1 other test pass
>  *
>
>     igt@kms_vrr@max-min:
>
>       o shard-lnl: (FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_vrr@max-min.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-7/igt@kms_vrr@max-min.html>)
>         (Intel XE#2443
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-2/igt@kms_vrr@max-min.html>
>         +1 other test pass
>  *
>
>     igt@xe_evict@evict-beng-cm-threads-large:
>
>       o {shard-bmg}: (INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@xe_evict@evict-beng-cm-threads-large.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-1/igt@xe_evict@evict-beng-cm-threads-large.html>)
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-1/igt@xe_evict@evict-beng-cm-threads-large.html>
>  *
>
>     igt@xe_evict@evict-cm-threads-large:
>
>       o {shard-bmg}: (TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@xe_evict@evict-cm-threads-large.html>,
>         TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-6/igt@xe_evict@evict-cm-threads-large.html>)
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-1/igt@xe_evict@evict-cm-threads-large.html>
>         +1 other test pass
>       o shard-dg2-set2: (TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html>,
>         TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html>)
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html>
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-small:
>
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html>
>  *
>
>     igt@xe_exec_balancer@many-parallel-userptr-invalidate:
>
>       o shard-adlp: (DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html>,
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html>)
>         (Intel XE#1638
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-2/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html>
>  *
>
>     igt@xe_exec_basic@many-rebind:
>
>       o shard-adlp: (DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@xe_exec_basic@many-rebind.html>,
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_exec_basic@many-rebind.html>)
>         (Intel XE#2226
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@xe_exec_basic@many-rebind.html>
>         +4 other tests pass
>  *
>
>     igt@xe_live_ktest@xe_bo:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_live_ktest@xe_bo.html>
>         (Intel XE#1192
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@xe_live_ktest@xe_bo.html>
>  *
>
>     igt@xe_module_load@many-reload:
>
>       o shard-adlp: (TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_module_load@many-reload.html>,
>         TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@xe_module_load@many-reload.html>)
>         (Intel XE#1353
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1353> /
>         Intel XE#1961
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961> /
>         Intel XE#2026
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-9/igt@xe_module_load@many-reload.html>
>  *
>
>     igt@xe_module_load@reload:
>
>       o shard-lnl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@xe_module_load@reload.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@xe_module_load@reload.html>)
>         (Intel XE#2317
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2317>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-6/igt@xe_module_load@reload.html>
>  *
>
>     igt@xe_module_load@reload-no-display:
>
>       o shard-dg2-set2: (DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_module_load@reload-no-display.html>,
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_module_load@reload-no-display.html>)
>         (Intel XE#2019
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@xe_module_load@reload-no-display.html>
>  *
>
>     igt@xe_pm@s4-exec-after:
>
>       o shard-lnl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@xe_pm@s4-exec-after.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@xe_pm@s4-exec-after.html>)
>         (Intel XE#1358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
>         Intel XE#1607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-4/igt@xe_pm@s4-exec-after.html>
>  *
>
>     igt@xe_pm@s4-mocs:
>
>       o shard-adlp: (ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@xe_pm@s4-mocs.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_pm@s4-mocs.html>)
>         (Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-1/igt@xe_pm@s4-mocs.html>
>  *
>
>     igt@xe_pm_residency@toggle-gt-c6:
>
>       o shard-lnl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html>)
>         (Intel XE#958
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/958>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html>
>  *
>
>     igt@xe_spin_batch@spin-fixed-duration-with-preempter:
>
>       o shard-adlp: (FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html>)
>         (Intel XE#1081
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-9/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html>
>         (Intel XE#801
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/801>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#801
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/801>) +23
>         other tests skip
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
>
>       o shard-adlp: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html>,
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html>)
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html>
>         (Intel XE#1033
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>)
>  *
>
>     igt@kms_async_flips@invalid-async-flip:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html>
>         (Intel XE#873
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@kms_async_flips@invalid-async-flip.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#873
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>)
>  *
>
>     igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>
>       o shard-adlp: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-adlp: (FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>)
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +1
>         other test dmesg-fail
>  *
>
>     igt@kms_big_fb@y-tiled-16bpp-rotate-0:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-435/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +4
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html>)
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +4
>         other tests skip
>  *
>
>     igt@kms_big_joiner@basic:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_big_joiner@basic.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_big_joiner@basic.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_big_joiner@basic.html>
>         (Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1
>         other test skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1
>         other test skip
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +62
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +11
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +34
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +9
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +17
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +41
>         other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition@pipe-d-dp-4:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html>
>         (Intel XE#314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-0-75:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_chamelium_color@ctm-0-75.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_color@ctm-red-to-blue:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@kms_chamelium_color@ctm-red-to-blue.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +4
>         other tests skip
>  *
>
>     igt@kms_chamelium_edid@hdmi-mode-timings:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_chamelium_edid@hdmi-mode-timings.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_chamelium_edid@hdmi-mode-timings.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +3
>         other tests skip
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-0:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-1:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-1.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-1.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>  *
>
>     igt@kms_content_protection@dp-mst-type-1:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html>
>         (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x512:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x512.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x512.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html>
>         (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>  *
>
>     igt@kms_feature_discovery@display-3x:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_feature_discovery@display-3x.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_feature_discovery@display-3x.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_feature_discovery@display-3x.html>
>         (Intel XE#703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>)
>  *
>
>     igt@kms_feature_discovery@display-4x:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_feature_discovery@display-4x.html>
>         (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_feature_discovery@display-4x.html>
>         (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
>  *
>
>     igt@kms_feature_discovery@psr1:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_feature_discovery@psr1.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_feature_discovery@psr1.html>)
>         (Intel XE#1135
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_feature_discovery@psr1.html>
>         (Intel XE#1135
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +6
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
>
>       o shard-adlp: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html>)
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html>
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) +1
>         other test fail
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
>
>       o shard-adlp: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
>
>       o shard-adlp: (FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-suspend:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +14
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
>
>       o shard-adlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +14
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html>
>         (Intel XE#658
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +18
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-adlp: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +12
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +9
>         other tests skip
>  *
>
>     igt@kms_getfb@getfb-reject-ccs:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html>
>         (Intel XE#605
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/605>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#605
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/605>)
>  *
>
>     igt@kms_hdr@static-toggle-suspend:
>
>       o shard-adlp: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@kms_hdr@static-toggle-suspend.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_hdr@static-toggle-suspend.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@kms_hdr@static-toggle-suspend.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_plane@plane-panning-bottom-right-suspend:
>
>       o shard-dg2-set2: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend.html>,
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_plane@plane-panning-bottom-right-suspend.html>)
>         (Intel XE#1551
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend.html>
>         (Intel XE#1551
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551>) +1
>         other test dmesg-warn
>  *
>
>     igt@kms_plane@plane-position-covered:
>
>       o shard-lnl: (DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_plane@plane-position-covered.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@kms_plane@plane-position-covered.html>)
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-5/igt@kms_plane@plane-position-covered.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_plane@plane-position-hole@pipe-a-plane-3:
>
>       o shard-lnl: (DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html>)
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_plane@plane-position-hole@pipe-b-plane-1:
>
>       o shard-lnl: (DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html>)
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html>
>         (Intel XE#324
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#498
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#498
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +1
>         other test skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#498
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html>
>         (Intel XE#498
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +2
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html>
>         (Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html>
>         (Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2318
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318>) +2
>         other tests skip
>  *
>
>     igt@kms_pm_backlight@basic-brightness:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_pm_backlight@basic-brightness.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html>
>         (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_pm_dc@dc5-psr:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html>
>         (Intel XE#1129
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html>
>         (Intel XE#1129
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-lnl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html>)
>         (Intel XE#1430
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html>
>         (Intel XE#1430
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430>)
>  *
>
>     igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>  *
>
>     igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>  *
>
>     igt@kms_psr@fbc-pr-cursor-plane-move:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_psr@fbc-pr-cursor-plane-move.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_psr@fbc-pr-cursor-plane-move.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html>
>         (Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +5
>         other tests skip
>  *
>
>     igt@kms_psr@pr-sprite-blt:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_psr@pr-sprite-blt.html>
>         (Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@kms_psr@pr-sprite-blt.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +7
>         other tests skip
>  *
>
>     igt@kms_psr@psr2-cursor-plane-onoff:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_psr@psr2-cursor-plane-onoff.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_psr@psr2-cursor-plane-onoff.html>
>         (Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +4
>         other tests skip
>  *
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>)
>         (Intel XE#1149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#1149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-90:
>
>       o shard-adlp: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-90.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@kms_rotation_crc@sprite-rotation-90.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>  *
>
>     igt@kms_scaling_modes@scaling-mode-full:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-full.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@kms_scaling_modes@scaling-mode-full.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +14
>         other tests skip
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1500
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500> /
>         Intel XE#362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#1500
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500>)
>  *
>
>     igt@kms_vrr@cmrr:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_vrr@cmrr.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_vrr@cmrr.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_vrr@cmrr.html>
>         (Intel XE#2168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>)
>  *
>
>     igt@kms_writeback@writeback-pixel-formats:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html>
>         (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-435/igt@kms_writeback@writeback-pixel-formats.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0xfd:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126> /
>         Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-large:
>
>       o shard-dg2-set2: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html>
>         (Intel XE#1041
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041> /
>         Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-large.html>
>         (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>  *
>
>     igt@xe_exec_fault_mode@many-userptr:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_exec_fault_mode@many-userptr.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_exec_fault_mode@many-userptr.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +8
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-userptr-invalidate-imm:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr-invalidate-imm.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-435/igt@xe_exec_fault_mode@many-userptr-invalidate-imm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +15
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@once-rebind-imm:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-imm.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-imm.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +9
>         other tests skip
>  *
>
>     igt@xe_module_load@force-load:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_module_load@force-load.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_module_load@force-load.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@xe_module_load@force-load.html>
>         (Intel XE#378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>  *
>
>     igt@xe_oa@buffer-fill:
>
>       o shard-dg2-set2: (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@xe_oa@buffer-fill.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_oa@buffer-fill.html>)
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@xe_oa@buffer-fill.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +2
>         other tests skip
>  *
>
>     igt@xe_oa@invalid-oa-format-id:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_oa@invalid-oa-format-id.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@xe_oa@invalid-oa-format-id.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +4
>         other tests skip
>  *
>
>     igt@xe_oa@unprivileged-single-ctx-counters:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_oa@unprivileged-single-ctx-counters.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@xe_oa@unprivileged-single-ctx-counters.html>
>         (Intel XE#2541
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>)
>  *
>
>     igt@xe_pm@d3cold-mmap-system:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>  *
>
>     igt@xe_pm@d3cold-mmap-vram:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>  *
>
>     igt@xe_pm@s3-vm-bind-unbind-all:
>
>       o shard-dg2-set2: (DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html>,
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html>)
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> /
>         Intel XE#1941
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941> /
>         Intel XE#569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html>
>         (Intel XE#1162
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> /
>         Intel XE#569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/569>)
>  *
>
>     igt@xe_pm@s4-vm-bind-unbind-all:
>
>       o shard-lnl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@xe_pm@s4-vm-bind-unbind-all.html>,
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html>)
>         (Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) ->
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html>
>         (Intel XE#1794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>  *
>
>     igt@xe_pm@vram-d3cold-threshold:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#579
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#579
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
>  *
>
>     igt@xe_query@multigpu-query-invalid-size:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_query@multigpu-query-invalid-size.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@xe_query@multigpu-query-invalid-size.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html>
>         (Intel XE#1201
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> /
>         Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_wedged@wedged-at-any-timeout:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_wedged@wedged-at-any-timeout.html>
>         (Intel XE#1760
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>) ->
>         DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-2/igt@xe_wedged@wedged-at-any-timeout.html>
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
>   * IGT: IGT_7986 -> IGT_7987
>   * Linux: xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70 ->
>     xe-pw-137692v2
>
> IGT_7986: 7986
> IGT_7987: 89c9c18d654c46a9469c6c414d40f5b63dde9958 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70: 
> 7365d672ab38ee0eabb65fcd359e5774a8efbd70
> xe-pw-137692v2: 137692v2
>
--------------0bqkfFu1lAZCHku0DWaUt9gK
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
    <div class="moz-cite-prefix">On 8/23/2024 6:44 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:172443147844.747146.11482977468081875817@2413ebb6fbb6">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe: Replace double space with single space after
              comma (rev2)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/137692/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/137692/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70_full -&gt;
        xe-pw-137692v2_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-137692v2_full
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-137692v2_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-137692v2_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@xe_exec_threads@threads-hang-shared-vm-rebind:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-7/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-1/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html"
                moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-mocs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_pm@s3-mocs.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@xe_pm@s3-mocs.html"
                moz-do-not-send="true">DMESG-WARN</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>No functional change. Pushed to drm-xe-next.</p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:172443147844.747146.11482977468081875817@2413ebb6fbb6">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html"
                moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
      </ul>
      <h4>Suppressed</h4>
      <p>The following results come from untrusted machines, tests, or
        statuses.<br>
        They do not affect the overall result.</p>
      <ul>
        <li>
          <p>igt@kms_async_flips@test-time-stamp@pipe-d-dp-2:</p>
          <ul>
            <li>{shard-bmg}: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@kms_async_flips@test-time-stamp@pipe-d-dp-2.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-1/igt@kms_async_flips@test-time-stamp@pipe-d-dp-2.html"
                moz-do-not-send="true">PASS</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-5/igt@kms_async_flips@test-time-stamp@pipe-d-dp-2.html"
                moz-do-not-send="true">DMESG-WARN</a> +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-x@pipe-c-dp-2:</p>
          <ul>
            <li>{shard-bmg}: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-3/igt@kms_plane_lowres@tiling-x@pipe-c-dp-2.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-5/igt@kms_plane_lowres@tiling-x@pipe-c-dp-2.html"
                moz-do-not-send="true">PASS</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-6/igt@kms_plane_lowres@tiling-x@pipe-c-dp-2.html"
                moz-do-not-send="true">INCOMPLETE</a> +2 other tests
              incomplete</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-137692v2_full that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911"
                moz-do-not-send="true">Intel XE#911</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html"
                moz-do-not-send="true">PASS</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426"
                moz-do-not-send="true">Intel XE#1426</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html"
                moz-do-not-send="true">PASS</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426"
                moz-do-not-send="true">Intel XE#1426</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426"
                moz-do-not-send="true">Intel XE#1426</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659"
                moz-do-not-send="true">Intel XE#1659</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">PASS</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">PASS</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204"
                moz-do-not-send="true">Intel XE#1204</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +34 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-green-to-red:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@dp-crc-single:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_chamelium_frames@dp-crc-single.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html"
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
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307"
                moz-do-not-send="true">Intel XE#307</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_content_protection@uevent.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188"
                moz-do-not-send="true">Intel XE#1188</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x170.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"
                moz-do-not-send="true">Intel XE#308</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_edge_walk@128x128-top-edge:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_cursor_edge_walk@128x128-top-edge.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_cursor_edge_walk@128x128-top-edge.html"
                moz-do-not-send="true">PASS</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@kms_cursor_edge_walk@128x128-top-edge.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@dp-mst:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137"
                moz-do-not-send="true">Intel XE#1137</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html"
                moz-do-not-send="true">PASS</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"
                moz-do-not-send="true">Intel XE#1874</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@prune-stale-modes:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274"
                moz-do-not-send="true">i915#5274</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">PASS</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861"
                moz-do-not-send="true">Intel XE#1861</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861"
                moz-do-not-send="true">Intel XE#1861</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658"
                moz-do-not-send="true">Intel XE#658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +12 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162"
                moz-do-not-send="true">Intel XE#1162</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-covered@pipe-a-plane-3:</p>
          <ul>
            <li>shard-lnl: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html"
                moz-do-not-send="true">PASS</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-covered@pipe-b-plane-4:</p>
          <ul>
            <li>shard-lnl: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html"
                moz-do-not-send="true">PASS</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) +5 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616"
                moz-do-not-send="true">Intel XE#616</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-x:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_plane_lowres@tiling-x.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@kms_plane_lowres@tiling-x.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195"
                moz-do-not-send="true">Intel XE#1195</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318"
                moz-do-not-send="true">Intel XE#2318</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html"
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
          <p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122"
                moz-do-not-send="true">Intel XE#1122</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-435/igt@kms_psr2_sf@cursor-plane-update-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122"
                moz-do-not-send="true">Intel XE#1122</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-cursor-plane-onoff:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_psr@psr-cursor-plane-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327"
                moz-do-not-send="true">Intel XE#327</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019"
                moz-do-not-send="true">Intel XE#2019</a>) +5 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@wait-idle:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@kms_vblank@wait-idle.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_vblank@wait-idle.html"
                moz-do-not-send="true">PASS</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@kms_vblank@wait-idle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-dpms:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@kms_vrr@flip-dpms.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flipline:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_vrr@flipline.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123"
                moz-do-not-send="true">Intel XE#1123</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html"
                moz-do-not-send="true">PASS</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@xe_evict@evict-beng-large-multi-vm-cm.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600"
                moz-do-not-send="true">Intel XE#1600</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402"
                moz-do-not-send="true">Intel XE#402</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@xe_evict@evict-threads-large.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@many-parallel-userptr-rebind:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@xe_exec_balancer@many-parallel-userptr-rebind.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@xe_exec_balancer@many-parallel-userptr-rebind.html"
                moz-do-not-send="true">PASS</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@xe_exec_balancer@many-parallel-userptr-rebind.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226"
                moz-do-not-send="true">Intel XE#2226</a>) +6 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@parallel-gt-reset:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html"
                moz-do-not-send="true">PASS</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105"
                moz-do-not-send="true">Intel XE#2105</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-bal-basic:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_exec_threads@threads-bal-basic.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@xe_exec_threads@threads-bal-basic.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226"
                moz-do-not-send="true">Intel XE#2226</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_gt_freq@freq_fixed_exec:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_gt_freq@freq_fixed_exec.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@xe_gt_freq@freq_fixed_exec.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"
                moz-do-not-send="true">Intel XE#1727</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226"
                moz-do-not-send="true">Intel XE#2226</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_gt_freq@freq_suspend:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@xe_gt_freq@freq_suspend.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@xe_gt_freq@freq_suspend.html"
                moz-do-not-send="true">PASS</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028"
                moz-do-not-send="true">Intel XE#2028</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229"
                moz-do-not-send="true">Intel XE#2229</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@invalid-create-userspace-config:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-435/igt@xe_oa@invalid-create-userspace-config.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@invalid-remove-userspace-config:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@xe_oa@invalid-remove-userspace-config.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@mmio-triggered-reports:</p>
          <ul>
            <li>shard-lnl: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@xe_oa@mmio-triggered-reports.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_oa@mmio-triggered-reports.html"
                moz-do-not-send="true">PASS</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-8/igt@xe_oa@mmio-triggered-reports.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249"
                moz-do-not-send="true">Intel XE#2249</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@mmio-triggered-reports@ccs-0:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_oa@mmio-triggered-reports@ccs-0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-8/igt@xe_oa@mmio-triggered-reports@ccs-0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249"
                moz-do-not-send="true">Intel XE#2249</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@oa-regs-whitelisted:</p>
          <ul>
            <li>shard-lnl: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted.html"
                moz-do-not-send="true">PASS</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514"
                moz-do-not-send="true">Intel XE#2514</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@oa-regs-whitelisted@rcs-0:</p>
          <ul>
            <li>shard-lnl: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted@rcs-0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted@rcs-0.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514"
                moz-do-not-send="true">Intel XE#2514</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xe2:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@xe_pat@pat-index-xe2.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977"
                moz-do-not-send="true">Intel XE#977</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
          <ul>
            <li>shard-lnl: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@xe_pm@s2idle-d3hot-basic-exec.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_pm@s2idle-d3hot-basic-exec.html"
                moz-do-not-send="true">PASS</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-8/igt@xe_pm@s2idle-d3hot-basic-exec.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616"
                moz-do-not-send="true">Intel XE#1616</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-multiple-execs:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_pm@s3-multiple-execs.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_pm@s3-multiple-execs.html"
                moz-do-not-send="true">PASS</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@xe_pm@s3-multiple-execs.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551"
                moz-do-not-send="true">Intel XE#1551</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569"
                moz-do-not-send="true">Intel XE#569</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-vm-bind-prefetch:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@xe_pm@s3-vm-bind-prefetch.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569"
                moz-do-not-send="true">Intel XE#569</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-d3hot-basic-exec:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607"
                moz-do-not-send="true">Intel XE#1607</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-mocs:</p>
          <ul>
            <li>shard-lnl: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@xe_pm@s4-mocs.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@xe_pm@s4-mocs.html"
                moz-do-not-send="true">PASS</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-2/igt@xe_pm@s4-mocs.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-prefetch:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607"
                moz-do-not-send="true">Intel XE#1607</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-query:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@xe_query@multigpu-query-invalid-query.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_spin_batch@spin-fixed-duration:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_spin_batch@spin-fixed-duration.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration.html"
                moz-do-not-send="true">PASS</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081"
                moz-do-not-send="true">Intel XE#1081</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html"
                moz-do-not-send="true">DMESG-WARN</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html"
                moz-do-not-send="true">PASS</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
          <ul>
            <li>shard-lnl: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html"
                moz-do-not-send="true">PASS</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701"
                moz-do-not-send="true">Intel XE#1701</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html"
                moz-do-not-send="true">FAIL</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426"
                moz-do-not-send="true">Intel XE#1426</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:</p>
          <ul>
            <li>{shard-bmg}: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html"
                moz-do-not-send="true">PASS</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426"
                moz-do-not-send="true">Intel XE#1426</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">FAIL</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426"
                moz-do-not-send="true">Intel XE#1426</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
          <ul>
            <li>{shard-bmg}: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html"
                moz-do-not-send="true">INCOMPLETE</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-3/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html"
                moz-do-not-send="true">PASS</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-1/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html"
                moz-do-not-send="true">DMESG-FAIL</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
          <ul>
            <li>{shard-bmg}: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html"
                moz-do-not-send="true">FAIL</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436"
                moz-do-not-send="true">Intel XE#2436</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html"
                moz-do-not-send="true">DMESG-WARN</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@torture-move@pipe-b:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-b.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_cursor_legacy@torture-move@pipe-b.html"
                moz-do-not-send="true">DMESG-WARN</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@kms_cursor_legacy@torture-move@pipe-b.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@bd-dp2-hdmi-a3:</p>
          <ul>
            <li>{shard-bmg}: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@bd-dp2-hdmi-a3.html"
                moz-do-not-send="true">DMESG-WARN</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@bd-dp2-hdmi-a3.html"
                moz-do-not-send="true">PASS</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@bd-dp2-hdmi-a3.html"
                moz-do-not-send="true">PASS</a> +4 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
          <ul>
            <li>{shard-bmg}: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-interruptible.html"
                moz-do-not-send="true">DMESG-WARN</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-interruptible.html"
                moz-do-not-send="true">DMESG-WARN</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-interruptible.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ad-dp2-hdmi-a3:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ad-dp2-hdmi-a3.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ad-dp2-hdmi-a3.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check@b-edp1:</p>
          <ul>
            <li>shard-lnl: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@b-edp1.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@b-edp1.html"
                moz-do-not-send="true">PASS</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886"
                moz-do-not-send="true">Intel XE#886</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@b-edp1.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html"
                moz-do-not-send="true">FAIL</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"
                moz-do-not-send="true">Intel XE#1874</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html"
                moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html"
                moz-do-not-send="true">FAIL</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"
                moz-do-not-send="true">Intel XE#1874</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html"
                moz-do-not-send="true">PASS</a> +10 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">FAIL</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861"
                moz-do-not-send="true">Intel XE#1861</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861"
                moz-do-not-send="true">Intel XE#1861</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr:</p>
          <ul>
            <li>{shard-bmg}: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@kms_hdr@invalid-hdr.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-6/igt@kms_hdr@invalid-hdr.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"
                moz-do-not-send="true">Intel XE#1503</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-7/igt@kms_hdr@invalid-hdr.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019"
                moz-do-not-send="true">Intel XE#2019</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-covered@pipe-b-plane-1:</p>
          <ul>
            <li>shard-lnl: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html"
                moz-do-not-send="true">DMESG-WARN</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html"
                moz-do-not-send="true">PASS</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-hole@pipe-a-plane-1:</p>
          <ul>
            <li>shard-lnl: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-1.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-1.html"
                moz-do-not-send="true">DMESG-FAIL</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-1.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-dp-2:</p>
          <ul>
            <li>{shard-bmg}: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-dp-2.html"
                moz-do-not-send="true">INCOMPLETE</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-dp-2.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@i2c:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_pm_rpm@i2c.html"
                moz-do-not-send="true">FAIL</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@kms_pm_rpm@i2c.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771"
                moz-do-not-send="true">Intel XE#771</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899"
                moz-do-not-send="true">Intel XE#899</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899"
                moz-do-not-send="true">Intel XE#899</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@max-min:</p>
          <ul>
            <li>shard-lnl: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_vrr@max-min.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-7/igt@kms_vrr@max-min.html"
                moz-do-not-send="true">FAIL</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443"
                moz-do-not-send="true">Intel XE#2443</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-2/igt@kms_vrr@max-min.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-cm-threads-large:</p>
          <ul>
            <li>{shard-bmg}: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@xe_evict@evict-beng-cm-threads-large.html"
                moz-do-not-send="true">INCOMPLETE</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-1/igt@xe_evict@evict-beng-cm-threads-large.html"
                moz-do-not-send="true">PASS</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-1/igt@xe_evict@evict-beng-cm-threads-large.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-cm-threads-large:</p>
          <ul>
            <li>{shard-bmg}: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@xe_evict@evict-cm-threads-large.html"
                moz-do-not-send="true">TIMEOUT</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-6/igt@xe_evict@evict-cm-threads-large.html"
                moz-do-not-send="true">TIMEOUT</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-bmg-1/igt@xe_evict@evict-cm-threads-large.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html"
                moz-do-not-send="true">TIMEOUT</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html"
                moz-do-not-send="true">TIMEOUT</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-small:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@many-parallel-userptr-invalidate:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html"
                moz-do-not-send="true">DMESG-FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html"
                moz-do-not-send="true">DMESG-FAIL</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638"
                moz-do-not-send="true">Intel XE#1638</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-2/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@many-rebind:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@xe_exec_basic@many-rebind.html"
                moz-do-not-send="true">DMESG-WARN</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_exec_basic@many-rebind.html"
                moz-do-not-send="true">DMESG-WARN</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226"
                moz-do-not-send="true">Intel XE#2226</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@xe_exec_basic@many-rebind.html"
                moz-do-not-send="true">PASS</a> +4 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_live_ktest@xe_bo.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192"
                moz-do-not-send="true">Intel XE#1192</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@xe_live_ktest@xe_bo.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@many-reload:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_module_load@many-reload.html"
                moz-do-not-send="true">TIMEOUT</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@xe_module_load@many-reload.html"
                moz-do-not-send="true">TIMEOUT</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1353"
                moz-do-not-send="true">Intel XE#1353</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961"
                moz-do-not-send="true">Intel XE#1961</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026"
                moz-do-not-send="true">Intel XE#2026</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-9/igt@xe_module_load@many-reload.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@reload:</p>
          <ul>
            <li>shard-lnl: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@xe_module_load@reload.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@xe_module_load@reload.html"
                moz-do-not-send="true">ABORT</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2317"
                moz-do-not-send="true">Intel XE#2317</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-6/igt@xe_module_load@reload.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@reload-no-display:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_module_load@reload-no-display.html"
                moz-do-not-send="true">DMESG-WARN</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_module_load@reload-no-display.html"
                moz-do-not-send="true">DMESG-WARN</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019"
                moz-do-not-send="true">Intel XE#2019</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@xe_module_load@reload-no-display.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-exec-after:</p>
          <ul>
            <li>shard-lnl: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@xe_pm@s4-exec-after.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@xe_pm@s4-exec-after.html"
                moz-do-not-send="true">ABORT</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358"
                moz-do-not-send="true">Intel XE#1358</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607"
                moz-do-not-send="true">Intel XE#1607</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-4/igt@xe_pm@s4-exec-after.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-mocs:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@xe_pm@s4-mocs.html"
                moz-do-not-send="true">ABORT</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_pm@s4-mocs.html"
                moz-do-not-send="true">PASS</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-1/igt@xe_pm@s4-mocs.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm_residency@toggle-gt-c6:</p>
          <ul>
            <li>shard-lnl: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html"
                moz-do-not-send="true">FAIL</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958"
                moz-do-not-send="true">Intel XE#958</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_spin_batch@spin-fixed-duration-with-preempter:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html"
                moz-do-not-send="true">FAIL</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081"
                moz-do-not-send="true">Intel XE#1081</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-9/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801"
                moz-do-not-send="true">Intel XE#801</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801"
                moz-do-not-send="true">Intel XE#801</a>) +23 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html"
                moz-do-not-send="true">DMESG-WARN</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"
                moz-do-not-send="true">Intel XE#1033</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873"
                moz-do-not-send="true">Intel XE#873</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@kms_async_flips@invalid-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873"
                moz-do-not-send="true">Intel XE#873</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316"
                moz-do-not-send="true">Intel XE#316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">FAIL</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) +1 other test
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-435/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231"
                moz-do-not-send="true">Intel XE#1231</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"
                moz-do-not-send="true">Intel XE#1124</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_joiner@basic:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_big_joiner@basic.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_big_joiner@basic.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346"
                moz-do-not-send="true">Intel XE#346</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_big_joiner@basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346"
                moz-do-not-send="true">Intel XE#346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191"
                moz-do-not-send="true">Intel XE#2191</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191"
                moz-do-not-send="true">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191"
                moz-do-not-send="true">Intel XE#2191</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191"
                moz-do-not-send="true">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"
                moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +62 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html"
                moz-do-not-send="true">SKIP</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +34 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html"
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
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"
                moz-do-not-send="true">Intel XE#787</a>) +41 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314"
                moz-do-not-send="true">Intel XE#314</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314"
                moz-do-not-send="true">Intel XE#314</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-75:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_chamelium_color@ctm-0-75.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@kms_chamelium_color@ctm-red-to-blue.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306"
                moz-do-not-send="true">Intel XE#306</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_chamelium_edid@hdmi-mode-timings.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_chamelium_edid@hdmi-mode-timings.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373"
                moz-do-not-send="true">Intel XE#373</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307"
                moz-do-not-send="true">Intel XE#307</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307"
                moz-do-not-send="true">Intel XE#307</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-1.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-1.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307"
                moz-do-not-send="true">Intel XE#307</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307"
                moz-do-not-send="true">Intel XE#307</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-1:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307"
                moz-do-not-send="true">Intel XE#307</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307"
                moz-do-not-send="true">Intel XE#307</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x512:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x512.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x512.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"
                moz-do-not-send="true">Intel XE#308</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"
                moz-do-not-send="true">Intel XE#308</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323"
                moz-do-not-send="true">Intel XE#323</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323"
                moz-do-not-send="true">Intel XE#323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323"
                moz-do-not-send="true">Intel XE#323</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323"
                moz-do-not-send="true">Intel XE#323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323"
                moz-do-not-send="true">Intel XE#323</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323"
                moz-do-not-send="true">Intel XE#323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-3x:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_feature_discovery@display-3x.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_feature_discovery@display-3x.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703"
                moz-do-not-send="true">Intel XE#703</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_feature_discovery@display-3x.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703"
                moz-do-not-send="true">Intel XE#703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-4x:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_feature_discovery@display-4x.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138"
                moz-do-not-send="true">Intel XE#1138</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_feature_discovery@display-4x.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138"
                moz-do-not-send="true">Intel XE#1138</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@psr1:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_feature_discovery@psr1.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_feature_discovery@psr1.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135"
                moz-do-not-send="true">Intel XE#1135</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_feature_discovery@psr1.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135"
                moz-do-not-send="true">Intel XE#1135</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html"
                moz-do-not-send="true">FAIL</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"
                moz-do-not-send="true">Intel XE#1874</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874"
                moz-do-not-send="true">Intel XE#1874</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html"
                moz-do-not-send="true">FAIL</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"
                moz-do-not-send="true">Intel XE#651</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658"
                moz-do-not-send="true">Intel XE#658</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658"
                moz-do-not-send="true">Intel XE#658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +18 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656"
                moz-do-not-send="true">Intel XE#656</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +12 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"
                moz-do-not-send="true">Intel XE#653</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_getfb@getfb-reject-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605"
                moz-do-not-send="true">Intel XE#605</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605"
                moz-do-not-send="true">Intel XE#605</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-suspend:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@kms_hdr@static-toggle-suspend.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_hdr@static-toggle-suspend.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@kms_hdr@static-toggle-suspend.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_plane@plane-panning-bottom-right-suspend.html"
                moz-do-not-send="true">DMESG-WARN</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551"
                moz-do-not-send="true">Intel XE#1551</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551"
                moz-do-not-send="true">Intel XE#1551</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-covered:</p>
          <ul>
            <li>shard-lnl: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_plane@plane-position-covered.html"
                moz-do-not-send="true">DMESG-WARN</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@kms_plane@plane-position-covered.html"
                moz-do-not-send="true">PASS</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-5/igt@kms_plane@plane-position-covered.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-hole@pipe-a-plane-3:</p>
          <ul>
            <li>shard-lnl: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html"
                moz-do-not-send="true">DMESG-FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html"
                moz-do-not-send="true">PASS</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-position-hole@pipe-b-plane-1:</p>
          <ul>
            <li>shard-lnl: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html"
                moz-do-not-send="true">DMESG-WARN</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html"
                moz-do-not-send="true">PASS</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324"
                moz-do-not-send="true">Intel XE#324</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498"
                moz-do-not-send="true">Intel XE#498</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498"
                moz-do-not-send="true">Intel XE#498</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498"
                moz-do-not-send="true">Intel XE#498</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498"
                moz-do-not-send="true">Intel XE#498</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318"
                moz-do-not-send="true">Intel XE#2318</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html"
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
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318"
                moz-do-not-send="true">Intel XE#2318</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318"
                moz-do-not-send="true">Intel XE#2318</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@basic-brightness:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_pm_backlight@basic-brightness.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870"
                moz-do-not-send="true">Intel XE#870</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870"
                moz-do-not-send="true">Intel XE#870</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-psr:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"
                moz-do-not-send="true">Intel XE#1129</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"
                moz-do-not-send="true">Intel XE#1129</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-lnl: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">FAIL</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430"
                moz-do-not-send="true">Intel XE#1430</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430"
                moz-do-not-send="true">Intel XE#1430</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489"
                moz-do-not-send="true">Intel XE#1489</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_psr@fbc-pr-cursor-plane-move.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_psr@fbc-pr-cursor-plane-move.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-sprite-blt:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_psr@pr-sprite-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@kms_psr@pr-sprite-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_psr@psr2-cursor-plane-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_psr@psr2-cursor-plane-onoff.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929"
                moz-do-not-send="true">Intel XE#929</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149"
                moz-do-not-send="true">Intel XE#1149</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149"
                moz-do-not-send="true">Intel XE#1149</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127"
                moz-do-not-send="true">Intel XE#1127</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127"
                moz-do-not-send="true">Intel XE#1127</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-90:</p>
          <ul>
            <li>shard-adlp: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-90.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-4/igt@kms_rotation_crc@sprite-rotation-90.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327"
                moz-do-not-send="true">Intel XE#327</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-full:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-full.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@kms_scaling_modes@scaling-mode-full.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"
                moz-do-not-send="true">Intel XE#455</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html"
                moz-do-not-send="true">FAIL</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729"
                moz-do-not-send="true">Intel XE#1729</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362"
                moz-do-not-send="true">Intel XE#362</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500"
                moz-do-not-send="true">Intel XE#1500</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362"
                moz-do-not-send="true">Intel XE#362</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500"
                moz-do-not-send="true">Intel XE#1500</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@cmrr:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_vrr@cmrr.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_vrr@cmrr.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168"
                moz-do-not-send="true">Intel XE#2168</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@kms_vrr@cmrr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168"
                moz-do-not-send="true">Intel XE#2168</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-pixel-formats:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756"
                moz-do-not-send="true">Intel XE#756</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-435/igt@kms_writeback@writeback-pixel-formats.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756"
                moz-do-not-send="true">Intel XE#756</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126"
                moz-do-not-send="true">Intel XE#1126</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126"
                moz-do-not-send="true">Intel XE#1126</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-large:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041"
                moz-do-not-send="true">Intel XE#1041</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-large.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473"
                moz-do-not-send="true">Intel XE#1473</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-userptr:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_exec_fault_mode@many-userptr.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_exec_fault_mode@many-userptr.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-userptr-invalidate-imm:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr-invalidate-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-435/igt@xe_exec_fault_mode@many-userptr-invalidate-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-rebind-imm:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-imm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"
                moz-do-not-send="true">Intel XE#288</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@force-load:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_module_load@force-load.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_module_load@force-load.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378"
                moz-do-not-send="true">Intel XE#378</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@xe_module_load@force-load.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378"
                moz-do-not-send="true">Intel XE#378</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@buffer-fill:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@xe_oa@buffer-fill.html"
                moz-do-not-send="true">SKIP</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_oa@buffer-fill.html"
                moz-do-not-send="true">SKIP</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@xe_oa@buffer-fill.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@invalid-oa-format-id:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_oa@invalid-oa-format-id.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-433/igt@xe_oa@invalid-oa-format-id.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_oa@unprivileged-single-ctx-counters.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@xe_oa@unprivileged-single-ctx-counters.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"
                moz-do-not-send="true">Intel XE#2541</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mmap-system:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"
                moz-do-not-send="true">Intel XE#2284</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366"
                moz-do-not-send="true">Intel XE#366</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"
                moz-do-not-send="true">Intel XE#2284</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366"
                moz-do-not-send="true">Intel XE#366</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mmap-vram:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"
                moz-do-not-send="true">Intel XE#2284</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366"
                moz-do-not-send="true">Intel XE#366</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"
                moz-do-not-send="true">Intel XE#2284</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366"
                moz-do-not-send="true">Intel XE#366</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
          <ul>
            <li>shard-dg2-set2: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html"
                moz-do-not-send="true">DMESG-WARN</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html"
                moz-do-not-send="true">DMESG-WARN</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162"
                moz-do-not-send="true">Intel XE#1162</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941"
                moz-do-not-send="true">Intel XE#1941</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569"
                moz-do-not-send="true">Intel XE#569</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162"
                moz-do-not-send="true">Intel XE#1162</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569"
                moz-do-not-send="true">Intel XE#569</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
          <ul>
            <li>shard-lnl: (<a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@xe_pm@s4-vm-bind-unbind-all.html"
                moz-do-not-send="true">PASS</a>, <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html"
                moz-do-not-send="true">ABORT</a>) (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html"
                moz-do-not-send="true">ABORT</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794"
                moz-do-not-send="true">Intel XE#1794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@vram-d3cold-threshold:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579"
                moz-do-not-send="true">Intel XE#579</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579"
                moz-do-not-send="true">Intel XE#579</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-size:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_query@multigpu-query-invalid-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-432/igt@xe_query@multigpu-query-invalid-size.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
          <ul>
            <li>shard-dg2-set2: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-dg2-466/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"
                moz-do-not-send="true">Intel XE#1201</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944"
                moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_wedged@wedged-at-any-timeout:</p>
          <ul>
            <li>shard-adlp: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_wedged@wedged-at-any-timeout.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760"
                moz-do-not-send="true">Intel XE#1760</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137692v2/shard-adlp-2/igt@xe_wedged@wedged-at-any-timeout.html"
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
        <li>IGT: IGT_7986 -&gt; IGT_7987</li>
        <li>Linux: xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70
          -&gt; xe-pw-137692v2</li>
      </ul>
      <p>IGT_7986: 7986<br>
        IGT_7987: 89c9c18d654c46a9469c6c414d40f5b63dde9958 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70:
        7365d672ab38ee0eabb65fcd359e5774a8efbd70<br>
        xe-pw-137692v2: 137692v2</p>
    </blockquote>
  </body>
</html>

--------------0bqkfFu1lAZCHku0DWaUt9gK--
