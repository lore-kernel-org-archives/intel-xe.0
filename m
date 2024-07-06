Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D34C3814E
	for <intel-xe@archiver.kernel.org>; Sat,  6 Jul 2024 13:32:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E0D10E188;
	Sat,  6 Jul 2024 13:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cSkL7VP7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5115D10E188
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Jul 2024 13:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720272752; x=1751808752;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=TvbkgR6YAEiXPWNzCw7cUR+4Y+xJC4FOm3iMGNldpu4=;
 b=cSkL7VP7lgdBTXlbipERxEO7BjbXPp3Tylruq8QSU05D937UI3daewhU
 /0qa38LiGVMC7NmZaOMLdN7jPVXanh/pT/xSPeIxsG5EnmuM07AXjOF0D
 4r2zaD3yX/qD5E7GZPvUYoGjm+qvpo0/eyUnAQyXqTgar+EjrqNVDJ1j3
 KOnG/Hytn/2bzBDWxRWjpc88MI5Tle/E3pSBkUBbwaikEq/i4+ZFK2t7+
 f4SZuS8YRqr2brfSOnv87fK/0O4s/ooiE5P8fCTSIE82+Q5x7S4eY/ZcF
 toHNW4TRya7y6IiiubjxXUe7xrG1agYIg+UwD+eunFkZ5lQDZvwC7E6SQ Q==;
X-CSE-ConnectionGUID: U38r2H2wRvmzPgeO2XGsYw==
X-CSE-MsgGUID: 5SZLv6idRue+BuXAkpdf7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="20436213"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; d="scan'208";a="20436213"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2024 06:32:32 -0700
X-CSE-ConnectionGUID: u9yu2d73T4KOUjJV+AVQFg==
X-CSE-MsgGUID: z+w02edVSyGpsCt7re9Gmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; d="scan'208";a="77823129"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.247.111])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2024 06:32:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sat, 6 Jul 2024 16:32:25 +0300 (EEST)
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
cc: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 david.e.box@linux.intel.com, matthew.brost@intel.com
Subject: Re: [PATCH v5 2/6] platform/x86/intel/vsec: Add PMT read callbacks
In-Reply-To: <20240701141730.3585133-3-michael.j.ruhl@intel.com>
Message-ID: <92c284d5-84ed-f2c5-0506-d1d5ab484362@linux.intel.com>
References: <20240701141730.3585133-1-michael.j.ruhl@intel.com>
 <20240701141730.3585133-3-michael.j.ruhl@intel.com>
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

On Mon, 1 Jul 2024, Michael J. Ruhl wrote:

> From: "David E. Box" <david.e.box@linux.intel.com>
> 
> Some PMT providers require device specific actions before their telemetry
> can be read. Provide assignable PMT read callbacks to allow providers to
> perform those actions.
> 
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  drivers/platform/x86/intel/vsec.c | 1 +
>  include/linux/intel_vsec.h        | 5 +++++
>  2 files changed, 6 insertions(+)
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
> index ff7998cadab4..003301783331 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -67,10 +67,15 @@ enum intel_vsec_quirks {
>  	VSEC_QUIRK_EARLY_HW     = BIT(4),
>  };
>  
> +struct pmt_callbacks {
> +	int (*read_telem)(void *args, u32 guid, u64 *data, u32 count);
> +};

Please add kerneldoc.

> +
>  /* Platform specific data */
>  struct intel_vsec_platform_info {
>  	struct device *parent;
>  	struct intel_vsec_header **headers;
> +	void *priv_data;
>  	unsigned long caps;
>  	unsigned long quirks;
>  	u64 base_addr;

Where's the kerneldoc for this struct?

I know you moved things around in the earlier patch, but moving things 
into kernel-wide scope comes with a higher standard on documenting things.

-- 
 i.

