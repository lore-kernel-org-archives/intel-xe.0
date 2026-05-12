Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27EDCD4855
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 08:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C12910E689;
	Tue, 12 May 2026 08:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PYpuPkJP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA8410E689;
 Tue, 12 May 2026 08:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778574338; x=1810110338;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=YrjSJtmoWAFjzHkux/wspVsGTjMwQIfJjLVO7epuQT4=;
 b=PYpuPkJPNfATL9vpuhOTwQHzkasvyfQvUPITEhjDFV/Ryq763rk1G79h
 WUpnMENvAeWNVF6Eu0bH8g5urtkfTtEyGv/kvWDIw2NfaUFeTyxHXFnCW
 RezE0H60vEvGLipEPul4QVvOGSFQttFzG5K9quzPpdlxH1P1Jx6Q3VcUr
 Duq2Houe5EsSv9CtioqMvkb+Ukb7SEMWW5KQMfkmsM39QFlH3dt0lwjEh
 3wjgeTl3x8WT54gYqkcVzV7+EpxpsJTtu/sdAcAQyE+hG7HYbkLLf2XOd
 N7xWFCeKK2LyVuVPfG5jJ2rp9jhxqNdarOfJEimXGcZwoqiI/COLWc5XR g==;
X-CSE-ConnectionGUID: YSIDIq19T/S1K3mEBZP3XA==
X-CSE-MsgGUID: eOFqJBPUSCGbdvXdRD43KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="67005716"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="67005716"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 01:25:38 -0700
X-CSE-ConnectionGUID: JbtYTFCMS7+rgL8RTRPH9A==
X-CSE-MsgGUID: GiA4pX7iS/mdjX2dwObfXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="233387923"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.158])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 01:25:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: imre.deak@intel.com, Gustavo Sousa <gustavo.sousa@intel.com>
Cc: James Xiong <james.xiong@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/i915/dmc: fix assert_dmc_loaded WARN during
 async firmware load
In-Reply-To: <agHSpKZtCqmciCU9@ideak-desk.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260508181329.666762-1-james.xiong@intel.com>
 <87tsseqgrb.fsf@intel.com> <agHOCIcYOsDPyUi0@ideak-desk.lan>
 <87o6imqfd8.fsf@intel.com> <agHSpKZtCqmciCU9@ideak-desk.lan>
Date: Tue, 12 May 2026 11:25:33 +0300
Message-ID: <7f0894a1c5d2e7b276e5d039f6a240813fce8b81@intel.com>
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

On Mon, 11 May 2026, Imre Deak <imre.deak@intel.com> wrote:
> On Mon, May 11, 2026 at 09:50:59AM -0300, Gustavo Sousa wrote:
>> Imre Deak <imre.deak@intel.com> writes:
>> 
>> > On Mon, May 11, 2026 at 09:20:56AM -0300, Gustavo Sousa wrote:
>> >> James Xiong <james.xiong@intel.com> writes:
>> >> 
>> >> > During driver probe, DMC firmware is loaded asynchronously via a
>> >> > workqueue. There is a race between parse_dmc_fw() setting the payload
>> >> > pointer (making has_dmc_id_fw() return true) and intel_dmc_load_program()
>> >> > writing the firmware to hardware registers. If the probe thread calls
>> >> > intel_dmc_enable_pipe() -> assert_dmc_loaded() in this window via
>> >> > intel_modeset_setup_hw_state(), it sees parsed payload but stale HW
>> >> > registers, triggering a ~20% intermittent WARNING on ADL-N warm boot.
>> >> >
>> >> > v2: Fix by calling intel_dmc_wait_fw_load() in
>> >> >     intel_modeset_setup_hw_state() before iterating the CRTCs (Gustavo
>> >> >     Sousa).
>> >> >
>> >> > v3: Move intel_dmc_wait_fw_load() into intel_dmc_enable_pipe() itself
>> >> >     so the function is self-contained (Jani Nikula, Gustavo Sousa).
>> >> >
>> >> > Signed-off-by: James Xiong <james.xiong@intel.com>
>> >> 
>> >> +Imre
>> >> 
>> >> Perhaps this deserves a fixes tag?
>> >
>> > Since that would result in backporting the fix to -stable, it depends on
>> > whether enabling the pipe DMC functionality before the firmware is
>> > loaded is an actual functionality problem.
>> 
>> I think we depend on pipe DMC for the flip queue functionality, so I
>> suspect it could be an issue.
>
> AFAIU stable rules require knowing that a fix fixes something for a
> user.

The rules may say that, but the reality doesn't match the rules. Lots
more stuff gets backported to stable nowadays.

BR,
Jani


> I suppose one way to make this sure would be reproducing a problem
> with PIPE DMC explicitly enabled early, before the firmware is loaded.
>
>> That said, I'm not very involved in that, so I can say for sure.
>> 
>> --
>> Gustavo Sousa
>> 
>> >
>> >> If so, maybe it should be this one:
>> >> 
>> >> Fixes: 3af2ff0840be ("drm/i915: Enable a PIPEDMC whenever its corresponding pipe is enabled")
>> >> 
>> >> The change itself looks good to me, so
>> >> 
>> >> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> >> 
>> >> > ---
>> >> >  drivers/gpu/drm/i915/display/intel_dmc.c | 7 ++++++-
>> >> >  1 file changed, 6 insertions(+), 1 deletion(-)
>> >> >
>> >> > diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
>> >> > index 0df4f42ba3e3..4151eae92744 100644
>> >> > --- a/drivers/gpu/drm/i915/display/intel_dmc.c
>> >> > +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
>> >> > @@ -786,7 +786,12 @@ void intel_dmc_enable_pipe(const struct intel_crtc_state *crtc_state)
>> >> >  	enum pipe pipe = crtc->pipe;
>> >> >  	enum intel_dmc_id dmc_id = PIPE_TO_DMC_ID(pipe);
>> >> >  
>> >> > -	if (!is_valid_dmc_id(dmc_id) || !has_dmc_id_fw(display, dmc_id))
>> >> > +	if (!is_valid_dmc_id(dmc_id))
>> >> > +		return;
>> >> > +
>> >> > +	intel_dmc_wait_fw_load(display);
>> >> > +
>> >> > +	if (!has_dmc_id_fw(display, dmc_id))
>> >> >  		return;
>> >> >  
>> >> >  	if (!can_enable_pipedmc(crtc_state)) {
>> >> > -- 
>> >> > 2.34.1

-- 
Jani Nikula, Intel
