Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF98C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 08:12:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF43B10EA22;
	Fri,  1 Mar 2024 08:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PtU9Qoi+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3E810EA22
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Mar 2024 08:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709280772; x=1740816772;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ER7k7gKM+u1j7NbVKoFwEANdfk9rEQ3o4cND2BPPzKE=;
 b=PtU9Qoi+W+ngkMAAcUNnaW/PMPIlH22+RBi55WB9KZqWXLzkGZjnAfDD
 KSzbHfaRKeL9pm01H0q/X5Ghd4TSm9CpYWkLZIjJFiYl/LrUSODlqLSYw
 ijGPWPoqvFMNvJ4RhwjKpxz/aUa9IWzdqq6rh0tDCzxDFacilXBn7L0xg
 R95DJAYw41rZIGZyToBGxbPrnH/U8pM/oAs7DjTZZQiLCPn4Lhn1kBYKQ
 MhB60c5RTLc+gz7/sTSLWybzrSH75rdtpRpsZ6Z5D3t4nryfELAd9e/Vn
 iWUw6jL0lvF1hrA/CgNpQFnpEuXqF6Woe3j0VqZTDmdgfvVt8mLLgzTSU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3977674"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="3977674"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 00:12:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="8269165"
Received: from mkuoppal-desk.fi.intel.com (HELO localhost) ([10.237.72.193])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 00:12:49 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Fix ref counting leak on page fault
In-Reply-To: <20240301041036.238471-1-matthew.brost@intel.com>
References: <20240301041036.238471-1-matthew.brost@intel.com>
Date: Fri, 01 Mar 2024 10:07:10 +0200
Message-ID: <87v866tlxt.fsf@mkuoppal-desk>
MIME-Version: 1.0
Content-Type: text/plain
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

Matthew Brost <matthew.brost@intel.com> writes:

> If a page fault occurs on VM not in fault a ref can be leaked. Fix this.
>
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index c26e4fcca01e..73c535193a98 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -146,10 +146,12 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	/* ASID to VM */
>  	mutex_lock(&xe->usm.lock);
>  	vm = xa_load(&xe->usm.asid_to_vm, pf->asid);
> -	if (vm)
> +	if (vm && xe_vm_in_fault_mode(vm))
>  		xe_vm_get(vm);
> +	else
> +		vm = NULL;
>  	mutex_unlock(&xe->usm.lock);
> -	if (!vm || !xe_vm_in_fault_mode(vm))
> +	if (!vm)
>  		return -EINVAL;
>  
>  retry_userptr:
> -- 
> 2.34.1
