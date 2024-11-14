Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C329D68B11
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 13:24:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEBA10E030;
	Thu, 14 Nov 2024 13:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EAOhMNri";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C223D10E030
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 13:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731590644; x=1763126644;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=p90VFFH2HoqneWypaw02cuhjIkq9fyq90Ykq1KxFrD8=;
 b=EAOhMNri6GYnZB3W97wyXgOE+WIyz8JzMleZz1i3jst03wSZG+IGSGvH
 CIflGk/dd7CitzuhAHFdbBm5ohWenl1S5j6FNMzkfJP1W2pI/KFZMShSL
 rW59Nmaghq19jBbVVGiDRZ2nZa76ARZA0+6ZIwU71RpfeAhxKBnbDHAM7
 9p5Ow3ciwJVNc5CjhbHCm+hLTYCO1xv0gW8TSmK+vZqFDPmrh0ED9H/GB
 372RyWK9VS1JkElBbXgBUfmsZyCsYuxGVst04+uuqGebXemwcra+IFkpm
 nZijqPBuUWY7i34X11/JUDd7M0vJVJnk2SgQ1zpT8T51FrRlXIOjxj1IB w==;
X-CSE-ConnectionGUID: 0Xi7EeGHRpmaVRQD/66GZg==
X-CSE-MsgGUID: cS/w2n3ZQsS7XjViVD5F5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31629963"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="31629963"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 05:24:03 -0800
X-CSE-ConnectionGUID: mcVZsqPoRticOOKeQwwaMg==
X-CSE-MsgGUID: iN9z2+fgTf2tlGHxUG6a+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="87962181"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.54])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 05:24:00 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 14 Nov 2024 15:23:57 +0200 (EET)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 david.e.box@linux.intel.com, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Hans de Goede <hdegoede@redhat.com>, rodrigo.vivi@intel.com, 
 lucas.demarchi@intel.com
Subject: Re: [PATCH v3 1/2] platform/x86/intel/pmt: allow user offset for
 PMT callbacks
In-Reply-To: <20241114130358.2467787-2-michael.j.ruhl@intel.com>
Message-ID: <3b700047-a00b-ed08-5bcf-ea9a04d401e7@linux.intel.com>
References: <20241114130358.2467787-1-michael.j.ruhl@intel.com>
 <20241114130358.2467787-2-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu, 14 Nov 2024, Michael J. Ruhl wrote:

> Usage of the telem sysfs file allows for partial reads at an offset.
> 
> The current callback method returns the buffer starting from offset 0
> only.
> 
> Include the requested offset in the callback.
> Update the necessary address calculations with the offset.
> 
> Note: offset addition is moved from the caller to the local usage.  For
> non-callback usage this is unchanged behavior.
> 
> Fixes: e92affc74cd8 ("platform/x86/intel/vsec: Add PMT read callbacks")
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Hi,

I've applied this patch 1 into pdx86/review-ilpo where it will migrate 
into pdx86/for-next in this cycle once lkp has done its magic.

-- 
 i.

> ---
>  drivers/platform/x86/intel/pmt/class.c     | 8 +++++---
>  drivers/platform/x86/intel/pmt/class.h     | 2 +-
>  drivers/platform/x86/intel/pmt/telemetry.c | 2 +-
>  include/linux/intel_vsec.h                 | 3 ++-
>  4 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
> index c04bb7f97a4d..c3ca2ac91b05 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -59,10 +59,12 @@ pmt_memcpy64_fromio(void *to, const u64 __iomem *from, size_t count)
>  }
>  
>  int pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, u32 guid, void *buf,
> -			void __iomem *addr, u32 count)
> +			void __iomem *addr, loff_t off, u32 count)
>  {
>  	if (cb && cb->read_telem)
> -		return cb->read_telem(pdev, guid, buf, count);
> +		return cb->read_telem(pdev, guid, buf, off, count);
> +
> +	addr += off;
>  
>  	if (guid == GUID_SPR_PUNIT)
>  		/* PUNIT on SPR only supports aligned 64-bit read */
> @@ -96,7 +98,7 @@ intel_pmt_read(struct file *filp, struct kobject *kobj,
>  		count = entry->size - off;
>  
>  	count = pmt_telem_read_mmio(entry->ep->pcidev, entry->cb, entry->header.guid, buf,
> -				    entry->base + off, count);
> +				    entry->base, off, count);
>  
>  	return count;
>  }
> diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
> index a267ac964423..b2006d57779d 100644
> --- a/drivers/platform/x86/intel/pmt/class.h
> +++ b/drivers/platform/x86/intel/pmt/class.h
> @@ -62,7 +62,7 @@ struct intel_pmt_namespace {
>  };
>  
>  int pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, u32 guid, void *buf,
> -			void __iomem *addr, u32 count);
> +			void __iomem *addr, loff_t off, u32 count);
>  bool intel_pmt_is_early_client_hw(struct device *dev);
>  int intel_pmt_dev_create(struct intel_pmt_entry *entry,
>  			 struct intel_pmt_namespace *ns,
> diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
> index c9feac859e57..0cea617c6c2e 100644
> --- a/drivers/platform/x86/intel/pmt/telemetry.c
> +++ b/drivers/platform/x86/intel/pmt/telemetry.c
> @@ -219,7 +219,7 @@ int pmt_telem_read(struct telem_endpoint *ep, u32 id, u64 *data, u32 count)
>  	if (offset + NUM_BYTES_QWORD(count) > size)
>  		return -EINVAL;
>  
> -	pmt_telem_read_mmio(ep->pcidev, ep->cb, ep->header.guid, data, ep->base + offset,
> +	pmt_telem_read_mmio(ep->pcidev, ep->cb, ep->header.guid, data, ep->base, offset,
>  			    NUM_BYTES_QWORD(count));
>  
>  	return ep->present ? 0 : -EPIPE;
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index 11ee185566c3..b94beab64610 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -74,10 +74,11 @@ enum intel_vsec_quirks {
>   * @pdev:  PCI device reference for the callback's use
>   * @guid:  ID of data to acccss
>   * @data:  buffer for the data to be copied
> + * @off:   offset into the requested buffer
>   * @count: size of buffer
>   */
>  struct pmt_callbacks {
> -	int (*read_telem)(struct pci_dev *pdev, u32 guid, u64 *data, u32 count);
> +	int (*read_telem)(struct pci_dev *pdev, u32 guid, u64 *data, loff_t off, u32 count);
>  };
>  
>  /**
> 
