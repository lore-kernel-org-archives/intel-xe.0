Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C638CF9C71
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 14:07:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFB310E833;
	Wed, 25 Sep 2024 14:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P72TpPqP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B9910E833
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 14:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727273273; x=1758809273;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+zo7ld7Wwg6FJ+/pJsIAnlcXnkIYcbTE0Jhe/YFGtnU=;
 b=P72TpPqPCaS0D33oq7OI206nx+0yYVjkFOoKFGykMm7ZtFZDiVqMDxLh
 8CN1QOKptOdxqm613JP0/vml7P4ZiiPFEsuQWYridRBz5Rr2HIn49i7Oz
 pH1XVA1QmBp2fPTl7n0Mrn8z5rSnFDX97TxLoQmdHiLhS1R6NHEan5JLm
 OJzOZ6aXgY/usLTEqmBTsf43wapmiighVcvaOUq9EP+lj3/9qZKZvoXBc
 7vk9cCokE+8/gTJt1Gzr3mNo/7IV+ThApz8F7oEqoUDIvU00sm9qh7F8h
 Rx7MbAeG45n/TnGIrzQ7vwYTrQhNFJjjOEKM8n2VwbeMzKaRlzyWrJ9Qn A==;
X-CSE-ConnectionGUID: 6RNejVmCRDSoayMSzy8vrA==
X-CSE-MsgGUID: PSXoABSSSteyltigUcH+lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="48855800"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="48855800"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 07:07:44 -0700
X-CSE-ConnectionGUID: YeedXW9oQBWxlzlAbOKucQ==
X-CSE-MsgGUID: AI8egGcDRwGUcErosNixfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="102555529"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa002.jf.intel.com with ESMTP; 25 Sep 2024 07:07:43 -0700
Received: from [10.246.19.248] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.19.248])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 96D32284FE;
 Wed, 25 Sep 2024 15:07:40 +0100 (IST)
Message-ID: <c63e6af4-1e71-43dc-b0c3-9179da40a657@intel.com>
Date: Wed, 25 Sep 2024 16:07:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/23] drm/xe: Change return type to void for
 xe_force_wake_put
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
 <20240924121641.1045763-24-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240924121641.1045763-24-himal.prasad.ghimiray@intel.com>
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



On 24.09.2024 14:16, Himal Prasad Ghimiray wrote:
> There is no need to return an error from xe_force_wake_put(), as a
> failure implicitly indicates that the domain failed to sleep.
> 
> v3
> - Move kernel-doc to this patch (Badal)
> 
> v5
> - change parameter to unsigned int in xe_force_wake_put()
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 20 ++++++++++++++++----
>  drivers/gpu/drm/xe/xe_force_wake.h |  4 ++--
>  2 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index d2eb367da7c1..c2c55d3de36f 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -11,6 +11,7 @@
>  #include "regs/xe_reg_defs.h"
>  #include "xe_gt.h"
>  #include "xe_gt_printk.h"
> +#include "xe_macros.h"

this include is likely not needed

>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
>  
> @@ -196,8 +197,20 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>  	return ret;
>  }
>  
> -int xe_force_wake_put(struct xe_force_wake *fw,
> -		      unsigned int domains_mask)
> +/**
> + * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
> + * @fw: Pointer to the force wake structure
> + * @domains_mask: forcewake domain mask to put reference
> + *
> + * This function reduces the reference counts for specified domain mask. If
> + * refcount for any of the specified domain reaches 0, it puts the domain to sleep
> + * and waits for acknowledgment for domain to sleep within specified timeout.

nit: if this timeout is hardcoded maybe mention or refer it?

> + * Ensure this function is always called with return of xe_force_wake_get() as
> + * @domains_mask.
> + * Warns in case of timeout of ack from domain.
> + */
> +void xe_force_wake_put(struct xe_force_wake *fw,
> +		       unsigned int domains_mask)

nit: no need to wrap, your kernel-doc is much wider

>  {
>  	struct xe_gt *gt = fw->gt;
>  	struct xe_force_wake_domain *domain;
> @@ -210,7 +223,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>  	 * in error path of individual domains.
>  	 */
>  	if (!domains_mask)
> -		return 0;
> +		return;
>  
>  	spin_lock_irqsave(&fw->lock, flags);
>  	for_each_fw_domain_masked(domain, domains_mask, fw, tmp) {
> @@ -229,5 +242,4 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>  
>  	xe_gt_WARN(gt, ret, "domain%s %#x failed to acknowledgment sleep\n",
>  		   str_plural(hweight_long(ret)), ret);
> -	return ret;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index 0b676462c97b..a79c98ed6d2f 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -17,8 +17,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>  				struct xe_force_wake *fw);
>  unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>  					    enum xe_force_wake_domains domains);
> -int xe_force_wake_put(struct xe_force_wake *fw,
> -		      unsigned int domains_mask);
> +void xe_force_wake_put(struct xe_force_wake *fw,
> +		       unsigned int domains_mask);

no need to wrap the line

>  
>  static inline int
>  xe_force_wake_ref(struct xe_force_wake *fw,

