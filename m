Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D25C3DA4A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 11:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5057C10E41C;
	Wed, 14 Aug 2024 11:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lgXCDspY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936AF10E41C
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 11:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723634484; x=1755170484;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=WSLHcqXoOHB0sWSkAXt/bxIDEYjbB5wuR2kjRfNh7J4=;
 b=lgXCDspYbi56zPKTq95a6IlCZJodSbP0JLZjTpQSwJVpS5aaya18p29K
 zXqj6KsHk42lBykrMK/2MKxByS2mHiIoFgGGBUWVkC4yxSpbKaMY30Gzo
 zaL4EcM9YlnXMWb2mA7jNDIruUcZqRug7GhnNQQEflXCuLMiX7iI3Ydp0
 wvKvBpY1EyfHU/xOjR2lfMK855uzVN29EhLWk+GEfAJVQl2bPj97E7/ur
 /G99Y5DVgeRvC1FVsLWP9qcWQLomuk6MxWmHnhIHi29aYJ4aWzB0pJV8E
 qK/82ktitQ6XsI2Zsq5fGzk82U/FtYehLH7P0b8IEx7Jo9FiTsqoNcT0m w==;
X-CSE-ConnectionGUID: EKTIqMR5SlSctXpxi6T36g==
X-CSE-MsgGUID: kC180bW1QgaM0JxbxjemeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21713736"
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="21713736"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 04:21:24 -0700
X-CSE-ConnectionGUID: YpDy9O1DRMqh58DMfk35+w==
X-CSE-MsgGUID: D4i1NgbbSfquOTaHwvQj8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; d="scan'208";a="59096930"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 04:21:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: apoorva.singh@intel.com, intel-xe@lists.freedesktop.org
Cc: Apoorva Singh <apoorva.singh@intel.com>
Subject: Re: [PATCH] drm/xe: Add NULL check before deferencing pointer
In-Reply-To: <20240814101750.857665-1-apoorva.singh@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240814101750.857665-1-apoorva.singh@intel.com>
Date: Wed, 14 Aug 2024 14:21:18 +0300
Message-ID: <871q2rz6xd.fsf@intel.com>
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

On Wed, 14 Aug 2024, apoorva.singh@intel.com wrote:
> From: Apoorva Singh <apoorva.singh@intel.com>
>
> - Add NULL check before deferencing of lrc->bo in
>   xe_lrc_snapshot_capture()
>
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

Primarily, see Nirmoy's comment. But changes like this kfree here need
to be mentioned in the commit message.

BR,
Jani.


> +	return NULL;
>  }
>  
>  void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)

-- 
Jani Nikula, Intel
