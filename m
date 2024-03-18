Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DB4C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 18:12:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A93110F35A;
	Mon, 18 Mar 2024 18:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OCActmiW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506A410F35A
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 18:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710785568; x=1742321568;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Cd1N6ShQ+u5r0goZrHa7QU08vGzYJCHBXnintPfGo3M=;
 b=OCActmiWNiwFH2WaWqMPqxwTXxGUdPyd7+5Geod8CZnRd6IjeTlfAsOt
 gzak/ZsNr6ACLza7VBYXS2+3YFy1POKyyAqdhDEj+VWD2+cOZ45y14EPO
 w5O1+IsclU6x3lbhhecK/7dfkd6WAAebZcFjdcTSWAwUohrcSUFxfBS3i
 wDl9q/MbkArwK0ani8gB4a83eE02xPyMzfxgS7AX3WWcFkkIYm/4eJIKZ
 C7fYBC+hG+OqtLKrMM2psVZtfshE63pzYr0cKuAGose7Qa+gsYW2hqMZ8
 cZMX2zO0TqLP9QYWpanoIjxMuoGd/kdj7uh6SjAfrtd5dVHfoTlBC55PY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="31053092"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="31053092"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 11:12:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="18280655"
Received: from unknown (HELO [10.245.245.16]) ([10.245.245.16])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 11:12:46 -0700
Message-ID: <8f2a95fa-2acc-46ba-8618-c7e784f69d25@intel.com>
Date: Mon, 18 Mar 2024 18:12:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Add dbg messages on the suspend resume
 functions.
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com
References: <20240318180141.267458-1-rodrigo.vivi@intel.com>
 <20240318180141.267458-2-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240318180141.267458-2-rodrigo.vivi@intel.com>
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

On 18/03/2024 18:01, Rodrigo Vivi wrote:
> In case of the suspend/resume flow getting locked up we
> can get reports with some useful hints on where it might
> get locked and if that has failed.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Makes sense. What about maybe also adding that to the rpm versions? 
Those can also be fun, and so would be useful to get hints when inside 
the callbacks.

> ---
>   drivers/gpu/drm/xe/xe_pm.c | 22 +++++++++++++++++-----
>   1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 9fbb6f6c598a..cc650a92c2fc 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -80,13 +80,15 @@ int xe_pm_suspend(struct xe_device *xe)
>   	u8 id;
>   	int err;
>   
> +	drm_dbg(&xe->drm, "Suspending device\n");
> +
>   	for_each_gt(gt, xe, id)
>   		xe_gt_suspend_prepare(gt);
>   
>   	/* FIXME: Super racey... */
>   	err = xe_bo_evict_all(xe);
>   	if (err)
> -		return err;
> +		goto err;
>   
>   	xe_display_pm_suspend(xe);
>   
> @@ -94,7 +96,7 @@ int xe_pm_suspend(struct xe_device *xe)
>   		err = xe_gt_suspend(gt);
>   		if (err) {
>   			xe_display_pm_resume(xe);
> -			return err;
> +			goto err;
>   		}
>   	}
>   
> @@ -102,7 +104,11 @@ int xe_pm_suspend(struct xe_device *xe)
>   
>   	xe_display_pm_suspend_late(xe);
>   
> +	drm_dbg(&xe->drm, "Device suspended\n");
>   	return 0;
> +err:
> +	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
> +	return err;
>   }
>   
>   /**
> @@ -118,13 +124,15 @@ int xe_pm_resume(struct xe_device *xe)
>   	u8 id;
>   	int err;
>   
> +	drm_dbg(&xe->drm, "Resuming device\n");
> +
>   	for_each_tile(tile, xe, id)
>   		xe_wa_apply_tile_workarounds(tile);
>   
>   	for_each_gt(gt, xe, id) {
>   		err = xe_pcode_init(gt);
>   		if (err)
> -			return err;
> +			goto err;
>   	}
>   
>   	xe_display_pm_resume_early(xe);
> @@ -135,7 +143,7 @@ int xe_pm_resume(struct xe_device *xe)
>   	 */
>   	err = xe_bo_restore_kernel(xe);
>   	if (err)
> -		return err;
> +		goto err;
>   
>   	xe_irq_resume(xe);
>   
> @@ -146,9 +154,13 @@ int xe_pm_resume(struct xe_device *xe)
>   
>   	err = xe_bo_restore_user(xe);
>   	if (err)
> -		return err;
> +		goto err;
>   
> +	drm_dbg(&xe->drm, "Device resumed\n");
>   	return 0;
> +err:
> +	drm_dbg(&xe->drm, "Device resume failed %d\n", err);
> +	return err;
>   }
>   
>   static bool xe_pm_pci_d3cold_capable(struct xe_device *xe)
