Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D442EE7FF4
	for <intel-xe@archiver.kernel.org>; Mon, 11 Sep 2023 11:04:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D544110E2C2;
	Mon, 11 Sep 2023 11:04:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F63310E2C2
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Sep 2023 11:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694430287; x=1725966287;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3E6wYPKMduDG+a3qrs5X/mctPdj6MDUj0C7nNfjsEGk=;
 b=bcz1XnTTYL2m/+pTxMFjvI0abqvs1cJaTX8sID2v5+dJrmMzo6SVMD1w
 sJBJ+uOnVb3+62Yh6knf5W/BOECiZ/Ye1aQc2YpIvOuyHwlDz2O0O63+7
 +HdZgfYv+54TRjiVasvBV9pp+55P4bvuUF7YKaMHi9WUAqIE8pAcFuGoM
 iMgq0RixvWdogScVlVeUqdLcM7aQte9gYqmuoNcNdrOKvTmu+ZQcwfvdU
 xSLgqTtZHpX4ZZ/DVi7fTOEwfBR+SG07qNr6vOt/JNzG4GqWguvtiP5Dn
 rN0X+atnzqOjpyQSKcdjt5A3jMN+qB+hrE8SkTn5fzWgl5GnRKMSbSPm2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="368294247"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="368294247"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 04:04:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="916983918"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="916983918"
Received: from kschuele-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.119])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 04:04:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20230911104134.431670-1-balasubramani.vivekanandan@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230911104134.431670-1-balasubramani.vivekanandan@intel.com>
Date: Mon, 11 Sep 2023 14:04:30 +0300
Message-ID: <87cyypezsx.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH v3] drm/xe/display: Print display ip version
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 11 Sep 2023, Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com> wrote:
> Print display ip version and flags during module load
>
> v3:
> Use the existing intel_display_device_info_print() function to print the
> display information. (Jani)

So this is an improvement in the sense that xe core doesn't poke at
display data directly to print the info.

However, I still think the interface between xe (or i915) core and
display should be minimal. I don't see why we'd need to add a function
at the top level probe to print display stuff... the display code should
do it internally, in some other high level probe call, when it's done.

Even having the function adds complexity, because the call site now
needs to be aware about display probe order, and ensure it's all done
before you can safely and accurately print display info. And that's
display code implementation details.

Superficially this is all benign, but this stuff adds up. We've been
trying to untangle i915 core and display for a long time, and the i915
probe is still a huge mess, with a bunch of random calls to display at
random times, and there seems to be no end to this. It's all so
intertwined.

Perhaps in the future all of the calls need to go through a framework,
maybe aux bus. Do we really want to put all of this to that interface?

So the direction should be to reduce and minimize the interfaces between
the high level components, not add more.


BR,
Jani.


>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_display.c | 9 +++++++++
>  drivers/gpu/drm/xe/xe_display.h | 4 ++++
>  drivers/gpu/drm/xe/xe_pci.c     | 2 ++
>  3 files changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index a453946ad108..45ffc418e636 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -417,6 +417,15 @@ void xe_display_pm_resume(struct xe_device *xe)
>  	intel_power_domains_enable(xe);
>  }
>  
> +void xe_display_info_print(struct xe_device *xe)
> +{
> +	struct drm_printer p = drm_info_printer(xe->drm.dev);
> +
> +	if (xe->info.enable_display)
> +		intel_display_device_info_print(xe->info.display,
> +						&xe->info.display_runtime, &p);
> +}
> +
>  /* Display info initialization */
>  __diag_push();
>  __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
> diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
> index 9e29de012df7..b18bf5583229 100644
> --- a/drivers/gpu/drm/xe/xe_display.h
> +++ b/drivers/gpu/drm/xe/xe_display.h
> @@ -19,6 +19,8 @@ int xe_display_create(struct xe_device *xe);
>  
>  void xe_display_info_init(struct xe_device *xe);
>  
> +void xe_display_info_print(struct xe_device *xe);
> +
>  int xe_display_init_nommio(struct xe_device *xe);
>  void xe_display_fini_nommio(struct drm_device *dev, void *dummy);
>  
> @@ -57,6 +59,8 @@ xe_display_create(struct xe_device *xe) { return 0; }
>  
>  static inline void xe_display_info_init(struct xe_device *xe) { }
>  
> +static inline void xe_display_info_print(struct xe_device *xe) { }
> +
>  static inline int
>  xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver) { return 0; }
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 24b16863bf3d..a4886ea8794f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -724,6 +724,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		xe_step_name(xe->info.step.display),
>  		xe_step_name(xe->info.step.basedie));
>  
> +	xe_display_info_print(xe);
> +
>  	err = xe_device_probe(xe);
>  	if (err)
>  		goto err_pci_disable;

-- 
Jani Nikula, Intel Open Source Graphics Center
