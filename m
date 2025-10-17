Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D24CCD1A2
	for <intel-xe@archiver.kernel.org>; Sat, 18 Oct 2025 02:46:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C5410E2E9;
	Sat, 18 Oct 2025 02:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8eupDOd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE4310E1DC
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Oct 2025 02:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760755567; x=1792291567;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RwxMYik0M/3po6X0vOCWJlIbaM7gngrG1DJAqsU9Irw=;
 b=B8eupDOdoQQmtPVYKWzwlp41lfsRA8y5rU+/71RhWCKJQMZGaE3k01S5
 vmjIM7ehtd2RrHclpqH8f7irpSJauDSKzp7YNx7uipuv+KyZU4vnayRHf
 W2+m0Vmonwv2eEsDtnqYPV3ngYvaQ7k+/O6SuP1XzBuNzs0tBS+v64DeH
 c9qwlMdY7Pkdyb+W4oincdoPgL06weA2LoRODeZonNETCEMASeMu/4g0C
 PLtkZ4RROCNvkiwAj94Pv7vyTJiWfx6SAhiB0kOKpzm4gdidGOl9O2G8f
 WMpp0fCXlILjf93WxpPcZDKICrg1QMoB+uK9N0TfA13lYKC9H2s24XBM9 g==;
X-CSE-ConnectionGUID: 5r/VNpixQgqI2awtgG6irA==
X-CSE-MsgGUID: iRoHPhFsRkOLmISCKmyBqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="63012454"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="63012454"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 19:46:07 -0700
X-CSE-ConnectionGUID: 4GqI2FrMSkKfCcZVx1hk8w==
X-CSE-MsgGUID: DMsLV33wTNKw2URqGRZgsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; d="scan'208";a="213399209"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.129])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 11:09:38 -0700
Date: Fri, 17 Oct 2025 21:09:34 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v3 23/24] drm/xe/xe3p_xpc: Setup PAT table
Message-ID: <aPKGXgfglFFi6uog@intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
 <20251016-xe3p-v3-23-3dd173a3097a@intel.com>
 <aPIjEfXpEQKjewIS@intel.com>
 <20251017171811.GV5409@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251017171811.GV5409@mdroper-desk1.amr.corp.intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Fri, Oct 17, 2025 at 10:18:11AM -0700, Matt Roper wrote:
> On Fri, Oct 17, 2025 at 02:05:53PM +0300, Ville Syrjälä wrote:
> > On Thu, Oct 16, 2025 at 07:26:42PM -0700, Lucas De Marchi wrote:
> > > From: Matt Roper <matthew.d.roper@intel.com>
> > > 
> > > Xe3p_XPC IP requires a new PAT table; note that this table has one fewer
> > > column than the Xe2/Xe3 tables since compression is not supported.
> > > There's also no "WT" entry (which we wouldn't have used on a platform
> > > without display anyway).
> > > 
> > > Bspec: 71582
> > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pat.c | 96 ++++++++++++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 95 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> > > index 6e48ff84ad0a0..7649b554942aa 100644
> > > --- a/drivers/gpu/drm/xe/xe_pat.c
> > > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > > @@ -154,6 +154,41 @@ static const struct xe_pat_table_entry xe2_pat_table[] = {
> > >  static const struct xe_pat_table_entry xe2_pat_ats = XE2_PAT( 0, 0, 0, 0, 3, 3 );
> > >  static const struct xe_pat_table_entry xe2_pat_pta = XE2_PAT( 0, 0, 0, 0, 3, 0 );
> > >  
> > > +/*
> > > + * Xe3p_XPC PAT table uses the same layout as Xe2/Xe3, except that there's no
> > > + * option for compression.  Also note that the "L3" and "L4" register fields
> > > + * actually control L2 and L3 cache respectively on this platform.
> > > + */
> > > +#define XE3P_XPC_PAT(no_promote, l3clos, l3_policy, l4_policy, __coh_mode) \
> > > +	XE2_PAT(no_promote, 0, l3clos, l3_policy, l4_policy, __coh_mode)
> > > +
> > > +static const struct xe_pat_table_entry xe3p_xpc_pat_ats = XE3P_XPC_PAT( 0, 0, 0, 0, 3 );
> > > +static const struct xe_pat_table_entry xe3p_xpc_pat_pta = XE3P_XPC_PAT( 0, 0, 0, 0, 0 );
> > > +
> > > +static const struct xe_pat_table_entry xe3p_xpc_pat_table[] = {
> > > +	[ 0] = XE3P_XPC_PAT( 0, 0, 0, 0, 0 ),
> > > +	[ 1] = XE3P_XPC_PAT( 0, 0, 0, 0, 2 ),
> > > +	[ 2] = XE3P_XPC_PAT( 0, 0, 0, 0, 3 ),
> > > +	[ 3] = XE3P_XPC_PAT( 0, 0, 3, 3, 0 ),
> > > +	[ 4] = XE3P_XPC_PAT( 0, 0, 3, 3, 2 ),
> > > +	[ 5] = XE3P_XPC_PAT( 0, 0, 3, 0, 0 ),
> > > +	[ 6] = XE3P_XPC_PAT( 0, 0, 3, 0, 2 ),
> > > +	[ 7] = XE3P_XPC_PAT( 0, 0, 3, 0, 3 ),
> > > +	[ 8] = XE3P_XPC_PAT( 0, 0, 0, 3, 0 ),
> > > +	[ 9] = XE3P_XPC_PAT( 0, 0, 0, 3, 2 ),
> > > +	[10] = XE3P_XPC_PAT( 0, 0, 0, 3, 3 ),
> > > +	/* 11..22 are reserved; leave set to all 0's */
> > > +	[23] = XE3P_XPC_PAT( 0, 1, 0, 0, 0 ),
> > > +	[24] = XE3P_XPC_PAT( 0, 1, 0, 0, 2 ),
> > > +	[25] = XE3P_XPC_PAT( 0, 1, 0, 0, 3 ),
> > > +	[26] = XE3P_XPC_PAT( 0, 2, 0, 0, 0 ),
> > > +	[27] = XE3P_XPC_PAT( 0, 2, 0, 0, 2 ),
> > > +	[28] = XE3P_XPC_PAT( 0, 2, 0, 0, 3 ),
> > > +	[29] = XE3P_XPC_PAT( 0, 3, 0, 0, 0 ),
> > > +	[30] = XE3P_XPC_PAT( 0, 3, 0, 0, 2 ),
> > > +	[31] = XE3P_XPC_PAT( 0, 3, 0, 0, 3 ),
> > 
> > Why did we go from human readable names to raw magic numbers?
> > This is now completely illegible.
> 
> For Xe2/Xe3 I think it's actually a lot easier to read since we have a
> kerneldoc right above the tables explaining exactly what each column
> represents:
> 
>  """
>  * The Xe2 table is getting large/complicated so it's easier to review if
>  * provided in a form that exactly matches the bspec's formatting.  The meaning
>  * of the fields here are:
>  *   - no_promote:  0=promotable, 1=no promote
>  *   - comp_en:     0=disable, 1=enable
>  *   - l3clos:      L3 class of service (0-3)
>  *   - l3_policy:   0=WB, 1=XD ("WB - Transient Display"), 3=UC
>  *   - l4_policy:   0=WB, 1=WT, 3=UC
>  *   - coh_mode:    0=no snoop, 2=1-way coherent, 3=2-way coherent
>  """

I don't like counting colums by hand. I would just like to look
at a row and understand what it means. With this thing that is
not possible without taking notes.

> 
> Trying to write out symbolic names like we did on i915 became pretty
> illegible due to the long/wrapping lines since we have so many fields
> now.

If wrapping is making a mess then don't wrap. I think people have big
enough screens that we can tolerate longs lines for something like this.

> It also became a nightmare to maintain since it was easy to make
> mistakes (and also easy to overlook them in code review).  This approach
> gives us something that exactly matches the presentation of the table in
> the bspec (so easier to add/modify without making mistakes, easier to
> review for correctness),

Except when the tables in the bspec are wrong you have to actually
debug this, like I did recently wrt. the CCS AUX screwups. 

Though even i915 wasn't fully using human reaadable names (eg.
some 0 values were basically just omitted). I have patch to 
also give those proper names, which I should probably clean
up and send out.

> and a key in the comments that makes it really
> easy to quickly understand the specific characteristics that relate to
> each row.
> 
> For Xe3p_XPC, we should probably duplicate that comment block (minus the
> "comp_en" field that's not relevant here) since we lost a field compared
> to the Xe2/Xe3 tables.

I think the only way the comment would actually help if it would
be directly above the table, and the comments would line up
properly with the colums of the table. Now the comment is too
far away (it's documenting the macro, not the table). And the
comment is using rows rather than the columns the actual table
is using, so there is a 90 degree rotation you have to perform
in your head all the time which is a pain.

Though even with the comments lining up with the colums you'd still
have to jump through extra hoops to figure out what eg. a magic '3'
means in a specific column. So still not the best solution IMO.

-- 
Ville Syrjälä
Intel
