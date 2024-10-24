Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5353CE8E90
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 16:08:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995BC10E2A5;
	Thu, 24 Oct 2024 16:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PSS1G2HF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE6710E2A5
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 16:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729786126; x=1761322126;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CD672zf/icrP84JkBNyIXVtqmmmy5ltkgqScRUqyZ0I=;
 b=PSS1G2HF0tC4oMg42t+a6BYSzXKsu1XpWNQ7xk0tyGK/7ym7G3DfcR21
 qJoiPHYNRDOH35k0dQVXTnVtTOzsrxt7HgGdUsKLZofj3QGA1avdHz3LH
 FHos2GpBW6YDrHgMAW9fUT7tTUFzviSz0oWPvpz58rKBcn9aKp7bYbQyP
 5AXhDHYMVTlFfNDosae+b/lDCZ0kiFD7Zq7eOEWYt/DOvai2Zt0ha4+iM
 6uz6q4+y6olmZ/jaWfn6m1pw9X9d7iZ4r1FEZrgKRgBNgYs4gEbrZmb8t
 ITxTOznAYVtdoFaHYRFbRoPQK2AsS66e/8oyRJqw7ToVCJAsex8/Mi9Rm Q==;
X-CSE-ConnectionGUID: H1Onzz53QoSQgVyW7txDdQ==
X-CSE-MsgGUID: dakwcgsDQQOdqFzRUCgV0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="29645489"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="29645489"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 09:08:46 -0700
X-CSE-ConnectionGUID: qiLFrGcfQ5ar0L2Kw9ovZw==
X-CSE-MsgGUID: 8ERYUp9QSXyVhWJRUXaTWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="118098418"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.128.192])
 ([10.245.128.192])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 09:08:42 -0700
Message-ID: <91c492bd-5001-41fe-b151-fe78be86a9c4@linux.intel.com>
Date: Thu, 24 Oct 2024 18:08:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/ufence: Flush xe ordered_wq in case of ufence
 timeout
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>
References: <20241024151815.929142-1-nirmoy.das@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241024151815.929142-1-nirmoy.das@intel.com>
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


On 10/24/2024 5:18 PM, Nirmoy Das wrote:
> Flush xe ordered_wq in case of ufence timeout which is observed
> on LNL and that points to the recent scheduling issue with E-cores.
>
> This is similar to the recent fix:
> commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
> response timeout") and should be removed once there is E core
> scheduling fix.
>
> v2: Add platform check(Himal)
>     s/__flush_workqueue/flush_workqueue(Jani)
>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: <stable@vger.kernel.org> # v6.11+
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2754
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wait_user_fence.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index f5deb81eba01..78a0ad3c78fe 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -13,6 +13,7 @@
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_macros.h"
> +#include "compat-i915-headers/i915_drv.h"

Sorry sent too soon. This is bit out of place. I will sort it and resend after sometime to accumulate reviews.


>  #include "xe_exec_queue.h"
>  
>  static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
> @@ -155,6 +156,19 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  		}
>  
>  		if (!timeout) {
> +			if (IS_LUNARLAKE(xe)) {
> +				/*
> +				 * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h
> +				 * worker in case of g2h response timeout")
> +				 *
> +				 * TODO: Drop this change once workqueue scheduling delay issue is
> +				 * fixed on LNL Hybrid CPU.
> +				 */
> +				flush_workqueue(xe->ordered_wq);
> +				err = do_compare(addr, args->value, args->mask, args->op);
> +				if (err <= 0)
> +					break;
> +			}
>  			err = -ETIME;
>  			break;
>  		}
