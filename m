Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C458FF8867
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 04:34:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E1A10EE55;
	Wed, 29 Apr 2026 04:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hiPU57Of";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A4910EE55
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 04:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777437242; x=1808973242;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4Gz67uPJffht+JI7FSJV5q6x7qnOvlsouUyTYii0j30=;
 b=hiPU57Of54AkkmURQaftQCT10O6k7L6sLYVt4xrOA9OAQopi6xxDAiDo
 jsXodpxMHE9eBWLU7qj5Gah2KLf/nMc9DjNnn1tmWWBoq+5eJIv1wVoZZ
 Usfo/ITN0NH6HzRonYypW/dlMgWtnV9RIAdPuB0n7fClHgtqxgcUvqiHZ
 nt7+6G9iFeAdsTsA9OhbddaDqe4q4/Ss1lrQYBBKscChsDdMfh+G7p3J9
 eR1mgKtYGo41FqsFYeZN4lCaZsmpccZpZ2kwS+y3zsfQ4jcYUKTpttKsa
 2TJW1tnEObaOpXWdGYHmNCfJam7GBLD2trgspwHncs9cBX3g8aP8IVJHW g==;
X-CSE-ConnectionGUID: KQcvZJ86Saqb6nYirRkoIQ==
X-CSE-MsgGUID: mm4RLfTETkqUJCLQRQsp2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78343271"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="78343271"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 21:34:01 -0700
X-CSE-ConnectionGUID: qy8EI5mDT5C5lbd41MqSYw==
X-CSE-MsgGUID: f4ifp2k1RyWThcmaTrL/mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="234129055"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 21:33:58 -0700
Date: Wed, 29 Apr 2026 06:33:55 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, michal.winiarski@intel.com,
 matthew.auld@intel.com, maarten@lankhorst.se, jani.nikula@intel.com,
 lukasz.laguna@intel.com, zhanjun.dong@intel.com, lukas@wunner.de,
 badal.nilawar@intel.com
Subject: Re: [PATCH v6 8/8] drm/xe/pci: Introduce PCIe FLR
Message-ID: <afGKM1bKyORzPzJ-@black.igk.intel.com>
References: <20260423100017.1051587-1-raag.jadav@intel.com>
 <20260423100017.1051587-9-raag.jadav@intel.com>
 <2de7d34d-6f47-4327-9290-7cebfd47a69d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2de7d34d-6f47-4327-9290-7cebfd47a69d@intel.com>
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

On Tue, Apr 28, 2026 at 04:28:15PM -0700, Daniele Ceraolo Spurio wrote:
> <snip>
> 
> I haven't gone through the code yet, but I wanted to ask some questions
> regarding the approach first.

Sure.

> > +
> > +/**
> > + * DOC: PCI Error Handling
> > + *
> > + * Xe driver registers PCI callbacks which are called by PCI core in case of
> > + * bus errors or resets.
> > + *
> > + * Currently only PCI Function Level Reset (FLR) callbacks are supported. Since
> > + * most of the Endpoint Function state is lost on PCIe FLR, the flow is pretty
> > + * much similar to system suspend/resume flow with a few notable exceptions.
> 
> IMO we need a couple of lines to describe what the impact of FLR is on the
> HW. Something like:
> 
> "PCI FLR clears VRAM and resets the state of all the HW units. Therefore,
> the contents of all exec queues and BOs in VRAM are lost and the HW needs a
> full re-init".

Makes sense.

> > + *
> > + * Prepare phase:
> > + * - Temporarily wedge the device to prevent userspace access
> 
> I'm not convinced that wedging is the correct approach here, because the
> expectation from the apps POV is that wedging is permanent, so they won't
> try again later. Maybe we can have a separate flr_in_progress flag and
> return something like -EBUSY or -EAGAIN when the FLR is in progress?

This was my initial plan but during implementation I realized that much
of the code paths that need handling based new flag are already handled
by wedged flag. Like IOCTLs, dummy page faulting, GT reset worker, GuC
submission, GuC PC and TLB invalidation corner cases, SRIOV races and so
on. So I decided to reuse it here.

In my understand wedging is permanent only when we choose to send the
uevent and expect device recovery from userspace, which IIUC we're not.
So I hope that's okay?

> > + * - Stop accepting new submissions
> 
> This is done as part of the above step and it isn't a separate one, right?

We explicitly xe_guc_submit_disable() inside flr_prepare() so I thought it
was worth spelling out. Will drop.

> > + * - Kill exec queues which signals all fences and frees in-flight jobs
> > + * - Skip memory eviction due to untrustworthy VRAM contents
> 
> Note that the VRAM contents are not necessarily untrustworthy at this points
> since the FLR hasn't happened yet. However, if the admin is triggering an
> FLR it is likely that something is broken (whether memory, GuC, GT or
> something else), so we shouldn't try to touch the HW anyway.

Yes, that's what I meant here but your phrasing is better. Will update.

> > + * - Remove all memory mappings since VRAM contents will be lost
> 
> Dumb question, but what happens if a userspace app has an object mapped and
> they try to access it from the CPU after this step?

I'm not much familiar with MM parts but from what I understand it'll
cause a fault which should be redirected to dummy page. I've tried to
handle it with commit c020fff70d75 but I'm not sure if that's sufficient.
This is why I've marked MM corner cases as TODO.

> > + *
> > + * Re-initialization phase:
> > + * - Recreate kernel bos due to skipped eviction in prepare phase
> > + * - Restore kernel queues which were killed in prepare phase
> > + * - Reload all uC firmwares
> > + * - Bring up GT and unwedge to allow userspace access
> > + *
> > + * Since VRAM contents are lost, the user is expected to recreate user memory
> > + * and reload context.
> 
> How is the user expected to realize that they need to re-create their BOs? A
> queue can be killed for different reasons and normally that doesn't imply
> that any associated BO is now invalid.

We return -ECANCELED if wedged flag is set and the dummy page data will
read all 0s. This would be the indication to the application that it needs
to recreate user memory and reload context.

Raag

> > + *
> > + * TODO: Add PCIe error handling callbacks using similar flow.
> > + *
> > + * Current implementation is only limited to re-initializing GT.
> > + * This needs to be extended for a lot of components listed below.
> > + *
> > + * - Proper re-initialization of GSC and PXP for integrated platforms
> > + * - SRIOV cases which need synchronization between PF and VF
> > + * - Re-initialization of all child devices of Xe
> > + * - User memory handling and MM corner cases
> > + * - Display
> > + */
> > +
> > 
> 
