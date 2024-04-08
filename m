Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42F3C67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 12:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F7E112549;
	Mon,  8 Apr 2024 12:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TpcXSrBB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A719211253E
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 12:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712579526; x=1744115526;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=lYL78KFZVI/z0mtb9pGHT0ut8yhz+SAsa7cQ7ElRY7I=;
 b=TpcXSrBBEZ26seTtbZpNZYIR3wpUXYeCew+lWsj8xBRhcW/KZ4ZWWBBb
 /gQDTzfwqJDjQEnZ/99jniqFR78HAFo7m0gtYphjeREYA3VhwK6q67tSr
 /26CBqhi6N3OZmlYTLU6sJBDQW7Kz839n0TDWQrEstFsBt04C2NTrBvv9
 3yvjoAc1vzQlkJjs7yuSp47amCegRxFqSMUvD8fz27dNGwLGnd7r8k4Sv
 w3yp4clz3IFGH2Hnt44t+OyClHZB7jVaVFxWY0Ag3UN0Llhws4fciEmqa
 SrcJBKUwqd+sGZOu2lcohDlwWH5V7n38voUIvdS6+01ho4A6f5HcVcjZe A==;
X-CSE-ConnectionGUID: X4TvWVVoRFi/DlF6UzCMYg==
X-CSE-MsgGUID: rcdctQu9QqOcQ0T9zV5WwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="8036192"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="8036192"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 05:32:05 -0700
X-CSE-ConnectionGUID: oiUY1A5yTgK4yLZ5jGY3WQ==
X-CSE-MsgGUID: MpshRI6dQnyB6DOiK4hfyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="24335725"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 08 Apr 2024 05:32:04 -0700
Received: from [10.249.158.202] (unknown [10.249.158.202])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 15BEA27BDE
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 13:32:02 +0100 (IST)
Message-ID: <187fffc9-1a7c-41ab-9a0b-34df27f446d9@intel.com>
Date: Mon, 8 Apr 2024 14:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=93_CI=2EBAT=3A_success_for_More_VF_tweaks?=
Content-Language: en-US
To: intel-xe@lists.freedesktop.org
References: <20240405133936.891-1-michal.wajdeczko@intel.com>
 <171233678227.1239329.13976834407139235427@8e613ede5ea5>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171233678227.1239329.13976834407139235427@8e613ede5ea5>
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



On 05.04.2024 19:06, Patchwork wrote:
> == Series Details ==
> 
> Series: More VF tweaks
> URL   : https://patchwork.freedesktop.org/series/132080/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1046-5714711c6612120bd9c306824ec807d322c0735b_BAT -> xe-pw-132080v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 

CI.FULL complains about
igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@b-hdmi-a2 on ADLP
but that is unrelated to this series

>   
> 
> Participating hosts (5 -> 5)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-132080v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@xe_evict@evict-beng-small-external:
>     - bat-pvc-2:          NOTRUN -> [FAIL][1] ([Intel XE#1000]) +3 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132080v1/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
> 
>   * igt@xe_evict@evict-small-cm:
>     - bat-adlp-7:         NOTRUN -> [SKIP][2] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132080v1/bat-adlp-7/igt@xe_evict@evict-small-cm.html
> 
>   * igt@xe_evict@evict-small-external-cm:
>     - bat-pvc-2:          NOTRUN -> [DMESG-FAIL][3] ([Intel XE#482]) +3 other tests dmesg-fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132080v1/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
>   [Intel XE#1442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442
>   [Intel XE#1462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7800 -> IGT_7801
>   * Linux: xe-1046-5714711c6612120bd9c306824ec807d322c0735b -> xe-pw-132080v1
> 
>   IGT_7800: 7800
>   IGT_7801: 7801
>   xe-1046-5714711c6612120bd9c306824ec807d322c0735b: 5714711c6612120bd9c306824ec807d322c0735b
>   xe-pw-132080v1: 132080v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132080v1/index.html
> 
