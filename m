Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF88606A695
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 21:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NYmTBkCT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD5C10E35B;
	Fri, 20 Nov 2026 21:29:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251CB10E35B
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 21:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795210156; x=1826746156;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=P+V8BShP0v43QyYe4tSw+7bDk9/zDSvgValQXrjXTr8=;
 b=NYmTBkCTYRRQJEBfB/G6/g7SC/yMRyQJmrEqVslGZpSVxWEHJ/XcnLRk
 /6F1DIYGB9B10EHyK58zhPhNfhNoj5eYnccKHTS9gOOw6aBOIbEj15eoE
 oH4ncsOq6p+6/OOWglE01OdGAf98dS24locSCgR7OjyoNfaWjehgtXSYz
 ABWIWCrSSmDR0oyDoJhveUrAsp8PmaNffyx1sL6O8hxlQD8yV07Lmpfgt
 0jHlxaU77b8ryibkayqkKViNZDhh6bPn+8X09R3A9wVdMx6LKvSgi3R4X
 JCmnjmDUSnM+KHieU9jfId0GRD3uBjILxZSHuuasRPpphnzzqz14U2g6g g==;
X-CSE-ConnectionGUID: ebxy5LwkS0m7WUkEoJrvJQ==
X-CSE-MsgGUID: Bag+/Kx2RaW4a6eHG46YAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3986713"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3986713"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 13:29:09 -0800
X-CSE-ConnectionGUID: fZgIaiAsRTC2uwelP45D5A==
X-CSE-MsgGUID: Nj92JNr2TWuB49Mj6z4mKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10687141"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.16])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 13:29:04 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 20 Nov 2026 23:29:00 +0200 (EET)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 Hans de Goede <hansg@kernel.org>, matthew.brost@intel.com, 
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, 
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com, 
 anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: Re: [PATCH v21 01/19] platform/x86/intel/pmt: Introduce a callback
 for discovery data
In-Reply-To: <20261120205540.1220643-22-michael.j.ruhl@intel.com>
Message-ID: <07de3fd3-c7bb-74f2-9f3c-72c79271aed0@linux.intel.com>
References: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
 <20261120205540.1220643-22-michael.j.ruhl@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 20 Nov 2026, Michael J. Ruhl wrote:

> Some devices require special handling to access discovery data.
> 
> Crescent Island GPUs have a windowed access to discovery and data.
> Because of this, direct access to the devices MMIO space can be unsafe.
> 
> A further difficuly is the read_data path requires a GUID which will
> not be known until after discovery, so the current read_data callback
> cannot be used.
> 
> Provide a callback that uses the capbility and disocvery index, for

typo x2.

> reading discovery data.
> 
> Reviewed-by: David E. Box <david.e.box@linux.intel.com>
> Suggested-by: David E. Box <david.e.box@linux.intel.com>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/class.c | 18 ++++++++++++------
>  include/linux/intel_vsec.h             | 10 ++++++++++
>  2 files changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
> index 2b11c4012f6a..601cdf68f0bc 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
> @@ -466,12 +466,17 @@ static int pmt_get_headers(struct intel_vsec_device *ivdev, int idx,
>  	switch (ivdev->src) {
>  	case INTEL_VSEC_DISC_PCI: {
>  		struct resource *disc_res = &ivdev->resource[idx];
> +		struct pmt_callbacks *cb = ivdev->priv_data;
>  		void __iomem *disc_table;
> +		int ret = 0;
>  
>  		disc_table = devm_ioremap_resource(dev, disc_res);
>  		if (IS_ERR(disc_table))
>  			return PTR_ERR(disc_table);
>  
> +		/* Used by crashlog driver */
> +		entry->disc_table = disc_table;
> +
>  		/*
>  		 * The mapped resource is sized by the namespace's DVSEC
>  		 * entry_size (in dwords), which can be less than the default
> @@ -480,13 +485,14 @@ static int pmt_get_headers(struct intel_vsec_device *ivdev, int idx,
>  		 * region.
>  		 */
>  		memset(entry->disc_header, 0, header_bytes);
> -		memcpy_fromio(entry->disc_header, disc_table,
> -			      min(header_bytes, resource_size(disc_res)));
> -
> -		/* Used by crashlog driver */
> -		entry->disc_table = disc_table;
>  
> -		return 0;
> +		if (cb && cb->read_discovery)
> +			ret = cb->read_discovery(ivdev->dev, ivdev->cap_id, idx,
> +						 entry->disc_header);
> +		else
> +			memcpy_fromio(entry->disc_header, disc_table,
> +				      min(header_bytes, resource_size(disc_res)));
> +		return ret;
>  	}
>  	case INTEL_VSEC_DISC_ACPI: {
>  		memcpy(entry->disc_header, &ivdev->acpi_disc[idx][0], header_bytes);
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index 8686e79c4f75..e4afdb6478e3 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -94,6 +94,11 @@ enum intel_vsec_quirks {
>   * * data:  buffer for the data to be copied
>   * * off:   offset into the requested buffer
>   * * count: size of buffer
> + * @read_discovery: when specified called by client driver to read PMT discovery structs
> + * * dev:       device reference for the callback's use
> + * * cap_id:    ilog2 of VSEC_CAP value
> + * * idx:       index to access based on the capability header enumerated by intel_vsec_register()
> + * * disc_data: PMT_DISC_DWORDS dword sized buffer for the discovery data to be copied
>   * @read_reg: when specified called by client driver to read PMT state
>   * * dev:      device reference for the callback's use
>   * * guid:     ID of data to access
> @@ -104,9 +109,14 @@ enum intel_vsec_quirks {
>   * * guid:     ID of data to access
>   * * reg_data: register data
>   * * offset:   offset of register to write
> + *
> + * NOTE: Callbacks may be called from the client driver's probe and remove paths.
> + *       A parent MUST not hold a lock taken by the callbacks across the registration
> + *       path or while its devices are being removed.
>   */
>  struct pmt_callbacks {
>  	int (*read_telem)(struct device *dev, u32 guid, u64 *data, loff_t off, u32 count);
> +	int (*read_discovery)(struct device *dev, unsigned long cap_id, u32 idx, u32 *disc_data);
>  	int (*read_reg)(struct device *dev, u32 guid, u32 *reg_data, u32 offset);
>  	int (*write_reg)(struct device *dev, u32 guid, u32 reg_data, u32 offset);
>  };
> 

-- 
 i.

