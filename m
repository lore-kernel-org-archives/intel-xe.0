Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594D1CD128A
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 09:19:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0467C11233C;
	Mon,  8 Apr 2024 09:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a4Fg1G/n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387CF11233C
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 09:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712567950; x=1744103950;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=MFeZ8Q6SKP0+hViLEKFd3f1pbRiKnxk/dl3o/LLohCQ=;
 b=a4Fg1G/nNLgn3f0GtZmoDpy7Q2svxztkIZak+3itDdbbOUsGpNR+XDbw
 lsfpEdOUQT5kyp124JS9Ooe+VlylAA6ssBzDJxIIb2LyoKS//Gmr5DrsY
 lF7jeWdNPGLz+Da2Y+CTiPEyJDOZlbhDmSuAqo5AI/4NopWpydC/P3mNs
 3e+cXpvgagcRT860ootEk7yirWaw/xfx0RY+NHNpL3sOd2C7oQJLV8Z7N
 vqeTOqEFylbTfGx39XMlzWNIaATcNw6O5pEkdBl/7FmbTehbswelqR+I+
 0kyQRp4Lv7O6J6q+0z7spd7ZgImEnGZIr/uAHTAhRZMG4BH2N18X2VY5z g==;
X-CSE-ConnectionGUID: nDy1dtpvT5G8aUjXXVYuKA==
X-CSE-MsgGUID: D8BAP4WfRZK+7/xnH+hWbQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="18557157"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="18557157"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 02:19:09 -0700
X-CSE-ConnectionGUID: VXxIH+vcSP645nRSy4CVIA==
X-CSE-MsgGUID: 5ed9d1+ARnyUCspz1S+uwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="24297370"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 08 Apr 2024 02:19:07 -0700
Received: from [10.249.158.202] (unknown [10.249.158.202])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id E917027BC6
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 10:19:06 +0100 (IST)
Message-ID: <8c1522cf-cc53-4b10-87a4-778ae7a9d968@intel.com>
Date: Mon, 8 Apr 2024 11:19:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EBAT=3A_failure_for_series_starting_w?=
 =?UTF-8?Q?ith_=5B1/2=5D_drm/xe/guc=3A_Use_drm=5Fdevice-managed_version_of_m?=
 =?UTF-8?B?dXRleF9pbml0KCk=?=
Content-Language: en-US
To: intel-xe@lists.freedesktop.org
References: <20240406143946.979-1-michal.wajdeczko@intel.com>
 <171241738524.1255282.14990289170083469257@8e613ede5ea5>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171241738524.1255282.14990289170083469257@8e613ede5ea5>
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



On 06.04.2024 17:29, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [1/2] drm/xe/guc: Use drm_device-managed version of mutex_init()
> URL   : https://patchwork.freedesktop.org/series/132118/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1050-1bace689230323abe9cd3dfc6dd011fa5f9e6a05_BAT -> xe-pw-132118v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-132118v1_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-132118v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (5 -> 5)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-132118v1_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

CI.FULL (no e-mail, dunno why) also reports some regression, but
reported GPF call stack points to xe_devcoredump_free() so it's unrelated

> 
>   * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind:
>     - bat-pvc-2:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1050-1bace689230323abe9cd3dfc6dd011fa5f9e6a05/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132118v1/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html

also seems unrelated as series is touching cleanup phase that is common
to all platforms, not just PVC

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
>     - {bat-lnl-1}:        [PASS][3] -> [FAIL][4] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1050-1bace689230323abe9cd3dfc6dd011fa5f9e6a05/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132118v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1050-1bace689230323abe9cd3dfc6dd011fa5f9e6a05 -> xe-pw-132118v1
> 
>   IGT_7801: 7801
>   xe-1050-1bace689230323abe9cd3dfc6dd011fa5f9e6a05: 1bace689230323abe9cd3dfc6dd011fa5f9e6a05
>   xe-pw-132118v1: 132118v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132118v1/index.html
> 
