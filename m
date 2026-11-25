Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08B9606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 05:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QJT4Coqz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F3F10E71B;
	Wed, 25 Nov 2026 05:09:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B2810E71B
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 05:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795583350; x=1827119350;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dAKqVAS+lMBLwBm0o9EvyW1lb5OYU3ZDr6WpgZqvY/U=;
 b=QJT4Coqzs6Pv5/2MlvtzIfk1o+wGldCR8G7EBcNKrNlqFtCA0snd++Oh
 10MyoxQMtthWJFwe7EAVFBM17Axn/VmTyaBI4iHqNUN/PmbTUeKAoCQsv
 4X2hfs1zJHr6yJT3Ckrrrpty7DbJ8+frV6eOs4otp1G0vm06pQ70pYspV
 3fY9v94OwOVZzAc00UTBIBfzQ2hoDN1dB/GGe5VTxPosepem8qEr4yliO
 lMRHANKuM7/Mqx0crfgoXegoINnTwNc8jNPV0dx4EJwXW3+clibLKgo/R
 7m2E9GWl6IYF9jNEmm2wiNz91fYoA0ZzpvPgpsteWDKdy6xfUwP9eZ8ob w==;
X-CSE-ConnectionGUID: FQ2PpIEHQ/+D9pDztet+GA==
X-CSE-MsgGUID: rSKAaTbEQ4Ofcc7n2B06UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4505004"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4505004"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 21:09:09 -0800
X-CSE-ConnectionGUID: uXJ+FWy4TBO8aIvV9xsT1w==
X-CSE-MsgGUID: oLBuXffKR16q12o/FvWIeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="11756042"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 21:09:07 -0800
Date: Wed, 25 Nov 2026 06:09:04 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: Soham Purkait <soham.purkait@intel.com>, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 Koujalagi Mallesh <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH] drm/xe/ras: Handle SPI out of flash error
Message-ID: <awZtcN059EejoyJI@black.igk.intel.com>
References: <20261123070221.1611306-2-soham.purkait@intel.com>
 <c336f40a-457e-4a62-986c-376c153b535e@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c336f40a-457e-4a62-986c-376c153b535e@intel.com>
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 12:58:49PM +0530, Tauro, Riana wrote:
> On 23-11-2026 12:32, Soham Purkait wrote:
> > Wedge the device with an unknown recovery method if Page-Offline returns
> > OUT_OF_RESOURCES, or if the offline list is full at probe.

...

> > @@ -299,6 +301,11 @@ static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
> >   	if (ret) {
> >   		xe_log_err(xe, SYSCTRL, ret, "page offline command failed with status %u\n",
> >   			   response.status);
> > +		if (response.status == XE_RAS_STATUS_OUT_OF_RESOURCES) {
> > +			xe_log_err(xe, SYSCTRL, ret,
> > +				   "No space left in SPI flash for bad pages, manual intervention required\n");
> > +			xe_wedge_declare(xe, 0);
> 
> Why 0? Use the defined macros

Defined macros are for defined methods, which is the opposite of 'unknown'.
drm_dev_wedged_event() doc already explains this.

Raag
