Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F2DC36008
	for <intel-xe@archiver.kernel.org>; Sat, 29 Mar 2025 05:20:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13ED110E1AE;
	Sat, 29 Mar 2025 05:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JsDCJ6bJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D2010E1AE
 for <intel-xe@lists.freedesktop.org>; Sat, 29 Mar 2025 05:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743225644; x=1774761644;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=f+oPaSw57VYM7qbenomiYqiEDebS05HOHmwb6tRV+9M=;
 b=JsDCJ6bJlNZt8Mqp4FeEgmKKI++UGepUbrrmFiLI5TpoVO+nu+ZGEAsM
 NgO5JNsjUjUN4pWlHX44yut2Bn32fh5On10hg+AKOhsZfgPCEJZbEGtYy
 +N6Rr+QXv92OTwKArXAt+OVMoEFcaCfrJeb937CMcTUJjo28uH79K5BsE
 gz/t5cHy44235uLNUtwWjRLseX3pLe0T198IOOEjARE/lLm/MK4nK0E8e
 ObOSFJ7AIy2Yhu0Z8VUKhx/957PMSLFxMkEI38Q2H/JYtb8X/4Eu8rPo0
 dcoa05xxA+cKjz/MRo+gQkNjMu0Bt/YviVMYgh9th4+OwIQhjoIG/5YHu A==;
X-CSE-ConnectionGUID: zG/sJLhRRnGR4AP4XqVlXA==
X-CSE-MsgGUID: gBvnFbPWSO6E/+gcFJaq3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="54789950"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; d="scan'208";a="54789950"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 22:20:43 -0700
X-CSE-ConnectionGUID: OjcgCCcmQcqQWXG1tm4nTQ==
X-CSE-MsgGUID: dLLRZPsbRX+qnFVzOboDmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; d="scan'208";a="156552148"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 22:20:41 -0700
Date: Sat, 29 Mar 2025 07:20:37 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: "Nilawar, Badal" <badal.nilawar@intel.com>,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rafael.j.wysocki@intel.com
Subject: Re: [PATCH] drm/xe/d3cold: Set power state to D3Cold during s2idle/s3
Message-ID: <Z-eDJUtxjzIjGlJT@black.fi.intel.com>
References: <20250327161914.432552-1-badal.nilawar@intel.com>
 <8a514fa3-af9a-4b92-a6d3-3c6764b20a5e@intel.com>
 <Z-WHYbhu1QdjUFPR@intel.com> <Z-bICZUBN_Fk0_mM@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-bICZUBN_Fk0_mM@intel.com>
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

On Fri, Mar 28, 2025 at 12:02:17PM -0400, Rodrigo Vivi wrote:
> On Thu, Mar 27, 2025 at 01:14:09PM -0400, Rodrigo Vivi wrote:
> > On Thu, Mar 27, 2025 at 10:02:29PM +0530, Nilawar, Badal wrote:
> > > 
> > > On 27-03-2025 21:49, Badal Nilawar wrote:
> > > Hi Rodrigo,
> > > 
> > > > According to pci core guidelines, pci_save_config is recommended when the
> > > > driver explicitly needs to set the pci power state. As of now xe kmd is
> > > > only doing pci_save_config while entering to s2idle/s3 state, which makes
> > > > pci core think that device driver has already applied required pci power
> > > > state. This leads to GPU remain in D0 state. To fix the issue setting
> > > > the pci power state to D3Cold.
> > > > 
> > > > Fixes:dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > > Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_pci.c | 1 +
> > > >   1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > > index 7046e7e9a6c7..3317d475be79 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > @@ -932,6 +932,7 @@ static int xe_pci_suspend(struct device *dev)
> > > >   	pci_save_state(pdev);
> > > >   	pci_disable_device(pdev);
> > > > +	pci_set_power_state(pdev, PCI_D3cold);
> > > 
> > > Another approach to avoid calling pci_save_state and pci_set_power_state,
> > > allowing the PCI core to manage this.
> > > Currently, the above change aligns with the Xe RPM suspend flow.
> > 
> > Either way is fine it seems. Or we don't save the state and let pci subsystem
> > handle that for us or we save and set explicitly. So, let's move quickly
> > with this option here that is already fixing our current issue.

On our way to become another i915 now, are we?

While this might be a good enough band-aid, we should probably explore
how DPM_FLAG_SMART_* work and stop mixing/matching approaches to hide
issues.

Raag
