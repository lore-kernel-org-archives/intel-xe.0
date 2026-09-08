Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69F4C79FA1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 10:16:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9261510EAFE;
	Tue,  8 Sep 2026 10:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RAOs0xZD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A873710EB03
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 10:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788862588; x=1820398588;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ajAenlWVc5ryF18ug92SuHZMKhCjvb1oyQKQ6wAox6E=;
 b=RAOs0xZD8b7ObGkl3xleb+8gh1c8fGt9guiwVWNlN79FUjDqR/Bm15Id
 R+FFtbJFJiHHhASqUxQcPf1Fga3Vd0J8UGCL24oT7saUbPC9DTpVPO5Nj
 JXRgJqMzZnFSJCRFfxxqNE8sN5xrV9gkGcjRI6rahyeA9DtQjf2nyUL20
 RIzRhdcVSGcqqt89JdsDZkjQYs3/4Xq+5C0CT2r79emIrdx73+DvVamAJ
 n0N6kG+ZchY24O20wrp8Vkxi4jNhwf6HhBYWbmG3+aRfSdXnaJ4q9SRf7
 bhfHyMMNgS3VXkbhEjZ55vkO/vn98ysoy5Ce4BXegVQFTh7znI3b0YiPa g==;
X-CSE-ConnectionGUID: Y6kxgBAwQD6fWxlFKofUfg==
X-CSE-MsgGUID: wPu4/ERLTniZEk9E4Fe6xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93124255"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="93124255"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:16:28 -0700
X-CSE-ConnectionGUID: ai7FoxoZQWu/OSl9Exe4Hg==
X-CSE-MsgGUID: r16/vaTdT2CU8x9D+ecLaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="271465668"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 03:16:25 -0700
Date: Tue, 8 Sep 2026 12:16:21 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, michal.wajdeczko@intel.com,
 himal.prasad.ghimiray@intel.com, arvind.yadav@intel.com,
 syed.abdul.muqthyar.ahmed@intel.com, nitin.r.gote@intel.com
Subject: Re: [PATCH v3 02/12] drm/xe/cper: Retrieve the error counter record
 for CPER reporting
Message-ID: <ap_gdX1GeLLatl2H@black.igk.intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-16-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906172604.2215987-16-badal.nilawar@intel.com>
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

On Sun, Sep 06, 2026 at 10:56:07PM +0530, Badal Nilawar wrote:
> Retrieve error counter record required to build a CPER record when
> one not provided by the caller.
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_cper.c |  15 ++++++
>  drivers/gpu/drm/xe/xe_ras.c  | 100 ++++++++++++++++++++++-------------
>  drivers/gpu/drm/xe/xe_ras.h  |   3 ++
>  3 files changed, 80 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index e8017e3ee3a0..f04a91223a43 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -9,6 +9,8 @@
>  
>  #include "xe_cper.h"
>  #include "xe_device.h"
> +#include "xe_printk.h"
> +#include "xe_ras.h"
>  #include "xe_ras_types.h"
>  
>  /**
> @@ -26,6 +28,8 @@ void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sig
>  				 struct xe_ras_get_counter_response *response)
>  {
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	struct xe_ras_get_counter_response local_resp = {};
> +	struct xe_ras_get_counter_response *counter_response = response;
>  
>  	if (!xe)
>  		return;
> @@ -33,5 +37,16 @@ void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sig
>  	if ((int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START)
>  		return;
>  
> +	if (!counter || !xe_ras_counter_is_valid(xe, counter))

Why? Should we even be at this point without a valid counter?

> +		return;
> +
> +	if (!counter_response) {
> +		counter_response = &local_resp;
> +		if (xe_ras_get_counter_response(xe, counter, counter_response)) {

Dumb question, shouldn't the whole xe_emit_hardware_error_cper() be the
consequence of get_counter() and not the other way around?

Raag

> +			xe_err(xe, "[RAS]: CPER: failed to get counter, skipping record\n");
> +			return;
> +		}
> +	}
> +
>  	/* TODO */
>  }
