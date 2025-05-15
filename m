Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90459C2D0CD
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 06:29:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5407C10E1B4;
	Thu, 15 May 2025 06:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dSEu1vWd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFC910E1B4
 for <intel-xe@lists.freedesktop.org>; Thu, 15 May 2025 06:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747290572; x=1778826572;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ceKuuQB+MnTeGNEDkwXFPZmiAPh4UNrETLzhOpCdBms=;
 b=dSEu1vWdzMG6WMNMK553uvMmbFHfLq0eh4UwHEXDmNiOvUUGdutLksQB
 vmGE5Na838WLLWYpkRdG0NQR6P7dzOk4gshzTnog7bghUR30bIWuSjyBH
 L1aPfbhvk59bVl9pw9ett9z9iPPmXxpZNL0ykATw6ibTdWlbxzMI4gxLI
 UpjPjIcfEpiRXP9A+bUKcu5igPnU/Xroa04XSKY990LB331ySfWDKlz6Q
 ktp24jk6mzYNwVMlGR/zzs5vcRTG+AN5ybrxACCKV92ZbpGpJ+YvtZKbl
 +NP3KfXb41SadD0jna5CWEIAW9v7Qvw9dJMm0VZ6PE+z1AVxrmHUzDYaL A==;
X-CSE-ConnectionGUID: tINPm4k8QUuF+Okk0cTg5A==
X-CSE-MsgGUID: HjdM3d2FRqKyXDiiqZduAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48328764"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="48328764"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 23:29:31 -0700
X-CSE-ConnectionGUID: CzC0Dtf9Rc2aq1S/kDN1dw==
X-CSE-MsgGUID: 3ArDWJPWSHiR/0T4VWIQqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="138810906"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 14 May 2025 23:29:30 -0700
Received: from [10.245.96.179] (unknown [10.245.96.179])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 61B1E32EA9
 for <intel-xe@lists.freedesktop.org>; Thu, 15 May 2025 07:29:29 +0100 (IST)
Message-ID: <beb8f231-de29-413b-b0e2-48c030fc0c8c@intel.com>
Date: Thu, 15 May 2025 08:29:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBEb24ndCBhbGxv?=
 =?UTF-8?Q?cate_managed_BO_for_each_policy_change_=28rev2=29?=
To: intel-xe@lists.freedesktop.org
References: <20250512220018.172-1-michal.wajdeczko@intel.com>
 <174727989854.82414.17399421351066129824@c664b1dc75d1>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <174727989854.82414.17399421351066129824@c664b1dc75d1>
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



On 15.05.2025 05:31, Patchwork wrote:
> == Series Details ==
> 
> Series: Don't allocate managed BO for each policy change (rev2)
> URL   : https://patchwork.freedesktop.org/series/148913/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961_FULL -> xe-pw-148913v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-148913v2_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-148913v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-148913v2_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

all KMS, all unrelated to this series

> 
>   * igt@kms_flip@blocking-wf_vblank@c-hdmi-a6:
>     - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-433/igt@kms_flip@blocking-wf_vblank@c-hdmi-a6.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148913v2/shard-dg2-435/igt@kms_flip@blocking-wf_vblank@c-hdmi-a6.html

Expected frametime: 16667us; measured 16427.2us +- 7.724us accuracy 0.14%
vblank interval differs from modeline! expected 16666.7us, measured
16427us +- 7.724us, difference 239.4us (31.0 sigma)

> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148913v2/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html

<4> [221.990004] xe 0000:03:00.0: [drm] vblank wait timed out on crtc 0
<4> [221.990043] WARNING: CPU: 5 PID: 4290 at
drivers/gpu/drm/drm_vblank.c:1307 drm_wait_one_vblank+0x185/0x220

> 
>   
> #### Warnings ####
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>     - shard-dg2-set2:     [SKIP][4] ([Intel XE#4208] / [i915#2575]) -> [ABORT][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148913v2/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

<4> [221.990004] xe 0000:03:00.0: [drm] vblank wait timed out on crtc 0
<4> [221.990043] WARNING: CPU: 5 PID: 4290 at
drivers/gpu/drm/drm_vblank.c:1307 drm_wait_one_vblank+0x185/0x220


