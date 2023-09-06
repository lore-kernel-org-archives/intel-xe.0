Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4ACEB8FA5
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 08:50:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7986010E5A5;
	Wed,  6 Sep 2023 08:50:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B213E10E5A5
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 08:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693990214; x=1725526214;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=9Txg9XbVEapcPqgwIa5NluLkk/Lzgry7ulpUn5Bak7k=;
 b=bl2KAhK9AwIJrUGfLndm9uOiJgaw7nK6gXqqO/GdWGEf4XTj05x2/fZp
 FKWyMIdnNSmyAJXkOv6h4AzlfQPRANuVKA8FyjfH5edC+t61+/W3NDMXb
 11wwlPDlq3pi4Ta+zqhfFtLMHhzJtpHghi0OF3w7rUwHyxxUm/QGy/+Sf
 4TrAW34RGzqMJtzD/9jfqSCuDJO3EHi463gg4DmdAoxzmECvAqeZYybxn
 mJjBlcc85yRIsuS41+9gY0hr4l3B0OFy6XxdlZ5bD9eda2JgPHEP4LR5q
 KA/t56CmH4WpPFMFIB8uaGs5Mi/FhWnOPKFJqL9wmGx00k7yQC3EDoeWT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="375911084"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="375911084"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 01:50:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="811576158"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="811576158"
Received: from iiervoli-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.60.161])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 01:50:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20230906061449.4147094-1-balasubramani.vivekanandan@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230906061449.4147094-1-balasubramani.vivekanandan@intel.com>
Date: Wed, 06 Sep 2023 11:50:10 +0300
Message-ID: <87r0nbheil.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH v2] drm/xe/display: Print display ip version
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

On Wed, 06 Sep 2023, Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com> wrote:
> Print display ip version during module load
>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 60f3474844e2..60927ad7fa27 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -844,6 +844,13 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		str_yes_no(xe->info.enable_display),
>  		xe->info.dma_mask_size, xe->info.tile_count);
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> +	if (xe->info.enable_display)
> +		drm_dbg(&xe->drm, "Display: %d.%02d\n",
> +			xe->info.display_runtime.ip.ver,
> +			xe->info.display_runtime.ip.rel);
> +#endif

Please don't mix non-display and display code.

Absolutely *nothing* in xe top level should touch any display
structures. (xe_display.c is the obvious exception, but that should be
moved under display/ too.)

The display code has intel_display_device_info_print(), i915 uses that
to dump the relevant information, so should xe.

Side note, I also don't think a high level function like xe_pci_probe()
should do any debug printing like it currently does. It should all be
abstracted away.


BR,
Jani.

> +
>  	drm_dbg(&xe->drm, "Stepping = (G:%s, M:%s, D:%s, B:%s)\n",
>  		xe_step_name(xe->info.step.graphics),
>  		xe_step_name(xe->info.step.media),

-- 
Jani Nikula, Intel Open Source Graphics Center
