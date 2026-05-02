Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BD8CD3427
	for <intel-xe@archiver.kernel.org>; Sat,  2 May 2026 17:55:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C092D10E2C3;
	Sat,  2 May 2026 17:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jQgFwCa8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B726C10E2C3
 for <intel-xe@lists.freedesktop.org>; Sat,  2 May 2026 17:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777744554; x=1809280554;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=j9GODIABf+JTEP1U2d13L7s9k0O3xP8BHyhFY0tJhGo=;
 b=jQgFwCa80oEDbicsT9rySYloH5AUFj+R/YXrUb3DJpZ0Q37FGuq0hGkP
 P4rAhaa5YcXri4pTwgFXGTGY3FHTydD5zZ6kaC9e8djKiFgM39Qufwa3a
 zQEV3LZh4z2h/j2sAl+yEjFsgYHP67oRVjvzjR5stF6uvXIyInYiw93bD
 19aZEx8KGy7yn1WO/5jM4emMOWR9QtKXkdGlylPTHds+VMLEH5Ckh8eS/
 IjuH4MmLk2HctSbYK29cV4T02x6Mhat1dG3LhA6Z2fvqZEh3q7qS90ySO
 +E3KPM78QzpAqyIkIS1tj+dmosca1qqjlaRAtWOo4COCcB35Jw/xx3sHP w==;
X-CSE-ConnectionGUID: Ta+kFEU9QMK1MgPocRPBaQ==
X-CSE-MsgGUID: k/cC1WL7TWC+bLTHwt2P9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="78602073"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; d="scan'208";a="78602073"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2026 10:55:53 -0700
X-CSE-ConnectionGUID: 6rq3eLLRQXG+BrCQReg6pw==
X-CSE-MsgGUID: ExM+NCPKQxyURZWH7i3+jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; d="scan'208";a="258489624"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2026 10:55:51 -0700
Date: Sat, 2 May 2026 19:55:48 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Cc: "Tauro, Riana" <riana.tauro@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "aravind.iddamsetty@linux.intel.com" <aravind.iddamsetty@linux.intel.com>,
 "Nilawar, Badal" <badal.nilawar@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>,
 "Koujalagi, Mallesh" <mallesh.koujalagi@intel.com>,
 "Purkait, Soham" <soham.purkait@intel.com>
Subject: Re: [PATCH v4 13/13] drm/xe/xe_pci_error: Process errors in
 mmio_enabled
Message-ID: <afY6pD47U8xLijeT@black.igk.intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-28-riana.tauro@intel.com>
 <BN9PR11MB5242107CE3AA04F2B27AC75895352@BN9PR11MB5242.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5242107CE3AA04F2B27AC75895352@BN9PR11MB5242.namprd11.prod.outlook.com>
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

On Thu, Apr 30, 2026 at 04:45:05PM +0530, Gupta, Anshuman wrote:
> > -----Original Message-----
> > From: Tauro, Riana <riana.tauro@intel.com>
> > 
> > Query system controller when any non fatal error occurs to check the type of
> > the error, contain and recover.
> > 
> > The system controller is queried in the mmio_enabled callback.

...

> > +/* Mapping of RAS recovery action to PCI error result */ static const
> > +pci_ers_result_t ras_recovery_action_to_pci_result[] = {
> > +	[XE_RAS_RECOVERY_ACTION_RECOVERED] =
> > PCI_ERS_RESULT_RECOVERED,
> > +	[XE_RAS_RECOVERY_ACTION_RESET] =
> > PCI_ERS_RESULT_NEED_RESET,
> > +	[XE_RAS_RECOVERY_ACTION_DISCONNECT] =
> > PCI_ERS_RESULT_DISCONNECT, };
> > +
> >  static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev,
> > pci_channel_state_t state)  {
> >  	struct xe_device *xe = pdev_to_xe_device(pdev); @@ -59,9 +67,13
> > @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev,
> > pci_channel_
> > 
> >  static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)  {
> > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > +	enum xe_ras_recovery_action action;
> > +
> >  	dev_err(&pdev->dev, "Xe Pci error recovery: MMIO enabled\n");
> > +	action = xe_ras_process_errors(xe);
> > 
> > -	return PCI_ERS_RESULT_NEED_RESET;
> > +	return ras_recovery_action_to_pci_result[action];
> Don't we need the array bound check for action ?
> Above review comment assisted by AI Tools.

We're not storing any meaningful data here, I'd rather use switch().

Raag
