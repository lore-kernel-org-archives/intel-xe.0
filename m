Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A60D17129
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 19:44:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF5010E592;
	Mon, 21 Oct 2024 19:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uy/5rb+r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFA810E58F
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 19:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729539839; x=1761075839;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=jlQwm/ZWZ/kPVIb5Low1Sn/j8xvC7p7Rf4qizvdGkPI=;
 b=Uy/5rb+rQEk3PSEHfESCORRlesTfyMIgpDGAfUxxdou2L1Lz0rvmZNqQ
 n4RfNZ5L3c5oJzES6PDH4oG42Q0MRF2Gz/LRS5utrMU2tAiQsfXWrONu8
 GGL+M8b4S/jMvSyvad3rJu4+CWBpd9l2nqxxo8XxuLl4e8G7Glh2urqB1
 +3NwSUaQDUFwUQ4/5Ufvcuazm/A4/iXoGeSwu2G1hcJY7Hcun9lErZLAg
 jerftUVmWw2OhEMwwE4pQTIasrH2rmFSsvu4OMJnMj14ymzz5nJftIGGv
 EVesadmnow+lC1QhFT92/hyvx9ZBXfZ1OWL7DfNpkG4NAGXDwGuBHOtdm w==;
X-CSE-ConnectionGUID: RB/9p+gISJSDfIVNL87v5Q==
X-CSE-MsgGUID: 9DbarBTPSBOpKbOMUFHq5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="28921413"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="28921413"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 12:43:59 -0700
X-CSE-ConnectionGUID: C0jlgcJWS16XK5YDlkWxCw==
X-CSE-MsgGUID: 70S9dpayRY25Nz72v9/JBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79708352"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa008.fm.intel.com with ESMTP; 21 Oct 2024 12:43:58 -0700
Received: from [10.245.97.255] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.97.255])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 830852FC7C;
 Mon, 21 Oct 2024 20:43:56 +0100 (IST)
Message-ID: <a4240e2a-65c4-4d32-89e9-12f342f46293@intel.com>
Date: Mon, 21 Oct 2024 21:43:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] drm/xe/guc: Prevent GuC register capture running
 on VF
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-xe@lists.freedesktop.org
References: <20241018224325.130754-1-zhanjun.dong@intel.com>
 <20241018224325.130754-2-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20241018224325.130754-2-zhanjun.dong@intel.com>
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



On 19.10.2024 00:43, Zhanjun Dong wrote:
> GuC based register capture is not supported by VF, thus prevent it
> running on VF.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_capture.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 41262bda20ed..5c0d9efaaab4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1590,6 +1590,9 @@ xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot
>  	u16 guc_id = 0;
>  	u32 lrca = 0;
>  
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
>  	new = guc_capture_get_prealloc_node(guc);
>  	if (!new)
>  		return;
> @@ -1756,7 +1759,7 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>  	devcoredump = &xe->devcoredump;
>  	devcore_snapshot = &devcoredump->snapshot;
>  
> -	if (!devcore_snapshot->matched_node)
> +	if (IS_SRIOV_VF(xe) || !devcore_snapshot->matched_node)
>  		return;

do we need to check for VF here? if we correctly skipped capture on VFs
then matched_node should be NULL, no?

>  
>  	xe_gt_assert(gt, snapshot->source <= XE_ENGINE_CAPTURE_SOURCE_GUC);
> @@ -1820,7 +1823,7 @@ xe_guc_capture_get_matching_and_lock(struct xe_sched_job *job)
>  		return NULL;
>  
>  	xe = gt_to_xe(q->gt);
> -	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe))
> +	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
>  		return NULL;
>  
>  	ss = &xe->devcoredump.snapshot;
> @@ -1876,6 +1879,9 @@ xe_engine_snapshot_capture_for_job(struct xe_sched_job *job)
>  	enum xe_hw_engine_id id;
>  	u32 adj_logical_mask = q->logical_mask;
>  
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
>  	for_each_hw_engine(hwe, q->gt, id) {
>  		if (hwe->class != q->hwe->class ||
>  		    !(BIT(hwe->logical_instance) & adj_logical_mask)) {
> @@ -1922,6 +1928,9 @@ void xe_guc_capture_put_matched_nodes(struct xe_guc *guc)
>  	struct xe_devcoredump *devcoredump = &xe->devcoredump;
>  	struct __guc_capture_parsed_output *n = devcoredump->snapshot.matched_node;
>  
> +	if (IS_SRIOV_VF(xe))
> +		return;

n (aka matched_node) should be NULL for VFs, no?

> +
>  	if (n) {
>  		guc_capture_remove_stale_matches_from_list(guc->capture, n);
>  		guc_capture_free_outlist_node(guc->capture, n);

