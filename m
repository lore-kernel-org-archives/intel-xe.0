Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35869C61DD9
	for <intel-xe@archiver.kernel.org>; Sat, 29 Aug 2026 14:00:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8307D10E0A9;
	Sat, 29 Aug 2026 14:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MREFx4nD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E944510E0A9
 for <intel-xe@lists.freedesktop.org>; Sat, 29 Aug 2026 14:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788012038; x=1819548038;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xZnSMSWNXfhyMX7VWps+6XmYlFTvby85ycQhwhhAS+w=;
 b=MREFx4nD5Q0wSOvvl1fvsywZn74nJPC18xU5bBlc2CpGdsr3FxSF6D30
 noinBRhGYBUUMh67TMx7kgvLdLSt6K34RqVcsPZLOjvd2iSOi35bHGIo1
 32WGDpukXyvkZ3WHc17K6CbklqYpsxXfq94dtkz5VSTgCb7oKMAZdters
 irQX8YI2oMzFeMKKH7H1/9k427eqM+J0AlTjuiKqTtMCaAERjZIvFCCXw
 +fNJnT910CRYyIxAfvWoTkuqCDYKy4G/7RfnK80eG+GyrlVcXyV1bh3s+
 +sno3GgPJ1FdSVgMYb1dY+n1+58m/g5In9uR4cbb06VJs/oYJ5YKFOuhd Q==;
X-CSE-ConnectionGUID: v/Ysr9i9TnGGXfY+eSN36g==
X-CSE-MsgGUID: p9j8j9X5TbaVYAxagke7dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88418553"
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; d="scan'208";a="88418553"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2026 07:00:37 -0700
X-CSE-ConnectionGUID: sHhNx81YRXC4eDrxmGAfuQ==
X-CSE-MsgGUID: DTiAaG/pTXCxjEi7BImh1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; d="scan'208";a="268443779"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2026 07:00:35 -0700
Date: Sat, 29 Aug 2026 16:00:32 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Cc: "Tauro, Riana" <riana.tauro@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "aravind.iddamsetty@linux.intel.com" <aravind.iddamsetty@linux.intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/xe_pci_error: Wait for pcode init post SBR
Message-ID: <apLmAAKh4uQT629K@black.igk.intel.com>
References: <20260828113104.319843-4-riana.tauro@intel.com>
 <20260828113104.319843-5-riana.tauro@intel.com>
 <BN9PR11MB524232BB439BB10F87C48D2395AC2@BN9PR11MB5242.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB524232BB439BB10F87C48D2395AC2@BN9PR11MB5242.namprd11.prod.outlook.com>
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

On Fri, Aug 28, 2026 at 07:36:21PM +0530, Gupta, Anshuman wrote:
> From: Tauro, Riana <riana.tauro@intel.com>

...

> > @@ -109,6 +110,10 @@ static pci_ers_result_t
> > xe_pci_error_slot_reset(struct pci_dev *pdev)
> >  		return PCI_ERS_RESULT_DISCONNECT;
> >  	}
> > 
> > +	err = xe_pcode_probe_early(xe);
> This can be a 3-minute wait in worst case, after PCIe core pci_bridge_wait_for_secondary_bus() is already waited for 1 second*[1].
> What will be the impact on already running workload and any worker thread tries to access the mmio or PCIe bar here? 

I think a more important question is, should we even get a callback
if SGUnit isn't ready yet and what PCI spec says about this?

Raag

> [1]
> /*
>  * Devices may extend the 1 sec period through Request Retry Status
>  * completions (PCIe r6.0 sec 2.3.1).  The spec does not provide an upper
>  * limit, but 60 sec ought to be enough for any device to become
>  * responsive.
>  */
> #define PCIE_RESET_READY_POLL_MS 60000 /* msec */
