Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01EACCA476
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 11:54:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E4310E43B;
	Mon, 13 Oct 2025 11:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z0o7NbZs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF5A10E43B
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 11:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760356488; x=1791892488;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=36jts368TPaLTauxTHVghyLvXH2ivsiSMM5qvh001aw=;
 b=Z0o7NbZs8C4xd1d/0ZYlMeVY7J7YAIksqZ/CCWi1oNxIFnuOxFfeIM7m
 Ix2ACuNm9uLe7Hr+9Z/Wo76fgMceCAPZ9BTMTXnECzG5UM0G+c986S3yQ
 kd+0jGGjmV1JusbHEibFDunPiRm134LlwoMiy72slW4Nct3RmQKtjTXdo
 qeRTM4+fEDPwrOelXThuaQpGvsMyTh2fUCIvhYwCM6w7yTTn5NXmdxS0e
 mLMBdh+youpN110x92VC1UonwWfu2H5zizjfiScbInGFSavWsFlu/RGGr
 ztt0Hr+/7b73JenW7j/2VTkG/TRgH+CDczJt9RIa1vskeT1hrCjGhrclb Q==;
X-CSE-ConnectionGUID: VOli8TheTvOnMylAolOCHQ==
X-CSE-MsgGUID: 0xuRBTqiRLaex3mSVHBH8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="87950922"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="87950922"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 04:54:48 -0700
X-CSE-ConnectionGUID: Hq4/EGXTSf2s1EY8C0rCUA==
X-CSE-MsgGUID: +op0xd5WQ8CFwbz0Tu5O5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="182341108"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 04:54:47 -0700
Date: Mon, 13 Oct 2025 13:54:44 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v10 26/34] drm/xe/vf: Replay GuC submission state on
 pause / unpause
Message-ID: <aOzohIkWY5eN6OXA@black.igk.intel.com>
References: <20251008214532.3442967-1-matthew.brost@intel.com>
 <20251008214532.3442967-27-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008214532.3442967-27-matthew.brost@intel.com>
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

On Wed, Oct 08, 2025 at 02:45:24PM -0700, Matthew Brost wrote:
> Fixup GuC submission pause / unpause functions to properly replay any
> possible state lost during VF post migration recovery.
> 
> v3:
>  - Add helpers for revert / replay (Tomasz)
>  - Add comment around WQ NOPs (Tomasz)
> v7:
>  - Only fixup / replay parallel queues once (Testing)
>  - Skip unpause step on queues created after resfix done (Testing)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

...

>  /**
>   * xe_guc_submit_pause - Stop further runs of submission tasks on given GuC.
>   * @guc: the &xe_guc struct instance whose scheduler is to be disabled
> @@ -2018,8 +2145,17 @@ void xe_guc_submit_pause(struct xe_guc *guc)
>  	struct xe_exec_queue *q;
>  	unsigned long index;
>  
> -	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> -		xe_sched_submission_stop_async(&q->guc->sched);
> +	xe_gt_assert(guc_to_gt(guc), vf_recovery(guc));

I'm trying to reuse this into GuC runtime PM flows[1] but hitting this
assert in runtime suspend path. I'm guessing because runtime PM flows are
not applicable for VFs, but any insight into how can I do this properly
without regressing?

[1] https://patchwork.freedesktop.org/series/154017/

Raag

> +
> +	mutex_lock(&guc->submission_state.lock);
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
> +		/* Prevent redundant attempts to stop parallel queues */
> +		if (q->guc->id != index)
> +			continue;
> +
> +		guc_exec_queue_pause(guc, q);
> +	}
> +	mutex_unlock(&guc->submission_state.lock);
>  }
