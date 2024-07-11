Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E04FC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 11:34:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE66010EA27;
	Thu, 11 Jul 2024 11:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eiBBQH0L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03AA710EA26
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 11:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720697662; x=1752233662;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=Oj7qCuRoZ6BG2CMcxhD5uo6MFrEJN+oqSjK8HVbgmLE=;
 b=eiBBQH0L1GeYaRT0sH75yX9QPQjOmU8OxsyuX4GqpvJpr3ygKbI8t+m/
 5phFPgoj0ImB3K5GVN+5hb9cvNOnGMg++bLeCtYcDNq936ipxoZeVPG5v
 YzzRUpKxxQpQP+46TETId+UVnWQW+qWbT6dWcxkyQnPrWs+j+42SFJ3Kj
 q+DY1w/wk6UKXFHEFOvSfSv/9a7zx/Zepqpjvn72K0/K4HjDh5WLCcZPr
 M86QuH4WfxnSVxZFNCwzn0BkeXYDX37NR3EgYrx6HKzt+pjFJJfbFvp/I
 JEK30Gl3FC1nXPWnJ7pKIIkfjzm/U8CvQ8ZkumY6Ftzf4P35k6IAF4jXL g==;
X-CSE-ConnectionGUID: 4PFzIeA3THWGq1FvwsvNlg==
X-CSE-MsgGUID: +Ra1j3UtQyGQ+/3kyo6+BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="29222587"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="29222587"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 04:34:22 -0700
X-CSE-ConnectionGUID: 8YiY9OMWRw2BJEhEUt2OCg==
X-CSE-MsgGUID: myy/T2T6SoKA91bQpbohUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="48610060"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.247.127])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 04:34:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 11 Jul 2024 14:34:15 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 david.e.box@linux.intel.com, matthew.brost@intel.com
Subject: Re: [PATCH v6 5/6] platform/x86/intel/pmt: Add support for PMT base
 adjust
In-Reply-To: <20240710192249.3915396-6-michael.j.ruhl@intel.com>
Message-ID: <b521ebe3-e7d2-6ca9-e626-ae9d3a455078@linux.intel.com>
References: <20240710192249.3915396-1-michael.j.ruhl@intel.com>
 <20240710192249.3915396-6-michael.j.ruhl@intel.com>
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

On Wed, 10 Jul 2024, Michael J. Ruhl wrote:

> DVSEC offsets are based on the endpoint BAR.  If an endpoint is
> not avialable allow the offset information to be adjusted by the

available

> parent driver.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/class.h     | 1 +
>  drivers/platform/x86/intel/pmt/telemetry.c | 9 +++++++++
>  drivers/platform/x86/intel/vsec.c          | 1 +
>  include/linux/intel_vsec.h                 | 2 ++
>  4 files changed, 13 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
> index a267ac964423..984cd40ee814 100644
> --- a/drivers/platform/x86/intel/pmt/class.h
> +++ b/drivers/platform/x86/intel/pmt/class.h
> @@ -46,6 +46,7 @@ struct intel_pmt_entry {
>  	void __iomem		*base;
>  	struct pmt_callbacks	*cb;
>  	unsigned long		base_addr;
> +	s32			base_adjust;
>  	size_t			size;
>  	u32			guid;
>  	int			devid;
> diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
> index c9feac859e57..5c44e500e8f6 100644
> --- a/drivers/platform/x86/intel/pmt/telemetry.c
> +++ b/drivers/platform/x86/intel/pmt/telemetry.c
> @@ -78,6 +78,13 @@ static int pmt_telem_header_decode(struct intel_pmt_entry *entry,
>  	header->access_type = TELEM_ACCESS(readl(disc_table));
>  	header->guid = readl(disc_table + TELEM_GUID_OFFSET);
>  	header->base_offset = readl(disc_table + TELEM_BASE_OFFSET);
> +	if (entry->base_adjust) {
> +		u32 new_base = header->base_offset + entry->base_adjust;

The code setting ->base_adjust is responsible for avoiding stupid settings 
that would lead to underflows and overflows?

> +
> +		dev_dbg(dev, "Adjusting baseoffset from 0x%x to 0x%x\n",

base offset

-- 
 i.

> +			header->base_offset, new_base);
> +		header->base_offset = new_base;
> +	}
>  
>  	/* Size is measured in DWORDS, but accessor returns bytes */
>  	header->size = TELEM_SIZE(readl(disc_table));
> @@ -302,6 +309,8 @@ static int pmt_telem_probe(struct auxiliary_device *auxdev, const struct auxilia
>  	for (i = 0; i < intel_vsec_dev->num_resources; i++) {
>  		struct intel_pmt_entry *entry = &priv->entry[priv->num_entries];
>  
> +		entry->base_adjust = intel_vsec_dev->base_adjust;
> +
>  		mutex_lock(&ep_lock);
>  		ret = intel_pmt_dev_create(entry, &pmt_telem_ns, intel_vsec_dev, i);
>  		mutex_unlock(&ep_lock);
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
> index 7b5cc9993974..be079d62a7bc 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -212,6 +212,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
>  	intel_vsec_dev->num_resources = header->num_entries;
>  	intel_vsec_dev->quirks = info->quirks;
>  	intel_vsec_dev->base_addr = info->base_addr;
> +	intel_vsec_dev->base_adjust = info->base_adjust;
>  	intel_vsec_dev->priv_data = info->priv_data;
>  
>  	if (header->id == VSEC_ID_SDSI)
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index 4569a55e8645..1fd0fcc5615d 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -95,6 +95,7 @@ struct intel_vsec_platform_info {
>  	unsigned long caps;
>  	unsigned long quirks;
>  	u64 base_addr;
> +	s32 base_adjust;
>  };
>  
>  /**
> @@ -120,6 +121,7 @@ struct intel_vsec_device {
>  	size_t priv_data_size;
>  	unsigned long quirks;
>  	u64 base_addr;
> +	s32 base_adjust;
>  };
>  
>  int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
> 
