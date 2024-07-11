Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A5AC3DA45
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 21:02:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C01F210EB9C;
	Thu, 11 Jul 2024 21:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PiHwZBap";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B9910EB9C
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 21:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720731770; x=1752267770;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=x7edkC8MK+YGckOmfzXaXSXAgCFv1GtLzqh0LCTKfFA=;
 b=PiHwZBapNOZg/gorLloUeSqDFa3y95fZBFmZJwlhLVgmJAW/rZqxIoLh
 +f7CgYlKV6MLcdvXE6/mdfD75H7QO2tbkkNqJdeQRYUNdEaNaqYGY8epd
 C9jb0Coeia9ptUjJuc8kBk/XWikc+IcH3OOVtA8IPcpZr/Qw4nu4hlmnJ
 cQxl8bLr9xeuS5UqH6axl+u/nlqS8mJi4UfIWZI40/xUKAnH+oHgxilJS
 Sy3go6G4P7zqt19c0NjMN9lVmecgbRIYr7rVYSemcbK1kK1Vz6wL4BAsX
 xEKIy/+9AfVyRYedPTn1uAnIm/l+rmAi6VioQIhjg4iklweIP1fdiW8mj A==;
X-CSE-ConnectionGUID: e4tVhsskSlK30iYSvrdPCQ==
X-CSE-MsgGUID: 6tZIUExQSWK8VZOLdnB2KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18100411"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="18100411"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 14:02:50 -0700
X-CSE-ConnectionGUID: fg5x3PxJSE+Z3Us6beha7g==
X-CSE-MsgGUID: SCLfKWW/S7K/C1uCkUxaWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="49111261"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa006.jf.intel.com with ESMTP; 11 Jul 2024 14:02:47 -0700
Received: from [10.246.49.75] (mwajdecz-MOBL.ger.corp.intel.com [10.246.49.75])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8FF74122C1
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 22:02:46 +0100 (IST)
Message-ID: <4caa431c-0b14-4a61-aa95-b4c845824e25@intel.com>
Date: Thu, 11 Jul 2024 23:02:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/pf=3A_Limi?=
 =?UTF-8?Q?t_fair_VF_LMEM_provisioning?=
To: intel-xe@lists.freedesktop.org
References: <20240711192320.1198-1-michal.wajdeczko@intel.com>
 <172072905358.164880.5867005051311083460@2413ebb6fbb6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <172072905358.164880.5867005051311083460@2413ebb6fbb6>
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



On 11.07.2024 22:17, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/pf: Limit fair VF LMEM provisioning
> URL   : https://patchwork.freedesktop.org/series/136010/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1597-3bcdb3f9a5370e29bc971883307487527c3e6a65_BAT -> xe-pw-136010v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-136010v1_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-136010v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-136010v1_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_gt_freq@freq_fixed_idle:
>     - bat-adlp-7:         [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1597-3bcdb3f9a5370e29bc971883307487527c3e6a65/bat-adlp-7/igt@xe_gt_freq@freq_fixed_idle.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136010v1/bat-adlp-7/igt@xe_gt_freq@freq_fixed_idle.html

this test was executed _after_ running some SR-IOV specific test that
forced GuC to run in the VGT mode, which might have some side-effect
that is not accounted by the test, or it's just a noise


<7>[  380.254006] [IGT] sriov_basic: starting subtest
enable-vfs-autoprobe-off
<7>[  380.254694] [IGT] sriov_basic: starting dynamic subtest numvfs-all
<6>[  380.485443] xe 0000:00:02.0: [drm] PF: Enabled 7 of 7 VFs
...
<6>[  381.607087] xe 0000:00:02.0: [drm] PF: Disabled 7 VFs
<7>[  381.607448] [IGT] sriov_basic: finished subtest numvfs-all, SUCCESS

...

<7>[  392.445578] [IGT] xe_gt_freq: starting subtest freq_fixed_idle
<7>[  392.672710] [IGT] xe_gt_freq: finished subtest freq_fixed_idle, FAIL


> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-136010v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - bat-atsm-2:         [SKIP][3] ([Intel XE#1932]) -> [PASS][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1597-3bcdb3f9a5370e29bc971883307487527c3e6a65/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136010v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
>     - bat-adlp-7:         [SKIP][5] ([Intel XE#1932]) -> [PASS][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1597-3bcdb3f9a5370e29bc971883307487527c3e6a65/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-off.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136010v1/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-off.html

this is expected fix, but I was expecting also fix for:

	igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1

that was recently added to BAT by [B]

[B] https://patchwork.freedesktop.org/patch/602461/?series=135803&rev=1


> 
>   
>   [Intel XE#1932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7924 -> IGT_7925
>   * Linux: xe-1597-3bcdb3f9a5370e29bc971883307487527c3e6a65 -> xe-pw-136010v1
> 
>   IGT_7924: 6e6ecdef9f167ff987f6d323f3ff6429c01b25e0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7925: def41c762723c9ba046a3ffe722d046cd12e993d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1597-3bcdb3f9a5370e29bc971883307487527c3e6a65: 3bcdb3f9a5370e29bc971883307487527c3e6a65
>   xe-pw-136010v1: 136010v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136010v1/index.html
> 
