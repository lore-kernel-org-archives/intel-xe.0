Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D41CD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 10:15:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D8F5112407;
	Fri,  5 Apr 2024 10:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jg4UpKeU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A5E112407
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 10:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712312118; x=1743848118;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=vJfWq7slcBOhYFbtyGhUbyj9MzySPbqlB8o7i1uXqes=;
 b=jg4UpKeUt22obL1cd0kSVQipYxRlUyFudvmu51UHOhK3+mRmsd/ZKPZu
 FD/SO4sCFfkRAdQk2v3nXfWH1zTZ7ACR9ou8gaWiLnwbdltgAXP1H+7vy
 2cdkGZiBvMEHaNISXQlgtAz9pnT31/MHzuoIxuah8hYFTj+EURDe4e4aZ
 +umI9ZXPO+lsxc6yItVawqLPStnE4W5udcwPP9ReN2ryrgi7D9dl2wv0c
 a+FkDS7i/y7JQxf4vpuIhiMrDVG8ZOcfALNgZaPldojL/e/m6qkbBc6HJ
 yVs+CUtFV2UD/agTG417osViXJKC0ZyZBzwz1Y10THe9WEkC68D0RrRCn g==;
X-CSE-ConnectionGUID: G+cw9nhhSlyvsGn4ejbc9g==
X-CSE-MsgGUID: I1f/KC48RRSmywNAZY5iRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7481173"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7481173"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 03:15:15 -0700
X-CSE-ConnectionGUID: 2roBHGWYRoKM3NQPZpVVrg==
X-CSE-MsgGUID: g3icRSvvR7y8zVcafzPXjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19224979"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa008.fm.intel.com with ESMTP; 05 Apr 2024 03:15:11 -0700
Received: from [10.249.143.198] (unknown [10.249.143.198])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7A2893496E
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 11:15:10 +0100 (IST)
Message-ID: <af3bf5d9-7a3a-4a4a-9b12-3ca93f6a45b7@intel.com>
Date: Fri, 5 Apr 2024 12:15:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_w?=
 =?UTF-8?Q?ith_=5BCI=2C1/2=5D_drm/xe/guc=3A_Prefer_GT_oriented_logs_for_GuC_?=
 =?UTF-8?Q?messages?=
Content-Language: en-US
To: intel-xe@lists.freedesktop.org
References: <20240404155046.627-1-michal.wajdeczko@intel.com>
 <171225301670.1209302.1881814550715168124@8e613ede5ea5>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171225301670.1209302.1881814550715168124@8e613ede5ea5>
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



On 04.04.2024 19:50, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [CI,1/2] drm/xe/guc: Prefer GT oriented logs for GuC messages
> URL   : https://patchwork.freedesktop.org/series/132041/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1039-f1408ebd4c6b508ff23139fcbc7275fa227b197b_BAT -> xe-pw-132041v1_BAT
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

  * igt@xe_exec_basic@twice-rebind:
    - shard-adlp:  NOTRUN -> [DMESG-FAIL][1] +1 other test dmesg-fail

but that's unrelated to this series

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
>   * Linux: xe-1039-f1408ebd4c6b508ff23139fcbc7275fa227b197b -> xe-pw-132041v1
> 
>   IGT_7798: 5e3263748a636ebc91ecfafbd339870c77e3eed6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1039-f1408ebd4c6b508ff23139fcbc7275fa227b197b: f1408ebd4c6b508ff23139fcbc7275fa227b197b
>   xe-pw-132041v1: 132041v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132041v1/index.html
> 
