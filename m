Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAB0CAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 16:00:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D221610E780;
	Wed, 24 Sep 2025 16:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PncZbWnI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F20710E140
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 16:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758729655; x=1790265655;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5nCdO4fO3syWMVoHJ+b4Qrs64/ycDMdJoVRPEe8ge6o=;
 b=PncZbWnIa0lw04jowVkauKvMHXLPMHrk+GEh758ySvtuPeYGPqD/Xx7t
 5KLfUz6NNHbe/gprRBGcfFuS9uPAKg4nMDPoqiaW3nnNKbGnBequay8u8
 0ra/YiuUqR0OigrfSX4Rxvsx0COQW0kSMKS+4pku9fReaWGgLmR15Ivyr
 2KQSC8Dgld9YOq575euWkmFoQ65JBKzJ6/6gZtZpMV1i0zPnUF+NRS/uY
 sJ+eTk1G7iZsdLMx9dT/DNRx0su0fXL7om+Ijgw+9t+1Vr2lElfLYHxIX
 k1Rd/k9dNZWGvPMBi1wFjK+jya+07jqmACLEAk/GYKP0DnDd8E2RDQq17 Q==;
X-CSE-ConnectionGUID: 71kgDNV+Tru0ej/cUQWFdg==
X-CSE-MsgGUID: 89I6Bf2+S+6uhFqEzXy21g==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="64868976"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="64868976"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 09:00:54 -0700
X-CSE-ConnectionGUID: l/AIkhJMTO+IDa6LdM+1Ww==
X-CSE-MsgGUID: RNQdnQeQQyCH22Dmo8DV8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="200763297"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 09:00:52 -0700
Date: Wed, 24 Sep 2025 18:00:50 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: intel-xe@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/configfs: Fix engine class parsing
Message-ID: <aNQVshNgS5wqxUyT@black.igk.intel.com>
References: <20250924152709.659483-3-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924152709.659483-3-lucas.demarchi@intel.com>
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

On Wed, Sep 24, 2025 at 08:27:10AM -0700, Lucas De Marchi wrote:
> If mask is NULL, only the engine class should be accepted, so the
> pattern string should be completely parsed. This should fix passing e.g.
> rcs0 to ctx_restore_post_bb when it's only expecting the engine class.
> 
> Reported-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Closes: https://lore.kernel.org/r/20250922155544.67712-1-jonathan.cavitt@intel.com

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/aNJKnrCQmL9xS9Gv@stanley.mountain

> Fixes: e2a9854d806e ("drm/xe/configfs: Allow to select by class only")
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 8a9b950e7a6d1..beade13efbae7 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -324,8 +324,8 @@ static const struct engine_info *lookup_engine_info(const char *pattern, u64 *ma
>  			continue;
>  
>  		pattern += strlen(engine_info[i].cls);
> -		if (!mask && !*pattern)
> -			return &engine_info[i];
> +		if (!mask)
> +			return *pattern ? NULL : &engine_info[i];
>  
>  		if (!strcmp(pattern, "*")) {
>  			*mask = engine_info[i].mask;
> -- 
> 2.50.1
> 
