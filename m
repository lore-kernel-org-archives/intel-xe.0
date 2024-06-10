Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0331AC27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 13:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8607810E340;
	Mon, 10 Jun 2024 13:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L3upewMG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD0E10E340
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 13:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718024535; x=1749560535;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=k9DYOlEyXIGI48Dg+be8ZenaQsZ1TkSkIZcgls7Kve0=;
 b=L3upewMG4yLyCAUYvumei0JEJb0YlpmNFS8nJ9WWPte9EdU6KZOXbsh6
 kEgmc71s4CByyKhT4rHWCewgDhObOP6yGuxDKDMzF1dn2Rls2Zts18b35
 UnG8NAJdwVWPMab1VsUPEkCao5QDI4W3D6JBVzofW6hQB76BgGN7m9N26
 BaNQwYetjtRxLySO927fUCeC/C8AjOoTCzxbDpCN3ruiH82iQ1/NZf2gf
 q7T4Erb4SxpMsjSTH4H8jLChkkwGGRdtLNvB9yyPCWsRtzM++lRNSRJFR
 fu8UZnUp7l8QxgJ4izLmI4snz54sJcw2jEEJVvM5SIMa289yzTR+mM7Ku g==;
X-CSE-ConnectionGUID: s4TUQss7TBmMZtkaha4e2w==
X-CSE-MsgGUID: /JisuHClTnmtR6ceWZcuDw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="26094212"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="26094212"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 06:02:15 -0700
X-CSE-ConnectionGUID: w5+cUNq7SUi/ScHPKaCN4g==
X-CSE-MsgGUID: wOa0xmoER7uyEUZlJ8wZGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43495085"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.36.65])
 ([10.246.36.65])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 06:02:14 -0700
Message-ID: <ceb49b55-9bbf-45b3-ab0e-b79c928587b9@linux.intel.com>
Date: Mon, 10 Jun 2024 15:02:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc: Drop unused legacy GuC message ABI
 definitions
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20240610120411.1768-1-michal.wajdeczko@intel.com>
 <20240610120411.1768-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240610120411.1768-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 6/10/2024 2:04 PM, Michal Wajdeczko wrote:
> Those were copy-pasted from i915 code and never used in Xe driver.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>


> ---
>   drivers/gpu/drm/xe/abi/guc_messages_abi.h | 13 -------------
>   1 file changed, 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_messages_abi.h b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> index 534a39db7772..e32142e3fe41 100644
> --- a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
> @@ -220,17 +220,4 @@
>   #define GUC_HXG_RESPONSE_MSG_0_DATA0		GUC_HXG_MSG_0_AUX
>   #define GUC_HXG_RESPONSE_MSG_n_DATAn		GUC_HXG_MSG_n_PAYLOAD
>   
> -/* deprecated */
> -#define INTEL_GUC_MSG_TYPE_SHIFT	28
> -#define INTEL_GUC_MSG_TYPE_MASK		(0xF << INTEL_GUC_MSG_TYPE_SHIFT)
> -#define INTEL_GUC_MSG_DATA_SHIFT	16
> -#define INTEL_GUC_MSG_DATA_MASK		(0xFFF << INTEL_GUC_MSG_DATA_SHIFT)
> -#define INTEL_GUC_MSG_CODE_SHIFT	0
> -#define INTEL_GUC_MSG_CODE_MASK		(0xFFFF << INTEL_GUC_MSG_CODE_SHIFT)
> -
> -enum intel_guc_msg_type {
> -	INTEL_GUC_MSG_TYPE_REQUEST = 0x0,
> -	INTEL_GUC_MSG_TYPE_RESPONSE = 0xF,
> -};
> -
>   #endif
