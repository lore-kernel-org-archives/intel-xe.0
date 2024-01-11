Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59537C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 17:31:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0339F10E060;
	Thu, 11 Jan 2024 17:31:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B6510E060
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 17:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704994317; x=1736530317;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=JBt6P9a6jdr3UpdHOKMGBsSRzgNlWpcKqWPlNn5HJrU=;
 b=TdWKSlAXxGd/Kd4y9yD9pMiFKPEPLX5D8f+ButwMHImiaPJQKKb1uDEY
 1+qgGBbhKqVhz920e0hFXLFAbqu4C9uTVilri+ZhwbskZv+IHa+gVk4UG
 pHIFA7zsFIPt7qHC/GPgz6YR7pxuWVS0pJz4rjVeMXC3Ga+igCQl7hmwW
 ruTnY2e0PdlUFrmufGToZO3RFqzfAtmNoGjihyYXvMKW8E7AyUWCVGF1s
 K6rV/glC9Nc92u8pUCcy9IDThEHPg4t+Pzm8CsMFhF/48bBL/C2y5hGL6
 bJKaKguDuIUPkziXTs4pWxCzozKCksOVzqt2DWLUxKIQxUxROSa7/9lh6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="17535203"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="17535203"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 09:31:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="758844610"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="758844610"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga006.jf.intel.com with ESMTP; 11 Jan 2024 09:31:54 -0800
Received: from [10.249.150.229] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.150.229])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6654C40E19
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 17:31:52 +0000 (GMT)
Message-ID: <d8663aac-8071-424b-afc8-88efd23a90a6@intel.com>
Date: Thu, 11 Jan 2024 18:31:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/guc=3A_Ret?=
 =?UTF-8?Q?urn_CTB_response_length?=
Content-Language: en-US
To: intel-xe@lists.freedesktop.org
References: <20240111152724.497-1-michal.wajdeczko@intel.com>
 <170498982314.290001.7423231611964465904@5338d5abeb45>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <170498982314.290001.7423231611964465904@5338d5abeb45>
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



On 11.01.2024 17:17, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/guc: Return CTB response length
> URL   : https://patchwork.freedesktop.org/series/128675/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-618-79184e72263e91528195db01783148435c7e4fad_BAT -> xe-pw-128675v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-128675v1_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-128675v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-128675v1_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_fault_mode@twice-basic-prefetch:
>     - bat-pvc-2:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128675v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic-prefetch.html

"This test didn't produce any output. The machine probably rebooted
ungracefully."

and it's not that uncommon
anyway, it seems unrelated

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-128675v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
>     - bat-atsm-2:         NOTRUN -> [SKIP][2] ([Intel XE#288]) +6 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128675v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-adlp-7:         [DMESG-FAIL][3] ([Intel XE#1033]) -> [PASS][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-618-79184e72263e91528195db01783148435c7e4fad/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128675v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@xe_create@create-execqueues-noleak:
>     - bat-atsm-2:         [FAIL][5] ([Intel XE#1099]) -> [PASS][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-618-79184e72263e91528195db01783148435c7e4fad/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128675v1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
>     - bat-atsm-2:         [INCOMPLETE][7] ([Intel XE#506]) -> [SKIP][8] ([Intel XE#288])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-618-79184e72263e91528195db01783148435c7e4fad/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128675v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
> 
>   
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1099
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/506
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7669 -> IGT_7670
>   * Linux: xe-618-79184e72263e91528195db01783148435c7e4fad -> xe-pw-128675v1
> 
>   IGT_7669: 418064e40ca6399700b0548983fdb679be4d855b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7670: 1b32bcdb2d9965090234739aba891a90743e01c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-618-79184e72263e91528195db01783148435c7e4fad: 79184e72263e91528195db01783148435c7e4fad
>   xe-pw-128675v1: 128675v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128675v1/index.html
> 
