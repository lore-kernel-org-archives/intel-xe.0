Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE05EEB8FA5
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 08:51:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0A410E5A7;
	Wed,  6 Sep 2023 08:51:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9BE10E5A7
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 08:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693990317; x=1725526317;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=CS11So9XWsyWwg0IQ0bTgIugmhDABoai+/ZEQl1Md3k=;
 b=aj2E6dz5gK/bCNlRbVCp7BSqeJMvnvdoGjTsHP2xxzC9ER8nPU0ReLH7
 8N9OJFhA4L5biy/yTff7ecH6POTxAIH4Djd5Kwe7/6AxVI5P+AnniEG49
 2pvrp53BN6w/MbbmYs2odjEjI/iXUae8Q38fR3oH/vJA0iV6Tr83wflxu
 TfbUmk9M8Hud9h0JSwBSez22E5UBsQia2i11pwZmR1G3whErNZTNwlj4Z
 g3+fPtBhBfQ+b3Ij67geLnuJa6EC3HA6/eWKoCrVq1gc/tff2582w1MVD
 Ld53Gs04KSEAEmZKMkCaEgui6e28p80NOmFMAeOo/AMz71fTdpQGDyk7a g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="379723657"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="379723657"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 01:51:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="884616175"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; d="scan'208";a="884616175"
Received: from iiervoli-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.60.161])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 01:51:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20230906061449.4147094-1-balasubramani.vivekanandan@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230906061449.4147094-1-balasubramani.vivekanandan@intel.com>
Date: Wed, 06 Sep 2023 11:51:33 +0300
Message-ID: <87o7ifhega.fsf@intel.com>
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

PS. Please indicate what changed since v1.


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
> +
>  	drm_dbg(&xe->drm, "Stepping = (G:%s, M:%s, D:%s, B:%s)\n",
>  		xe_step_name(xe->info.step.graphics),
>  		xe_step_name(xe->info.step.media),

-- 
Jani Nikula, Intel Open Source Graphics Center
