Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F9AC3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 17:43:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24AA010E135;
	Mon,  8 Jul 2024 17:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OVJwc3F3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063A010E135
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 17:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720460600; x=1751996600;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9/7k81ZTzMAHN+LEfpeOIDJnGTM69duNlt4viRY2rCk=;
 b=OVJwc3F3IOJNXdecdW6h1NhCzq7qM2pnzAJHpDTJ6j0o4wuSoV5BFK+6
 ZG7TWTLlbRSRaS5SZ8B2f2bF1yKx3zEOP6VP+Nr1BIfUBt1ZJnqtj1eoA
 5Fk7GOTTWO+htbiIDGfGgMIX5fTOrk7S7tHCIIhYLZV6L5ug/tz/4RhVs
 a8RawKfdcS6wCxNQZDCYeF4M6ZILDdpNYElXnjAM4VkKPeA8BW3LA4/Ov
 1Fj95KMFoRxAqIQITTwUXGL18xHvU0DeWbiORlnDU36xDGIoUfN62YleB
 TeAbHqZdJHgtQ73jeINcFBcPaYPJ58+EVI98a8s3gIGcJU1moPQAIHTN3 w==;
X-CSE-ConnectionGUID: STRNGHbaRGeq1FybHyqDMg==
X-CSE-MsgGUID: 5gwcTw12Ra6UbTZWpPyc1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="35117546"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="35117546"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 10:43:20 -0700
X-CSE-ConnectionGUID: j+BEAk+tQCSs2VTeJdd4qg==
X-CSE-MsgGUID: Wp4ceuLRSE6e5NdWmkF5Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="52386290"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 08 Jul 2024 10:43:18 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 735DA2878B;
 Mon,  8 Jul 2024 18:43:17 +0100 (IST)
Message-ID: <709d30e5-d456-43bf-8058-ba40dd4db4e6@intel.com>
Date: Mon, 8 Jul 2024 19:43:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/gt: Remove double include
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>, kernel test robot <lkp@intel.com>
References: <20240708173301.1543871-1-lucas.demarchi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240708173301.1543871-1-lucas.demarchi@intel.com>
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



On 08.07.2024 19:33, Lucas De Marchi wrote:
> The header generated/xe_wa_oob.h is included twice. Remove one.
> 
> Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202407052122.AzuWSPuo-lkp@intel.com/
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index ce8994b808fe..b04e47186f5b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -9,7 +9,6 @@
>  
>  #include <drm/drm_managed.h>
>  #include <drm/xe_drm.h>
> -#include <generated/xe_wa_oob.h>
>  
>  #include <generated/xe_wa_oob.h>
>  
