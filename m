Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537D6CCA470
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 07:26:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1390310E3BB;
	Mon,  6 Oct 2025 07:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KRYpQ3TS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD01A10E3B9
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 07:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759735615; x=1791271615;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vcHQbNCrjlDfjT/24938hpRJKwifXPbYf3XZbtb8/dI=;
 b=KRYpQ3TS2szIt/ZSNjOxXUb8NR6qNFVUOl3sM5OGZA6REPI99cPG9foQ
 D39hjNk1spZ4GP0hgh4x+vFKaJdr5tslw1ZA9EZDhVM1teKHhjF0+4vA0
 WNg+aFeciYQAXca18hMeAZTQRdH4MaDjauHSuWQPTzGvDNACu4wlsQeZj
 dcq2srHItKF1taji5VjRZ+zq91//E5m7HRLRAvN9WsZ9U1CVN88wAFTnv
 GS3WBXVGL3ueaNL07EKf4rO6ONQ42QFCyTiIalO+d/ISmYxL/mfOFxJCc
 fvyqqm0JTnXdyoCn0xwMwuanYX0F4iDChZMhIGwvZiwoG2ypWRLXSaTH7 A==;
X-CSE-ConnectionGUID: 01bqS35GRZi1StL+IzLpfA==
X-CSE-MsgGUID: PXU+BB05SZGjBK/tIEVJLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="62073489"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="62073489"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 00:26:55 -0700
X-CSE-ConnectionGUID: MD5nlAbYSBi1zTF3TMnJzQ==
X-CSE-MsgGUID: GaPVSwQtTBKtSscAKPxOHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="183843264"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.162])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 00:26:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>, intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: Re: [PATCH] drm/xe: Fix typos and improve kernel-doc comments in xe_gt
In-Reply-To: <20251003234850.2481736-2-shuicheng.lin@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251003234850.2481736-2-shuicheng.lin@intel.com>
Date: Mon, 06 Oct 2025 10:26:49 +0300
Message-ID: <56f7abc63ff246b71462046f066554b2eeecf403@intel.com>
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

On Fri, 03 Oct 2025, Shuicheng Lin <shuicheng.lin@intel.com> wrote:
> Correct several spelling and grammar issues in xe_gt struct
> documentation to improve readability:
>
> - Use proper kernel-doc comment opener (`/**`).
> - Fix "to not" -> "do not".
> - Fix "mmigrations" -> "migrations".
> - Fix "Multiple queues exists" -> "Multiple queues exist".
> - Fix "are be processed" -> "to be processed".
> - Fix "have being processed" -> "have been processed".
>
> These changes are purely cosmetic and do not affect functionality.
>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_types.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 66158105aca5..8fb4ea1d90f5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -50,7 +50,7 @@ struct xe_mmio_range {
>  	u32 end;
>  };
>  
> -/*
> +/**

enum xe_steering_type comments has no kernel-doc formatting, so it
shouldn't have /** either.

>   * The hardware has multiple kinds of multicast register ranges that need
>   * special register steering (and future platforms are expected to add
>   * additional types).
> @@ -202,14 +202,14 @@ struct xe_gt {
>  		/**
>  		 * @usm.bb_pool: Pool from which batchbuffers, for USM operations
>  		 * (e.g. migrations, fixing page tables), are allocated.
> -		 * Dedicated pool needed so USM operations to not get blocked
> +		 * Dedicated pool needed so USM operations do not get blocked
>  		 * behind any user operations which may have resulted in a
>  		 * fault.
>  		 */
>  		struct xe_sa_manager *bb_pool;
>  		/**
>  		 * @usm.reserved_bcs_instance: reserved BCS instance used for USM
> -		 * operations (e.g. mmigrations, fixing page tables)
> +		 * operations (e.g. migrations, fixing page tables)
>  		 */
>  		u16 reserved_bcs_instance;
>  		/** @usm.pf_wq: page fault work queue, unbound, high priority */
> @@ -220,8 +220,8 @@ struct xe_gt {
>  		 * @usm.pf_queue: Page fault queue used to sync faults so faults can
>  		 * be processed not under the GuC CT lock. The queue is sized so
>  		 * it can sync all possible faults (1 per physical engine).
> -		 * Multiple queues exists for page faults from different VMs are
> -		 * be processed in parallel.
> +		 * Multiple queues exist for page faults from different VMs to be
> +		 * processed in parallel.
>  		 */
>  		struct pf_queue {
>  			/** @usm.pf_queue.gt: back pointer to GT */
> @@ -387,7 +387,7 @@ struct xe_gt {
>  		/**
>  		 * @wa_active.oob_initialized: mark oob as initialized to help
>  		 * detecting misuse of XE_GT_WA() - it can only be called on
> -		 * initialization after OOB WAs have being processed
> +		 * initialization after OOB WAs have been processed
>  		 */
>  		bool oob_initialized;
>  	} wa_active;

-- 
Jani Nikula, Intel
