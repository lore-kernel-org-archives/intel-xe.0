Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F428D36138
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 20:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88DF10E605;
	Tue,  5 Nov 2024 20:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZHWTpGF2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9CBA10E605
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 20:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730837629; x=1762373629;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SXXirK+ceJqHxcWlLugh15YTAfOz12Cg3TgyGF4O6hg=;
 b=ZHWTpGF2m8TlUKLHPWDSGPVys76sVh73pNtQ8qg3kJnYvsdQQ3YBfx9P
 4H0kXYRwvojjbFKb9r2Zo7Q+yLNe/H34Bkb2PacV5N1nsGLWeOUWj+88b
 G8Ny2VEKfX3c4d8vLZo2di5uPFvlxr/Bv5SKJb9jo3qAtgNLvVCj7j60a
 QnkJWpfj4FSWeFiw/WMKqJ7rEUiMXljLd2LNR9BL0JjQoSFxZSoatzJnk
 KkQPW7WVaQA3RsOJs4lMf0xXurEsQyln1P9BUSz1XFdI1tplUTdSyKyav
 2hyu9HgsKiqgnMwxqntJgCInWiMOn55I6XJyp1CqZhtF7khC7AI2SasZo g==;
X-CSE-ConnectionGUID: nz4xIJNfTwm9hAMIESuLCw==
X-CSE-MsgGUID: tkny7sOeRJGM2C89bCtsEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="33449731"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="33449731"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 12:13:49 -0800
X-CSE-ConnectionGUID: 4mPspi3NTUKigYyv0HABCg==
X-CSE-MsgGUID: 0ljtI9svT/KH6R33LnBGXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="84976708"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa008.jf.intel.com with ESMTP; 05 Nov 2024 12:13:47 -0800
Received: from [10.245.120.199] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.120.199])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id D80A6312D4;
 Tue,  5 Nov 2024 20:13:44 +0000 (GMT)
Message-ID: <fc79227d-1ce3-48bf-926c-7a0c8f30bc47@intel.com>
Date: Tue, 5 Nov 2024 21:13:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe/guc: Don't treat GuC generic CAT error as
 protocol error
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20241105173032.1947-1-michal.wajdeczko@intel.com>
 <20241105173032.1947-5-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20241105173032.1947-5-michal.wajdeczko@intel.com>
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



On 05.11.2024 18:30, Michal Wajdeczko wrote:
> GuC uses GUC_ID_MAX if it can not map the CAT fault to any PF/VF
> context. We shouldn't treat that as G2H protocol error that would
> justify a GT reset, as it may happen due to some VF activity.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 147000fd1177..696f8884040a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2023,6 +2023,15 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  
>  	guc_id = msg[0];
>  
> +	if (guc_id == GUC_ID_MAX) {

oops, this is actually wrong as GUC_ID_MAX is defined as 65535 which is
16bit while we should look for 32b value 0xffffffff

> +		/*
> +		 * GuC uses GUC_ID_MAX if it can not map the CAT fault to any PF/VF
> +		 * context. Only PF will be notified about that.
> +		 */
> +		xe_gt_err_ratelimited(gt, "Memory CAT error reported by GuC!\n");
> +		return 0;
> +	}
> +
>  	q = g2h_exec_queue_lookup(guc, guc_id);
>  	if (unlikely(!q))
>  		return -EPROTO;

