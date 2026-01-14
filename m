Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DD5D31A0E
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 05:07:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C89610E39B;
	Wed, 14 Jan 2026 05:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YjTMkKJq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1779010E39B
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 05:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768367237; x=1799903237;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=S7rgekL8yn6LbeYUz2Upr0uWLQEUngN2ne9bmdfapwA=;
 b=YjTMkKJqUiXHMb2bZz54i1xBYn7RZDn0l8vej6I0nBAeNPTf3v0pR+ct
 7O2svcQgmjiwxFBR/DEQkp0TQhrN59f4mZ2sbAcYfU5CRcKQuKQ0CO2ro
 mL4pdW1p3tda6V3nC5jnuPfKLCBTOpuyxTkQyc1yNDH043HPXBE3jNL9H
 KTkTg4ReasEemffjoeioUyCMll+/IObyohcshH6TM4FG7ZD2JvGANxZKV
 o+9EceO77BaXPAogVzC/TaRLWfBJudI5kP2afVCULbgeIaJ8CbwKOf7V6
 cCyuih67RL8WI1Sxc1oaSr1CXkeTDEznET13eQGHUSihiHUe/+56tLx90 A==;
X-CSE-ConnectionGUID: ix3zfErOSCOUIj91nny+4w==
X-CSE-MsgGUID: lG141nvDTQCc+zOr5eie8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="68868636"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="68868636"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 21:07:17 -0800
X-CSE-ConnectionGUID: Sp1bvNjmTripZVHQkPwSjA==
X-CSE-MsgGUID: sIBGU0hLQMGyi/1elhturw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204597275"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 21:07:15 -0800
Date: Wed, 14 Jan 2026 06:07:12 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 25/79] drm/xe: Simplify header in xe_gt_throttle.c
Message-ID: <aWckgMZvDUB36rNo@black.igk.intel.com>
References: <20260113230315.3081153-81-matthew.d.roper@intel.com>
 <20260113230315.3081153-106-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113230315.3081153-106-matthew.d.roper@intel.com>
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

On Tue, Jan 13, 2026 at 03:03:30PM -0800, Matt Roper wrote:
> xe_gt_throttle.c doesn't use anything from xe_device.h; it only needs
> the corresponding 'types' header.  Replace the include accordingly.

Long awaited.

> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_throttle.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
> index 570358310e97..1e7e3a31aa69 100644
> --- a/drivers/gpu/drm/xe/xe_gt_throttle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
> @@ -6,7 +6,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include <regs/xe_gt_regs.h>
> -#include "xe_device.h"
> +#include "xe_device_types.h"
>  #include "xe_gt.h"
>  #include "xe_gt_sysfs.h"
>  #include "xe_gt_throttle.h"
> -- 
> 2.52.0
> 
