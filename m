Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2211ED4337D
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 16:56:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D766E10E096;
	Thu,  7 Nov 2024 16:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D7O1zYYC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDD710E096
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 16:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730998574; x=1762534574;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oJwHGKSQyPnMDUVMygTiBtaiV77YxSQ55cSVh+aWxn0=;
 b=D7O1zYYCjmjd3WhylYwUD3HroyzhnTvPeOjOQ0iy181tgc1ygApFuhhv
 Wojw4PZaRzE/0XA24c6o+shkFhz2oJ0kHCRMCH77ZT7SUJHpZi6fAT8BQ
 4PU4PtVROra73kndskf2g85X+R/eLiK1qPdDeOmvAqLfzdUwnmuSvrcSU
 YdgUryqZ1Ma+thdIM5zCVtZJiFknk8Dl0McneE37z3NcwAsRLYtlSI3uV
 7sp9jMzQBqe7z4nRlMREu65sahAeOHhChoBPNkuwPOlZoBTWIRUwTC8IQ
 ntWUdIBNoNfsPLq9kr7Di+5TiQE2qDblM1jGp8icRvOGxmL54rzw6I2Lb g==;
X-CSE-ConnectionGUID: 9itzCLTJSyWM8LaGOuLTPQ==
X-CSE-MsgGUID: 8u4vfptaRfaLE759evafjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41962866"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41962866"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 08:56:13 -0800
X-CSE-ConnectionGUID: AoeHWRA9Rriz7R4gDQvUjw==
X-CSE-MsgGUID: Oia4foOtSsuCXZsQe18glQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="85148345"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 07 Nov 2024 08:56:11 -0800
Received: from [10.246.2.138] (mwajdecz-MOBL.ger.corp.intel.com [10.246.2.138])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id B528A28763;
 Thu,  7 Nov 2024 16:56:10 +0000 (GMT)
Message-ID: <48da6fac-2693-4fad-871c-d990f2da0bc6@intel.com>
Date: Thu, 7 Nov 2024 17:56:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] drm/xe/guc: Do not assert CTB state while sending
 MMIO
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
References: <20241107151357.1623733-1-tomasz.lis@intel.com>
 <20241107151357.1623733-2-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20241107151357.1623733-2-tomasz.lis@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 07.11.2024 16:13, Tomasz Lis wrote:
> During VF post-migration recovery, MMIO communication channel to GuC
> is used, despite CTB channel being enabled. This behavior is rooted
> in the save-restore architecture specification.
> 
> Therefore, a VF driver cannot assert that CTB is disabled while sending
> MMIO messages to GuC. Such assertion needs to be PF only, or be removed.

+ Matt

> 
> This patch simply removes the assertion.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Suggested-by: Michał Wajdeczko <michal.wajdeczko@intel.com>

in fact I was already trying to fix that [1], but I had to wait until we
have some S/R code in place, so I'm fine with it as-is

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

[1] https://patchwork.freedesktop.org/series/128721/#rev1

> ---
>  drivers/gpu/drm/xe/xe_guc.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 7224593c9ce9..df1ba94cf4ca 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -945,7 +945,6 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  
>  	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
>  
> -	xe_assert(xe, !xe_guc_ct_enabled(&guc->ct));
>  	xe_assert(xe, len);
>  	xe_assert(xe, len <= VF_SW_FLAG_COUNT);
>  	xe_assert(xe, len <= MED_VF_SW_FLAG_COUNT);

