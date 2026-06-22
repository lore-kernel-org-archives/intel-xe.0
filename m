Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1226CDB46F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 15:44:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A717B10E614;
	Mon, 22 Jun 2026 15:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kffQFvbl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA6810E614
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 15:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782143042; x=1813679042;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=XrQtvNoXKsjydyeRCSC2okdfUPeqophTLwKd6Y7Xrmo=;
 b=kffQFvbldyFa25M03sDzJPAjLFw7IPfI29k0kcMox4y3P8fmLLrzMzfx
 l++8AhkULQ7O6koxmXFJ2TwrGRQ5bas1aIf8biceuByKYlooxal29bnhv
 nfUGQkCJ2iTUNgHTbeidoeijEO83n0u9fcAGUrTTVdQQy0RvneZlCHO14
 BBMRa6MOTZA7cHY3iCTYivbsx2xxcJbKXGNu2WaiuJgt+UHbNI/9ItxKn
 kAmZiXSbpJkIu98M/SOi8iT9zJjZz5vbTF5SBu3atMhSYw7vLhJvsrCZu
 HRp/qU2l8e6smTs0LWu22HhQFZ/iiLYU0+Xidgj8fFBkw/7PfQ2V6reb/ A==;
X-CSE-ConnectionGUID: 82TFFmuWQJmYRTXrqAaE2Q==
X-CSE-MsgGUID: lizaIyl6SzasmUnIXfYBGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="93993818"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="93993818"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 08:44:02 -0700
X-CSE-ConnectionGUID: IaL0NdN0RLaiy2Uw49LLZQ==
X-CSE-MsgGUID: Kqzh1ehjSSiwZ8FI+Twusg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="272957461"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO [10.245.245.133])
 ([10.245.245.133])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 08:44:00 -0700
Message-ID: <3a63e2f7-bde7-4c33-9d18-7ad56ec6a6bc@intel.com>
Date: Mon, 22 Jun 2026 16:43:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] drm/xe/mmio: Add check for minimal BAR size
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20260622132342.19600-1-michal.wajdeczko@intel.com>
 <20260622132342.19600-4-michal.wajdeczko@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260622132342.19600-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 22/06/2026 14:23, Michal Wajdeczko wrote:
> We initialized the root tile's xe_mmio structure with a new size
> of 4MiB without sanity checks to see if mapped GTTMMADR_BAR was
> actually at least that size. Check BAR size against first 16MiB,
> which is expected minimum BAR size for the one-tile platforms.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com> #v1

r-b still applies.

> ---
> v1: https://patchwork.freedesktop.org/patch/727340/?series=167104&rev=1
> v2: expect at least 16MiB as xe_ggtt relies on this (sashiko)
> ---
>   drivers/gpu/drm/xe/xe_mmio.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index fce890b6410c..8dd818e1184c 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -101,13 +101,18 @@ int xe_mmio_probe_early(struct xe_device *xe)
>   	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>   
> -	xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
>   	xe->mmio.regs = pcim_iomap(pdev, GTTMMADR_BAR, 0);
>   	if (!xe->mmio.regs) {
>   		xe_err(xe, "Failed to map GTTMMADR_BAR\n");
>   		return -EIO;
>   	}
>   
> +	xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
> +	if (xe->mmio.size < SZ_16M) {
> +		xe_err(xe, "GTTMMADR_BAR is too small: %zu\n", xe->mmio.size);
> +		return -EIO;
> +	}
> +
>   	/* Setup first tile; other tiles (if present) will be setup later. */
>   	xe_mmio_init(&root_tile->mmio, root_tile, xe->mmio.regs, SZ_4M);
>   

