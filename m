Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A05CD98D2
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 10:47:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866CA10EE2E;
	Thu, 11 Jun 2026 10:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="NMG5u5QU";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA0410EE2E
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 10:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1781174861;
 bh=bJve6RUDYlRJejLPCxtAoNL+gi0r1pX/F1w3Yrhms1c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NMG5u5QUE+mPSI12jQijzNVNXkQRnm+nfpvp04yeZ+RWsVHyX2IV2cV7VuRf1H9ZB
 ql2bMzKlhK8hfsn1gbo2O22uqSsZAeBPES1KbPR5x/2E13DrZDYHxf939ypEsemZVr
 h23iSIbNQVVwcXyv162VifT7axJKC8uuxCWSXs/jEYhEr8Bn6VRBM24p9RINxoUllc
 gg3eP+9kHV8WXBRscIl2JCJ2OnE/SRfbkC0DB+KiaYMQ0gJzBeSaKN7jKl49f3iDmm
 UkSz2p/JawpYvMqlFrU4JdqJpGnVFsyqVqnYo3lCF/wzF3Rc0zi9H90lUrCinTNbOT
 i6IHMgXMzrlXA==
Message-ID: <cff1c411-59a6-4b1c-acb5-5c3b8762f628@lankhorst.se>
Date: Thu, 11 Jun 2026 12:47:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] drm/xe: Cap MSI-X vector count to XE_MSIX_MAX_VECS
To: Stuart Summers <stuart.summers@intel.com>
Cc: michal.wajdeczko@intel.com, ilia.levi@intel.com, x.wang@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 alan.previn.teres.alexis@intel.com
References: <20260610212833.153366-13-stuart.summers@intel.com>
 <20260610212833.153366-16-stuart.summers@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten@lankhorst.se>
In-Reply-To: <20260610212833.153366-16-stuart.summers@intel.com>
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

Hello,

On 6/10/26 23:28, Stuart Summers wrote:
> Introduce XE_MSIX_MAX_VECS (1024) as a software cap on the total number
> of MSI-X vectors the driver will use. We want a way to cap the number
> of vectors separately from the PCIe capability. This way we can more
> easily manage certain system-wide configurations that might differ
> from the per-device level configuration.
>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Assisted-by: Copilot:claude-sonnet-4.6
> ---
>  drivers/gpu/drm/xe/xe_irq.c | 2 +-
>  drivers/gpu/drm/xe/xe_irq.h | 7 +++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 9e49e2241da4..3429bb305293 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -895,7 +895,7 @@ static int xe_irq_msix_init(struct xe_device *xe)
>  		return nvec;
>  	}
>  
> -	xe->irq.msix.nvec = nvec;
> +	xe->irq.msix.nvec = min_t(int, nvec, XE_MSIX_MAX_VECS);
>  	xa_init_flags(&xe->irq.msix.indexes, XA_FLAGS_ALLOC);
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
> index a28bd577ba52..5f48249dae8a 100644
> --- a/drivers/gpu/drm/xe/xe_irq.h
> +++ b/drivers/gpu/drm/xe/xe_irq.h
> @@ -10,6 +10,13 @@
>  
>  #define XE_IRQ_DEFAULT_MSIX 1
>  
> +/*
> + * Software cap on the total number of MSI-X vectors the driver will use.
> + * Allows the supported vectors to be managed independent of the PCI
> + * config space report.
> + */
> +#define XE_MSIX_MAX_VECS 1024
> +
>  struct xe_device;
>  struct xe_tile;
>  struct xe_gt;

I took a quick look at the PCI docs for the kernel.

pci_alloc_irq_vectors will request a minimum of 1024 vectors in this case,
but is allowed to allocate more.

Although we should set a sensible default using pci_msix_vec_count(),
I'm not sure it makes sense to specifically limit them if we can use as many as we like.

The return value of pci_alloc_irq_vectors returns the amount of vectors actually available, so this patch clamps the amount available without necessity.

What about this instead, and drop configfs?

xe->irq.msix.nvec = err = pci_alloc_irq_vectors(pdev, NUM_OF_STATIC_MSIX, pci_msix_vec_count()) ?

In this case, we get the maximum amount of vectors available, without requiring any caps or requiring configfs.

If MSI-X vectors really provide a speedup, would it be beneficial to use those on the migration queues as well?

Kind regards,
~Maarten Lankhorst
