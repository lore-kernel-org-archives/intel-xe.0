Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C69C52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 08:58:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E6310E21B;
	Mon, 19 Aug 2024 08:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IptROzSR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA0B10E21A
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 08:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724057899; x=1755593899;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=TiEYBMK5MdHRhjt497IUPRTBFLJjwfNiRkO3v7f6hJY=;
 b=IptROzSRMIUYzA7EijL4AwBlTbBBsZhZHSlmfpGqAhyqPeByQfjFFDeY
 sgfqK1aHqJCXd0Eg4PX+WlhTCHJbQPhUvectnecryr6lyVoi2s8XEW7TS
 oEqQgu+wvE0bsanpnlp1NG7MtDN9Ibygy5Cx7caI+lgBGOvts8oCphPjH
 A4I5Sb+JDpthrHwrMUCst5BlZgatLvrUqN2rG82kQ2YI1XHTP2YxSiMk7
 u2vHOGyGxj0svXj00JeHkgXah1LQVmfd6k7b0Simwqe0NOtZ44u/eDpg8
 LAue5hKP7K1TOPFS0po95JXvSJQegpBMtQ/gPy/vidk4tjmWFRYzfwq6h g==;
X-CSE-ConnectionGUID: Z6weiXDRSgue9ZE2/0ANww==
X-CSE-MsgGUID: BAzA+0UMRwO2Tk0ADQmHgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="33671730"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="33671730"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 01:58:19 -0700
X-CSE-ConnectionGUID: HpgXvtE2TWGzQMNhzeibHQ==
X-CSE-MsgGUID: tCVXifd3TPufV6bG0Pyu2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="64696409"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.70])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 01:58:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: apoorva.singh@intel.com, intel-xe@lists.freedesktop.org
Cc: Apoorva Singh <apoorva.singh@intel.com>
Subject: Re: [PATCH] drm/xe: Add NULL check before deferencing pointer
In-Reply-To: <20240819071557.964326-1-apoorva.singh@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240819071557.964326-1-apoorva.singh@intel.com>
Date: Mon, 19 Aug 2024 11:58:13 +0300
Message-ID: <87v7zw6g9m.fsf@intel.com>
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

On Mon, 19 Aug 2024, apoorva.singh@intel.com wrote:
> From: Apoorva Singh <apoorva.singh@intel.com>

*dereferencing typo in the subject. You could also be more specific,
that subject could refer to anything anywhere in the driver. If you find
another one, what's its subject going to be?

> Add NULL check before deferencing of lrc->bo in
> xe_lrc_snapshot_capture().
>
> Free the dynamically allocated memory for snapshot
> to avoid memory leak

We've seen this patch or its variants many times now. Where's the
changelog? What's going on?

> Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 32 ++++++++++++++++++--------------
>  1 file changed, 18 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 974a9cd8c379..e31d9bc64ff6 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1652,20 +1652,24 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>  	if (lrc->bo && lrc->bo->vm)
>  		xe_vm_get(lrc->bo->vm);
>  
> -	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
> -	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
> -	snapshot->head = xe_lrc_ring_head(lrc);
> -	snapshot->tail.internal = lrc->ring.tail;
> -	snapshot->tail.memory = xe_lrc_ring_tail(lrc);
> -	snapshot->start_seqno = xe_lrc_start_seqno(lrc);
> -	snapshot->seqno = xe_lrc_seqno(lrc);
> -	snapshot->lrc_bo = xe_bo_get(lrc->bo);
> -	snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
> -	snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset;
> -	snapshot->lrc_snapshot = NULL;
> -	snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
> -	snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
> -	return snapshot;
> +	if (lrc->bo) {

Please handle error cases in if branches with early returns, and do the
happy day scenario in the top indentation level.


BR,
Jani.


> +		snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
> +		snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
> +		snapshot->head = xe_lrc_ring_head(lrc);
> +		snapshot->tail.internal = lrc->ring.tail;
> +		snapshot->tail.memory = xe_lrc_ring_tail(lrc);
> +		snapshot->start_seqno = xe_lrc_start_seqno(lrc);
> +		snapshot->seqno = xe_lrc_seqno(lrc);
> +		snapshot->lrc_bo = xe_bo_get(lrc->bo);
> +		snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
> +		snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset;
> +		snapshot->lrc_snapshot = NULL;
> +		snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
> +		snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
> +		return snapshot;
> +	}
> +	kfree(snapshot);
> +	return NULL;
>  }
>  
>  void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)

-- 
Jani Nikula, Intel
