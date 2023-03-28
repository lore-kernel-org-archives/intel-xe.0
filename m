Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDEAC76196
	for <intel-xe@archiver.kernel.org>; Tue, 28 Mar 2023 20:48:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70B110E0CC;
	Tue, 28 Mar 2023 20:48:00 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9912F10E0CC
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Mar 2023 20:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680036478; x=1711572478;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=MnboJvZXccySv6LohFSCbE+EQv+cX6PDbCAkMjAMG0A=;
 b=FvvJ3aVlV+ZfsGWYl/099MqTXzB/59bpFKKl0Z5YZ9Qi0VDOsoABmSzZ
 BU26S1cWpHKtqytHEMsUQDu4xo9Q2bgUu+dQ1hCqYfDQVSBFBV/A0QsDj
 y2pIE9HLgutji5BR/jCvMDOki0NGD/5RLthdLopfL/n760tHv9Gn0gDxQ
 raBc9SVP8aE5MhzqU5uD1PopaMucO+yAg5Poa+OuPFRkdJBGL82xNtJct
 nrTY76gDE8xy1m/U30DXJBQeTpz7T1/T73LWgwm1IZ6xoaYcRcpqFPqrH
 pSXAy3926LfXgfgi6XjEfwzMJp4JIqHAyFQZxyzjKvpjFFtMqX1e9cn9o w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="368454133"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="368454133"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 13:47:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="807961282"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="807961282"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga004.jf.intel.com with ESMTP; 28 Mar 2023 13:47:56 -0700
Received: from [10.249.149.19] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.149.19])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 2D0D73494A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Mar 2023 21:47:56 +0100 (IST)
Message-ID: <761ee09f-4b67-aac6-5252-79160abcffa2@intel.com>
Date: Tue, 28 Mar 2023 22:47:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Content-Language: en-US
To: intel-xe@lists.freedesktop.org
References: <20230328195822.1941865-1-matthew.brost@intel.com>
 <20230328195822.1941865-2-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20230328195822.1941865-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Better error messages for
 xe_gt_record_default_lrcs
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



On 28.03.2023 21:58, Matthew Brost wrote:
> Add some error messages describing the problem when
> xe_gt_record_default_lrcs fails.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 6322e0689a9e..724ba2be5d3d 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -23,6 +23,7 @@
>  #include "xe_gt_sysfs.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_gt_topology.h"
> +#include "xe_guc_engine_types.h"
>  #include "xe_hw_fence.h"
>  #include "xe_irq.h"
>  #include "xe_lrc.h"
> @@ -257,30 +258,46 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
>  				     hwe, ENGINE_FLAG_WA);
>  		if (IS_ERR(e)) {
>  			err = PTR_ERR(e);
> +			drm_err(&xe->drm, "gt%d, hwe %d:%d, xe_engine_create,e failed=%d",
> +				gt->info.id, hwe->class, hwe->instance, err);

btw, there is pending series that would print GT%u for you

	#include "xe_gt_printk.h"

	xe_gt_err(gt, "hwe %d:%d, ...

[1] https://patchwork.freedesktop.org/series/115083/

