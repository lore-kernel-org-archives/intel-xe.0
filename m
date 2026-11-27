Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3833606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 15:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GFTUQbYT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98FBA10E1E0;
	Fri, 27 Nov 2026 15:13:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822F010E1E0;
 Fri, 27 Nov 2026 15:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795792404; x=1827328404;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9MqdemRAzr1vs9ozsfac2pCLaxhENKDgyXyhxIoh9Vo=;
 b=GFTUQbYTa5cPh6bq3aEC1zlbFHdeYWBn8tu25SLu+cnpq7MvxFistkm1
 s0fOeLha9GypW2Sm5PVGE0VLC+J6jgDqisSCORP3844nCNA8L7v/26dif
 XlP3izs4lhdrqAl3MepOaa+QEXcuOp+xo1IgoDAdHvuhDrXYn5YVBWZ+Z
 qe31XHGsKyY9Sz20Yyx07aG3hvsMudoDFEEHN7x9XvJYsQ4BNgsENKu1e
 klLHs9nydZXj28eEUGAxDb+CPYwrObvSYx8Injt4KWuD7UxPvB3ERUwdb
 0Vdam+Um30onb8ztWimxoGJsi6duyMI1ciLsAcnwNNjqbcYTeUV4cElCN A==;
X-CSE-ConnectionGUID: cL+Wl6mcS56OTUQ+SZd6Ag==
X-CSE-MsgGUID: VyC9IJkDS3+783ASPJtcKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4698071"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4698071"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 07:13:24 -0800
X-CSE-ConnectionGUID: 9zLGTHlOQWqvdLv53DHzRg==
X-CSE-MsgGUID: qe6mIt7ERfeTWovhz/9zmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; d="scan'208";a="12739413"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 07:13:22 -0800
Date: Fri, 27 Nov 2026 17:13:18 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 13/13] drm/i915: Add more vertical timing diagrams
Message-ID: <awmeDlxhpzOsqpba@intel.com>
References: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
 <20261023165803.31016-14-ville.syrjala@linux.intel.com>
 <75e1eff1-0710-4712-83f4-07db32c2cf94@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75e1eff1-0710-4712-83f4-07db32c2cf94@intel.com>
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

On Fri, Nov 27, 2026 at 11:36:59AM +0530, Nautiyal, Ankit K wrote:
> 
> On 10/23/2026 10:28 PM, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Document what's going in the vertical blank interval on all
> > platforms. We already have one diagram, but that also includes
> > details on the frame counter vs. pixel counter differences and
> > whatnot, and so would probably get even messier if we added
> > more to it. So create a new set of simpler diagrams. We basically
> > have four different timing generator behaviors, add a diagram
> > for each.
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >   drivers/gpu/drm/i915/display/intel_vblank.c | 50 +++++++++++++++++++++
> >   1 file changed, 50 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
> > index 084f6aaea61d..d93a78cea9cc 100644
> > --- a/drivers/gpu/drm/i915/display/intel_vblank.c
> > +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
> > @@ -68,6 +68,56 @@
> >    *   of horizontal active on the first line of vertical active
> >    */
> >   
> > +/*
> > + * Overview of vertical timings:
> > + *
> > + * Legacy timing generator (pre-TGL):
> > + * ... vactive |    vblank   | vactive ...
> > + *             | "guardband" |
> > + *             | FSD |
> > + *             ^     ^
> > + *             |     frame start (vblank interrupt on gen2/3)
> > + *             vblank
> > + *
> > + * Legacy timing generator (TGL+):
> > + * ... vactive |         vblank         | vactive ...
> > + *             | window 2 | "guardband" |
> > + *             |   SCL    | FSD |
> > + *             ^          ^     ^
> > + *             |          |     frame start
> > + *             |          delayed vblank
> > + *             undelayed vblank
> > + *
> > + * VRR timing generator (ICL):
> > + * ... vactive |               vblank               | vactive ...
> > + *             | window 1 | VRR stretch | guardband |
> > + *                                      | FSD |
> > + *                                      ^     ^
> > + *                                      |     frame start
> > + *                                      vblank
> > + *
> > + * VRR timing generator (TGL-LNL):
> > + * ... vactive |                    vblank                     | vactive ...
> > + *             | window 1 | VRR stretch | window 2 | guardband |
> > + *                                      |   SCL    | FSD |
> > + *             |    DSB safe window     |
> > + *             ^                                   ^     ^
> > + *             |                                   |     frame start
> > + *             undelayed vblank                    delayed vblank
> > + *
> > + * VRR timing generator (PTL+):
> > + * ... vactive |                    vblank                     | vactive ...
> > + *             | window 1 | VRR stretch | window 2 | guardband |
> > + *    |  SCL   |                        |   SCL    | FSD |
> > + *    |         DSB safe window         |
> > + *             ^                                   ^     ^
> > + *             |                                   |     frame start
> > + *             undelayed vblank                    delayed vblank
> > + *
> > + * SCL = set context latency
> > + * FSD = frame start delay
> > + */
> 
> Perhaps good to mention: on ICL/TGL guardband was called pipeline_full?

I suppose a note about that might be in order.

> 
> Can we also document the wait_for_vblank and DSB chicken bits behaviour, 
> something like:
> 
>   * VRR timing generator (PTL+):
>   * ... vactive |                    vblank                     | 
> vactive ...
>   *             | window 1 | VRR stretch | window 2 | guardband |
>   *    |  SCL   |                        |   SCL    | FSD |
>   *    |         DSB safe window         |
>   *    |        ^                                   ^     ^
>   *    |        |                                   |     frame start
>   *    |        undelayed vblank                    delayed vblank
>   *    ^
>   *    |
>   *   wait_for_vblank ends here (DSB chicken bits redirect it to the 
> safe window)

Hmm. Maybe just an extra note at the end?
Something like this perhaps?

When DSB_CHICKEN is configured to wait for vblank, the signal
is edge triggered on the undelayed vblank. When DSB_CHICKEN
is configured to wait for safe window, the signal is level
triggered on the entire DSB safe window period.

> 
> 
> But even without above suggestions, the diagrams LGTM.
> 
> I had a very primitive diagram in my scratchpad. This is better.
> 
> 
> Reviewed-by: Ankit Nautiyal ankit.k.nautiyal@intel.com
> 
> 
> > +
> >   /*
> >    * Called from drm generic code, passed a 'crtc', which we use as a pipe index.
> >    */

-- 
Ville Syrjälä
Intel
