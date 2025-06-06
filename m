Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16722C5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 11:02:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC4710EA4D;
	Fri,  6 Jun 2025 11:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h/iQ6LCr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795AB10E2BD
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 11:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749207732; x=1780743732;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MCTlROZcKDBEu3kxhaYQWlMyzWs+bQRmdKiwppJB36k=;
 b=h/iQ6LCrsJQcge9xBUlUOQfjG7/bML7xSo9c7ctLRuNKmgBSQFQEb77F
 Hfj9SRUba3Ec/ZmoKxj+9DzzRVo6A3vxIGJWLnqqnQMpSjLRg3tLfw/OZ
 knOcK7snzq3T8tC9PbfQcpEEOcqSoVIjFRfCrD5Fh4Uti2ERCiDJP7zEw
 nIVCkQx/YuFWNdD5+2ak2CHWmg1vFd7UE0iaRlBmxYNL/OG4BizBeaX8r
 yTxNz8rRvicFIi89BS8rRFBw0qBYfqgQBk4rMT7uWLaTi6090k5KvTSA/
 FNbBf0wrrwVqaJom3OWzWI2NX7C0MkXtF4Y5glvardLKBXjSbwmhHU3hv w==;
X-CSE-ConnectionGUID: J50cPGSET/in3QfIA2V/IA==
X-CSE-MsgGUID: m7WyMwopTeeAv3sfbHRQ6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="68913676"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="68913676"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 04:02:08 -0700
X-CSE-ConnectionGUID: paMLDV53QmWcr/EP0wF9eQ==
X-CSE-MsgGUID: rrz48pMJR2Oz50WhIsA0eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="145693172"
Received: from kuha.fi.intel.com ([10.237.72.152])
 by orviesa006.jf.intel.com with SMTP; 06 Jun 2025 04:02:06 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Fri, 06 Jun 2025 14:02:04 +0300
Date: Fri, 6 Jun 2025 14:02:04 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com,
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com
Subject: Re: [PATCH] drm/xe/xe_i2c: Add support for i2c in survivability mode
Message-ID: <aELKrBOBaDRv4P3I@kuha.fi.intel.com>
References: <20250603170958.1580894-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603170958.1580894-1-riana.tauro@intel.com>
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

On Tue, Jun 03, 2025 at 10:39:58PM +0530, Riana Tauro wrote:
> Initialize i2c in survivability mode to allow firmware
> update of Add-In Management Controller (AMC) in survivability mode
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> 
> This depends on I2C series by Heikki on [1].
> [1] https://lore.kernel.org/intel-xe/20250530141744.3605983-1-heikki.krogerus@linux.intel.com/

Thanks Riana. I'll include this to my series in v2. This is now
avilable in my internal amc branch:

https://github.com/intel-sandbox/hkrogeru-linux/commit/83ead82b0adf307b28cc794e9567c3e622ab7daf

cheers,

>
>  drivers/gpu/drm/xe/xe_survivability_mode.c | 23 ++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 1f710b3fc599..3800cc855c22 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -14,6 +14,7 @@
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_heci_gsc.h"
> +#include "xe_i2c.h"
>  #include "xe_mmio.h"
>  #include "xe_pcode_api.h"
>  #include "xe_vsec.h"
> @@ -173,20 +174,26 @@ static int enable_survivability_mode(struct pci_dev *pdev)
>  	survivability->mode = true;
>  
>  	ret = xe_heci_gsc_init(xe);
> -	if (ret) {
> -		/*
> -		 * But if it fails, device can't enter survivability
> -		 * so move it back for correct error handling
> -		 */
> -		survivability->mode = false;
> -		return ret;
> -	}
> +	if (ret)
> +		goto err;
>  
>  	xe_vsec_init(xe);
>  
> +	ret = xe_i2c_probe(xe);
> +	if (ret)
> +		goto err;
> +
>  	dev_err(dev, "In Survivability Mode\n");
>  
>  	return 0;
> +
> +err:
> +	/*
> +	 * But if it fails, device can't enter survivability
> +	 * so move it back for correct error handling
> +	 */
> +	survivability->mode = false;
> +	return ret;
>  }
>  
>  /**
> -- 
> 2.47.1

-- 
heikki
