Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE31C10DC3
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 18:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D946B10E130;
	Mon, 11 Dec 2023 18:49:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EEFA10E4D9
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 18:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702320599; x=1733856599;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=l5EwEzPtPUyyBK4yvIjNxKj/R9goHoE9gQK1UhD0mMc=;
 b=EmGytJnznTwMIlDILqLjQLH/tcLqnilkhdkchcItDYt0OXI+UsU2T6rj
 5ty8fB8XNMedliLeklE1waNRHooMCeWigMsfi3UiummkEHV/r/phm9ltk
 9wYfZcKNjs4+Kx0S5WZTT8qh4JQjtW0g8YB4/9A7pKDTqnJmqNznk1bbP
 2QOKwOkWAUuZ4Y8ExWqVS1wT/Jv8317d16RNdbf09pUETMIc52jA4VlPt
 4JrzFyaGyqatRQw7NC6i5CszXspZHJla48sU3u44ogCBpfywUiY6iMeBu
 UTXZ62R1jNrr2hyDUX256wn6wp3TFyckL0RHNBgVO6Wd7oWUMxWBvAkNK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="13389005"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="13389005"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 10:49:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="896574995"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="896574995"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga004.jf.intel.com with ESMTP; 11 Dec 2023 10:49:56 -0800
Received: from [10.249.128.141] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.128.141])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id D70DD333F8
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 18:49:50 +0000 (GMT)
Message-ID: <d5e452bf-1781-4700-affd-0e0c5abc62d8@intel.com>
Date: Mon, 11 Dec 2023 19:49:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EBAT=3A_failure_for_Introduce_GuC_Doo?=
 =?UTF-8?Q?rbells_Manager_=28rev2=29?=
Content-Language: en-US
To: intel-xe@lists.freedesktop.org
References: <20231211101719.1659-1-michal.wajdeczko@intel.com>
 <170229286726.19580.2092829560447676100@emeril.freedesktop.org>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <170229286726.19580.2092829560447676100@emeril.freedesktop.org>
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



On 11.12.2023 12:07, Patchwork wrote:
> == Series Details ==
> 
> Series: Introduce GuC Doorbells Manager (rev2)
> URL   : https://patchwork.freedesktop.org/series/127608/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-566-00175313322325f73095e61b6cbe550f47184408_BAT -> xe-pw-127608v2_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-127608v2_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-127608v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-127608v2_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-adlp-7:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-566-00175313322325f73095e61b6cbe550f47184408/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127608v2/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html

oops. I was mislead by the below "known issues" but unfortunately this
is a legit regression due to attempt to use submit.lock in __fini_dbm()
but this lock was already released due to order of init functions:
xe_guc_db_mgr_init() is before xe_guc_submit_init().

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-127608v2_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-dg2-oem2:       [PASS][3] -> [INCOMPLETE][4] ([Intel XE#764])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-566-00175313322325f73095e61b6cbe550f47184408/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127608v2/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
>     - bat-atsm-2:         [PASS][5] -> [INCOMPLETE][6] ([Intel XE#764])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-566-00175313322325f73095e61b6cbe550f47184408/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127608v2/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@xe_prime_self_import@basic-with_fd_dup:
>     - bat-atsm-2:         [PASS][7] -> [FAIL][8] ([Intel XE#999])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-566-00175313322325f73095e61b6cbe550f47184408/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127608v2/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html
> 
>   
>   [Intel XE#764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/764
>   [Intel XE#999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/999
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-566-00175313322325f73095e61b6cbe550f47184408 -> xe-pw-127608v2
> 
>   IGT_7632: 3fff86827c4728708072b9accbc990fa1084c95d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-566-00175313322325f73095e61b6cbe550f47184408: 00175313322325f73095e61b6cbe550f47184408
>   xe-pw-127608v2: 127608v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127608v2/index.html
> 
