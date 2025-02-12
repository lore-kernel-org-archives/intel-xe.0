Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E441C02198
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 20:32:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C0610E98C;
	Wed, 12 Feb 2025 20:32:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SAXhR1NN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9726610E98C
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 20:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739392344; x=1770928344;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=QIETyESkhMoOFZSIMYI2gDV2zWrGxZkpjaxjhQrO9bA=;
 b=SAXhR1NN9MKEzmtO8ToCSN9Cf/1lVJKEU8VnK0zch8sefZPMDM0mwyjQ
 TgTtNsnjL8gcugtDmbM38/YioJ691KQMHtfCDIa/XyAiGGAXP72tJI1h4
 2QR+pmJqsTZ644P34sabp8iy5R++GgyL18hQKGe0A5ThIRcEGSjI1lCcE
 PstPpgyDqr6VW8IxosNp43jz4KJuzDdq6fjQTwkzsAGS/LGLjZwFb2hpU
 HcZt/ELSl9b5ZsTBWhZ0z7Xx/wTfCK24jbzy1+kxoNPGQlNJUFPHNCNU2
 DYcR7BU8Vv7PJ2mFQ49LaNNvsoud4MneM4tyGXzhKh/zKPJFpFLyzCFEQ A==;
X-CSE-ConnectionGUID: 7yV0kk+ITiO2LbWeLJYAWQ==
X-CSE-MsgGUID: VMwTcvk9RK6w2PsfLV/PBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="57475461"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="57475461"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 12:32:24 -0800
X-CSE-ConnectionGUID: 7DqGqmZiQXaHP6y1M60Fiw==
X-CSE-MsgGUID: GTSDQjcdTJqicVfb4bnCJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="112702874"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 12:32:22 -0800
Date: Wed, 12 Feb 2025 22:33:18 +0200
From: Imre Deak <imre.deak@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe/display: Remove hpd cancel work sync from runtime
 pm path
Message-ID: <Z60FjqU7JDotstyg@ideak-desk.fi.intel.com>
References: <20250212192447.402715-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212192447.402715-1-rodrigo.vivi@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Feb 12, 2025 at 02:24:47PM -0500, Rodrigo Vivi wrote:
> This function will synchronously cancel and wait for many display
> work queue items, which might try to take the runtime pm reference
> causing a bad deadlock. So, remove it from the runtime_pm suspend patch.
> 
> Reported-by: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Makes sense, since instead of trying to cancel a pending a work from
here, the work should instead wake up the device if needed via RPM get:

Reviewed-by: Imre Deak <imre.deak@intel.com>

See some notes below.

> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 651799c946ac..f0f427689a56 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -311,7 +311,8 @@ static void __xe_display_pm_suspend(struct xe_device *xe, bool runtime)
>  
>  	xe_display_flush_cleanup_work(xe);
>  
> -	intel_hpd_cancel_work(xe);
> +	if (!runtime)
> +		intel_hpd_cancel_work(xe);

Could be moved to the block below.

AFAICS it's still in the wrong spot for system suspend, as in
xe_pm_suspend() the above function will be called before
xe_irq_suspend(), so a new interrupt/work could be scheduled
here right after intel_hpd_cancel_work(). But that's a separate issue.

>  
>  	if (!runtime && has_display(xe)) {
>  		intel_display_driver_suspend_access(display);
> -- 
> 2.48.1
> 
