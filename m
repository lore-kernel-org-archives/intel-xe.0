Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D133CD3424
	for <intel-xe@archiver.kernel.org>; Sat,  2 May 2026 07:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F4210E11B;
	Sat,  2 May 2026 07:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WnDAjczY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77EFD10E11B
 for <intel-xe@lists.freedesktop.org>; Sat,  2 May 2026 07:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777707674; x=1809243674;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tiTqcWpe0aIKoxJLcPXAtrYN6McUtzbZgjZM7xeHS9A=;
 b=WnDAjczYYz3mymsCUb/dn1PnL3d1EnlwVD8uaMYJZ+GI8QAsRseCtFIr
 XMer7WFDOOdNBOgFMMBtpG5FG9vQv2NaJbkDQhbzdbp/ltFj0lcOdXCbM
 i9n06B9Zlw61GAyK8F0EmUzIxYxeAyutozVnmQcsimRe6ZTQScf9HfzOb
 4qQKszsSCol1xPP+GjrRqYWfCModuOcSMMNtzb70FZvRYNRU5UlPwsVAl
 YqE04ccylUlOK+8LJB/SzUuOnAs+v7QAiT4I3lhSbb97J6ith7DwPLLly
 N+jK2eVobGqbRHXVm0ah8gnQ45cB+VdUm3ybz5Bsf68sIen7R80ZNAN0t w==;
X-CSE-ConnectionGUID: ddRrjNM2TlefczxNDHyMnA==
X-CSE-MsgGUID: X1aMpOTnQbStTDRi7FZtZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="77677570"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; d="scan'208";a="77677570"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2026 00:41:14 -0700
X-CSE-ConnectionGUID: 7XDJDq22QdOVEyViw6XDxw==
X-CSE-MsgGUID: Am3SKXB2QPWOwEEZ+kmjUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; d="scan'208";a="258664397"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2026 00:41:10 -0700
Date: Sat, 2 May 2026 09:41:07 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com,
 maarten@lankhorst.se, jani.nikula@intel.com,
 lukasz.laguna@intel.com, zhanjun.dong@intel.com, lukas@wunner.de,
 badal.nilawar@intel.com
Subject: Re: [PATCH v6 8/8] drm/xe/pci: Introduce PCIe FLR
Message-ID: <afWqkw063tUekzLQ@black.igk.intel.com>
References: <20260423100017.1051587-1-raag.jadav@intel.com>
 <20260423100017.1051587-9-raag.jadav@intel.com>
 <2de7d34d-6f47-4327-9290-7cebfd47a69d@intel.com>
 <afGKM1bKyORzPzJ-@black.igk.intel.com> <afIwQWRZyZqM2lWl@intel.com>
 <16ed12a2-bcbe-4569-9be2-1fb3d3faa66d@intel.com>
 <afPCSglJC3E0e_Zh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afPCSglJC3E0e_Zh@intel.com>
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

On Thu, Apr 30, 2026 at 04:57:46PM -0400, Rodrigo Vivi wrote:
> On Wed, Apr 29, 2026 at 10:57:53AM -0700, Daniele Ceraolo Spurio wrote:
> > On 4/29/2026 9:22 AM, Rodrigo Vivi wrote:
> > > On Wed, Apr 29, 2026 at 06:33:55AM +0200, Raag Jadav wrote:
> > > > On Tue, Apr 28, 2026 at 04:28:15PM -0700, Daniele Ceraolo Spurio wrote:
> > > > > <snip>
> > > > > 
> > > > > I haven't gone through the code yet, but I wanted to ask some questions
> > > > > regarding the approach first.
> > > > Sure.
> > > > 
> > > > > > +
> > > > > > +/**
> > > > > > + * DOC: PCI Error Handling
> > > > > > + *
> > > > > > + * Xe driver registers PCI callbacks which are called by PCI core in case of
> > > > > > + * bus errors or resets.
> > > > > > + *
> > > > > > + * Currently only PCI Function Level Reset (FLR) callbacks are supported. Since
> > > > > > + * most of the Endpoint Function state is lost on PCIe FLR, the flow is pretty
> > > > > > + * much similar to system suspend/resume flow with a few notable exceptions.
> > > > > IMO we need a couple of lines to describe what the impact of FLR is on the
> > > > > HW. Something like:
> > > > > 
> > > > > "PCI FLR clears VRAM and resets the state of all the HW units. Therefore,
> > > > > the contents of all exec queues and BOs in VRAM are lost and the HW needs a
> > > > > full re-init".
> > > > Makes sense.
> > > > 
> > > > > > + *
> > > > > > + * Prepare phase:
> > > > > > + * - Temporarily wedge the device to prevent userspace access
> > > > > I'm not convinced that wedging is the correct approach here, because the
> > > > > expectation from the apps POV is that wedging is permanent, so they won't
> > > > > try again later. Maybe we can have a separate flr_in_progress flag and
> > > > > return something like -EBUSY or -EAGAIN when the FLR is in progress?
> > > > This was my initial plan but during implementation I realized that much
> > > > of the code paths that need handling based new flag are already handled
> > > > by wedged flag. Like IOCTLs, dummy page faulting, GT reset worker, GuC
> > > > submission, GuC PC and TLB invalidation corner cases, SRIOV races and so
> > > > on. So I decided to reuse it here.
> > > > 
> > > > In my understand wedging is permanent only when we choose to send the
> > > > uevent and expect device recovery from userspace, which IIUC we're not.
> > > > So I hope that's okay?
> > > Right, it should be okay.
> > > 
> > > But we have 2 different users on top.
> > > 
> > > Runtime (NEO/Level0-core and Apps):
> > > 
> > > UMDs will send DEVICE_LOST to application in the case of any kind of reset.
> > > Nothing prevents App to go and try it again. It will just receive error.
> > > 
> > > Admin (Level0-sysman and XPUManager):
> > > 
> > > As Raag told, to them it is only permanent if we ask for help through the
> > > wedge uevent hints. Otherwise they should still be able to re-enumerate
> > > the devices whenever needed.
> > 
> > Those are very specific to server use-cases. While that's what we're
> > currently implementing FLR for, there might be other use-cases in the future
> > that require us to implement this on the client side (there is already at
> > least one case where we wedge but we could instead recover via
> > driver-triggered FLR), where the apps can be less curated.
> > 
> > I'm a bit lost on how a random app is supposed to tell the difference
> > between temporary and permanent wedges if they get a DEVICE_LOST error in
> > both cases. Are we expecting all apps to register to the uevent? Or are the
> > UMD drivers expected to return a different code if the wedge is permanent?
> > Because I don't think that an app should just keep trying again non-stop.
> 
> Thomas had a proposal with watch queue where we could pass UMD some different
> error codes in different situations so UMD could perhaps handle different cases
> in different ways.

+1, or we can simply hook this up to WEDGED=none (which IIRC AMD is already
doing).

Raag

> But as of now they have no different ways of handling things. They send
> DEVICE_LOST to the application. Application can be reinitialized or not.
> Nothing there states that device is lost forever at the same time that
> nothing is done to restart the application automatically. It is up to
> the user to restart things over when they need/want to.
> 
> > 
> > > 
> > > > > > + * - Stop accepting new submissions
> > > > > This is done as part of the above step and it isn't a separate one, right?
> > > > We explicitly xe_guc_submit_disable() inside flr_prepare() so I thought it
> > > > was worth spelling out. Will drop.
> > 
> > Maybe instead of dropping it, reword it as "stop all submissions to the
> > GuC".
> > 
> > > > 
> > > > > > + * - Kill exec queues which signals all fences and frees in-flight jobs
> > > > > > + * - Skip memory eviction due to untrustworthy VRAM contents
> > > > > Note that the VRAM contents are not necessarily untrustworthy at this points
> > > > > since the FLR hasn't happened yet. However, if the admin is triggering an
> > > > > FLR it is likely that something is broken (whether memory, GuC, GT or
> > > > > something else), so we shouldn't try to touch the HW anyway.
> > > > Yes, that's what I meant here but your phrasing is better. Will update.
> > > > 
> > > > > > + * - Remove all memory mappings since VRAM contents will be lost
> > > > > Dumb question, but what happens if a userspace app has an object mapped and
> > > > > they try to access it from the CPU after this step?
> > > > I'm not much familiar with MM parts but from what I understand it'll
> > > > cause a fault which should be redirected to dummy page. I've tried to
> > > > handle it with commit c020fff70d75 but I'm not sure if that's sufficient.
> > > > This is why I've marked MM corner cases as TODO.
> > 
> > AFAICS that patch only redirects to dummy page while the wedged flag is set.
> > What happens after the FLR is completed and we've removed the wedged flag?
> > If we've dropped the mapping to the memory, where is that access going to
> > go?
> > 
> > > > 
> > > > > > + *
> > > > > > + * Re-initialization phase:
> > > > > > + * - Recreate kernel bos due to skipped eviction in prepare phase
> > > > > > + * - Restore kernel queues which were killed in prepare phase
> > > > > > + * - Reload all uC firmwares
> > > > > > + * - Bring up GT and unwedge to allow userspace access
> > > > > > + *
> > > > > > + * Since VRAM contents are lost, the user is expected to recreate user memory
> > > > > > + * and reload context.
> > > > > How is the user expected to realize that they need to re-create their BOs? A
> > > > > queue can be killed for different reasons and normally that doesn't imply
> > > > > that any associated BO is now invalid.
> > > > We return -ECANCELED if wedged flag is set and the dummy page data will
> > > > read all 0s. This would be the indication to the application that it needs
> > > > to recreate user memory and reload context.
> > 
> > Applications don't usually check their memory to see if it is still good.
> > Are we expecting them to start doing this? or are we expecting all memory to
> > get thrown out every time an application gets an -ECANCELED error?
> > In either case I'd like an ack from the UMD teams on this.
> > 
> > Daniele
> > 
> > > > 
> > > > Raag
> > > > 
> > > > > > + *
> > > > > > + * TODO: Add PCIe error handling callbacks using similar flow.
> > > > > > + *
> > > > > > + * Current implementation is only limited to re-initializing GT.
> > > > > > + * This needs to be extended for a lot of components listed below.
> > > > > > + *
> > > > > > + * - Proper re-initialization of GSC and PXP for integrated platforms
> > > > > > + * - SRIOV cases which need synchronization between PF and VF
> > > > > > + * - Re-initialization of all child devices of Xe
> > > > > > + * - User memory handling and MM corner cases
> > > > > > + * - Display
> > > > > > + */
> > > > > > +
> > > > > > 
> > 
