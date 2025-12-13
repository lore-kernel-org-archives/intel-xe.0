Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD39D59F7D
	for <intel-xe@archiver.kernel.org>; Sat, 13 Dec 2025 07:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D63510E0E3;
	Sat, 13 Dec 2025 07:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OFReW4PR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A54410E0E3
 for <intel-xe@lists.freedesktop.org>; Sat, 13 Dec 2025 07:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765612698; x=1797148698;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3dVRwVdcFtXj+eMfxrxDZc2YqXmrpr5oyaXFHSilNw0=;
 b=OFReW4PRip/ICpdel5NKwWpF1V/R+rdcnb/ZqCLg96eXmgt9X/ntH79r
 q6LfMUpugNu0DVpRhf9AeWfJ2UGjoAEJFtXxYJFP3/EEWqSYgqABp9DiR
 J01RUsf3TWPnCu8VhQ0mNLcrXAGlVjuMLx0n/VevOrmUAG7fc2RYkxBNT
 bY1VP6SpKk56oelGpNZ/psCo/B8o3BUtDkdSFT9twugMSwUoHnxI50InU
 FQwSisV5RZUk4lHGvJH1XTmxRHlITcM28ym8l3fPJxHYrT7ZuJbq+W4xM
 m9PZGIuU5QbCoHJMrwXsGgnJZgBPu90Mlx9z5rlRJLR0MNJTKQIQBOKJa Q==;
X-CSE-ConnectionGUID: YeDIMNZUSH+vXWfnkVTsjA==
X-CSE-MsgGUID: SpDJXvpZT0+BkbenUYksBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="79061339"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; d="scan'208";a="79061339"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 23:58:18 -0800
X-CSE-ConnectionGUID: w0E5NFPGSQGiXrfGyv5Mzw==
X-CSE-MsgGUID: Xu15EpJeQ86d8FCzAG8Gqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; d="scan'208";a="201455980"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 23:58:17 -0800
Date: Sat, 13 Dec 2025 08:58:14 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [RFC PATCH 3/3] drm/xe: Trigger queue cleanup if not in wedged
 mode 2
Message-ID: <aT0clhiMQQvMk02_@black.igk.intel.com>
References: <20251212233444.1717326-1-matthew.brost@intel.com>
 <20251212233444.1717326-4-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212233444.1717326-4-matthew.brost@intel.com>
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

On Fri, Dec 12, 2025 at 03:34:44PM -0800, Matthew Brost wrote:
> The intent of wedging a device is to allow queues to continue running
> only in wedged mode 2. In other modes, queues should initiate cleanup
> and signal all remaining fences. Fix xe_guc_submit_wedge to correctly
> clean up queues when wedge mode != 2.
> 
> Fixes: 7dbe8af13c18 ("drm/xe: Wedge the entire device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 31 ++++++++++++++++++------------
>  1 file changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 857375be9a84..1eef93d474f0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1277,6 +1277,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>   */
>  void xe_guc_submit_wedge(struct xe_guc *guc)
>  {
> +	struct xe_device *xe = guc_to_xe(guc);
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	struct xe_exec_queue *q;
>  	unsigned long index;
> @@ -1291,19 +1292,25 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
>  	if (!guc->submission_state.initialized)
>  		return;
>  
> -	err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
> -				       guc_submit_wedged_fini, guc);
> -	if (err) {
> -		xe_gt_err(gt, "Failed to register clean-up on wedged.mode=2; "
> -			  "Although device is wedged.\n");
> -		return;
> -	}
> +	if (xe->wedged.mode == 2) {
> +		err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
> +					       guc_submit_wedged_fini, guc);
> +		if (err) {
> +			xe_gt_err(gt, "Failed to register clean-up on wedged.mode=2; "
> +				  "Although device is wedged.\n");
> +			return;
> +		}
>  
> -	mutex_lock(&guc->submission_state.lock);
> -	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> -		if (xe_exec_queue_get_unless_zero(q))
> -			set_exec_queue_wedged(q);
> -	mutex_unlock(&guc->submission_state.lock);
> +		mutex_lock(&guc->submission_state.lock);
> +		xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +			if (xe_exec_queue_get_unless_zero(q))
> +				set_exec_queue_wedged(q);
> +		mutex_unlock(&guc->submission_state.lock);
> +	} else {
> +		/* Forcefully kill any remaining exec queues, signal fences */
> +		xe_guc_submit_stop(guc);
> +		xe_guc_submit_pause_abort(guc);

This is basically the prerequisite[1] as we decided at the time, but
perhaps I failed to notice it. I'm wondering if we should also redirect
page faults to dummy page as per prerequisites section?

[1] https://lore.kernel.org/dri-devel/20250204070528.1919158-2-raag.jadav@intel.com/

Raag
