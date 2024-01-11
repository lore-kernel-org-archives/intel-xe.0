Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEB6C47077
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 19:53:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1957210E954;
	Thu, 11 Jan 2024 19:53:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1AA10E954
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 19:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705002833; x=1736538833;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=V2K17gkzdeYUuIFC1SV5qaleIInYXK0TQLiwkSg+rjg=;
 b=jDNMKBqIJQrF4tLXuxpdKkCZqo6e4DNTLKvDI4tMo2kuPBg3t5dg0MPS
 TbZH8DBvlzkCP3H26gFfF62+/ZTrKf3IxcO7Kgy1py73EehQwBR3Fn/p9
 kYgpSa1vaPrNL5tpmvTFeXmwgb8BrGjOheT2aB7yvh4ISkQXRVTWluYrr
 0pPamivzw8yH0Z10kpFjyNKf6zsNj3aDZ35c/amO+erTRePFXJAMXw56Z
 EBKlkOzxq5knejaxgLCodgfhhUGqvfT+UjhupW/v3bFXP+KGjAFKDpy4A
 SfGgvh65UlQkHuK1I0k0DYqERXS7sRhSkLT6w6d8ezkh/CHvfHi43Gtar g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="17579048"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="17579048"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 11:53:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="955864145"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; d="scan'208";a="955864145"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga005.jf.intel.com with ESMTP; 11 Jan 2024 11:53:50 -0800
Received: from [10.249.150.229] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.150.229])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4DB7843C1B
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 19:53:49 +0000 (GMT)
Message-ID: <6323ffbf-6b7b-46ab-9101-02807f0d0b5a@intel.com>
Date: Thu, 11 Jan 2024 20:53:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Allow_t?=
 =?UTF-8?Q?o_exclude_part_of_GGTT_from_allocations?=
Content-Language: en-US
To: intel-xe@lists.freedesktop.org
References: <20240111182559.629-1-michal.wajdeczko@intel.com>
 <170500039807.290000.12393143665221931404@5338d5abeb45>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <170500039807.290000.12393143665221931404@5338d5abeb45>
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



On 11.01.2024 20:13, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Allow to exclude part of GGTT from allocations
> URL   : https://patchwork.freedesktop.org/series/128686/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-618-79184e72263e91528195db01783148435c7e4fad_BAT -> xe-pw-128686v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-128686v1_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-128686v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-128686v1_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

hmm, this must be a CI glitch, as new functions from this patch are not
used yet by any driver code paths, so they can't cause real regressions

> 
>   * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
>     - bat-dg2-oem2:       [PASS][1] -> [SKIP][2] +1 other test skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-618-79184e72263e91528195db01783148435c7e4fad/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128686v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
> 
>   * igt@xe_exec_threads@threads-mixed-fd-basic:
>     - bat-dg2-oem2:       [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-618-79184e72263e91528195db01783148435c7e4fad/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128686v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-128686v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
>     - bat-atsm-2:         NOTRUN -> [SKIP][5] ([Intel XE#288]) +6 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128686v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@xe_create@create-execqueues-noleak:
>     - bat-atsm-2:         [FAIL][6] ([Intel XE#1099]) -> [PASS][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-618-79184e72263e91528195db01783148435c7e4fad/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128686v1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
>     - bat-atsm-2:         [INCOMPLETE][8] ([Intel XE#506]) -> [SKIP][9] ([Intel XE#288])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-618-79184e72263e91528195db01783148435c7e4fad/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128686v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
> 
>   
>   [Intel XE#1099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1099
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/506
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7669 -> IGT_7670
>   * Linux: xe-618-79184e72263e91528195db01783148435c7e4fad -> xe-pw-128686v1
> 
>   IGT_7669: 418064e40ca6399700b0548983fdb679be4d855b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7670: 1b32bcdb2d9965090234739aba891a90743e01c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-618-79184e72263e91528195db01783148435c7e4fad: 79184e72263e91528195db01783148435c7e4fad
>   xe-pw-128686v1: 128686v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128686v1/index.html
> 
