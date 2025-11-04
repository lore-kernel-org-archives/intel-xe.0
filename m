Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3324ACCF9E3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 11:15:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C6A10E25A;
	Tue,  4 Nov 2025 11:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J0brVQbr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C5110E25A
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 11:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762254942; x=1793790942;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8+zL3cjLK+38rWXO46344fXklqinXMvJ5TGLLkcirXs=;
 b=J0brVQbr+7hTgTH9RbbDQBpvoy6xviBkR4vdAsbtloJJO58jm6hSSqMw
 UPw42V5PD+kYSePA8dZkA4wXNmzbOcQHxjgf05e1WjiuvbIopu8Z9TXlE
 IjNAyJTTagTEiffmYWJJ570QrhndgS5bHKA4O2aUs4atmSsBEI8HAJSvx
 8S0uTTvlyHw6+ZCx2ojEAeduSQDyen6gPVsl7cAD22PABTJ8VgDvyGD+/
 6y3urE1lQx/o0qwoaJvkoKA8jBFxJNuTALxtVk4MIuPUuFjcq93aQU2xH
 pw3spig06TecjgIfyBm7QPunbE+AdaIdVswB1ZAwW5XefGOuHK4Csdead g==;
X-CSE-ConnectionGUID: tmAEKUyKR0WdyAVUOGEAdg==
X-CSE-MsgGUID: Iei63XxKSrukxeDTz2ZFgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="68205733"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="68205733"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 03:15:41 -0800
X-CSE-ConnectionGUID: 8IwufL3bSZO+80WxyP3QzQ==
X-CSE-MsgGUID: BSLhBn+YShicmVQuXdEeWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="224383045"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 03:15:39 -0800
Date: Tue, 4 Nov 2025 12:15:36 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 badal.nilawar@intel.com
Subject: Re: [PATCH v8 3/4] drm/xe/pm: Assert on runtime suspend if VFs are
 enabled
Message-ID: <aQngWGvdywGYJZcT@black.igk.intel.com>
References: <20251030122357.128825-1-raag.jadav@intel.com>
 <20251030122357.128825-4-raag.jadav@intel.com>
 <3595815d-8324-4a0d-a6e6-ba5f332a3dd9@intel.com>
 <aQTP-gwfrwl_RGZP@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQTP-gwfrwl_RGZP@black.igk.intel.com>
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

On Fri, Oct 31, 2025 at 04:04:30PM +0100, Raag Jadav wrote:
> On Thu, Oct 30, 2025 at 11:33:38AM -0700, Daniele Ceraolo Spurio wrote:
> > On 10/30/2025 5:23 AM, Raag Jadav wrote:
> > > We hold an additional reference to the runtime PM to keep PF in D0
> > > during VFs lifetime, as our VFs do not implement the PM capability.
> > > This means we should never be runtime suspending as long as VFs are
> > > enabled.
> > > 
> > > v8: Add !IS_SRIOV_VF() assert (Matthew Brost)
> > > 
> > > Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > 
> > Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> Thank you.
> 
> So I'm guessing this series is good to go?

Or perhaps anything else I can do here?

Raag

> > > ---
> > >   drivers/gpu/drm/xe/xe_pci.c | 9 +++++++++
> > >   1 file changed, 9 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index 6e59642e7820..1c37f4d91047 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -1152,6 +1152,15 @@ static int xe_pci_runtime_suspend(struct device *dev)
> > >   	struct xe_device *xe = pdev_to_xe_device(pdev);
> > >   	int err;
> > > +	/*
> > > +	 * We hold an additional reference to the runtime PM to keep PF in D0
> > > +	 * during VFs lifetime, as our VFs do not implement the PM capability.
> > > +	 * This means we should never be runtime suspending as long as VFs are
> > > +	 * enabled.
> > > +	 */
> > > +	xe_assert(xe, !IS_SRIOV_VF(xe));
> > > +	xe_assert(xe, !pci_num_vf(pdev));
> > > +
> > >   	err = xe_pm_runtime_suspend(xe);
> > >   	if (err)
> > >   		return err;
> > 
