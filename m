Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD5EC54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 12:51:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3082210E9A7;
	Thu, 21 Mar 2024 12:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NRbnojwV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A9110E9A7
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 12:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711025508; x=1742561508;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=o0iYjs8RDcX6UyX8oKARJ6teEwlIXOMCOyTUzjV26c8=;
 b=NRbnojwViiRyPoc09i8UNVA59E3IKXQyTFy9S6rmOaUSZ0QuH5W3iXBX
 EpSjgDYEIfdljpC9z+q5Ja7MrS/0ppyhNM3q2v4O+IOChmVF9zFRubvXp
 8GXksFNmzg/P5qwYJS0IHD6PLZRLJaDeRkKE7b8eKEG2nH0CN2aFZ9t5E
 UFk/dWnNU9ew6Z26nH2o3mMoCYjCvYqUN/SwBD0w/Sd7Xf7IpZXj0kC/n
 KiN7aN7gRh2mehMh5CAtMk8S2A1j41aVTPOWdsPRYK6nrQtNKPVato2E+
 izJbFi9fmOFBPb9dPO1cz/nO8rHQPoTr4Z6tCf0lin6EzE3DsC04/1oit Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="31447608"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="31447608"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 05:51:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="45492089"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 05:51:45 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, Zhanjun Dong
 <zhanjun.dong@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe : Fix mixed enum type warning
In-Reply-To: <20240321113210.3311749-1-himal.prasad.ghimiray@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240321113210.3311749-1-himal.prasad.ghimiray@intel.com>
Date: Thu, 21 Mar 2024 14:51:41 +0200
Message-ID: <877chvn3xe.fsf@intel.com>
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

On Thu, 21 Mar 2024, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> wrote:
> The issue arises from comparing an unsigned integer with a macro-defined
> value. To address this, cast the macro-defined value to the same data
> type as the other operand.

I don't think the explanations are convincing, as this has nothing to do
with enums. And in general just adding casts to ignore warnings is not
the way to go.

BR,
Jani.

>
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
> Coverity Reports "Parse warning (PW.MIXED_ENUM_TYPE)
> 1. mixed_enum_type enumerated type mixed with another type"
>
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 866bbd26ba3f..027cb60c60c1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -311,7 +311,7 @@ void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 *group,
>  {
>  	int dss_per_grp = dss_per_group(gt);
>  
> -	xe_gt_assert(gt, dss < XE_MAX_DSS_FUSE_BITS);
> +	xe_gt_assert(gt, dss < (unsigned int)XE_MAX_DSS_FUSE_BITS);
>  
>  	*group = dss / dss_per_grp;
>  	*instance = dss % dss_per_grp;

-- 
Jani Nikula, Intel
