Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5559C531F9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 12:28:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2B110E041;
	Fri, 24 Jul 2026 12:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aogTSlWB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993FC10E041
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 12:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784896102; x=1816432102;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+iG6QjVY0qpPjt/A/gWwCMPgVgXcC1AP1DgXJB51AI4=;
 b=aogTSlWBiY9Jix+9Xx+oyyIoei3qSK4fxFkZ1MKne+ciYsa95VTQITk4
 ot/sxpuSecbYb+EApxGFsyvk9T3ADu/WcsmRbnAwW0ooTSijX+jy/RUux
 SR4hBDKwJt/oy9eLCA0RChoE2l8s3f/6uKCRBhBpL5+Tg5jFvSkqlz42M
 kwHwncc+0UxAQUSnlnofSG3AP1fzXnIICCGspHxeZNCkO7gCezpVYUMxw
 ZFM6FgyfJVqdObUwrgcALrQjkyfNlSJTFsOae119ie88wZ/lWCbL/arbL
 MRQt8GBTeVAcySXQHwq8aW21GXe5tSNIypUvW2vL6e+liOSWER2ifPPhB w==;
X-CSE-ConnectionGUID: DoJbkpt5R8q/clRG+LyKaw==
X-CSE-MsgGUID: wsE7cRZzTJipKUtdgOET8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89451018"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="89451018"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 05:28:22 -0700
X-CSE-ConnectionGUID: w3VXsI6VTuCqngTgg5+YnQ==
X-CSE-MsgGUID: IJnIXcevToyjHkQWtuDW8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="296920549"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.191.14])
 ([10.247.191.14])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 05:28:21 -0700
Message-ID: <16c11f76-f382-490a-8618-2aa0c02130d0@linux.intel.com>
Date: Fri, 24 Jul 2026 17:58:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/19] drm/xe: Report 'probe blocked' error using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Yoni Levitt <yoni.levitt@intel.com>
References: <20260723203754.3782-1-michal.wajdeczko@intel.com>
 <20260723203754.3782-13-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20260723203754.3782-13-michal.wajdeczko@intel.com>
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


On 24-07-2026 02:07, Michal Wajdeczko wrote:
> Report 'probe blocked' error using xe_log_err() helper.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 36d62927b969..a9ada8e4f081 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -25,6 +25,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
> +#include "xe_log.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
>  #include "xe_pci_error.h"
> @@ -1172,8 +1173,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	}
>  
>  	if (id_blocked(pdev->device)) {
> -		dev_info(&pdev->dev, "Probe blocked for device [%04x:%04x].\n",
> -			 pdev->vendor, pdev->device);
> +		xe_log_err(pdev, PROBE, -ENODEV, "Probe

if this is due to force_probe passed by user shall not even be
considered an error.

Thanks,
Aravind.
>  blocked for device [%04x:%04x]\n",
> +			   pdev->vendor, pdev->device);
>  		return -ENODEV;
>  	}
>  
