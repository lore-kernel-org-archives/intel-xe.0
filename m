Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBC3CCF9FE
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 15:04:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFA210E2CF;
	Fri, 31 Oct 2025 15:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="edcdGh5u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2699210E2C8
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 15:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761923071; x=1793459071;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wcptltItczfeQKfxN336GsWtk6L7BebkxnyURIN/SdM=;
 b=edcdGh5uRK81PsA659eXixj+fFIAIoCxRExJ5X1bSEK/LVW5hLS2XfDd
 teLSRRnAM5ZZRIo7YrHw8Zhp6TzzQtuJ/BXGmJ3ET6JWTCU9laQMo0wWW
 1m/ISAU1/edjiU0GjQWavlAI0r1r1S9O2obrw8chcL1gtR2XQVVioV3VK
 Qk8yaqecddlGmgNYSAx/ESppm4N2faj52YLEoEz3TB1QENVwkZ8kH4M5+
 iRzl/Ctbr1M3sIxjSoYkpdMHhKgwjXCrOUQvtadRd02wOmlney6DOF9wF
 3QK2d02BBVwBdo0ahL8K2xACg+QggQ2pRIBK+HkSkU6Uo1EeP6D1OatP8 Q==;
X-CSE-ConnectionGUID: 8qCCZ+TwTqa7ReWVxFzn+w==
X-CSE-MsgGUID: TGIlYF6uRkaXsVAZqqZvJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="63289767"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="63289767"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 08:04:31 -0700
X-CSE-ConnectionGUID: gB8+1maYRfyk+EkHZ2a6Dg==
X-CSE-MsgGUID: jd7mN5DEQ8e70lOWR6FLdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="191396893"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 08:04:29 -0700
Date: Fri, 31 Oct 2025 16:04:26 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 badal.nilawar@intel.com
Subject: Re: [PATCH v8 3/4] drm/xe/pm: Assert on runtime suspend if VFs are
 enabled
Message-ID: <aQTP-gwfrwl_RGZP@black.igk.intel.com>
References: <20251030122357.128825-1-raag.jadav@intel.com>
 <20251030122357.128825-4-raag.jadav@intel.com>
 <3595815d-8324-4a0d-a6e6-ba5f332a3dd9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3595815d-8324-4a0d-a6e6-ba5f332a3dd9@intel.com>
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

On Thu, Oct 30, 2025 at 11:33:38AM -0700, Daniele Ceraolo Spurio wrote:
> On 10/30/2025 5:23 AM, Raag Jadav wrote:
> > We hold an additional reference to the runtime PM to keep PF in D0
> > during VFs lifetime, as our VFs do not implement the PM capability.
> > This means we should never be runtime suspending as long as VFs are
> > enabled.
> > 
> > v8: Add !IS_SRIOV_VF() assert (Matthew Brost)
> > 
> > Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> 
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Thank you.

So I'm guessing this series is good to go?

Raag

> > ---
> >   drivers/gpu/drm/xe/xe_pci.c | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 6e59642e7820..1c37f4d91047 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -1152,6 +1152,15 @@ static int xe_pci_runtime_suspend(struct device *dev)
> >   	struct xe_device *xe = pdev_to_xe_device(pdev);
> >   	int err;
> > +	/*
> > +	 * We hold an additional reference to the runtime PM to keep PF in D0
> > +	 * during VFs lifetime, as our VFs do not implement the PM capability.
> > +	 * This means we should never be runtime suspending as long as VFs are
> > +	 * enabled.
> > +	 */
> > +	xe_assert(xe, !IS_SRIOV_VF(xe));
> > +	xe_assert(xe, !pci_num_vf(pdev));
> > +
> >   	err = xe_pm_runtime_suspend(xe);
> >   	if (err)
> >   		return err;
> 
