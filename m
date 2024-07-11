Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602BEC3DA45
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 20:09:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B7610EB8B;
	Thu, 11 Jul 2024 20:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EnlfyEwy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F320810EB89
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 20:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720728545; x=1752264545;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=gcyMJM2rVa9Rl5Eg2juFaSz/eZnOFAcdc9To3NgvdVk=;
 b=EnlfyEwyESL812STHSlYlncwktJFuj8ntZ5eVM3MpcvJRJogD/WOr8BY
 dUpNYc5pQgzdWh7ixljB2kQqfsGc2cF/91JZInGffXfg9MPpqJoLlDHWb
 VqMdDNEbUXJf219R2px1aIvuitg4vq7RRamfiPYPIU44GedqRChmdPndB
 xXn8K95blmFhjZ3DHrwV2Gha4umuBRHd9AE9XcrJC7xRRiY/Y7YVK7F8T
 4QJiFWTybodc9owlcupFvzQagU8vTo4W+NafSZH9bj9KvmIDG8EfIqeo/
 fP5uugvYxXSYbeB616nRlsTxlbW2PAk/Jmi6ToS4btF4TTCC8D06fhpoh Q==;
X-CSE-ConnectionGUID: NG29/YPfTgWmG9/dmdWRtw==
X-CSE-MsgGUID: 5+6dy7W7RGafvfqHYK5UFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="17759815"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="17759815"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 13:09:04 -0700
X-CSE-ConnectionGUID: Zu6h3JT3T8qqC5ml61t2ZA==
X-CSE-MsgGUID: fgOigWM5QUCDxCrJWsVzSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="53065753"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 11 Jul 2024 13:09:03 -0700
Received: from [10.246.49.75] (mwajdecz-MOBL.ger.corp.intel.com [10.246.49.75])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 3627B2879A;
 Thu, 11 Jul 2024 21:09:01 +0100 (IST)
Message-ID: <09a7eb4c-23fa-481e-ba44-8d3a127e13a1@intel.com>
Date: Thu, 11 Jul 2024 22:09:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] drm/xe: Introduce xe_ggtt_print_holes
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240711171155.173717-1-rodrigo.vivi@intel.com>
 <20240711171155.173717-9-rodrigo.vivi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240711171155.173717-9-rodrigo.vivi@intel.com>
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



On 11.07.2024 19:11, Rodrigo Vivi wrote:
> Introduce a new xe_ggtt_print_holes helper that attends the SRIOV
> demand and finishes the goal of limiting drm_mm access to xe_ggtt.
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c               | 40 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ggtt.h               |  1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 25 +-------------
>  3 files changed, 42 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index dbaf1ce87fb4..5b51753fe1ba 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -682,3 +682,43 @@ int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
>  	mutex_unlock(&ggtt->lock);
>  	return err;
>  }
> +
> +/**
> + * xe_ggtt_print_holes - Print holes
> + * @ggtt: the &xe_ggtt to be inspected
> + * @alignment: min alignment
> + * @p: the &drm_printer
> + *
> + * Print GGTT ranges that are available and return total size available.
> + *
> + * Return: Total available size.

I would rather prefer to lost that info than make the 'print' function
return some real value (which may be immediately stale as it will be out
of mutex)

> + */
> +u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p)
> +{
> +	const struct drm_mm *mm = &ggtt->mm;
> +	const struct drm_mm_node *entry;
> +	u64 hole_min_start = xe_wopcm_size(tile_to_xe(ggtt->tile));
> +	u64 hole_start, hole_end, hole_size;
> +	u64 total;
> +	char buf[10];
> +
> +	mutex_lock(&ggtt->lock);
> +
> +	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
> +		hole_start = max(hole_start, hole_min_start);
> +		hole_start = ALIGN(hole_start, alignment);
> +		hole_end = ALIGN_DOWN(hole_end, alignment);
> +		if (hole_start >= hole_end)
> +			continue;
> +		hole_size = hole_end - hole_start;
> +		total += hole_size;
> +
> +		string_get_size(hole_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> +		drm_printf(p, "range:\t%#llx-%#llx\t(%s)\n",
> +			   hole_start, hole_end - 1, buf);
> +	}

or we can print that 'total' here, as it is still kind of related since
it is "sum of all holes" ;)

> +
> +	mutex_unlock(&ggtt->lock);
> +
> +	return total;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 31060fe7644b..67ae5f1602a3 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -32,6 +32,7 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
>  u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
>  
>  int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);

hmm, maybe xe_ggtt_dump() from prev patch should be xe_ggtt_print() ?

> +u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
>  
>  #ifdef CONFIG_PCI_IOV
>  void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct xe_ggtt_node *node, u16 vfid);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 1d17c34fe5a4..d0995680f53f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -6,9 +6,6 @@
>  #include <linux/string_choices.h>
>  #include <linux/wordpart.h>
>  
> -/* FIXME: remove this after encapsulating all drm_mm_node access into xe_ggtt */
> -#include <drm/drm_mm.h>
> -
>  #include "abi/guc_actions_sriov_abi.h"
>  #include "abi/guc_klvs_abi.h"
>  
> @@ -2096,11 +2093,7 @@ int xe_gt_sriov_pf_config_print_dbs(struct xe_gt *gt, struct drm_printer *p)
>  int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
> -	const struct drm_mm *mm = &ggtt->mm;
> -	const struct drm_mm_node *entry;
>  	u64 alignment = pf_get_ggtt_alignment(gt);
> -	u64 hole_min_start = xe_wopcm_size(gt_to_xe(gt));
> -	u64 hole_start, hole_end, hole_size;
>  	u64 spare, avail, total = 0;
>  	char buf[10];
>  
> @@ -2109,24 +2102,8 @@ int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_prin
>  	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
>  
>  	spare = pf_get_spare_ggtt(gt);
> +	total = xe_ggtt_print_holes(ggtt, alignment, p);
>  
> -	mutex_lock(&ggtt->lock);
> -
> -	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
> -		hole_start = max(hole_start, hole_min_start);
> -		hole_start = ALIGN(hole_start, alignment);
> -		hole_end = ALIGN_DOWN(hole_end, alignment);
> -		if (hole_start >= hole_end)
> -			continue;
> -		hole_size = hole_end - hole_start;
> -		total += hole_size;
> -
> -		string_get_size(hole_size, 1, STRING_UNITS_2, buf, sizeof(buf));
> -		drm_printf(p, "range:\t%#llx-%#llx\t(%s)\n",
> -			   hole_start, hole_end - 1, buf);
> -	}
> -
> -	mutex_unlock(&ggtt->lock);
>  	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>  
>  	string_get_size(total, 1, STRING_UNITS_2, buf, sizeof(buf));
