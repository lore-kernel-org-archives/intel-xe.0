Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C800FCE7B1F
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 14:53:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D52E10EA9C;
	Fri, 14 Nov 2025 14:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C5BTc38V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959C310EA9C
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 14:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763132000; x=1794668000;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UBFDOASV7wsinpbYHR87zDyOyxJYL+dRPpIhhrDt7vE=;
 b=C5BTc38V1ejKLtDqw7k5wVekwpXFZgE2aZkh2jbTnBesvilGfiy5Bp+6
 0mD0Ee9oaRFJz6Fyy3rS9Auy8V0mQtHJ7S6zm7wR4NmX366ooxlIn5grM
 oJ43g4+ifobOdSSVn7TWQyufYn8iBqI8SkIb4e0sDL2Bf5GI9snEUaDyl
 ICZDhRKYYPRZFaCTsImjY/G5XiBhwuuiRSPUB9+u6XssFURwti7b6JMa0
 cFB2ZaDXc+SeaNIDjR7Iukj7ZzTzQdlLLCBRw1JQCNqlO1yJpAvA2lLCI
 YL2BayLYFhIKbNFfUSE++Ld8hjko1LkfWwjHOD/u7QhgOW3QD+xKIyGYr Q==;
X-CSE-ConnectionGUID: FT4lo3gVSLaFHvhgzJGy+w==
X-CSE-MsgGUID: 9h0YZ4TRS/CAdsm/sCLtuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="75545412"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="75545412"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 06:53:19 -0800
X-CSE-ConnectionGUID: IYAgfmHvQ4ifSEndXkfwlA==
X-CSE-MsgGUID: 6HdP8roiQNCBtjLDWZWv0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="193898974"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 06:53:18 -0800
Date: Fri, 14 Nov 2025 15:53:14 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 badal.nilawar@intel.com
Subject: Re: [PATCH v8 3/4] drm/xe/pm: Assert on runtime suspend if VFs are
 enabled
Message-ID: <aRdCWjY30dkUnH-I@black.igk.intel.com>
References: <20251030122357.128825-1-raag.jadav@intel.com>
 <20251030122357.128825-4-raag.jadav@intel.com>
 <3595815d-8324-4a0d-a6e6-ba5f332a3dd9@intel.com>
 <aQTP-gwfrwl_RGZP@black.igk.intel.com>
 <aQngWGvdywGYJZcT@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQngWGvdywGYJZcT@black.igk.intel.com>
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

On Tue, Nov 04, 2025 at 12:15:41PM +0100, Raag Jadav wrote:
> On Fri, Oct 31, 2025 at 04:04:30PM +0100, Raag Jadav wrote:
> > On Thu, Oct 30, 2025 at 11:33:38AM -0700, Daniele Ceraolo Spurio wrote:
> > > On 10/30/2025 5:23 AM, Raag Jadav wrote:
> > > > We hold an additional reference to the runtime PM to keep PF in D0
> > > > during VFs lifetime, as our VFs do not implement the PM capability.
> > > > This means we should never be runtime suspending as long as VFs are
> > > > enabled.
> > > > 
> > > > v8: Add !IS_SRIOV_VF() assert (Matthew Brost)
> > > > 
> > > > Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > 
> > > Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > 
> > Thank you.
> > 
> > So I'm guessing this series is good to go?
> 
> Or perhaps anything else I can do here?

Is this still on the cards by any chance?

Raag

> > > > ---
> > > >   drivers/gpu/drm/xe/xe_pci.c | 9 +++++++++
> > > >   1 file changed, 9 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > > index 6e59642e7820..1c37f4d91047 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > @@ -1152,6 +1152,15 @@ static int xe_pci_runtime_suspend(struct device *dev)
> > > >   	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > >   	int err;
> > > > +	/*
> > > > +	 * We hold an additional reference to the runtime PM to keep PF in D0
> > > > +	 * during VFs lifetime, as our VFs do not implement the PM capability.
> > > > +	 * This means we should never be runtime suspending as long as VFs are
> > > > +	 * enabled.
> > > > +	 */
> > > > +	xe_assert(xe, !IS_SRIOV_VF(xe));
> > > > +	xe_assert(xe, !pci_num_vf(pdev));
> > > > +
> > > >   	err = xe_pm_runtime_suspend(xe);
> > > >   	if (err)
> > > >   		return err;
> > > 
