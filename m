Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7266C3DA60
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 21:34:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455E610E45F;
	Wed, 17 Jul 2024 21:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lza1Bj81";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5051810E45F
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 21:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721252069; x=1752788069;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=OQw4v4zOWDP8BhJf9PYz8wOe4u/YDe+qGlYTkzDkehY=;
 b=lza1Bj81HHFg8kzqLS+Usk7IiWHEuxmFnJNNsRZVJB9Enif5pVrLXuMt
 A8aNuQ49UaCBWsXgj3MYpZc/sXsnfhIX5xM69Gt4ANkYM0sO76sQvSkpw
 SPCBe4AMubZDDUaALvIA82OBTKSX9f/xSTbAnT1KL/O0jGM2rqthmW2Kh
 3E9y+uDfVnzbnyApAkTUBuk7l4f6xl634USZenCnPh26b8K/VeAtDqNiI
 jTNoItg5bncJQ5zh+yRoNt/L9kHYLJDmD/E/eZANoUASAq3R4avcSqfaQ
 YcOiy4UT8LybzhleE7zvgPt1brcjSWRRUdOZ+9LwOpJAC3Y/yf544dNad A==;
X-CSE-ConnectionGUID: ofaspfHqRl6RqbvRHNFJVQ==
X-CSE-MsgGUID: 7SsB1TyBQ0Ov3lsKXU3wWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18486009"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="18486009"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 14:34:28 -0700
X-CSE-ConnectionGUID: 0ie0gugwTXCWeBjmN9j7sQ==
X-CSE-MsgGUID: wIH2xOj7RsGx89A2ryIY5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="50843424"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa006.jf.intel.com with ESMTP; 17 Jul 2024 14:34:26 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 0825A2878D
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 22:34:24 +0100 (IST)
Message-ID: <1ac1f508-ca11-4a3d-b338-93c407ba260e@intel.com>
Date: Wed, 17 Jul 2024 23:34:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EBAT=3A_failure_for_Convert_live_test?=
 =?UTF-8?Q?s_to_parameterized_style_=28rev2=29?=
To: intel-xe@lists.freedesktop.org
References: <20240717195155.442-1-michal.wajdeczko@intel.com>
 <172124885918.271339.12965011522495881458@2413ebb6fbb6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <172124885918.271339.12965011522495881458@2413ebb6fbb6>
Content-Type: text/plain; charset=UTF-8
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



On 17.07.2024 22:40, Patchwork wrote:
> == Series Details ==
> 
> Series: Convert live tests to parameterized style (rev2)
> URL   : https://patchwork.freedesktop.org/series/136163/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f_BAT -> xe-pw-136163v2_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-136163v2_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-136163v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (7 -> 7)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-136163v2_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 

these are not regressions, all now reported SKIP are actually expected,
as previously, due to a way live tests were implemented, they were just
incorrectly shown as normal comment and thus test was treated as PASS

>   * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>     - bat-lnl-1:          [PASS][1] -> [SKIP][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/bat-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/bat-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

[ ]     # xe_bo_evict_kunit: Skipping non-discrete device 0000:00:02.0.
[ ]     ok 1 xe_bo_evict_kunit

vs

[ ]     # xe_bo_evict_kunit: running on LUNARLAKE device
[ ]         ok 1 0000:00:02.0 # SKIP Skipping non-discrete device
0000:00:02.0.
[ ]     ok 1 xe_bo_evict_kunit # SKIP

> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - bat-pvc-2:          [PASS][3] -> [SKIP][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/bat-pvc-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/bat-pvc-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

[ ]     # xe_ccs_migrate_kunit: Skipping non-flat-ccs device.
[ ]     ok 1 xe_ccs_migrate_kunit

vs

[ ]     # xe_ccs_migrate_kunit: running on PVC device
[ ]         ok 1 0000:aa:00.0 # SKIP Skipping non-flat-ccs device.
[ ]     ok 1 xe_ccs_migrate_kunit # SKIP

>     - bat-adlp-7:         [PASS][5] -> [SKIP][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

[ ]     # xe_ccs_migrate_kunit: Skipping non-flat-ccs device.
[ ]     ok 1 xe_ccs_migrate_kunit

vs

[ ]     # xe_ccs_migrate_kunit: running on ALDERLAKE_P device
[ ]         ok 1 0000:00:02.0 # SKIP Skipping non-flat-ccs device.
[ ]     ok 1 xe_ccs_migrate_kunit # SKIP

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - {bat-bmg-1}:        [PASS][7] -> [DMESG-WARN][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/bat-bmg-1/igt@kms_force_connector_basic@prune-stale-modes.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/bat-bmg-1/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>     - {bat-lnl-2}:        [PASS][9] -> [SKIP][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-136163v2_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
>     - bat-lnl-1:          [PASS][11] -> [FAIL][12] ([Intel XE#886]) +1 other test fail
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-adlp-7:         [PASS][13] -> [DMESG-FAIL][14] ([Intel XE#324])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - bat-adlp-7:         [PASS][15] -> [SKIP][16] ([Intel XE#455]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f -> xe-pw-136163v2
> 
>   IGT_7928: 294a7a487aab103c54b0deeb1559fcba371232d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f: bd2a84d801982bd4a899a29916b458a8f82cb01f
>   xe-pw-136163v2: 136163v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/index.html
> 
