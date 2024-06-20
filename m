Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A871C27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 06:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C083310E494;
	Thu, 20 Jun 2024 06:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dvoiLSov";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D92D10E4E7;
 Thu, 20 Jun 2024 06:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718864921; x=1750400921;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=nQ4+nP6bQtUBNCLMRPxUsBtNg3TjI0JVTMI+1kHKIac=;
 b=dvoiLSovn04QaKsxiDhIq63KT1AoogeGNzv095geVVxyzUV0zY1WJLhF
 Too8rHfRU49QG24d/TF1oalWanqTmhBqfxDSABpNMjoE/OpUtTRnPgw/x
 vk7CJiTG0NCucM/01fZ2Ad8wxlR7MWIYLM3f7/N2qd6/Wwu0JDBMzROwH
 04NGlL1xC7oOcTQnxG4TEn3kj0tB6Lmc3UWnTvbYcQ2ItWuDprqrBkLIj
 AlkkIkjfQg1Q3meMzBCEyvVUNbxselVrm8Z3hpDlG1Kl8QJzzcwxO7NxE
 UFUHpaDlkX4DZNgNJ7t4mfOcYnRXu5mFaViDUgcJ1PzUkpxJSE+fEHghw g==;
X-CSE-ConnectionGUID: JyUfOtSKRpSCyT0gvBAXRg==
X-CSE-MsgGUID: Tljxy8boSaiJzYt6vXD43w==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="27243846"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="27243846"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 23:28:40 -0700
X-CSE-ConnectionGUID: BzS5KsE3TzOFpcgk2LxE+w==
X-CSE-MsgGUID: yk375xy2RpK2ictTa/b+iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="47279337"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 19 Jun 2024 23:28:38 -0700
Received: from [10.246.49.231] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.49.231])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id ACF3B12591;
 Thu, 20 Jun 2024 07:28:25 +0100 (IST)
Message-ID: <fdd378cc-e300-4515-8425-989d31ecbc96@intel.com>
Date: Thu, 20 Jun 2024 08:28:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EBAT=3A_failure_for_Adapt_the_driver_?=
 =?UTF-8?Q?to_boot_on_the_VF_device?=
To: intel-xe@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
 <171883574375.124989.1656310321456214041@a6498e030952>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171883574375.124989.1656310321456214041@a6498e030952>
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



On 20.06.2024 00:22, Patchwork wrote:
> == Series Details ==
> 
> Series: Adapt the driver to boot on the VF device
> URL   : https://patchwork.freedesktop.org/series/135080/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1500-66d8ec4c6e7d124a021a3a8d038ed9e739cc9359_BAT -> xe-pw-135080v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-135080v1_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-135080v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (5 -> 0)
> ------------------------------
> 
>   ERROR: It appears as if the changes made in xe-pw-135080v1_BAT prevented too many machines from booting.
> 
>   Missing    (5): bat-pvc-2 bat-lnl-1 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 

that must be some unrelated CI reporting glitch (as it can't be that bad
if we got some FULL results); already triggered rerun

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
>   * IGT: IGT_7892 -> IGT_7893
>   * Linux: xe-1500-66d8ec4c6e7d124a021a3a8d038ed9e739cc9359 -> xe-pw-135080v1
> 
>   IGT_7892: 7892
>   IGT_7893: a1840ca4270b765883d3b71a710b6af85ded8235 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1500-66d8ec4c6e7d124a021a3a8d038ed9e739cc9359: 66d8ec4c6e7d124a021a3a8d038ed9e739cc9359
>   xe-pw-135080v1: 135080v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v1/index.html
> 
