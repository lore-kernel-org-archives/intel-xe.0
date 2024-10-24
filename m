Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294F2CDDE69
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 09:42:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED85F10E8E7;
	Thu, 24 Oct 2024 09:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NZuB9IGR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8588410E8EC
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 09:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729762968; x=1761298968;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pp17VRPynLSY3DFtVrbhnNkdPDspg3ytaLU4JPrVbjQ=;
 b=NZuB9IGRTstJeGckN2+ddSiZ5U46u56s0RgkQiAjiF1kgxhhbGBIHO9o
 L2O40vyEEfesVavi05aBiGsYr953g9+MTiAr2X9mBoSatTU4wJQnYZeyt
 1jpqvWJEPva66rxIGnYCnDNgrVyIPg+yo1Whv9TIa6UMMaqS23lR4Gszp
 odj2wfPrmTFxHPoEhIg9om7XtA08ea9/MchTRAMMyw5W55/zrY7HPww92
 2kI1FLVP/S8Y0o3Y3Vm/CnzOfz1pTMa8Q3zv7bq1fupVi0nf415z4PK3V
 8MxHtEbsNuGhO8yd+PGOijIWVXErV33wuETRGq6P+TmQ6uCZx3OYUyOYh Q==;
X-CSE-ConnectionGUID: Y+/P21yvTQKd7zeGX7/J/A==
X-CSE-MsgGUID: uF8a6aIMQ/CmBvnMVamIgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33072466"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="33072466"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 02:42:48 -0700
X-CSE-ConnectionGUID: hmN1t3sgTf2ObjhzyAhpVw==
X-CSE-MsgGUID: MILEDQX6Q2Oxxgq7pTJTAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="80532785"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.151])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 02:42:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Matthew Auld <matthew.auld@intel.com>, John
 Harrison <John.C.Harrison@Intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe/ufence: Flush xe ordered_wq in case of ufence
 timeout
In-Reply-To: <20241023155817.3618388-1-nirmoy.das@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241023155817.3618388-1-nirmoy.das@intel.com>
Date: Thu, 24 Oct 2024 12:42:41 +0300
Message-ID: <87wmhxsupa.fsf@intel.com>
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

On Wed, 23 Oct 2024, Nirmoy Das <nirmoy.das@intel.com> wrote:
> Flush xe ordered_wq in case of ufence timeout which is observed
> on LNL and that points recent scheduling issue with E-cores.
>
> This is similar to the recent fix:
> commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
> response timeout") and should be removed once there is E core
> scheduling fix.
>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2754
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wait_user_fence.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index f5deb81eba01..7f034871345b 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -155,6 +155,17 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  		}
>  
>  		if (!timeout) {
> +			/*
> +			 * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h worker
> +			 * in case of g2h response timeout")
> +			 *
> +			 * TODO: Drop this change once workqueue scheduling delay issue is
> +			 * fixed on LNL Hybrid CPU.
> +			 */
> +			__flush_workqueue(xe->ordered_wq);

Just flush_workqueue() please, not the double underscored version. The
double underscores are there to tell you not to use it...

BR,
Jani.

> +			err = do_compare(addr, args->value, args->mask, args->op);
> +			if (err <= 0)
> +				break;
>  			err = -ETIME;
>  			break;
>  		}

-- 
Jani Nikula, Intel
