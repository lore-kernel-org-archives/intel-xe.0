Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12BE606A335
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 12:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cPIsi8ek
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B78010E9B9;
	Thu, 26 Nov 2026 12:48:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A5A10E9B4;
 Thu, 26 Nov 2026 12:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795697333; x=1827233333;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=vML+xb1VeA7WBPQ6zbeMsHes/ikZhe2SYXK96i8H+Eo=;
 b=cPIsi8ekum/zPVS0L+VGjGYXwrEdcNmLWxHBL+xe79Mq56VUJ7jc6Yrb
 9Jp6rEivzxeT/BuSC7TtvrERa8/WVQWtCeebLMoap69wcBpiTRAhuBvYC
 jjIs1wLxH2udzIR0tfkkvL8DLxb01MczTiqon1dTyzulB0lRjbCBTMahQ
 J+8Sz6697+QmmHunCEQEZp0IjzLGWqj7Rw8c+YXreQ/3suaYnEBcf8k0E
 S03bPLwmofwG/CEBc+stIAFexlYSopOCSsnybKBaOu50Z2IDZfYG3yWZ0
 Rc/oFQg2qLVfQjxPfpcPgyCtMhzjmIUnJ0YMzpVIJ06wzzaf5IOhyNsQF g==;
X-CSE-ConnectionGUID: hVubDZodQJCu6ZrmG9ygOA==
X-CSE-MsgGUID: obEeogXbSk+CmlLOC9Fw5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4532803"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4532803"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 04:48:52 -0800
X-CSE-ConnectionGUID: jvr9Y2d/Qyy5KPzhamnE+A==
X-CSE-MsgGUID: B9XRBnyERl2Q1PvWnJyI6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12423797"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.235])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 04:48:50 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: Remove the HSW+ PIPEDSL==0 hack
In-Reply-To: <20261126123132.9589-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261126123132.9589-1-ville.syrjala@linux.intel.com>
Date: Thu, 26 Nov 2026 14:48:46 +0200
Message-ID: <673509fb77f58a92665943e178f0d76e79707876@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 26 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Remove the ugly "wait until PIPEDSL reads non zero" hack from
> __intel_get_crtc_scanline(), added in
> commit 41b578fb0e8b ("drm/i915: workaround bad DSL readout v3") and
> commit b291681926a1 ("drm/i915: Extend DSL readout fix to BDW
> and SKL.").
>
> I'm 90% sure this was just PSR deep sleep (the symptoms match),
> and no one actually understood PSR at the time. Unfortunately
> no one felt the need to leave any useful logs in the bug
> (https://bugs.freedesktop.org/show_bug.cgi?id=3D91579) either
> so a bit hard to confirm :/
>
> The proper fix for vblank evasion vs. PSR happened only a few years
> later with
> commit a608987970b9 ("drm/i915: Wait for PSR exit before checking
> for vblank evasion")
>
> Removing the retry loop does mean that we may in fact read a
> semi-bogus zero a bit more often from the register when PSR
> hasn't been waited on (eg. in tracepoints). But the ~100usec
> timeout did not in any way guarantee that PSR exit was done
> by the time we return from __intel_get_crtc_scanline(), so
> getting the semi-bogus zero was always a possibility. This
> is something to bare in mind when inspecting trace logs and
> whatnot.
>
> Another approach I was thinking was to just do a pair of reads,
> separated by a wait of a few scanlines, and then maybe return
> something like vblank_start-1 if the two reads both come out
> as zeroes. But that would still be a lie as we have no idea
> how long until the timing generator starts up again, and I'm
> not sure that lie is any better than the other.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

With the understanding that you'll address the issues this uncovers, if
any,

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_vblank.c | 26 ---------------------
>  1 file changed, 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/dr=
m/i915/display/intel_vblank.c
> index 114ff43381b5..616710bd05b0 100644
> --- a/drivers/gpu/drm/i915/display/intel_vblank.c
> +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
> @@ -247,32 +247,6 @@ static int __intel_get_crtc_scanline(struct intel_cr=
tc *crtc)
>=20=20
>  	position =3D intel_de_read_fw(display, PIPEDSL(display, pipe)) & PIPEDS=
L_LINE_MASK;
>=20=20
> -	/*
> -	 * On HSW, the DSL reg (0x70000) appears to return 0 if we
> -	 * read it just before the start of vblank.  So try it again
> -	 * so we don't accidentally end up spanning a vblank frame
> -	 * increment, causing the pipe_update_end() code to squak at us.
> -	 *
> -	 * The nature of this problem means we can't simply check the ISR
> -	 * bit and return the vblank start value; nor can we use the scanline
> -	 * debug register in the transcoder as it appears to have the same
> -	 * problem.  We may need to extend this to include other platforms,
> -	 * but so far testing only shows the problem on HSW.
> -	 */
> -	if (HAS_DDI(display) && !position) {
> -		int i, temp;
> -
> -		for (i =3D 0; i < 100; i++) {
> -			udelay(1);
> -			temp =3D intel_de_read_fw(display,
> -						PIPEDSL(display, pipe)) & PIPEDSL_LINE_MASK;
> -			if (temp !=3D position) {
> -				position =3D temp;
> -				break;
> -			}
> -		}
> -	}
> -
>  	/*
>  	 * See update_scanline_offset() for the details on the
>  	 * scanline_offset adjustment.

--=20
Jani Nikula, Intel
