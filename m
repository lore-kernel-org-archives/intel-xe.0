Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0865606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 18:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nJiMuTDV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9535F10E65E;
	Tue, 17 Nov 2026 18:47:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F39610E011;
 Tue, 17 Nov 2026 18:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794941223; x=1826477223;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=I9+NaGjFv/jU9p99JCBJfpO8z9hGCvAxggVLzGFAdBY=;
 b=nJiMuTDVoTIs3i1TLJThhRpapBbdD70rqxKOSA7FjTT8iv9LB1Bk+D17
 MUKWyV8AepMgnFoJZNS/rmWPqdVGf+O74QCNFRzSPfM8r2pQEnXTumtMS
 I3Njh000Oet0v7LYWwvvczPyyOOO4GlaOehqzzHw3X5XdmC4VahbYTvxg
 aOWaiudSuAAqRUWNlyps6Ho8amOAnQ/uZXSED+mv73iTYXqHJsfR8Rscq
 nr8zMtoCSNHniiepk5WZmgNOQrhnEL10sb6lmq3Yp3JLe37/UUyYY/wCt
 whZPE6HOAZ0o4FPeSC6mlDQIIez4PHL2+SYEUN3JWkflDPfPX1n3kMP/l A==;
X-CSE-ConnectionGUID: +rYb3IjzR+26QJYYCGgHSw==
X-CSE-MsgGUID: ZQT7RE1rSDOHpspAhJAT2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3806482"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3806482"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 10:46:40 -0800
X-CSE-ConnectionGUID: LXx60YJ2TKuIK69jj6CpsA==
X-CSE-MsgGUID: ByFQUX0JQ72Vlha1ZxpaqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208";a="11638511"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.117])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 10:46:39 -0800
Date: Tue, 17 Nov 2026 20:46:35 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 7/7] drm/i915/dsb: Avoid redundant writes to the DSB
 buffer for indexed register writes
Message-ID: <avyhCx4my_lBzTyj@intel.com>
References: <20261116081041.6519-1-ville.syrjala@linux.intel.com>
 <20261116081041.6519-8-ville.syrjala@linux.intel.com>
 <a2cdb4b3495a62ecbfd8a9d3261c499098a60d38@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2cdb4b3495a62ecbfd8a9d3261c499098a60d38@intel.com>
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
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 06:05:08PM +0200, Jani Nikula wrote:
> On Mon, 16 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Currently each and every intel_dsb_reg_write_indexed() call
> > will store the new register count into the actual DSB buffer,
> > overwriting the previous count. Considering the LUT has
> > perhaps 1024 or more entries, that is a lot of redundant
> > writes into a buffer that may live in the local memory of a
> > discrete GPU.
> >
> > Defer storing the count until the final value is known,
> > that is when a completely new instruction is about to
> > be emitted.
> 
> Please remind me what guarantees there will be a new instruction, so
> that an unfinished buffer never gets to the DSB.
> 
> Maybe a word or two about that here, or in a comment near
> intel_dsb_ins_align() would be helpful for the more casual DSB folks...

Preparation of a DSB buffer must end with either intel_dsb_finish()
or intel_dsb_gosub_finish(). Each of those always calls
intel_dsb_align_tail() which in turn always calls intel_dsb_ins_align().

> 
> Other than that,
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> > Eliminating these and other redundant writes speeds up the
> > DSB buffer writes for a 1024 entry LUT update from ~75 usec
> > to ~45 usec on my DG2.
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dsb.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
> > index f7a54dc44894..057f0545bace 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
> > @@ -335,6 +335,10 @@ static bool intel_dsb_prev_ins_is_indexed_write(struct intel_dsb *dsb)
> >  
> >  static void intel_dsb_ins_align(struct intel_dsb *dsb)
> >  {
> > +	/* Store the final indexed register write count */
> > +	if (intel_dsb_prev_ins_is_indexed_write(dsb))
> > +		dsb_buffer_write(dsb, dsb->ins_start_offset + 0, dsb->ins[0]);
> > +
> >  	/*
> >  	 * Every instruction must be 8 byte aligned.
> >  	 * Indexed register writes may leave free_pos misaligned.
> > @@ -409,9 +413,12 @@ void intel_dsb_reg_write_indexed(struct intel_dsb *dsb,
> >  	if (!assert_dsb_has_room(dsb))
> >  		return;
> >  
> > -	/* Update the count */
> > +	/*
> > +	 * Update the count. The actual dsb_buffer_write()
> > +	 * is done from intel_dsb_ins_align() once the final
> > +	 * count is known.
> > +	 */
> >  	dsb->ins[0]++;
> > -	dsb_buffer_write(dsb, dsb->ins_start_offset + 0, dsb->ins[0]);
> >  
> >  	dsb_buffer_write(dsb, dsb->free_pos++, val);
> >  }
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
