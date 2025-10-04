Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CA6CAC5B0
	for <intel-xe@archiver.kernel.org>; Sat,  4 Oct 2025 06:39:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD5710E152;
	Sat,  4 Oct 2025 06:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CR6cJ95F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E7B10E152
 for <intel-xe@lists.freedesktop.org>; Sat,  4 Oct 2025 06:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759559984; x=1791095984;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PCUvhrFuXvvmRK3w/DksxH7eDn9h6u38uuTMqGchY6g=;
 b=CR6cJ95Fko3e7jvGF0HUMSTvbqG3Ri5nPHb5GYFWmbvp2tOQkzMCkfJZ
 xQa/5l4BdTtiv+i4/D/R4V+5CKIUy+cpsulCtbGWmZK2fhgdhhryJI2Fw
 9nhDMdWPtOH8F8iCHWY8jUZ47XaSuDUyNV6IATJPmLUM6dpjF/+x+go+O
 zo9Bf07Wwtl5HehBsDH333j7nFquR8Yt4hq0B5UvHX12ve3BT6ZdFMU+M
 jE/6EaFLxE0JyGO6ejSCqfvah6adISdUVbGVFskudlvHAcoiRnd/Fyy++
 xHFBHApsLxUp95LvVs0IP/dDNEYq4nFwBjBHtUD0a7OljX6qrwEPVqNDZ Q==;
X-CSE-ConnectionGUID: NlRW0hXhTU64h3RQN6Hj/Q==
X-CSE-MsgGUID: 84iDCdJ8Q1SERsXkVP2tiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61747516"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61747516"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 23:39:44 -0700
X-CSE-ConnectionGUID: AxgTnbuRSeKYiLIdjwlazA==
X-CSE-MsgGUID: hKu6P1PIQbiudruEaG5PJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; d="scan'208";a="210135177"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 23:39:41 -0700
Date: Sat, 4 Oct 2025 08:39:38 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com
Subject: Re: [PATCH v4 2/2] drm/xe/gt: Introduce runtime suspend/resume
Message-ID: <aODBKmSDEBPHPNCl@black.igk.intel.com>
References: <20250904091439.2279352-1-raag.jadav@intel.com>
 <20250904091439.2279352-3-raag.jadav@intel.com>
 <6659c13b-666a-4a57-8a31-f123f9ce932c@intel.com>
 <aN6mz1Ongl9uNDwM@black.igk.intel.com>
 <23a6bff4-a2c3-4d5c-8937-f3e97588f422@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23a6bff4-a2c3-4d5c-8937-f3e97588f422@intel.com>
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

On Thu, Oct 02, 2025 at 09:53:21AM -0700, Daniele Ceraolo Spurio wrote:
> <snip>
> > > > +	xe_guc_ct_runtime_suspend(&guc->ct);
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_guc_runtime_resume() - GuC runtime resume
> > > > + * @guc: The GuC object
> > > > + *
> > > > + * Runtime resume GuC CT and allow further runs of submission tasks on
> > > > + * given GuC.
> > > > + */
> > > > +void xe_guc_runtime_resume(struct xe_guc *guc)
> > > > +{
> > > > +	guc_enable_irq(guc);
> > > I don't think that this is a valid function to call in a VF (but will leave
> > > the final judgement to Michal).
> > I think commit 14fcd7361ed1 covers those cases?
> 
> I'm not familiar with the PM subsystem, so apologies if this is a dumb
> question, but what is the exact consequence of that patch?
> 
> 1 - runtime suspend/resume functions for VFs are not called at all for VFs,
> even when the PF runtime suspends.
> or
> 2 - runtime suspend/resume functions for VFs are called only when the PF
> runtime suspends.
> 
> If it is #1, are we saying that on VF it is fine to not call
> xe_guc_runtime_suspend/resume? and if so, why is this required on native/PF?
> None of the operations done in those functions are PF-specific, apart from
> the irq stuff.
> If it is #2, then you still have the problem of not being able to call
> guc_enable_irq on VFs.
> 
> Or am I misunderstanding something?

I remember reading somewhere that our VFs reflect power state of their
associated PF, and what commit 14fcd7361ed1 essentially does is prevents
runtime PM from being enabled for VFs so that runtime_suspend/resume()
handles don't execute at all for VFs.

But this is my limited understanding and perhaps Michal can confirm this.

Raag
