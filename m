Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EECDC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 17:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A1210EBF6;
	Mon, 22 Apr 2024 17:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TUebDrcu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1591410EBF6
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 17:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713806920; x=1745342920;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=X01ImktQuSprR4RR4wKSTv/BaIFsljrDr7vTXgqgUyY=;
 b=TUebDrcutddEd40wPxnL1pUQZSmBtMtcZIAUe4rBWtFBB1/AKgmlYHs/
 xr4UUO6jx+CKVZzZKIOqa3hLJlsJHa+26yaUvb0AgkGfRV5OZWg3dsKms
 6//fJCD6Js0t03Ae2/hFV8yQkUMzzfyT8oXhFRv4493MRrmP7R+rHA0/l
 sOLyUAuBrFRunaivCKY3/swYJV4qzi205Deo3IJCkpogpMnqr87NEsnex
 Cwhm3GkGTnKG1Ha2YG2yP3WcOFnwjfHL/4L85d6LyYnpTh1uVdvQYA0UC
 QP+MVaEpxX1eoqHMGPKDIaGoL2yCJ3nDa41fN+9qbE6U8LVvRJ2QT85j2 w==;
X-CSE-ConnectionGUID: jPX3DG+lRPWo5U21pBjtKw==
X-CSE-MsgGUID: b8vy8KVdRCuwFJOadYwSGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="19912068"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="19912068"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 10:28:40 -0700
X-CSE-ConnectionGUID: SBIZyPlVR2qN16tIvPzZsg==
X-CSE-MsgGUID: 4Ce5ogpmS1OnVQajNkysQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="28603137"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 22 Apr 2024 10:28:38 -0700
Received: from [10.252.63.74] (mwajdecz-MOBL.ger.corp.intel.com [10.252.63.74])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 63FD12879A
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 18:28:29 +0100 (IST)
Message-ID: <d3d3f9a7-2ca3-4d9d-b454-a11a61f7b98e@intel.com>
Date: Mon, 22 Apr 2024 19:28:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/guc=3A_Fix?=
 =?UTF-8?Q?_arguments_passed_to_relay_G2H_handlers?=
To: intel-xe@lists.freedesktop.org
References: <20240419150351.358-1-michal.wajdeczko@intel.com>
 <171357010156.1536851.11430254969529858621@8e613ede5ea5>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171357010156.1536851.11430254969529858621@8e613ede5ea5>
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



On 20.04.2024 01:41, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/guc: Fix arguments passed to relay G2H handlers
> URL   : https://patchwork.freedesktop.org/series/132651/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1129-53dd7a2909139fb469db4423b79d8a2888a734c2_BAT -> xe-pw-132651v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-132651v1_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-132651v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 0)
> ------------------------------
> 
>   ERROR: It appears as if the changes made in xe-pw-132651v1_BAT prevented too many machines from booting.
> 
>   Missing    (4): bat-pvc-2 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 

this is clearly a CI glitch

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
>   * Linux: xe-1129-53dd7a2909139fb469db4423b79d8a2888a734c2 -> xe-pw-132651v1
> 
>   IGT_7814: 7814
>   xe-1129-53dd7a2909139fb469db4423b79d8a2888a734c2: 53dd7a2909139fb469db4423b79d8a2888a734c2
>   xe-pw-132651v1: 132651v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132651v1/index.html
> 
