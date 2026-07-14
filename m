Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9A8C43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 10:03:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F8810ECB1;
	Tue, 14 Jul 2026 10:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dnXg5rCD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3FF10ECB1
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 10:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784023404; x=1815559404;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TPCzyOp6HAuo4mFluZ54UXDJaANk5kC564bGocRxI3E=;
 b=dnXg5rCDCJuAPjniSX6FbNUpm1W9dSEj+ekeG+U0dEd95OkYQeApHkwn
 u7uNOSbhFzPX8kitM8NaUazeGzPMz7I9gEM+849mY7P7cXwQoiAv39Ibl
 gZtTV56CnmL+WHFYu03WK0BhEMDnOYWUZZWw/z2jb4TFAK2ef3eY2Kxyb
 CXEFYlTvgCfBOY+isnE/YpXnjHJDt7xSx/v3kwe6Pq3znp0ilO/qR+JY6
 o3DZ+DuprXTI+10DDfndgvRDwXsTTWHwRhXlY84oOfK4ld9t080ibp5Xt
 j+VwidRiNYnv2+afB679qZS2DSpu5CdWL2d1qekymN1zC0FxmdF/BbBQ7 w==;
X-CSE-ConnectionGUID: OgTwxKz7RLen6rYZefB3zg==
X-CSE-MsgGUID: oSzas66KT5uPktMTnpxfPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="83763630"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="83763630"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 03:03:23 -0700
X-CSE-ConnectionGUID: KaKm1VBCStyR2+e3+Y1x9A==
X-CSE-MsgGUID: 6FTTdkmmQGyMmiq22BRKrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="259387587"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.251])
 ([10.245.245.251])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 03:03:22 -0700
Message-ID: <8a2d611f-7220-4360-8a7e-087b67c78fec@intel.com>
Date: Tue, 14 Jul 2026 11:03:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vf: Fix VF CCS attach/detach race with in-flight
 BO moves
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20260714062440.3421225-1-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260714062440.3421225-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 14/07/2026 07:24, Matthew Brost wrote:
> xe_bo_move() attaches VF CCS read/write batch buffers (BBs) to a BO
> after it transitions NULL/SYSTEM -> TT, and detaches them after it
> transitions TT -> SYSTEM. Both operations were done synchronously on
> the CPU immediately after building the move's copy/clear fence,
> without waiting for that fence to signal. This creates two races with
> VF migration:
> 
> - Attach happens too late relative to the copy job it is meant to
>    protect. If the copy job is submitted before the CCS BBs are
>    attached, a VF migration event that pauses execution mid-copy can
>    observe partially copied CCS metadata without the attach state
>    needed to correctly save/restore it.
> 
> - Detach happens too early relative to the copy job that moves data
>    out of TT. The CCS BBs are torn down right after the copy fence is
>    obtained, while the actual blit may still be in flight. A VF
>    migration event that pauses execution mid-copy can then race the
>    save/restore path against the still-running blit, and the CCS BBs
>    it would need to make sense of the paused state have already been
>    removed.
> 
> Fix both races:
> 
> - Move the attach call to before the copy/clear job is submitted, so
>    the CCS BBs are already registered by the time the copy runs. On
>    attach failure, unwind and bail out of the move. xe_migrate_ccs_rw_copy()
>    now takes the destination resource explicitly, since bo->ttm.resource
>    is not updated to the new resource until after the move commits.
> 
> - Detach only after explicitly waiting for the copy fence to signal,
>    instead of tearing down the CCS BBs immediately after obtaining it.
> 
> While here, also fix xe_sriov_vf_ccs_attach_bo() to properly unwind and
> propagate errors: the per-context loop previously never broke out on
> error, silently discarding earlier failures. Unwind by clearing each
> attached context directly via xe_migrate_ccs_rw_copy_clear() instead of
> reusing xe_sriov_vf_ccs_detach_bo(), which requires both contexts to be
> attached before it will clean up either one.
> 
> Fixes: 864690cf4dd6 ("drm/xe/vf: Attach and detach CCS copy commands with BO")
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Assisted-by: GitHub_Copilot:claude-sonnet-5
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
