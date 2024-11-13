Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9239D41C27
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 10:26:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC9A10E6C3;
	Wed, 13 Nov 2024 10:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MjkWT37g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDB310E6C3
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 10:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731493573; x=1763029573;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AaWtQezRf5n95+J2LluOVp5nuttkjgQE+VmbqBeG0ac=;
 b=MjkWT37gIR+QZTjuhUbzLX1b5nK8DpU4egzfYQk28s5R/13hKGF3cUKf
 3uSAk0ZYLpvg4X20LNJ66nhJ6hOyEP/sNh1ydcdxG2C1zA/3UGc2JINpl
 AEbJP5N9fOr1Z8EVmChvjd454OL2g/ixqQca2qpoAmLFRu0iFpA6u5svc
 0PE/Rds8c1w5mziwQovy0qqqhG2nJrcu0xOj/2cUeuxf1a0kAX3nkg2Q2
 t4mghPd74Ya6fioEQcbf1SLWS28r4qEmlHFewucZ6UVmF1/ALAX3ps5KW
 lwyP5Hqe6C/r9eZifzF1cFWVrU+JqvK37Pv+uGpUPoGtYufLefyZ/KJo1 A==;
X-CSE-ConnectionGUID: J0f9iSDjSwSGvT2D2BS13Q==
X-CSE-MsgGUID: iGsD63lJStqk/h/ueMFSqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30772842"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="30772842"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 02:26:13 -0800
X-CSE-ConnectionGUID: ltoO5klNQvapAy2LKQFk6w==
X-CSE-MsgGUID: ZN4tFoGBTTS8TLXyEinHkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="111141340"
Received: from smile.fi.intel.com ([10.237.72.154])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 02:26:10 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tBAZc-0000000EIuX-09ZM; Wed, 13 Nov 2024 12:26:08 +0200
Date: Wed, 13 Nov 2024 12:26:07 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, rodrigo.vivi@intel.com, lucas.demarchi@intel.com
Subject: Re: [PATCH v2 1/2] platform/x86/intel/pmt: allow user offset for PMT
 callbacks
Message-ID: <ZzR-v4wiKCqRcd6q@smile.fi.intel.com>
References: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
 <20241112163035.2282499-2-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112163035.2282499-2-michael.j.ruhl@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Tue, Nov 12, 2024 at 11:30:34AM -0500, Michael J. Ruhl wrote:
> Usage of the telem sysfs file allows for partial reads at
> an offset.
> 
> The current callback method returns the buffer starting
> from offset 0 only.
> 
> Include the requested offset in the callback.
> Update the necessary address calculations with the offset.
> 
> Note: offset addition is moved from the caller to the local
> usage.  For non-callback usage this unchanged behavior.

...

>  int pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, u32 guid, void *buf,
> -			void __iomem *addr, u32 count)
> +			void __iomem *addr, loff_t off, u32 count)
>  {
>  	if (cb && cb->read_telem)
> -		return cb->read_telem(pdev, guid, buf, count);
> +		return cb->read_telem(pdev, guid, buf, off, count);

Also possible instead of the below changes is to add here

	addr += off;

>  	if (guid == GUID_SPR_PUNIT)
>  		/* PUNIT on SPR only supports aligned 64-bit read */
> -		return pmt_memcpy64_fromio(buf, addr, count);
> +		return pmt_memcpy64_fromio(buf, addr + off, count);
>  
> -	memcpy_fromio(buf, addr, count);
> +	memcpy_fromio(buf, addr + off, count);
>  
>  	return count;
>  }

-- 
With Best Regards,
Andy Shevchenko


