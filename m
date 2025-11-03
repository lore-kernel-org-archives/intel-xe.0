Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22E7CCFA05
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 11:12:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B108D10E1D3;
	Mon,  3 Nov 2025 11:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EemQ6xRM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694F110E1C0
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 11:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762168377; x=1793704377;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=A4oOnrSmJ2bdDfMepof+84AHPfuS1ZdXihEu92gjkPk=;
 b=EemQ6xRMQj+Lz9qk01nyKt6uTmYe8ZFhWCz9CP1D7I0bSfeAjJ0k57ir
 j34puIwN07wW+vq0Cbw9GbSupv27+gN5x0/jTgPSqcQ1xpxDMm0aU8Pzz
 seZdtTzz6aHGBVQvsHF+7azYeXfHvyVcg4v/M88iAyNX0UAJjKecqRcVj
 s1+rwGEiHI0yCdaVAHZp73Y44cuBppgGVHVgGzB4uJZ0eMY9eSWVMrFXF
 AJSKp8c0uj0DH7ecfjPfcsPkbPKESKW1UhCvvhabfTEz/E6Ap0aKAQL2S
 DzJvvwm7/Fnyp4DEr34K2YwxIJ8fTbKk5kQ38V7beNoPQaM6AJiX5VF40 w==;
X-CSE-ConnectionGUID: 5PZbE2WTR6Gd0P7Zyuledg==
X-CSE-MsgGUID: GmnkHRTkTMOFQrFfKjbbCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="75688190"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="75688190"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 03:12:57 -0800
X-CSE-ConnectionGUID: srWU7gfYRAejw09xdoFuTw==
X-CSE-MsgGUID: V/PaRtbzRbWkMccOwBeErA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="192001947"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.245.37])
 ([10.245.245.37])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 03:12:55 -0800
Message-ID: <a506ffa0-f42c-4359-983a-196aef531e38@linux.intel.com>
Date: Mon, 3 Nov 2025 12:12:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Do clean shutdown also when using flr
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20251031122312.1836534-1-jouni.hogander@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20251031122312.1836534-1-jouni.hogander@intel.com>
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

Hey,

Yeah, initially it was ok to just do a FLR since it gave no issues compared to cleaning up nicely,
and allowed us to shutdown even if it was the driver that crashed. I guess it's better to shut down
cleanly before doing a FLR instead now that bugs were found.

Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>

Den 2025-10-31 kl. 13:23, skrev Jouni Högander:
> Currently Xe driver is triggering flr without any clean-up on
> shutdown. This is causing random warnings from pending related works as the
> underlying hardware is reset in the middle of their execution.
> 
> Fix this by performing clean shutdown also when using flr.
> 
> Fixes: 501d799a47e2 ("drm/xe: Wire up device shutdown handler")
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 86d5960476af6..6156be15affba 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -988,21 +988,21 @@ void xe_device_remove(struct xe_device *xe)
>  
>  void xe_device_shutdown(struct xe_device *xe)
>  {
> +	struct xe_gt *gt;
> +	u8 id;
> +
>  	drm_dbg(&xe->drm, "Shutting down device\n");
>  
> -	if (xe_driver_flr_disabled(xe)) {
> -		struct xe_gt *gt;
> -		u8 id;
> +	xe_display_pm_shutdown(xe);
>  
> -		xe_display_pm_shutdown(xe);
> +	xe_irq_suspend(xe);
>  
> -		xe_irq_suspend(xe);
> +	for_each_gt(gt, xe, id)
> +		xe_gt_shutdown(gt);
>  
> -		for_each_gt(gt, xe, id)
> -			xe_gt_shutdown(gt);
> +	xe_display_pm_shutdown_late(xe);
>  
> -		xe_display_pm_shutdown_late(xe);
> -	} else {
> +	if (!xe_driver_flr_disabled(xe)) {
>  		/* BOOM! */
>  		__xe_driver_flr(xe);
>  	}

