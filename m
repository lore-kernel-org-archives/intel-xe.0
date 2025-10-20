Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F8DCCD199
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 11:48:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2601710E29A;
	Mon, 20 Oct 2025 11:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mvB8HUmy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E34910E29A
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 11:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760960911; x=1792496911;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8nS5/weLj3rmZYO+iOQ+0rPavaoOf1ks/3R1cboeYm8=;
 b=mvB8HUmy9YT571PcLmbtdfqiuxdN21NVSme+mZbhXNTmrJF1yZw/rqjs
 EGk0q94mzR0JG3+/xkFgEhTAm789jOSqTJel1h14cTN1nCjXyh0cC9SaS
 aCs0wcO8r1hDFNAb2tdN4HDEAPRKhwwphV1/iBPGZ59uAPL6sRQWIvxas
 nZeDvpXuc84uPuzbIi02mpnoRjyr3H9zZsmYn2c4eBwxpaxYvZUVBet5G
 f4Bk/rReRXmGf6Ny7/oweLB/wy4eZWSP6zYZgae2mxcRHzP5IVPTixmXz
 BNy9d3vGrsQdQjgFrMpIe/V63WkOX2gIPFB1Uys7jJjJW0jmy7rQzIvLy g==;
X-CSE-ConnectionGUID: p16jj62cTc+/pY50MfuZjg==
X-CSE-MsgGUID: R9T/TT6/SwiUYGxM+uSBKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62982154"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="62982154"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 04:48:31 -0700
X-CSE-ConnectionGUID: YKNG9wFBRXSPrPNJV94c2Q==
X-CSE-MsgGUID: NAE3cl+jS/ekCY/NWqABDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="183257297"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 04:48:29 -0700
Date: Mon, 20 Oct 2025 13:48:26 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 riana.tauro@intel.com, michal.wajdeczko@intel.com
Subject: Re: [PATCH v5 2/2] drm/xe/gt: Introduce runtime suspend/resume
Message-ID: <aPYhinOaJJmMpv3a@black.igk.intel.com>
References: <20251014073036.3282329-1-raag.jadav@intel.com>
 <20251014073036.3282329-3-raag.jadav@intel.com>
 <1aa6c0b4-73fd-4603-b414-802b4e15442a@intel.com>
 <aPE7oYJa037sxbaU@lstrano-desk.jf.intel.com>
 <4bc0b037-ae4a-49fe-a379-a9aec25ef42d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bc0b037-ae4a-49fe-a379-a9aec25ef42d@intel.com>
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

On Thu, Oct 16, 2025 at 11:47:40AM -0700, Daniele Ceraolo Spurio wrote:
> On 10/16/2025 11:38 AM, Matthew Brost wrote:
> > On Thu, Oct 16, 2025 at 08:32:23AM -0700, Daniele Ceraolo Spurio wrote:
> > > On 10/14/2025 12:30 AM, Raag Jadav wrote:
> > > > If power state is retained between suspend/resume cycle, we don't need
> > > > to perform full GT re-initialization. Introduce runtime helpers for GT
> > > > which greatly reduce suspend/resume delay.
> > > > 
> > > > v2: Drop redundant xe_gt_sanitize() and xe_guc_ct_stop() (Daniele)
> > > >       Use runtime naming for guc helpers (Daniele)
> > > > v3: Drop redundant logging, add kernel doc (Michal)
> > > >       Use runtime naming for ct helpers (Michal)
> > > > v4: Fix tags (Rodrigo)
> > > > v5: Include host_l2_vram workaround (Daniele)
> > > >       Reuse xe_guc_submit_enable/disable() helpers (Daniele)
> > > Based on the reply about VF behavior in the previous rev, I am thinking this
> > > is not the correct approach to this.
> > > If on a VF the runtime_suspend/resume functions are not called at all like
> > > you said, it means that the VF driver needs to be able to cope with the fact
> > > that the HW can lose power without it being directly notified if its rpm
> > > refcount is 0. This in turn means that on a VF the driver can't rely on what
> > > you do in xe_uc_runtime_suspend/resume() to idle the state and must instead
> > > guarantee that the state is already idled when the last rpm ref is released
> > > and that a new rpm ref is taken before restarting anything (which might
> > > already be true). AFAIK there are no difference in the SW state management
> > > of queues and CTBs between PF and VF, so if we achieve that on a VF we'll
> > > also have it on PF/Native, which means that there will be no need to
> > > pause/unpause CTBs and exec_queues. The only thing that the PF would need to
> > > do in the rpm flow is program the HW (e.g. the host_l2_vram stuff and the
> > > irq re-enabling).
> > > 
> > > tl;dr, if we guarantee that:
> > > 1 - if the rpm refcount is 0 then there is no activity on HW, so nothing
> > > that needs to be paused (which might already be true)
> > > 2 - an rpm ref is taken before any activity is started (which might also
> > > already be true)
> > > 
> > > Then we're guaranteeing that there is nothing to pause/unpause at runtime
> > > suspend/resume time, so we're safe skipping those calls entirely on VF while
> > > on native/PF we can just focus on the HW re-programming.
> > > 
> > > BTW, any idea how this is working with the current code? Given that we're
> > > re-loading the GuC on runtime resume, are the VFs getting disconnected and
> > VFs hold a RPM ref. See pf_enable_vfs in xe_pci_sriov.c.
> 
> Ok, so we just can never do runtime pm if there are VFs active and my
> concerns about VF rpm behavior are void. Thanks for clarifying. It might be
> worth adding an assert to the runtime suspend/resume functions to make sure
> this is documented there as well and not just in the SRIOV code.

Would you prefer xe_assert() or drm_WARN()?

> I think that we should still investigate if we actually do need to call
> pause/unpause on runtime suspend or if we're already covered by the rpm
> refs, because we might end up being able to actually turn on rpm for VFs,
> but we can do that as a follow up step and go ahead with the approach in
> this patch first.

Raag
