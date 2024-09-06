Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7D2E6FE2B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 15:40:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC30410EAA6;
	Fri,  6 Sep 2024 15:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WKvLQJ6w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165B210EAA6
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 15:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725637221; x=1757173221;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rASMXDQpfwxvIu/q14mfxStLq0tovcngzO94d5eqwhM=;
 b=WKvLQJ6w9X9dmDtekprXCPUIDHbHfb7ZXStYaBz/zvwsfx5sD5/TqA6M
 7vwP42UTISrADP3a94cMsG6bxYyRGLfWvovQL9REjdwpzwD5ihWXrcfFU
 aPjQRRwxE05kQSRZ8ZzkC4adLhwshy/clbEmipIxdmia8FJHFd+Yb6j05
 6tBgYB48EiBKmdMjkleTf0Py5091JrsDnye7DJ25OjqfsQysffSq+rtVI
 DuQYVkVh6ygK/nERrqnNv5+u89qs/bSdWD2PriGjhnxN6zjzX5kWESf0a
 ZkKoXtzQH/Q7u+gHbYUgLar4paNoS0saJqPZX9GTQmloiFGiTcBH44RyZ w==;
X-CSE-ConnectionGUID: RMq1MpaqR0SxxIoOAKLDxA==
X-CSE-MsgGUID: 63enzIo5SWmOvDax+X35hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24349090"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="24349090"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 08:40:21 -0700
X-CSE-ConnectionGUID: NJBMECiZSISQ9fORdaaDiA==
X-CSE-MsgGUID: gfteSjUtQ+K0VaYiqIfT0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="70795537"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa005.jf.intel.com with ESMTP; 06 Sep 2024 08:40:21 -0700
Received: from [10.246.19.248] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.19.248])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A623C2FC47;
 Fri,  6 Sep 2024 16:40:19 +0100 (IST)
Message-ID: <19b33859-03b9-4b0d-943d-e6e6aeea742e@intel.com>
Date: Fri, 6 Sep 2024 17:40:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix arg to pci_iomap()
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
References: <20240906032507.2952859-1-lucas.demarchi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240906032507.2952859-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 06.09.2024 05:25, Lucas De Marchi wrote:
> Commit 2d8865b27724 ("drm/xe: Move BAR definitions to dedicated file")
> moved the BAR definition to the header, but replaced the wrong arg in
> the pci_iomap() function - the last arg is actuall the length, not the
> BAR. Luckily GTTMMADR_BAR == 0, so it still works. Fix the argument
> to avoid confusion.
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 3fd462fda625..4aae30880bc6 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -157,15 +157,14 @@ int xe_mmio_init(struct xe_device *xe)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> -	const int mmio_bar = 0;

probably initial change was supposed to be:

-	const int mmio_bar = 0;
+	const int mmio_bar = GTTMMADR_BAR;

but below also works for me, thanks for fixing this!

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

>  
>  	/*
>  	 * Map the entire BAR.
>  	 * The first 16MB of the BAR, belong to the root tile, and include:
>  	 * registers (0-4MB), reserved space (4MB-8MB) and GGTT (8MB-16MB).
>  	 */
> -	xe->mmio.size = pci_resource_len(pdev, mmio_bar);
> -	xe->mmio.regs = pci_iomap(pdev, mmio_bar, GTTMMADR_BAR);
> +	xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
> +	xe->mmio.regs = pci_iomap(pdev, GTTMMADR_BAR, 0);
>  	if (xe->mmio.regs == NULL) {
>  		drm_err(&xe->drm, "failed to map registers\n");
>  		return -EIO;
