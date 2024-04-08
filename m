Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FB7CD128A
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 12:57:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05E1112567;
	Mon,  8 Apr 2024 12:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GSYXRUpr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C13A112567
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 12:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712581025; x=1744117025;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=oKw9oKHFPiE0UDCdvvnRs6jeEhEvzsivpi+eZCxIHCo=;
 b=GSYXRUpr+vXfecRQmXnEC0aeQmR1MpuyCVDqC+hqmoGlzKKEgsU+a1xB
 cKD3TV+W+tSjdLcCb05MVTH0aS4onU34LOxV2KKezfR/Gb4dEm1CWoTTN
 nJG6mYwtXvz+TVCgbJZJVQYQDpMge+wqjogQMkpDlXfRQ3cm6N0bJP4Rx
 9qpLFFK1TXOpe/6m8+gCTwuCQVZff0EDKnBrUJrQmYEYSpjvIF97y/y8j
 9c3kb0p1sPNn1iXFAwJyxAhLzV9Al4i0eVvLLFHRrf8cNWDX1nSGga8Lp
 WcFfAQdVSdipSU8QllU68W6DzgQOhpQEifynGs8+1hCPD4uDjBR4PvraF w==;
X-CSE-ConnectionGUID: dG4oZ+nkQciEbKSqQhxjDA==
X-CSE-MsgGUID: hoFWYLh/TZ2XydoKAnkliQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7721005"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="7721005"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 05:57:04 -0700
X-CSE-ConnectionGUID: cuKqmoRfRdGbHizqicJgFA==
X-CSE-MsgGUID: bIKS8uwPTASlqi57Mm8JOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="19966685"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 08 Apr 2024 05:57:02 -0700
Received: from [10.249.158.202] (unknown [10.249.158.202])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8CF6528169
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 13:57:01 +0100 (IST)
Message-ID: <22ccae8f-b700-4c92-925d-89e3bb119b49@intel.com>
Date: Mon, 8 Apr 2024 14:57:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/vf=3A_Mark?=
 =?UTF-8?Q?_supported_firmwares_as_preloaded?=
Content-Language: en-US
To: intel-xe@lists.freedesktop.org
References: <20240404173814.715-1-michal.wajdeczko@intel.com>
 <171226084056.1211620.16623139188551051189@8e613ede5ea5>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171226084056.1211620.16623139188551051189@8e613ede5ea5>
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



On 04.04.2024 22:00, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/vf: Mark supported firmwares as preloaded
> URL   : https://patchwork.freedesktop.org/series/132047/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1039-f1408ebd4c6b508ff23139fcbc7275fa227b197b_BAT -> xe-pw-132047v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 

CI.FULL was complaining about:

* igt@kms_flip@2x-flip-vs-panning
  but call stack points to xe_devcoredump_free()

* igt@xe_exec_balancer@once-parallel-userptr-invalidate-race
  but job timeout was unrelated

* igt@runner@aborted
  but it was due to WARN somewhere in gpio_device_find()

>   
> 
> Participating hosts (5 -> 5)
> ------------------------------
> 
>   No changes in participating hosts
> 
> 
> Changes
> -------
> 
>   No changes found
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7798 -> IGT_7799
>   * Linux: xe-1039-f1408ebd4c6b508ff23139fcbc7275fa227b197b -> xe-pw-132047v1
> 
>   IGT_7798: 5e3263748a636ebc91ecfafbd339870c77e3eed6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7799: 7799
>   xe-1039-f1408ebd4c6b508ff23139fcbc7275fa227b197b: f1408ebd4c6b508ff23139fcbc7275fa227b197b
>   xe-pw-132047v1: 132047v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132047v1/index.html
> 
