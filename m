Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F680606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 08:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dxilwpMy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CD410E90B;
	Thu,  5 Nov 2026 08:58:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7CE10E091;
 Thu,  5 Nov 2026 08:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793869109; x=1825405109;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=cFf0LaCBQLa8+oCQ/3plVEMp0XBwn/RDC5zToRS+HEs=;
 b=dxilwpMyjVgIF1nrWDv99ZeQV++ZlCpV0BjPcbbGET04K2tcbOfBO1ae
 a6P9sHieh/pQgIxPWn09l69mqbGssB8au3LzPcZ0BL9ijvei8ncvpIedR
 zpbx7iE/AM9brkUcR2hOma7LvT+ssHThIshASHYRIfsCNNBi3orLDyUij
 vqPa9ogoGLARyQCbtGKzUNFoUbawOcDa24AYX6Mca7qghmeYDYucleZdp
 aoAGqVNiZHZTewh9DliBIm+rj2FaP6bc4uXNi58qFDmslPgdTJpDBKSmp
 oTvGPyD+4d8fsJadw/SSwCiGuODWInPsxrZ1mSPwKyrbYFd+//o2AwVYD g==;
X-CSE-ConnectionGUID: +vzcQjOXR++ItT/hHNgj9A==
X-CSE-MsgGUID: lsUNYVVZRZewjCklEEo9/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2678811"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2678811"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 00:58:29 -0800
X-CSE-ConnectionGUID: l2VN4NaDSY69n6SJDjz+sQ==
X-CSE-MsgGUID: uIubwZIBQaO9sMjnsH9qmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7292850"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 00:58:26 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: sashiko-reviews@lists.linux.dev, Ville Syrjala
 <ville.syrjala@linux.intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/9] drm/i915/de: Introduce dislay->mmio and
 intel_de_init()
In-Reply-To: <sashiko-outbox-198229@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
 <20261104221842.18799-2-ville.syrjala@linux.intel.com>
 <sashiko-outbox-198229@kernel.org>
Date: Thu, 05 Nov 2026 10:58:24 +0200
Message-ID: <27be76640e973479b717bd601330ff7d7bcdfa15@intel.com>
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 04 Nov 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] drm/i915/de: NULL display->mmio.uncore when intel_de_init() is s=
kipped
> --
>
> commit 0c47f694d22974ac99844e39b462f72389dd014b
> Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> drm/i915/de: Introduce dislay->mmio and intel_de_init()
>
> This commit adds a display->mmio struct and intel_de_init() to initialize
> display->mmio.uncore, and updates __to_uncore() to return display->mmio.u=
ncore
> instead of calling to_intel_uncore(display->drm).
>
> [ ... ]
>
>> diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i=
915/display/intel_de.h
>> index d0a239a369807..f1135ee5071b4 100644
>> --- a/drivers/gpu/drm/i915/display/intel_de.h
>> +++ b/drivers/gpu/drm/i915/display/intel_de.h
>> @@ -14,9 +14,11 @@
>>=20=20
>>  static inline struct intel_uncore *__to_uncore(struct intel_display *di=
splay)
>>  {
>> -	return to_intel_uncore(display->drm);
>> +	return display->mmio.uncore;
>>  }
>
> [ ... ]
>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drive=
rs/gpu/drm/i915/display/intel_display_device.c
>> index c74256359c253..f1bd1252a9602 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_device.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display_device.c
>> @@ -1798,6 +1798,13 @@ static void __intel_display_device_info_runtime_i=
nit(struct intel_display *displ
>>  	struct intel_display_runtime_info *display_runtime =3D DISPLAY_RUNTIME=
_INFO(display);
>>  	enum pipe pipe;
>>=20=20
>> +	/*
>> +	 * TODO end of intel_display_device_probe() would be a more
>> +	 * logical place, but at the moment i915 calls that super
>> +	 * early when things aren't fully set up yet.
>> +	 */
>> +	intel_de_init(display);
>
> [Severity: High]
> Can this leave display->mmio.uncore NULL and cause a NULL pointer derefer=
ence
> when HAS_DISPLAY(display) is already false before runtime init?
>
> In drivers/gpu/drm/i915/display/intel_display_device.c,
> intel_display_device_info_runtime_init() only calls
> __intel_display_device_info_runtime_init() when HAS_DISPLAY(display) is t=
rue:
>
> void intel_display_device_info_runtime_init(struct intel_display *display)
> {
> 	if (HAS_DISPLAY(display))
> 		__intel_display_device_info_runtime_init(display);
>
> On devices where intel_display_device_probe() sets DISPLAY_INFO() to
> no_display=E2=80=94such as Ivybridge Quanta server SKUs (INTEL_IVB_Q_IDS =
via
> has_no_display()), PCI IDs without an entry in intel_display_ids like Arc=
tic
> Sound-M (INTEL_ATS_M_IDS where find_platform_desc() returns NULL), or GMD=
_ID
> platforms (INTEL_MTL_IDS / INTEL_ARL_IDS) where probe_gmdid_display() rea=
ds 0
> from GMD_ID_DISPLAY=E2=80=94HAS_DISPLAY(display) is false and
> __intel_display_device_info_runtime_init() is skipped.
>
> Because __to_uncore(display) in drivers/gpu/drm/i915/display/intel_de.h n=
ow
> returns display->mmio.uncore instead of computing
> to_intel_uncore(display->drm), any subsequent unconditional intel_de_*() =
call
> will pass a NULL struct intel_uncore pointer to intel_uncore_read*() or
> intel_uncore_write*():
>
> 1. On INTEL_IVB_Q_IDS, ilk_irq_handler() in drivers/gpu/drm/i915/i915_irq=
.c
>    unconditionally calls ilk_display_irq_master_disable() and
>    ilk_display_irq_master_enable() in
>    drivers/gpu/drm/i915/display/intel_display_irq.c on every interrupt, w=
hich
>    call intel_de_read_fw(display, DEIER) and intel_de_write_fw(display, D=
EIER,
>    ...).
>
> 2. On INTEL_ATS_M_IDS and headless GMD_ID platforms, gen11_irq_handler() =
and
>    dg1_irq_handler() unconditionally call gen11_gu_misc_irq_ack() in
>    drivers/gpu/drm/i915/display/intel_display_irq.c when GEN11_GU_MISC_IR=
Q is
>    set, which calls intel_de_read_fw(display, GEN11_GU_MISC_IIR) and
>    intel_de_write_fw(display, GEN11_GU_MISC_IIR, iir).
>
> 3. During system resume, i915_drm_resume() in
>    drivers/gpu/drm/i915/i915_driver.c unconditionally calls
>    intel_gmbus_reset(display) in drivers/gpu/drm/i915/display/intel_gmbus=
.c,
>    which calls intel_de_write_fw(display, GMBUS0(display), 0) and
>    intel_de_write_fw(display, GMBUS4(display), 0).
>
> Should intel_de_init(display) be called unconditionally at the start of
> intel_display_device_info_runtime_init() before the HAS_DISPLAY(display)
> check?

Seems annoying but valid, at least until we figure something else out.

BR,
Jani.



--=20
Jani Nikula, Intel
