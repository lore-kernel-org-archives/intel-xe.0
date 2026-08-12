Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D36C5CFEB
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 11:05:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F0B10EF38;
	Wed, 12 Aug 2026 11:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EkwEM9+Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F8B10E410;
 Wed, 12 Aug 2026 11:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786532745; x=1818068745;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=Q7Z72wgEDHEuQ7w7bXyGGQr4wxjDiGclcI+iw6K/vNM=;
 b=EkwEM9+QokXcKNj4q8BoQjh1LMSPd8U8qp3PJNlo1t7zAflQW3xw9thu
 EIGlq/dAJCSze221ATEKUTJcY23wMC+WTQH660wGs+Nmq6yLaPKCTO947
 rG+OUKQ29pCtwzSlig4NIRm2Q/f9bRA2i4dtV/+1MMXXa1LvFd9UScA+I
 1KCsC4P+nzpSS4dz0R4H+EPmoQ8LSlPcEimq3CfFKdmFA2br+P7xzI5uz
 JhqcjzYI/m0PtLIrnIJ0bZHNb8duLPq1GhFLhpXHGvF0BWgWVEyXcAv28
 Ucrv7YGTKqQWE6zCbq+tYmOTJWbrJF7eAq1fKAsT7NEL/6i+S2ZE/+/pZ Q==;
X-CSE-ConnectionGUID: Dcd2rvMQQzGrgorxROPtuQ==
X-CSE-MsgGUID: ut7dnwozThuLJSOkGZKmsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="97428544"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="97428544"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 04:05:44 -0700
X-CSE-ConnectionGUID: WqOdVoOSSLC02kyh2ileBA==
X-CSE-MsgGUID: yB9BUbTsQk+VH/T+Z+1pJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="267468684"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.141])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 04:05:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Garg, Nemesa" <nemesa.garg@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane
 disable
In-Reply-To: <MW4PR11MB688720289D3B3CD86834A345E3DC2@MW4PR11MB6887.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260812094547.1808459-1-nemesa.garg@intel.com>
 <0958cc7e77d3c1bc717aa88bf8d74bf04c498822@intel.com>
 <MW4PR11MB688720289D3B3CD86834A345E3DC2@MW4PR11MB6887.namprd11.prod.outlook.com>
Date: Wed, 12 Aug 2026 14:05:39 +0300
Message-ID: <4ce02b124a6d5cf02e2d6522bd40e9c4f5ed8472@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 12 Aug 2026, "Garg, Nemesa" <nemesa.garg@intel.com> wrote:
>> -----Original Message-----
>> From: Jani Nikula <jani.nikula@linux.intel.com>
>> Sent: Wednesday, August 12, 2026 3:47 PM
>> To: Garg, Nemesa <nemesa.garg@intel.com>; intel-gfx@lists.freedesktop.org;
>> intel-xe@lists.freedesktop.org
>> Cc: Garg, Nemesa <nemesa.garg@intel.com>
>> Subject: Re: [PATCH] drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane
>> disable
>> 
>> On Wed, 12 Aug 2026, Nemesa Garg <nemesa.garg@intel.com> wrote:
>> > icl_plane_disable_sel_fetch_arm() wrote SEL_FETCH_PLANE_CTL = 0 only
>> > when crtc_state->enable_psr2_sel_fetch was set.  If a plane was
>> > disabled after selective fetch had been turned off, the guard fired
>> > early and left the register's enable bit set in hardware.
>> 
>> Why doesn't the selective fetch disable change the bit?
>> 
> During disable path icl_plane_disable_sel_fetch_arm is called and here we have a condition :
> if (!crtc_state->enable_psr2_sel_fetch)
>                 return;
> 		
> So if the plane is disabled after selective fetch has already been turned off, this returns early and the enable bit is left set in hardware.
>
> Turning selective fetch back on does not repair it: icl_plane_update_sel_fetch_arm() only runs for planes that are in the update mask and visible. A plane disabled during the off window is neither, so its stale bit is never rewritten, it just becomes live again.
>
> From logs: plane 1A after being disabled:
>  plane 1 ddb (0 - 0) CTL=0x00000000 SURF=0x00000000 SURFLIVE=0x00000000
>                       SEL_FETCH_PLANE_CTL=0x80000000

None of that answers my question.

Where does crtc_state->enable_psr2_sel_fetch get set to false without
disabling the bit in hardware? Why? What's the scenario that actually
leads us to the case at hand?


BR,
Jani.


>
> Thanks and Regards,
> Nemesa
>
>> > The bit is harmless until selective fetch is re-enabled.  When it is,
>> > the hardware resumes fetching for the now-disabled plane and keeps its
>> > old DDB range reserved.
>> >
>> > Fixes: b1f5279b5981 ("drm/i915/psr: Move plane sel fetch configuration
>> > into plane source files")
>> > Closes:https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8739
>> 
>> Missing space after :.
>> 
>> > Assisted-by: GitHub-Copilot:claude-opus-4.6
>> > Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
>> > ---
>> >  drivers/gpu/drm/i915/display/skl_universal_plane.c | 8 +++++++-
>> >  1 file changed, 7 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> > b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> > index 07a683293352..afc1df1b84a4 100644
>> > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>> > @@ -885,7 +885,13 @@ static void icl_plane_disable_sel_fetch_arm(struct
>> intel_dsb *dsb,
>> >  	struct intel_display *display = to_intel_display(plane);
>> >  	enum pipe pipe = plane->pipe;
>> >
>> > -	if (!crtc_state->enable_psr2_sel_fetch)
>> > +	/*
>> > +	 * Clear this whenever the hardware has selective fetch, not just when
>> > +	 * the current state uses it. The plane may have been enabled with
>> > +	 * selective fetch earlier and had its enable bit orphaned when the
>> > +	 * feature was switched off.
>> > +	 */
>> > +	if (!HAS_PSR2_SEL_FETCH(display))
>> >  		return;
>> >
>> >  	intel_de_write_dsb(display, dsb, SEL_FETCH_PLANE_CTL(pipe,
>> > plane->id), 0);
>> 
>> --
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
