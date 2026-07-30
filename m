Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974CBC55165
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 13:50:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BB810EED2;
	Thu, 30 Jul 2026 13:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ReLtCR2f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAC910EED2
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 13:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785419447; x=1816955447;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8z8pe+eCr4BpRnh1r+j/asTAwPs8PS60+utE+tNiCVM=;
 b=ReLtCR2fT9+SSGPcJePuDJMLpNmPNQrDYjSb/RILTxXLoKdUEc+ONwhf
 4/VNq+VQkxShfAAXmVrajsnWcPfIHEqOmSF7MqOYgg/3YMmAD2zN7cnkp
 av48TeApcFUULLjijBcDQimRuKWtakdOhMSu9nuLTKPIOmnVrjLlN2Tub
 5w1puZIenvxTyjet5yhxQ8hdACoSZm8EOEwCbKa1JP93QkrDjnlnF+PVw
 UYkRHb0gO4lkO7GBpNeeozFPjo2C324c2ERWxx9jEGdDwlWavGJ4gmBVm
 b7vNmC1lbdZGhJbYZQwdv0CPCrkmIfTuUtcoayBdQcLv46to31yzRXy4+ A==;
X-CSE-ConnectionGUID: h/ii5vZKT1qcIbkvz2QRjQ==
X-CSE-MsgGUID: OHP0m/GuRVyzNkhUdNn0Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86116479"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="86116479"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 06:50:47 -0700
X-CSE-ConnectionGUID: wIEuKfqZQ/udfmcj9QpafA==
X-CSE-MsgGUID: EaIgFfBrRIO4+QX0irdljQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="259735692"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 06:50:44 -0700
Date: Thu, 30 Jul 2026 15:50:41 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH v2 00/22] drm/xe: Add structured SIGID error logging
 infrastructure
Message-ID: <amtWsQMoiyxk6H4k@black.igk.intel.com>
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
 <dfe82413d317aee8bd39dbbc45ece77f9b6d7610@intel.com>
 <amqhoFzQaf1HsuFq@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amqhoFzQaf1HsuFq@intel.com>
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

On Wed, Jul 29, 2026 at 08:58:08PM -0400, Rodrigo Vivi wrote:
> On Wed, Jul 29, 2026 at 11:31:46AM +0300, Jani Nikula wrote:
> > On Tue, 28 Jul 2026, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> > > Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
> > > strings that have no stable shape. That is readable for a human, but it
> > > gives fleet tooling nothing durable to match on: the wording changes
> > > between releases, lines can be rate-limited or dropped under an error
> > > storm, and there is no consistent way to ask "which recognised fault
> > > just happened?".
> > >
> > > Introduce a signature identifier (SIGID): a small, stable integer that
> > > names one recognised Xe fault situation and serves as the primary handle
> > > for triage. A SIGID maps, through published end-user documentation, to a
> > > description and a recommended action; the driver only has to emit the
> > > right SIGID next to the usual human-readable text.
> > >
> > > Design decisions:
> > >
> > >  - Software-emitted signatures only. This header enumerates just the
> > >    situations the driver detects and reports itself. Signatures that
> > >    originate in firmware or hardware are identified by those layers (via
> > >    their own records/counters) and are logged as received -- minting a
> > >    driver-side id for them would duplicate an id the reporting layer
> > >    already owns.
> > >
> > >  - Flat catalogue, chosen per report site. Each site emits the single
> > >    most specific situation for that site, so a multi-layer failure
> > >    produces a chain of reports rather than one ambiguous classification
> > >    (e.g. a failed GT reset reports GT_TDR and then WEDGED). A site that
> > >    matches no defined situation keeps using ordinary xe_err() /
> > >    xe_gt_err() rather than forcing a wrong id.
> > >
> > >  - Stable numbering. A single flat list numbered sequentially from 1, in
> > >    introduction order. Values are only ever appended, never renumbered
> > >    or reused.
> > >
> > >  - First-order action. Each SIGID carries a coarse, in-tree resolution
> > >    bucket (COLLECT / RETRY / UPDATE / RECOVER) so it is actionable
> > >    without an external reference, and so every new id must declare what
> > >    to do about it.
> > >
> > >  - Severity is decoupled from the SIGID and chosen at the call site via
> > >    xe_ras_log_fatal() / _recoverable() / _info(); the same situation can
> > >    be reported at different severities depending on the instance.
> > >
> > >  - dmesg stays close to a normal xe error line by reusing xe_err() /
> > >    xe_gt_err() (and their Tile/GT decoration); the only stable,
> > >    machine-matchable token added is SIGID=<n>. dmesg is not an ABI --
> > >    the durable machine record is the CPER carrying the same SIGID (a
> > >    planned follow-up, left as a TODO).
> > >
> > > Wire up a representative site for each software signature so the set is
> > > exercised rather than merely declared:
> > >
> > >  - PROBE: xe workqueue allocation failure during early init
> > >  - WEDGED: xe_device_declare_wedged() (drop redundant "CRITICAL" + BDF)
> > >  - SURVIVABILITY: entering boot survivability mode
> > >  - RUNTIME_FW: GuC mmio request failure
> > >  - DEVICE_FW: PCODE mailbox failure
> > >  - GT_TDR: GT reset failure (which then chains into a WEDGED report)
> > >  - MEM_FAULT: page-fault queue overflow
> > >  - IO_BUS: PCI re-enable failure after a bus reset
> > 
> > The idea is not new, see for example [1] and [2]. I'm not sure if that
> > was ever merged, though. Would be good to know what came of it, and why.
> > 
> > There's also the printk index support already in the kernel [3]. Did you
> > look into that? If not, please do. If yes, please iterate why that can't
> > be used, or extended, and a local mechanism is required.
> 
> Well, I do agree with your feeling here. When this request first came to us,
> it was framed similarly to the two older proposals you referenced.
> I pushed back making it very clear that our kernel log is not an ABI and
> it will never be... that our debug messages are for our own developers to
> consume and edit as the code evolves. So, I refused and blocked any
> attempt to modify all the messages and force them to follow this format.
> 
> So, this evolved a bit since. I hope. We have agreed that the ABI itself
> is not the dmesg, but the CPER that is emitted on tracefs... that's the
> ultimate goal. The message here is just an extra helper and it brings
> both our CPER/tracefs and the dmesg helper. So, the printk index cannot
> be used here. It has no mechanism to influence or annotate what goes
> into CPER records. And even if we modified it, its volatile number
> doesn't work with the CPER goals.
> 
> The goal is to have this SIGID mostly identifying FW/HW stuff and a few
> of the key points that could help providing a guidance/map to a recovery
> path. With an intentionally narrow scope.

So why not stick to a specific interface instead kernel logs having to
bare the burden here? CI results are already full of noise, so it's a
bit unclear how this makes developers' life any easier. I now have to
figure out all the macros before reaching to the point of failure :)

Raag
