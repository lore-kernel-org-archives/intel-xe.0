Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886BA606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 09:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ilFhtHeP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECFD10F926;
	Wed, 18 Nov 2026 09:46:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D8D10F701;
 Wed, 18 Nov 2026 09:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794995161; x=1826531161;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ck4mIHZnAmt35KSGJMGbhrGj26Et9EW/Di4mX9XVJTo=;
 b=ilFhtHePtr9PUQCtK419PVx4jly7ErdcqhcjYS3RKgJBfWnUsTyVC5w8
 07Uf0YWba+G/geJcL2dPSaLrSL2+2LP5BuRjxFD0Q/f9wjlqai9vxVcsr
 2UUJfWLXAMdpY8daT6BpS3wP3dsZL9opiGQCxLUdbxQfMQD4cReMiwIcf
 RqnZEHZwUWMhW4Q/n7QgIXYI1phFZ4pZkg3sC0HAKPqscX9aRVnemMVxR
 uWmi79q0ejAJTX5Vy4gP9E4eqzXB3va3wLTZThm59ddcLYx0OTa3H9BD8
 I5ZCcUIwYGNfvisSWzpr7BRF1PRKcAbx06GZXVDq3RX+EsTfJwfmpzeJu w==;
X-CSE-ConnectionGUID: /WdnQnC9Sn2mkP/4fD5lFA==
X-CSE-MsgGUID: 0h5XDHdvTdargCrjhB0OIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3814394"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3814394"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 01:46:00 -0800
X-CSE-ConnectionGUID: 0uUdMOXATFCNIBerOBJ2lw==
X-CSE-MsgGUID: 3L1GmhF7QyqkO27E8cXNBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10185672"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 01:46:00 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/8] drm/i915/de: Pimp the intel_de_{read, write}_fw() docs
In-Reply-To: <avcfS-j_eUkkswiM@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261113134355.14579-1-ville.syrjala@linux.intel.com>
 <20261113134355.14579-3-ville.syrjala@linux.intel.com>
 <f472ab77b47162fac4185465c3e19956d4e7d43e@intel.com>
 <avcfS-j_eUkkswiM@intel.com>
Date: Wed, 18 Nov 2026 11:45:56 +0200
Message-ID: <71b5e4616f87ef83a2997ad6813f609f2e011405@intel.com>
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
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 13 Nov 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Fri, Nov 13, 2026 at 04:12:51PM +0200, Jani Nikula wrote:
>> On Fri, 13 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
>> > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> >
>> > Include a bit more guidance on when to use or not use
>> > intel_de_{read,write}_fw(), and what the extra caveats
>> > are.
>> >
>> > Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> > ---
>> >  drivers/gpu/drm/i915/display/intel_de.h | 13 ++++++++++---
>> >  1 file changed, 10 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm=
/i915/display/intel_de.h
>> > index a6dcb91b36f2..2c469a2d6a20 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_de.h
>> > +++ b/drivers/gpu/drm/i915/display/intel_de.h
>> > @@ -87,12 +87,19 @@ int intel_de_wait_for_clear_ms(struct intel_displa=
y *display, intel_reg_t reg,
>> >  			       u32 mask, unsigned int timeout_ms);
>> >=20=20
>> >  /*
>> > - * Unlocked mmio-accessors, think carefully before using these.
>> > + * Unlocked mmio-accessors, think carefully before using these. Gener=
ally only
>> > + * highly performance sensitive code should use these (eg. vblank eva=
de critical
>> > + * section, or interrupt handlers).
>> >   *
>> >   * Certain architectures will die if the same cacheline is concurrent=
ly accessed
>> > - * by different clients (e.g. on Ivybridge). Access to registers shou=
ld
>> > - * therefore generally be serialised, by either the dev_priv->uncore.=
lock or
>> > + * by different clients (e.g. on Ivybridge/Haswell). Access to regist=
ers should
>> > + * therefore generally be serialised, by either the display->mmio.loc=
k or
>> >   * a more localised lock guarding all access to that bank of register=
s.
>> > + *
>> > + * DMC wakelock will not be taken by these. It must be done manually,
>> > + * if needed.
>>=20
>> Is there anything we could mention here about what "if needed" really
>> means?
>
> "See intel_dmc_wl.c which registers need the wakelock."
> ?

Ack.

>
>>=20
>> Regardless,
>>=20
>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>>=20
>>=20
>> > + *
>> > + * These will also skip the mmio_debug unclaimed register detection.
>> >   */
>> >  u32 intel_de_read_fw(struct intel_display *display, intel_reg_t reg);
>> >  void intel_de_write_fw(struct intel_display *display, intel_reg_t reg=
, u32 val);
>>=20
>> --=20
>> Jani Nikula, Intel

--=20
Jani Nikula, Intel
