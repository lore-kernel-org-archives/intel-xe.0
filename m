Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E45CD5BB0
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 15:05:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341C610E23D;
	Fri, 22 May 2026 15:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P6+jE/GS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B975410E23D
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 15:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779462322; x=1810998322;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=bEChoHhDdBQQyEOf3WVLrj9NZ+/FJOFpaCraWDjWxwI=;
 b=P6+jE/GSMzHeUnZyPWb9o64NfdJ9C8AolsW/hAx3ETG87+iljfJ23hej
 qPCm1u9V1TunHiAtnKyvV7WwA4OcfoPmupgrCl8eqhg3nSvTa8pcRqs8C
 j2amjJ8a8uTe7FhKz4gohTgzx/TCkJESzWdlrOdrKavn+fEc7a9mxokGV
 XuE7hVNn35rnr0sFI/6ppe1Q3gEk4LjxEh/IORwxYW+w5Fi81cD/W+1Gp
 YGfViZXzjxMANjcAVaOD8mOF/qabeHP20yShBCr5A2THQKQYgVpMTDbm7
 fKIRB6RIp35NgDlkbd/j4LXla93K1YOe5kjcfzYHvcWAqKBhjTksZMXDa w==;
X-CSE-ConnectionGUID: Jbbe22oFT2KUl95CzPEmWQ==
X-CSE-MsgGUID: hjPQlKeWRuCXNN81fz8hhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="90967053"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="90967053"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 08:05:22 -0700
X-CSE-ConnectionGUID: xltxpoULQRCvBbyTtMR8jw==
X-CSE-MsgGUID: HdF7ZrBvQeSqMK34kqUAig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="246008532"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.22])
 ([10.245.245.22])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 08:05:21 -0700
Message-ID: <99e3a652-1c19-4157-9733-0bf6666920af@intel.com>
Date: Fri, 22 May 2026 16:05:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/xe/mmio: Add check for minimal BAR size
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20260522143112.10643-1-michal.wajdeczko@intel.com>
 <20260522143112.10643-3-michal.wajdeczko@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260522143112.10643-3-michal.wajdeczko@intel.com>
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

On 22/05/2026 15:31, Michal Wajdeczko wrote:
> We initialized the root tile's xe_mmio structure with a new size
> of 4MiB without sanity checks to see if mapped GTTMMADR_BAR was
> actually at least that size.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_mmio.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index f4086b9ae38f..3e31a2141886 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -93,13 +93,18 @@ int xe_mmio_probe_early(struct xe_device *xe)
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
> +	if (xe->mmio.size < SZ_4M) {
> +		xe_err(xe, "GTTMMADR_BAR is too small: %zd\n", xe->mmio.size);
> +		return -EIO;
> +	}
> +
>   	/* Setup first tile; other tiles (if present) will be setup later. */
>   	xe_mmio_init(&root_tile->mmio, root_tile, xe->mmio.regs, SZ_4M);
>   

