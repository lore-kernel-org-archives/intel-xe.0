Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3507CD216B0
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 14:26:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C2A10E06C;
	Tue, 15 Oct 2024 14:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xmg+/1eW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA7A10E06C
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 14:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729002390; x=1760538390;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hSFfrYbzqjqEMkPVO8LdEP83NTBDpLeI2LbyLd2b018=;
 b=Xmg+/1eWTysK2Le9RTLn+Exu4IXeTPM6QPi+JFuoMwnkqxkhehH+lxEa
 vLJiUjhxgkG1dxokl2GjuP5wkWQaCPT31E+ytR7qpyJ4yBtym/8GpM+nF
 WmZ02PGxCXZMU5B0Bzy5Ik5UigsNjkR4F9DGQRRqX4M0KNRL0Pebxu21Q
 hxmeu+VskGa5GGRiLLD7sWM+I3nYXxHgNoM8SaQM+H4EinsE0pibrMYLg
 161/w3aDLvuBZlchVTCENaqtllGtxlHNicwFzKOuDMEqZfd1RE0a0crvz
 YFfn44bIvScOrCCKpqC6jMF9zMFvjh82WQ/V6EV2AvgAawv0fSH7UlKYC Q==;
X-CSE-ConnectionGUID: mYlo9v6eS9KLtjQOPXXAXQ==
X-CSE-MsgGUID: t7J5gVUvTJ6rOHnbjtcE+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39033930"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="39033930"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 07:26:30 -0700
X-CSE-ConnectionGUID: bf1zoH1bTL+YscLziHXIUA==
X-CSE-MsgGUID: QYOeTuTsShaPOJa5mJfbYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="77795674"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.177.104])
 ([10.245.177.104])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 07:26:28 -0700
Message-ID: <63786fa6-5bca-4213-8d76-df8be374cd55@linux.intel.com>
Date: Tue, 15 Oct 2024 16:26:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 11/26] drm/xe/devcoredump: Update handling of
 xe_force_wake_get return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-12-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241014075601.2324382-12-himal.prasad.ghimiray@intel.com>
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


On 10/14/2024 9:55 AM, Himal Prasad Ghimiray wrote:
> xe_force_wake_get() now returns the reference count-incremented domain
> mask. If it fails for individual domains, the return value will always
> be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
> in the event of failure. Use helper xe_force_wake_ref_has_domain to
> verify all domains are initialized or not. Update the return handling of
> xe_force_wake_get() to reflect this behavior, and ensure that the return
> value is passed as input to xe_force_wake_put().
>
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
>
> v5
> - return unsigned int for xe_force_wake_get()
>
> v6
> - use helper xe_force_wake_ref_has_domain()
>
> v7
> - Fix commit message
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 99842a35dbf0..8b0ea77661b2 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -158,13 +158,15 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
>  {
>  	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
>  	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
> +	unsigned int fw_ref;
>  
>  	/* keep going if fw fails as we still want to save the memory and SW data */
> -	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
> +	fw_ref = xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>  		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
>  	xe_vm_snapshot_capture_delayed(ss->vm);
>  	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
> -	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
> +	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
>  
>  	/* Calculate devcoredump size */
>  	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
> @@ -236,8 +238,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>  	u32 width_mask = (0x1 << q->width) - 1;
>  	const char *process_name = "no process";
>  
> -	int i;
> +	unsigned int fw_ref;
>  	bool cookie;
> +	int i;
>  
>  	ss->snapshot_time = ktime_get_real();
>  	ss->boot_time = ktime_get_boottime();
> @@ -261,8 +264,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>  	}
>  
>  	/* keep going if fw fails as we still want to save the memory and SW data */
> -	if (xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL))
> -		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
> +	fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
>  
>  	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
>  	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
> @@ -274,7 +276,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>  
>  	queue_work(system_unbound_wq, &ss->work);
>  
> -	xe_force_wake_put(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
> +	xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
>  	dma_fence_end_signalling(cookie);
>  }
>  
