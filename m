Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285A5C47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 14:26:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D2810E5A4;
	Tue, 16 Jan 2024 14:26:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DE210E5B2
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 14:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705415174; x=1736951174;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=1fByVPFODn+kIQA4qnH2YkyjUsrXeGZce4+mVNUDaFA=;
 b=d4i9xUBaUvy3bC5jhLy1lgp5iiv2BFhub59gJ5h7AQ78WQwnP6o32/F/
 AGNuTrhr6CehrdwvJrQ4wcA/Zqi/F1k5sNu+/al2wbYxqn6TM6f/ag6pm
 WCC5OYi+VtuJzs342cqy0/GdHcUiTBCmAfLbk5JDOTBvZtAFB+lrEBX2H
 jglIZV0CR+HRqEQpig7/GWZhEUX66W9B9UnjhgoteOGqehrkEmfQbqPq3
 uGVENTCtmT9ZxzTlaoqADeVT76aWLZq6xfAi6NGmuBVZ2dyxCY7CAdAPw
 SxDNEfVYz2wAjRFiIm7D+m7yNX9G2QVhoPRnesfHYwBhPR1GGuACQu1Eg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="6592522"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="6592522"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 06:26:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="927504401"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="927504401"
Received: from jfunnell-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.52])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 06:26:01 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ohad Sharabi <osharabi@habana.ai>, Dani Liberman <dliberman@habana.ai>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/irq: allocate all possible msix interrupts
In-Reply-To: <e50b9b13-9f98-4ed4-89e1-ac83153f5884@habana.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240116130736.1678104-1-dliberman@habana.ai>
 <e50b9b13-9f98-4ed4-89e1-ac83153f5884@habana.ai>
Date: Tue, 16 Jan 2024 16:25:58 +0200
Message-ID: <87zfx5qrrd.fsf@intel.com>
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

On Tue, 16 Jan 2024, Ohad Sharabi <osharabi@habana.ai> wrote:
> On 16/01/2024 15:07, Dani Liberman wrote:
>
> For future platforms which will support msix, need to allocate all
> possible interrupts.
>
> Signed-off-by: Dani Liberman <dliberman@habana.ai><mailto:dliberman@habana.ai>
>
> Reviewed-by: Ohad Sharabi <osharabi@<mailto:gustavo.sousa@intel.com>habana.ai>

Please use plain text when replying on the public lists.

Thanks,
Jani.

>
>
> Cc: Ohad Sharabi <osharabi@habana.ai><mailto:osharabi@habana.ai>
> ---
>  drivers/gpu/drm/xe/xe_irq.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 907c8ff0fa21..62722809a01d 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -662,7 +662,7 @@ int xe_irq_install(struct xe_device *xe)
>  {
>         struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>         irq_handler_t irq_handler;
> -       int err, irq;
> +       int err, irq, nvec;
>
>         irq_handler = xe_irq_handler(xe);
>         if (!irq_handler) {
> @@ -672,7 +672,18 @@ int xe_irq_install(struct xe_device *xe)
>
>         xe_irq_reset(xe);
>
> -       err = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI | PCI_IRQ_MSIX);
> +       if (pdev->msix_cap) {
> +               nvec = pci_msix_vec_count(pdev);
> +               if (nvec <= 0) {
> +                       drm_err(&xe->drm, "MSIX: Failed getting count\n");
> +                       return -EINVAL;
> +               }
> +       } else {
> +               /* device supports only msi */
> +               nvec = 1;
> +       }
> +
> +       err = pci_alloc_irq_vectors(pdev, nvec, nvec, PCI_IRQ_MSI | PCI_IRQ_MSIX);
>         if (err < 0) {
>                 drm_err(&xe->drm, "MSI/MSIX: Failed to enable support %d\n", err);
>                 return err;
>
>

-- 
Jani Nikula, Intel
