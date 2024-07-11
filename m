Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F8DC3DA41
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 11:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A2C10E164;
	Thu, 11 Jul 2024 11:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XyOYc+Sh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA58C10E164
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 11:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720696599; x=1752232599;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=MYNcE5OdclA2SYOVPy6cMN48VOgpbyI4AicBX7FXFV4=;
 b=XyOYc+ShRLR7U9+ljHn+7WPl97dT1UlVgaDdpFKx/tvA7y/SAQig15GQ
 zoJ09mcN2QWetco5aC4XUESeMbQQ3He7By5uNQeijOHd/8CzMe6+sOEG3
 9p20qaqp1JRgdNue0CkkkW7ZlSbCOqeq8F+xYeWiFDaiwWP2PxCcboWcz
 MNsHjBBmNSB/erNc0384ENXD2x7eO8pi3be1X0NLWJ03cByuV65YVKOj7
 d0xIEwexIMvxaArLgqcZBsH9/tt7+TiSXpWXnGpABNHdwVuU2VqbdVvCp
 2vVQOk5HCSE7+jsUXt37FLemzKTr06eX478H8IqS/pr4FRm93/EU8MWRL A==;
X-CSE-ConnectionGUID: ZRqITP3UQ9aiyMGXqY7jYA==
X-CSE-MsgGUID: N0eLxnzITA2QV7U0sj3lXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17770542"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="17770542"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 04:16:38 -0700
X-CSE-ConnectionGUID: w0i6HdbyTLuqHhzbiaITPA==
X-CSE-MsgGUID: U/DhFRIwSWygm3zlu3DgWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="48606419"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.247.127])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 04:16:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 11 Jul 2024 14:16:33 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 david.e.box@linux.intel.com, matthew.brost@intel.com
Subject: Re: [PATCH v6 2/6] platform/x86/intel/vsec: Add PMT read callbacks
In-Reply-To: <20240710192249.3915396-3-michael.j.ruhl@intel.com>
Message-ID: <18866bce-1b3a-83b6-c861-6eedbd185265@linux.intel.com>
References: <20240710192249.3915396-1-michael.j.ruhl@intel.com>
 <20240710192249.3915396-3-michael.j.ruhl@intel.com>
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

> From: "David E. Box" <david.e.box@linux.intel.com>
> 
> Some PMT providers require device specific actions before their telemetry
> can be read. Provide assignable PMT read callbacks to allow providers to
> perform those actions.
> 
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  drivers/platform/x86/intel/vsec.c |  1 +
>  include/linux/intel_vsec.h        | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
> index 2b46807f868b..7b5cc9993974 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -212,6 +212,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
>  	intel_vsec_dev->num_resources = header->num_entries;
>  	intel_vsec_dev->quirks = info->quirks;
>  	intel_vsec_dev->base_addr = info->base_addr;
> +	intel_vsec_dev->priv_data = info->priv_data;
>  
>  	if (header->id == VSEC_ID_SDSI)
>  		intel_vsec_dev->ida = &intel_vsec_sdsi_ida;
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index 1a287541a2f9..4569a55e8645 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -67,6 +67,19 @@ enum intel_vsec_quirks {
>  	VSEC_QUIRK_EARLY_HW     = BIT(4),
>  };
>  
> +/**
> + * struct pmt_callbacks - Callback infrastructure for PMT devices
> + * ->read_telem() when specified, called by client driver to access PMT data (instead
> + * of direct copy).
> + * @args:  pci device info pointer

PCI

> + * @guid:  ID of data to acccss
> + * @data:  buffer for the data to be copied
> + * @count: size of buffer
> + */
> +struct pmt_callbacks {
> +	int (*read_telem)(void *args, u32 guid, u64 *data, u32 count);

Can you explain why args is void * and not struct pci_dev *? I was already 
unsure earlier why void * is needed but now you even explicitly documented
it to be "pci device info pointer".

> +};
> +
>  /**
>   * struct intel_vsec_platform_info - Platform specific data
>   * @parent:    parent device in the auxbus chain
> @@ -78,6 +91,7 @@ enum intel_vsec_quirks {
>  struct intel_vsec_platform_info {
>  	struct device *parent;
>  	struct intel_vsec_header **headers;
> +	void *priv_data;
>  	unsigned long caps;
>  	unsigned long quirks;
>  	u64 base_addr;
> 

-- 
 i.

