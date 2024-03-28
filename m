Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55ADCC54E67
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 12:44:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0C510EA96;
	Thu, 28 Mar 2024 12:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TZDhtXOO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DA810EA96
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 12:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711629889; x=1743165889;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=2Zp51d5PAnJxVN7g1w27fmUSSmKsxR7YJ/cCJ7c3qqU=;
 b=TZDhtXOOLpLEydADEsd0h8M1yFB2ZSJJa5RjV34B7huvs98bzU+J9sNg
 bc83nNxn630MpqO8gd1KxWCz0ZMETheEPPDRXDnU4BZx+vIHzOmrb/4wn
 j604g+g8H4+Zc6UuNgp66Iui3e0LYjOM7qtwT5Cf9tHcGTVWFCdvfN+4+
 4wzW03AjKJI7H3F5IR0aiIangR993Eyyj6ihRlWdAaxQl1GjQgwAoh6Wg
 WCWQh5W7KENp/ASTSASjK+bbwm4Isd2l2AcE3/F61/Stlb9wpnGx1Kewt
 OsIgOHK8heEUw0ZG/T9dHTIoIfFv7StML1zAaZUHXAgKyj4H04sZ4aySe Q==;
X-CSE-ConnectionGUID: bEaFepSnQ0SJv294k8ekyg==
X-CSE-MsgGUID: lrKEQBkFSNerhAhqbj2s7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6713199"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="6713199"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 05:44:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="47824024"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 28 Mar 2024 05:44:47 -0700
Received: from [10.249.157.82] (unknown [10.249.157.82])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id AE3CC35822
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 12:44:41 +0000 (GMT)
Message-ID: <350f3ddf-713f-49a6-9fe1-e16e3e4f7b85@intel.com>
Date: Thu, 28 Mar 2024 13:44:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=93_CI=2EBAT=3A_success_for_Add_proper_detect?=
 =?UTF-8?Q?ion_of_the_SR-IOV_VF_mode?=
Content-Language: en-US
To: intel-xe@lists.freedesktop.org
References: <20240327182740.407-1-michal.wajdeczko@intel.com>
 <171156713254.1055708.1706365095789753077@8e613ede5ea5>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171156713254.1055708.1706365095789753077@8e613ede5ea5>
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



On 27.03.2024 20:18, Patchwork wrote:
> == Series Details ==
> 
> Series: Add proper detection of the SR-IOV VF mode
> URL   : https://patchwork.freedesktop.org/series/131705/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1001-0a8fdcee5ce9a43e8411ea096c7361f8ec7829ca_BAT -> xe-pw-131705v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 

there is also CI.FULL report (sorry, no e-mail) with "possible new
issue" but that seems to be have the same call trace as in [#1304]

[#1304] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1304

>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-131705v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Warnings ####
> 
>   * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
>     - bat-dg2-oem2:       [FAIL][1] ([Intel XE#1259]) -> [INCOMPLETE][2] ([Intel XE#804])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1001-0a8fdcee5ce9a43e8411ea096c7361f8ec7829ca/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131705v1/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
> 
>   
>   [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
>   [Intel XE#804]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/804
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1001-0a8fdcee5ce9a43e8411ea096c7361f8ec7829ca -> xe-pw-131705v1
> 
>   IGT_7786: 1e4a3cd0a4bb3419fb70ed3e01259485b056dcfd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1001-0a8fdcee5ce9a43e8411ea096c7361f8ec7829ca: 0a8fdcee5ce9a43e8411ea096c7361f8ec7829ca
>   xe-pw-131705v1: 131705v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131705v1/index.html
> 
