Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078D8C5AC7A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 08:16:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802BA10F3E3;
	Fri,  7 Aug 2026 08:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U9exeJC8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6BB10F414;
 Fri,  7 Aug 2026 08:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786090581; x=1817626581;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7RaIsYf+UTGUT4z5tV+g0b1pkDpVZx68MiJ1p1mD60M=;
 b=U9exeJC8BJME8t2GidjVIMQiEfNFRZMz81d5uS3XN5vuXRL11bTXaMcH
 QUlsLtF6o2SYaMSGaUr5YY82JLtHuapsK+JxfZsK+gHH3aKWwBByHQ0Fw
 S2KybG6QiFWuPr17D+DX24luDY7BiO2JKvCnP4YX78C1qJUr2JdcxYIYt
 owCVMjzBd9t/QXd7XXvKgM2fRDzvfOXBEAUy/RkBAgmisB8FCT2cWKd2l
 +xDl7slCtPOaVkbG/go7xBkksDw6+x6fYZHewmF6ZW0QFQpQOedphZcDV
 tSjHb+piHj98SRvQa3LNOEdD4aWa0wnvv9GeC1k54RmIUEqzH7aHU0nZi w==;
X-CSE-ConnectionGUID: Tc99L741RwiiZNNgOINPwQ==
X-CSE-MsgGUID: nkGSz5V/QsqD9BiRfK2HiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97046597"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="97046597"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 01:16:20 -0700
X-CSE-ConnectionGUID: ZfcjSKWhQDm4SfzL4HGiZg==
X-CSE-MsgGUID: ncp7DqjyRaCzWKQc4SRXuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="256110813"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.152])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 01:16:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
 "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH] drm/i915/cmtg: Disable CMTG after PSR exit to avoid
 disable timeout
In-Reply-To: <DS0PR11MB8049B57E8E753BDDBEBE62E9F9D12@DS0PR11MB8049.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260807055452.2997983-1-animesh.manna@intel.com>
 <220f80c2de131ecf25a869bd9218af30fbbe4b54@intel.com>
 <DS0PR11MB8049B57E8E753BDDBEBE62E9F9D12@DS0PR11MB8049.namprd11.prod.outlook.com>
Date: Fri, 07 Aug 2026 11:16:16 +0300
Message-ID: <636908b4af9b34f638e05e574e18438ef4f28bc2@intel.com>
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

On Fri, 07 Aug 2026, "Manna, Animesh" <animesh.manna@intel.com> wrote:
>> -----Original Message-----
>> From: Jani Nikula <jani.nikula@linux.intel.com>
>> Sent: Friday, August 7, 2026 1:33 PM
>> To: Manna, Animesh <animesh.manna@intel.com>; intel-
>> gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
>> Cc: Manna, Animesh <animesh.manna@intel.com>; Dibin Moolakadan
>> Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>; Shankar,
>> Uma <uma.shankar@intel.com>
>> Subject: Re: [PATCH] drm/i915/cmtg: Disable CMTG after PSR exit to avoid
>> disable timeout
>> 
>> On Fri, 07 Aug 2026, Animesh Manna <animesh.manna@intel.com> wrote:
>> > CMTG is enabled in sync-to-port mode, so its running state
>> > (CMTG_STATE) can only clear while the port is actively timing. In
>> > hsw_crtc_disable() the CMTG was torn down at the very beginning of the
>> > sequence, before the encoders were disabled. At that point PSR may
>> > still be active on the eDP, leaving the port timing generator idle. As
>> > a result, after clearing CMTG_ENABLE the wait for CMTG_STATE to clear
>> never completes and triggers:
>> >
>> >   xe 0000:00:02.0: [drm] CMTG: A disable timeout
>> >   WARNING: drivers/gpu/drm/i915/display/intel_cmtg.c:205
>> > intel_cmtg_disable+0x331/0x3d0 [xe]
>> >
>> > This is intermittently seen with igt@kms_hdr@bpc-switch-suspend, which
>> > repeatedly cycles the eDP in and out of PSR across suspend/resume.
>> >
>> > Move the CMTG disable to after intel_encoders_disable() (so PSR is
>> > exited) but before intel_encoders_post_disable()/intel_dpll_disable(),
>> > so the transcoder timing generator and port PLL are still active while
>> > CMTG_STATE is polled. The ordering requirement of disabling CMTG
>> > before the transcoder and port PLL are brought down is preserved.
>> >
>> > Cc: Dibin Moolakadan Subrahmanian
>> > <dibin.moolakadan.subrahmanian@intel.com>
>> > Cc: Uma Shankar <uma.shankar@intel.com>
>> > Signed-off-by: Animesh Manna <animesh.manna@intel.com>
>> 
>> Fixes: ?
>> Cc: stable ?
>
> Sure, will add in next version.

If there is no next version otherwise, you don't have to and should not
send a new version just to amend these trailers. Just reply with them to
the patch.

BR,
Jani.

>
> Regards,
> Animesh
>> 
>> > ---
>> >  drivers/gpu/drm/i915/display/intel_display.c | 18 ++++++++++++++----
>> >  1 file changed, 14 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
>> > b/drivers/gpu/drm/i915/display/intel_display.c
>> > index 829d7a411dcc..cc4d20fdda44 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_display.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> > @@ -1791,15 +1791,25 @@ static void hsw_crtc_disable(struct
>> intel_atomic_state *state,
>> >  		intel_atomic_get_old_crtc_state(state, crtc);
>> >  	struct intel_crtc *pipe_crtc;
>> >
>> > -	if (crtc->cmtg.enabled && intel_cmtg_is_allowed(old_crtc_state)) {
>> > -		intel_cmtg_set_clk_select(old_crtc_state);
>> > -		intel_cmtg_disable(old_crtc_state);
>> > -	}
>> >  	/*
>> >  	 * FIXME collapse everything to one hook.
>> >  	 * Need care with mst->ddi interactions.
>> >  	 */
>> >  	intel_encoders_disable(state, crtc);
>> > +
>> > +	/*
>> > +	 * Disable CMTG after the encoders are disabled (so PSR is exited) but
>> > +	 * before the transcoder timing generator and port PLL are torn down
>> in
>> > +	 * intel_encoders_post_disable()/intel_dpll_disable(). CMTG is
>> synced to
>> > +	 * the port, so its running state (CMTG_STATE) can only clear while
>> the
>> > +	 * port is actively timing. Doing this while PSR is still active leaves
>> > +	 * the port idle and makes the CMTG_STATE clear wait time out.
>> > +	 */
>> > +	if (crtc->cmtg.enabled && intel_cmtg_is_allowed(old_crtc_state)) {
>> > +		intel_cmtg_set_clk_select(old_crtc_state);
>> > +		intel_cmtg_disable(old_crtc_state);
>> > +	}
>> > +
>> >  	intel_encoders_post_disable(state, crtc);
>> >
>> >  	intel_dpll_disable(old_crtc_state);
>> 
>> --
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
