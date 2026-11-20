Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A83B60A260D
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 18:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KlG4qj+a
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13EBD10E012;
	Fri, 20 Nov 2026 18:48:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6296310E012
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 18:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795200521; x=1826736521;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=46Zcb6hmpvIXvsipCGu2pwcmX0AJ0gxJ+2afzrOMcAo=;
 b=KlG4qj+a6QJ3G9GgZ/EDTiDKK0j201kCNLVOQOMrdz+7qAljxTWDJ6M6
 XwcX6BR6lZzOIwk9xNO+RsTiSSWcQCwpa5Y+0n2Gi480rmgag755Mygtl
 DiG3PM9M/o2pXx1rPDRdE0sExa1ye2gUbDfU1DmE+7F7vknxvYk6woMnB
 P3yY4+WTxGMM1DVDxT4W7MQ2mOg7ek5CEFvtvJzqWyzcLvapvJB9kYg22
 INWtioyTyyqKYfZpdI+3KtTj87deB7WpRDbQVimGsEM9+dbbkFfo6lQfZ
 R4QLD2duvwKib553HgyodyHz9Ztp+oGbhgOdQxP9TZk0rc8w8NQBuTebz w==;
X-CSE-ConnectionGUID: WRbih7cGSdCZs4wHsW1wIg==
X-CSE-MsgGUID: tjMp6Y7ITbC6xvDXOh5BQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4115264"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4115264"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 10:48:41 -0800
X-CSE-ConnectionGUID: AabO5DN8SBy8PNMbi7Ykcw==
X-CSE-MsgGUID: nKZ2OxodQtmL+lXRjy6yzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="11088276"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.54.77.98])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 10:48:40 -0800
Date: Fri, 20 Nov 2026 10:48:39 -0800
From: David Box <david.e.box@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com, 
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, airlied@gmail.com, 
 simona@ffwll.ch, anoop.c.vijay@intel.com, badal.nilawar@intel.com, 
 matthew.d.roper@intel.com, james.ausmus@intel.com
Subject: Re: [PATCH v20 02/19] platform/x86/intel/pmt: Use the pre-populated
 header info for crashlog
Message-ID: <awCVscE42LSfgCol@debox1-desk4>
References: <20261120021929.473553-21-michael.j.ruhl@intel.com>
 <20261120021929.473553-23-michael.j.ruhl@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261120021929.473553-23-michael.j.ruhl@intel.com>
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

On Thu, Nov 19, 2026 at 06:19:32PM -0800, Michael J. Ruhl wrote:
> Crashlog reads discovery data directly from the discovery table.
> 
> For parents that provide a read_discovery callback, this data may
> not be readable with this method.
> 
> Update to use the pre-populated discovery data (disc_header), rather
> than reading directly (disc_table) for probe.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
>  drivers/platform/x86/intel/pmt/crashlog.c | 24 +++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
> index d7018b495217..e2af09732dd6 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -27,10 +27,10 @@
>  #define CRASH_TYPE_OOBMSM	1
>  
>  /* Crashlog Discovery Header */
> -#define CONTROL_OFFSET		0x0
> -#define GUID_OFFSET		0x4
> -#define BASE_OFFSET		0x8
> -#define SIZE_OFFSET		0xC
> +#define ACCESS_IDX		0
> +#define GUID_IDX		1
> +#define BASE_IDX		2
> +#define SIZE_IDX		3
>  #define GET_ACCESS(v)		((v) & GENMASK(3, 0))
>  #define GET_TYPE(v)		(((v) & GENMASK(7, 4)) >> 4)
>  #define GET_VERSION(v)		(((v) & GENMASK(19, 16)) >> 16)
> @@ -208,10 +208,10 @@ static int pmt_crashlog_disabled(struct crashlog_entry *crashlog, bool *state)
>  
>  static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_type, u32 *version)
>  {
> -	u32 discovery_header = readl(entry->disc_table + CONTROL_OFFSET);
> +	u32 *disc_header = entry->disc_header;
>  
> -	*crash_type = GET_TYPE(discovery_header);
> -	*version = GET_VERSION(discovery_header);
> +	*crash_type = GET_TYPE(disc_header[ACCESS_IDX]);
> +	*version = GET_VERSION(disc_header[ACCESS_IDX]);
>  
>  	/*
>  	 * Currently we only recognize OOBMSM (type 1) and version 0 or 2
> @@ -608,15 +608,15 @@ static int pmt_crashlog_pre_decode(struct intel_vsec_device *ivdev,
>  static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
>  				      struct device *dev)
>  {
> -	void __iomem *disc_table = entry->disc_table;
>  	struct intel_pmt_header *header = &entry->header;
> +	u32 *disc_header = entry->disc_header;
>  
> -	header->access_type = GET_ACCESS(readl(disc_table));
> -	header->guid = readl(disc_table + GUID_OFFSET);
> -	header->base_offset = readl(disc_table + BASE_OFFSET);
> +	header->access_type = GET_ACCESS(disc_header[ACCESS_IDX]);
> +	header->guid = disc_header[GUID_IDX];
> +	header->base_offset = disc_header[BASE_IDX];
>  
>  	/* Size is measured in DWORDS, but accessor returns bytes */
> -	header->size = GET_SIZE(readl(disc_table + SIZE_OFFSET));
> +	header->size = GET_SIZE(disc_header[SIZE_IDX]);
>  
>  	return 0;
>  }
> -- 
> 2.43.0
> 
> 
Reviewed-by: David E. Box <david.e.box@linux.intel.com>
