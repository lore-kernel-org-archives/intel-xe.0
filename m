Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DD3C5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 21:26:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9192310E352;
	Wed, 26 Aug 2026 21:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZeofQSrv";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3551210E352
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 21:26:23 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2701860A5C;
 Wed, 26 Aug 2026 21:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A5171F000E9;
 Wed, 26 Aug 2026 21:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787779580;
 bh=gm39wQMjKpmBedmXq2MOstLdN4egcQOOG6PSnXiEiE8=;
 h=Date:From:To:Cc:Subject:In-Reply-To;
 b=ZeofQSrvbVjAFqCoJTwO91Bnds+XmhUjlfGvKAhiVVWTR9RxGvXOewcW6zQLwexBH
 paQr+e1eMA9uf7Dn1G8aOqqp5LtbPjcOagO7y81eV84mXr3A5PhtcpsaB4sur6c2jP
 AUPRraLAW5hEPlbhRnyNWcRuxLqfpFRdKh6z5FJqHjsFyCoop+OYG3V17kqqoYNyju
 f9bN9QKGUF1JGNT5ngXeWq+7gyBT6eQ3eRIf1qn0PhjcUuHyW0L238/GICG7HEtK/l
 KC8vVcjr73FjfZVb7KH4FonxacjYJ22UD4qA3RbRAVm+qlcn5xWalB2AQUtRWUFnWt
 AKcAW0GTgT9IA==
Date: Wed, 26 Aug 2026 16:26:19 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Raag Jadav <raag.jadav@intel.com>
Cc: dave@stgolabs.net, jic23@kernel.org, dave.jiang@intel.com,
 alison.schofield@intel.com, vishal.l.verma@intel.com,
 djbw@kernel.org, iweiny@kernel.org, ming.li@zohomail.com,
 bhelgaas@google.com, rodrigo.vivi@intel.com,
 linux-cxl@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 lukas@wunner.de, riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com
Subject: Re: [PATCH v2 2/2] drm/xe/ras: Enable SGUnit PCIe error reporting
Message-ID: <20260826212619.GA1566339@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260825054312.1319951-3-raag.jadav@intel.com>
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

On Tue, Aug 25, 2026 at 11:12:51AM +0530, Raag Jadav wrote:
> SGUnit as a PCI endpoint is not AER capable and requires explicit
> programming of error reporting bits in DevCtl register of it's config
> space for upstream error propagation. Hack it.

s/it's/its/

> While at it, add native AER sanity check for upstream port before
> programming SGUnit register.
> 
> This is as per pci_enable_pcie_error_reporting() logic implemented
> in PCIe AER driver.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Lukas Wunner <lukas@wunner.de>
> ---
>  drivers/gpu/drm/xe/xe_ras.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index de4cb9ef7355..c4b5c0b5eb0d 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2026 Intel Corporation
>   */
>  
> +#include <linux/aer.h>
> +
>  #include "xe_debugfs.h"
>  #include "xe_device.h"
>  #include "xe_drm_ras.h"
> @@ -234,6 +236,9 @@ static struct pci_dev *find_usp_dev(struct pci_dev *pdev)
>  	return pci_upstream_bridge(vsp);
>  }
>  
> +#define PCI_EXP_AER_FLAGS	(PCI_EXP_DEVCTL_CERE | PCI_EXP_DEVCTL_NFERE | \
> +				 PCI_EXP_DEVCTL_FERE | PCI_EXP_DEVCTL_URRE)

Ugh :)  Duplicate of what's in drivers/pci/pci.h.

>  static void ras_usp_aer_init(struct xe_device *xe)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -251,6 +256,14 @@ static void ras_usp_aer_init(struct xe_device *xe)
>  		return;
>  	}
>  
> +	if (!pcie_aer_is_native(usp)) {
> +		dev_warn(&usp->dev, "No native AER support\n");
> +		return;
> +	}
> +
> +	pcie_capability_set_word(pdev, PCI_EXP_DEVCTL, PCI_EXP_AER_FLAGS);

The PCI core calls pci_aer_init() for every device, which only calls
pci_enable_pcie_error_reporting() to set PCI_EXP_AER_FLAGS when the
device itself has an AER Capability.

Setting PCI_EXP_AER_FLAGS enables the device to send ERR_* messages
upstream.  *Maybe* enabling those has something to do with whether the
Root Port (the ultimate consumer of those ERR_* messages) supports
AER, but I don't think it is related to whether the device *itself*
has an AER Capability.

It seems to me like the PCI core should do
pci_enable_pcie_error_reporting() independent of whether the device
has an AER Capability.

> +	pci_save_state(pdev);
> +
>  	/*
>  	 * Clear any stale Uncorrectable Internal Error Status event in Uncorrectable Error
>  	 * Status Register.
> @@ -279,6 +292,7 @@ static void ras_usp_aer_init(struct xe_device *xe)
>  	pci_save_state(usp);
>  	dev_dbg(&usp->dev, "Uncorrectable Internal Errors downgraded and unmasked\n");
>  }
> +MODULE_IMPORT_NS("AER");
>  
>  static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component)
>  {
> -- 
> 2.43.0
> 
