Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788CACCD183
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 17:31:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E6D10EAC9;
	Thu,  9 Oct 2025 17:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aj/l5Yhp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E8EE10EAC9
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 17:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760031115; x=1791567115;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Z81TfXrw3R2OjaqxfI4ObZMIg6eSTP/XTdH/pvF9zVs=;
 b=Aj/l5YhpQi747TOK8JDISfwdXrHKBUHLAzAeJCJRhWB0BJFxa6ztr+Fv
 FSl5AvIBy0eIF2EYBRrMUEzWzOUrrr90K03yWFQEBQ2Bku45Pf1gyjIMX
 i3VNRu1U/EyJuPokI36Gnz6zLhDSSve28ePWo7Gh9lhTmgnm7gxNMiwKx
 hf0X95yMITUnZvtSU42Ac0mPV7srJKLnhndAM9Zsd7gmF3IGFxXQ8FJYb
 xIpg8cA4Quh/IFxKcowRiQz6LTzBU0Puw8hKNCrWey/PHNMmDZLznPfRh
 gkJjsLuHvMe8HSM6yxspM7J1BtwZVDMxuMpWlHaWKNlzuMpHUOW8i/RP7 Q==;
X-CSE-ConnectionGUID: gck/x8ZzRrqIZgqOzQATJQ==
X-CSE-MsgGUID: /WedAjWcTT2ODg8h3RQFUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="87709852"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="87709852"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 10:31:55 -0700
X-CSE-ConnectionGUID: eAtH9BLiS9+tFqQadHz4Dg==
X-CSE-MsgGUID: odBxQz1aQ5GnVbTrUbXeGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="186026347"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 10:31:53 -0700
Date: Thu, 9 Oct 2025 19:31:50 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com
Subject: Re: [PATCH v2 0/2] Wire up reset/postinstall for I2C IRQ
Message-ID: <aOfxhkPwesLREWff@black.igk.intel.com>
References: <20251009070304.3210101-1-raag.jadav@intel.com>
 <aOe71Yj-o6QFFXaU@black.igk.intel.com>
 <bkkwks7j546u7qskxobxdd6xjohupriruopviuxog4hig37a7t@g7otn7xly3yw>
 <aOfGAA0GrT0JGMTR@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOfGAA0GrT0JGMTR@intel.com>
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

On Thu, Oct 09, 2025 at 10:26:08AM -0400, Rodrigo Vivi wrote:
> On Thu, Oct 09, 2025 at 09:15:37AM -0500, Lucas De Marchi wrote:
> > On Thu, Oct 09, 2025 at 03:42:45PM +0200, Raag Jadav wrote:
> > > On Thu, Oct 09, 2025 at 12:33:02PM +0530, Raag Jadav wrote:
> > > > This series wires up reset/postinstall handles for I2C IRQ so that it
> > > > can be routed to SGunit or PUnit when needed.
> > > 
> > > Please hold on to this series while I resolve a few queries with the
> > > architecture.
> > 
> > you caught me between applying and pushing :-o. I will wait further
> > updates here for the push.
> 
> similarly here... I typed "dim b4-shazam", then I opened here again to get the
> message-id in the header and noticed this msg :)

Turns out DISABLE_MSI_CAP actually means something else than what the
spec says about it and not required here for the usecase.

Let me send out a v3 with final changes.

Raag

> > > > v2: Integrate DISABLE_MSI_CAP changes (Heikki)
> > > > 
> > > > Raag Jadav (2):
> > > >   drm/xe/i2c: Introduce xe_i2c_irq_present()
> > > >   drm/xe/i2c: Wire up reset/postinstall for I2C IRQ
> > > > 
> > > >  drivers/gpu/drm/xe/regs/xe_i2c_regs.h |  4 ++++
> > > >  drivers/gpu/drm/xe/xe_i2c.c           | 28 ++++++++++++++++++++++++++-
> > > >  drivers/gpu/drm/xe/xe_i2c.h           |  4 ++++
> > > >  drivers/gpu/drm/xe/xe_irq.c           |  2 ++
> > > >  4 files changed, 37 insertions(+), 1 deletion(-)
> > > > 
> > > > --
> > > > 2.34.1
> > > > 
