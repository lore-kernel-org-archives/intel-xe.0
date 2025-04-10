Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26489C3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 12:06:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD38610E969;
	Thu, 10 Apr 2025 12:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E4acg2LX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245F810E975
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 12:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744286797; x=1775822797;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=JGlDiaONdzf2rfyzIAYctoq1eNZkiQCrzy4IoB7tUEs=;
 b=E4acg2LXP9Ko/dBSLPHSBZ1H6zO1hg05WGZJmGeyvfW/54OOUEsTp0Nh
 cMETjWpLlqBWljFlSg1FyZ91Hl+IKme4JxM4rThkBUGg6M8J5szrSlP46
 qJktNit5rT4oKjCYVh8ydSN1AmyBiT5g0W65fdij9gmCHkxI7mOWQuhuO
 ZQNUHi3GlUMdEu/Z31re1Df/K8e1uQLeT8ni/CQqmjv/nn1vlAwrozJH1
 59hr4jYsz7HUtNSoEs1m9t+Ho79WL+jfm6K3wjnMCqW/C24At0lFvCLBp
 EpYCbw59xLyzjsbiAkn1tvSh0vpr9WDGGvHTAj1/s/E1vnoHp1wqTjLub Q==;
X-CSE-ConnectionGUID: +vH8+MivSg6l8W0+ykfYBQ==
X-CSE-MsgGUID: nCfXtnz2QOOD7cKDqHvpew==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56781103"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="56781103"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 05:06:36 -0700
X-CSE-ConnectionGUID: ypHrQ72zQqKFpuMSq9fxGA==
X-CSE-MsgGUID: +45QSpytQE2cHAe803UMTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="129429265"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 05:06:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3 3/4] drm/print: Add drm_printer_is_full
In-Reply-To: <20250410040622.238389-4-matthew.brost@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250410040622.238389-1-matthew.brost@intel.com>
 <20250410040622.238389-4-matthew.brost@intel.com>
Date: Thu, 10 Apr 2025 15:06:32 +0300
Message-ID: <87h62wuson.fsf@intel.com>
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

On Wed, 09 Apr 2025, Matthew Brost <matthew.brost@intel.com> wrote:
> Add drm_printer_is_full which indicates if a drm printer's output is
> full. Useful to short circuit coredump printing once printer's output is
> full.

The function is presented as a generic drm_printer thing, but it's
really only valid for a coredump printer, and will return random results
for other printers. Which can't even be "full" in any meaningful sense,
making the documentation for the function seem completely weird.

BR,
Jani.

>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  include/drm/drm_print.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index f31eba1c7cab..db7517ee1b19 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -242,6 +242,23 @@ struct drm_print_iterator {
>  	ssize_t offset;
>  };
>  
> +/**
> + * drm_printer_is_full() - DRM printer output is full
> + * @p: DRM printer
> + *
> + * DRM printer output is full, useful to short circuit coredump printing once
> + * printer is full.
> + *
> + * RETURNS:
> + * True if DRM printer output buffer is full, False otherwise
> + */
> +static inline bool drm_printer_is_full(struct drm_printer *p)
> +{
> +	struct drm_print_iterator *iterator = p->arg;
> +
> +	return !iterator->remain;
> +}
> +
>  /**
>   * drm_coredump_printer - construct a &drm_printer that can output to a buffer
>   * from the read function for devcoredump

-- 
Jani Nikula, Intel
