Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB80CC87FCE
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 09:49:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947F810E119;
	Mon, 28 Jul 2025 09:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V5YR8uuh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF61010E119
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 09:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753696140; x=1785232140;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=eU3RK2WQ+QfelN0zg6nvlBWpyYcm7pmTNVkjx93WI2g=;
 b=V5YR8uuh1pr+KYgn0nEkicfzj69GFd8ZqCmbgLaNwGm2nCtvn5B6MRT3
 huA3rx2DfAAcFfcJwewo+7qgoq9vuG9Z3CXnRtw78A4YZdiPCtvaLRNWw
 x6iYexVOS9tF9I52H+o4uZGeJ6y8v7uf9lY6dt1j675avWF+lb9nVSH5r
 RjL3m9JNRWwXwz1/FXhkz5eDq0SkT1RqKGGAbbhYEHjbrkErbd7S+xOE/
 l79EMbPBE7EUOI5cLOkpk0HD3n+E4YQue8yUqlJrmtWLkqP9nC4S5i3TC
 c/HHlLnEq42j+4o4Jnf+VdPS+3wbDGy4NNr1jk+lJBqhPsShimHubdmKx g==;
X-CSE-ConnectionGUID: Ai23uFgWRX+QUt1A1L9Xlg==
X-CSE-MsgGUID: wQvllYENQcyGsqq1hwGQzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="59759245"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="59759245"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 02:48:59 -0700
X-CSE-ConnectionGUID: N2TToYxJRVmXvsNtZVxqRQ==
X-CSE-MsgGUID: wltcMR6uSTK75v7GW+YdGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="161616706"
Received: from opintica-mobl1 (HELO [10.245.245.241]) ([10.245.245.241])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 02:48:59 -0700
Message-ID: <7bf5bc1c-a61a-4a49-ab48-945d0ae555c7@intel.com>
Date: Mon, 28 Jul 2025 10:48:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_pat: Adding the graphics version for BMG-G31
To: nakshtra.goyal@intel.com, intel-xe@lists.freedesktop.org
Cc: dwarakanath.ramadeva@intel.com
References: <20250728081641.1178859-1-nakshtra.goyal@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250728081641.1178859-1-nakshtra.goyal@intel.com>
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

On 28/07/2025 09:16, nakshtra.goyal@intel.com wrote:
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
> 
> Adding the corresponding graphics version for bmg_g31 i.e 20.02
> Bspec 68090
> 
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pat.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 2e7cb99ae87a..a0872f84dc29 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -385,7 +385,7 @@ void xe_pat_init_early(struct xe_device *xe)
>   			xe->pat.pat_pta = &xe2_pat_pta;
>   
>   		/* Wa_16023588340. XXX: Should use XE_WA */
> -		if (GRAPHICS_VERx100(xe) == 2001)
> +		if (GRAPHICS_VERx100(xe) == 2001 || GRAPHICS_VERx100(xe) == 2002)

This reason we need this is tied to Wa_16023588340, since CLOS3 is 
hard-wired to controlling the behaviour of the caching of VRAM from host 
side when that WA is turned on, and so we don't want UMD interacting 
with CLOS3 on that platform. But AFAICT we don't currently enable this 
WA on BMG 2002, see xe_wa_oob.rules, so not sure why we need this 
change? Also I'm fairly sure that the WA is not meant to be needed on 
BMG g31. Do you have some more information?

>   			xe->pat.n_entries = 28; /* Disable CLOS3 */
>   		else
>   			xe->pat.n_entries = ARRAY_SIZE(xe2_pat_table);

