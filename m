Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7BDE6E7F4
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 10:39:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11CB110E2DE;
	Tue,  3 Feb 2026 10:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hJVa/7Re";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21D010E2DE
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 10:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770115146; x=1801651146;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=upU6meRoTh7wdhqynGKd/5fPoNT7lHNJtytQ9sq6DvM=;
 b=hJVa/7ReYROsZ8QTvoIpezxO3lCEYhCMab1DFnF4Rhogm12wB9LH7QET
 JMXB/mblZBskK46XfQOzcC1ur5oKbNSfL3gv/OkPpMahiU+VM8hi9Adzq
 w0fGfhSNocba+rq1SqGqycSric+oxh9IVa+IpZEYjoRVgCEkKNByO8iBt
 mK9SzZpT+x2lWfl1KcdE2HRMXdVbS5duMRWL36NXBZZvutXninqoSPQO/
 7nqK9JJg6qAJr56fsH8TOtI4BDHltRWeVCvIIDppHbC9FzOCwLoYOa1C+
 JaoBo4s75cUZE1gyvZmOapnACWXsbI7fwwjjfcrfY6BFo8kPSvKYTFpbz Q==;
X-CSE-ConnectionGUID: ry0AHc+nTlyHLZe47oTyPg==
X-CSE-MsgGUID: mDy1L2wZTp6aYgHrSAQHdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="73878758"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="73878758"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 02:39:04 -0800
X-CSE-ConnectionGUID: YY2Bi/xeQ16GqC208p2fng==
X-CSE-MsgGUID: vAF77Fp9QfGwo/dnnAdrlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="208915720"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 02:39:01 -0800
Date: Tue, 3 Feb 2026 11:38:58 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 mallesh.koujalagi@intel.com, dev@lankhorst.se
Subject: Re: [PATCH v1] drm/xe/irq: Introduce xe_irq_init_late()
Message-ID: <aYHQQvihdYGLOqeO@black.igk.intel.com>
References: <20260202114609.1276227-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202114609.1276227-1-raag.jadav@intel.com>
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

On Mon, Feb 02, 2026 at 05:14:29PM +0530, Raag Jadav wrote:
> Introduce xe_irq_init_late() which will enable the IRQs at the end of
> xe_device_probe() to make sure we don't hit them during probe sequence.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> PS: I'm not aware of any historic significance of current sequence.
> If I've missed anything, please let me know.

As per CI results, this looks like a bad idea. Sorry about the noise.

Raag

>  drivers/gpu/drm/xe/xe_device.c |  3 +++
>  drivers/gpu/drm/xe/xe_irq.c    | 10 ++++++++--
>  drivers/gpu/drm/xe/xe_irq.h    |  1 +
>  3 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 9cf82bde36c4..40c27e62bc01 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1013,6 +1013,9 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	detect_preproduction_hw(xe);
>  
> +	/* Turn irqs on only after we're setup to service them */
> +	xe_irq_init_late(xe);
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  
>  err_unregister_display:
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 7560a45f7f64..bf554268762e 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -802,6 +802,14 @@ int xe_irq_init(struct xe_device *xe)
>  	return xe_irq_msix_init(xe);
>  }
>  
> +void xe_irq_init_late(struct xe_device *xe)
> +{
> +	if (!atomic_read(&xe->irq.enabled))
> +		return;
> +
> +	xe_irq_postinstall(xe);
> +}
> +
>  int xe_irq_install(struct xe_device *xe)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -831,8 +839,6 @@ int xe_irq_install(struct xe_device *xe)
>  
>  	atomic_set(&xe->irq.enabled, 1);
>  
> -	xe_irq_postinstall(xe);
> -
>  	return devm_add_action_or_reset(xe->drm.dev, irq_uninstall, xe);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
> index a28bd577ba52..ad03e830a0b0 100644
> --- a/drivers/gpu/drm/xe/xe_irq.h
> +++ b/drivers/gpu/drm/xe/xe_irq.h
> @@ -15,6 +15,7 @@ struct xe_tile;
>  struct xe_gt;
>  
>  int xe_irq_init(struct xe_device *xe);
> +void xe_irq_init_late(struct xe_device *xe);
>  int xe_irq_install(struct xe_device *xe);
>  void xe_irq_suspend(struct xe_device *xe);
>  void xe_irq_resume(struct xe_device *xe);
> -- 
> 2.43.0
> 
