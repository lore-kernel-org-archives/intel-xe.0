Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF64C28B28
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 10:34:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E2810E0A3;
	Wed, 12 Mar 2025 10:34:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGsuU4in";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC6310E0A3;
 Wed, 12 Mar 2025 10:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741775669; x=1773311669;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ZV1OifPVBiu6b6N7lm1aN20JXsz8Pmo72Be9yvlEDKQ=;
 b=KGsuU4in5YuRQmBc5XnkGQx14S+kGjSkGS1yCrW4cOf08Q5WFFkt6lbj
 9x7Xik9VBnRzGDbhSO49Tx2YxAUS8eswlbv6HrmumglT5ZLakShNyQEuK
 f/C/4BTBcAD3gGkpggPoye3TtZeSYvGcqOPDeJM1qUGByBaRQGNEY9fS2
 rBAWcKkquEvgRtyLbWHAKv3Gc0SeL1rulXGMuMr85FJWrXZo8BCd/Jd4s
 iBSoinX7/UCVsmS8Kn4cTWLrco7TO4JNA3/HYZmuczTR36PyJ8aEdk8cW
 el1XIbeuEKaJ1X33aCqcsYhIN12W7EJQaU4CqnaG4MtvkcrViSQQYrxUy Q==;
X-CSE-ConnectionGUID: 7ZQECWtlQVOm4np+J39NEw==
X-CSE-MsgGUID: 2njpyr3yROGatUlDx13EJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="60390319"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="60390319"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 03:34:27 -0700
X-CSE-ConnectionGUID: 3WX44xJrSfOPuDlSS/qewQ==
X-CSE-MsgGUID: CbaMiYZ9QfSIbH5dnygLZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="151561907"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 12 Mar 2025 03:34:26 -0700
Received: from [10.245.99.10] (unknown [10.245.99.10])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 3D10733EA1;
 Wed, 12 Mar 2025 10:34:25 +0000 (GMT)
Message-ID: <2f14e37b-7b41-4fea-b77a-e3145741a1a3@intel.com>
Date: Wed, 12 Mar 2025 11:34:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBVc2UgTUlfTUFU?=
 =?UTF-8?Q?H_to_apply_RMW_WA_in_LRC_=28rev4=29?=
To: intel-xe@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250303173522.1822-1-michal.wajdeczko@intel.com>
 <174175806554.22571.17757010164278269717@18a75f3d1eae>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <174175806554.22571.17757010164278269717@18a75f3d1eae>
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



On 12.03.2025 06:41, Patchwork wrote:
> == Series Details ==
> 
> Series: Use MI_MATH to apply RMW WA in LRC (rev4)
> URL   : https://patchwork.freedesktop.org/series/145732/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2794-777e1850811f9864aa8b55940634d3da19712bf7_full -> xe-pw-145732v4_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-145732v4_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-145732v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-145732v4_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:
>     - shard-dg2-set2:     [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2794-777e1850811f9864aa8b55940634d3da19712bf7/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145732v4/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html

unrelated, not seen on previous runs of this series
	
<4> [212.095268] ------------[ cut here ]------------
<4> [212.095281] xe 0000:03:00.0: [drm] vblank wait timed out on crtc 0
<4> [212.095319] WARNING: CPU: 7 PID: 4915 at
drivers/gpu/drm/drm_vblank.c:1307 drm_wait_one_vblank+0x1ef/0x210

> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4:
>     - shard-dg2-set2:     [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2794-777e1850811f9864aa8b55940634d3da19712bf7/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145732v4/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html

unrelated, not seen on previous runs of this series

<4> [213.151269] ------------[ cut here ]------------
<4> [213.151283] xe 0000:03:00.0: [drm] vblank wait timed out on crtc 1
<4> [213.151321] WARNING: CPU: 4 PID: 4915 at
drivers/gpu/drm/drm_vblank.c:1307 drm_wait_one_vblank+0x1ef/0x210

> 
>   * igt@xe_oa@buffer-size:
>     - shard-bmg:          [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2794-777e1850811f9864aa8b55940634d3da19712bf7/shard-bmg-2/igt@xe_oa@buffer-size.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145732v4/shard-bmg-7/igt@xe_oa@buffer-size.html

according to the section below, this test should be "Suppressed"

Starting subtest: buffer-size
Starting dynamic subtest: rcs-0-128K
(xe_oa:3603) CRITICAL: Test assertion failure function
test_non_zero_reason, file ../tests/intel/xe_oa.c:2509:
(xe_oa:3603) CRITICAL: Failed assertion: !(oa_status &
DRM_XE_OASTATUS_BUFFER_OVERFLOW)
Dynamic subtest rcs-0-128K failed.

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@xe_oa@buffer-size@rcs-0-128k}:
>     - shard-bmg:          NOTRUN -> [FAIL][7]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145732v4/shard-bmg-7/igt@xe_oa@buffer-size@rcs-0-128k.html
> 
