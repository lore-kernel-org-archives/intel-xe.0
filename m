Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF16B1062871
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 12:05:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE1810E8DA;
	Wed, 11 Mar 2026 12:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lXOX7HNq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D02110E8DA;
 Wed, 11 Mar 2026 12:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773230703; x=1804766703;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=k/A6/GUtD/M2h8iuUnvhJ6Yx+Yxg/7kxxyhViUFPFnI=;
 b=lXOX7HNqaJd3iIav2wPTFcM+/RaGKYd/FlHZm2RW46dKVtSGEqmMVNQY
 R4BlmcGrsPrazFSxaBMgOb+NGepmb2PDga/woLGm/v1UrFUYC9cYbZ0/p
 urRkeCH/V4hnt22qgeX4idFNEDh2/aHaP4U31S3XrvEAjOYgLgvbzFpxd
 FS2v0FZn2IhQK/p286gZyY3zXewhZroQsE4zGMv/gCg8jSd5XOspqel/G
 xJIhNYTauf2jQBEcoxXMLTO2j4M1kXLEozosomn6tYPoL2rw2jd5k/Xvs
 tp4ikYZJKxC+URVXmaZSmxhIgh0fLRpa6Bd7uuaaeHJ/cnULQZ14MLw/6 Q==;
X-CSE-ConnectionGUID: HXTKME1pSdiliptrNz8fAw==
X-CSE-MsgGUID: wUihK7k1QkSymOU7oXhrhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="84620134"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="84620134"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 05:04:18 -0700
X-CSE-ConnectionGUID: sTLndukeS6eoGHz2q2BSwQ==
X-CSE-MsgGUID: XmSR4olQSuSYrjZmyBre3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="250946816"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.252])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 05:04:16 -0700
Date: Wed, 11 Mar 2026 14:04:13 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 arun.r.murthy@intel.com
Subject: Re: [PATCH 3/5] drm/i915/dp: Add helper for AS SDP TL and fix
 documentation
Message-ID: <abFaPftPmvwGPXkD@intel.com>
References: <20260305040118.2576312-1-ankit.k.nautiyal@intel.com>
 <20260305040118.2576312-4-ankit.k.nautiyal@intel.com>
 <aarCQYHTCCEKtB2R@intel.com> <aa_fhRxsFcftI2Nv@intel.com>
 <270d9647-7238-4d78-a942-d45ea846b763@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <270d9647-7238-4d78-a942-d45ea846b763@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Wed, Mar 11, 2026 at 05:24:22PM +0530, Nautiyal, Ankit K wrote:
> 
> On 3/10/2026 2:38 PM, Ville Syrjälä wrote:
> > On Fri, Mar 06, 2026 at 02:02:09PM +0200, Ville Syrjälä wrote:
> >> On Thu, Mar 05, 2026 at 09:31:16AM +0530, Ankit Nautiyal wrote:
> >>> Add a helper, intel_dp_emp_as_sdp_tl(), to compute the EMP_AS_SDP_TL
> >>> value used when programming the double‑buffering point and transmission
> >>> line for VRR packets.
> >>> Also improve the documentation: the AS SDP transmission line corresponds
> >>> to the T1 position, which maps to the start of the Vsync pulse.
> >>>
> >>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> >>> ---
> >>>   drivers/gpu/drm/i915/display/intel_dp.c  | 9 +++++++++
> >>>   drivers/gpu/drm/i915/display/intel_dp.h  | 1 +
> >>>   drivers/gpu/drm/i915/display/intel_vrr.c | 4 ++--
> >>>   3 files changed, 12 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> >>> index 86390553800d..9204a813639a 100644
> >>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> >>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> >>> @@ -7288,6 +7288,15 @@ bool intel_dp_joiner_candidate_valid(struct intel_connector *connector,
> >>>   	return true;
> >>>   }
> >>>   
> >>> +int intel_dp_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state)
> >>> +{
> >>> +	/*
> >>> +	 * EMP_AS_SDP_TL defines the T1 position : The default AS SDP position
> >>> +	 * that corresponds to the start of the Vsync pulse.
> >>> +	 */
> >>> +	return crtc_state->vrr.vsync_start;
> >>> +}
> >> Other parts of the code (eg. ALPM) still just directly use the
> >> adjusted_mode timings to calculate the same stuff. So this doesn't
> >> really seem to help us.
> >>
> >> Feels like all of our abstractions around this SDP transmission line
> >> stuff are way too low level, and thus the same information is
> >> calculated in different ways in different parts of the code. There
> >> should be a single place that defines the transmission line(s),
> >> and everyone should just consult that stuff (regardless of whether
> >> the platform uses implicit transmission lines, EMP_AS_SDP_TL, or
> >> the new stuff).
> > I think instead of tracking the low level stagger values directly, what
> > we want to track is just the transmission line itself for each type of
> > SDP. That seems like a form that is easier to use elsewhere in the code.
> 
> Agreed storing TL will be easier, stagger values can be derived from that.
> 
> So we set the transmission line for the packets only if we plan to send 
> them right?

I don't see why we wouldn't just always set them. And if we set one we
have to anyway set all of them since they're all derived from that one
pair of registers.

> 
> 
> >
> > And to accommodate VRR I suppose we should use the "transmission line
> > is specified relative to the end of vblank/vtotal" convention for all
> > of these.
> 
> Makes sense.
> 
> 
> Regards,
> 
> Ankit
> 
> >

-- 
Ville Syrjälä
Intel
