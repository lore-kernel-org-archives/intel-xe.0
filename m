Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DF2606A335
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 18:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a308hrNa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0BA10F2AE;
	Tue, 17 Nov 2026 18:41:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85E010F2AE;
 Tue, 17 Nov 2026 18:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794940890; x=1826476890;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZHhvUFCHDJJjP6SYE0mDz1oF3OPRNB1U/WKX626/w3M=;
 b=a308hrNaxODBMXhfzDbAEK7IMN9KLWnY2fOLppGtmRj+VqTso6FzB1u9
 jDdbqCuFxXIWmxfZpMfNi2ngZhEOvoQXFTJrOWSnqS/E1cuPjE/bKg72z
 uZInF0HwnvQ/NjQgliWmbXCWrh2G2sq5vmeT/Oa+/uaNIGu9ujT+hvfkx
 TlOaf3optg/YeM5A5ot7gLoupF02W2jjPfDcJBaD/bWjn+GzhWXHDMhIL
 6reqeVxoghmvqftOTaXN0ALMa9o3kogiPuFvwiuLW+Td8WurV+XoEoDb+
 /ewxo9HmZnw9Ac0FEX1HEK93ZOqdzzSsNUfCmP5lPzi8va3GCuvRZLHa+ g==;
X-CSE-ConnectionGUID: F6bfbhABTQK/1gGet8IPyA==
X-CSE-MsgGUID: np7DuzOiRI2slfFokL6Njw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3609285"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3609285"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 10:41:30 -0800
X-CSE-ConnectionGUID: DYlCUEtbSDGJPy2fKbUUMw==
X-CSE-MsgGUID: ot0gQxsyQ+SE3aATyVVEpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9849670"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.117])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 10:41:28 -0800
Date: Tue, 17 Nov 2026 20:41:24 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 5/7] drm/i915/dsb: Update previous instruction tracking
 in intel_dsb_align_tail() & co.
Message-ID: <avyf1MMGU1uDRARb@intel.com>
References: <20261116081041.6519-1-ville.syrjala@linux.intel.com>
 <20261116081041.6519-6-ville.syrjala@linux.intel.com>
 <7d90df4bf575d83be6b34824d3a40d07fa5d10d2@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d90df4bf575d83be6b34824d3a40d07fa5d10d2@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 06:07:15PM +0200, Jani Nikula wrote:
> On Mon, 16 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > intel_dsb_align_tail() and intel_dsb_gosub_align() simply memset
> > a bunch of QWs to 0. What that actually does is emit a bunch of
> > NOOP instructions. For complete correctness let's keep the
> > previous instruction tracking up to date, instead of leaving
> > it pointing at whatever instruction preceded the alignment
> > NOOPs.
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dsb.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
> > index 75f98b31c780..f8ca64a3c076 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
> > @@ -601,6 +601,8 @@ static void intel_dsb_align_tail(struct intel_dsb *dsb)
> >  	if (aligned_tail > tail) {
> >  		dsb_buffer_fill(dsb, dsb->free_pos, 0, aligned_tail - tail);
> >  		dsb->free_pos = aligned_tail / 4;
> > +
> > +		intel_dsb_set_ins(dsb, dsb->free_pos - 2, 0, 0);
> 
> So is this just the last two NOOPs?

free_pos is in DW units, each instruction is 2 DWs. So this just points
at the last NOOP emitted as alignment.

> 
> BR,
> Jani.
> 
> >  	}
> >  }
> >  
> > @@ -624,6 +626,8 @@ static void intel_dsb_gosub_align(struct intel_dsb *dsb)
> >  	if (aligned_tail - tail <= 2 * 8) {
> >  		dsb_buffer_fill(dsb, dsb->free_pos, 0, aligned_tail - tail);
> >  		dsb->free_pos = aligned_tail / 4;
> > +
> > +		intel_dsb_set_ins(dsb, dsb->free_pos - 2, 0, 0);
> >  	}
> >  }
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
