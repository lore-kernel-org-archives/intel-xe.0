Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D3B606D80C
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 22:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jF5jZwVY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE2F10FF58;
	Wed,  4 Nov 2026 22:31:55 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FA110FF58;
 Wed,  4 Nov 2026 22:31:49 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C783C601DE;
 Wed,  4 Nov 2026 22:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52EA01F00A18;
 Wed,  4 Nov 2026 22:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793831508;
 bh=Q6GyQeMpBXDDgZSDHsHrtysrouXtCbzau4mABuKEqYE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=jF5jZwVYbJm2/qMAbUJF9fdv9wo1dwHwTabG4d/qcObI+jj+i/2F1C3XnQhaZqq0T
 5QshvuFrsCjIg75eMNNSQdmphdztrLJZ7iZ+YPx3tCv3p3ivZNLcqXz3YimgHyQji8
 tof2Vp3ouISPpDCKxKs7V8cldQGKWH18nZhKNh+cO43bMa2Ule2FSom919odwLy1gr
 iHU/3E6B9ts/T1jnGK5vG6fDhgSmDHsO6z0zs1DVMXg3HB+UnFNgKqPl1ePamBMbyf
 u3wLkc8A44jVPTv3MbLQ4hKmDZ3jOUr+Kza6Ph3fKu1izfvsAu4Od9YNBILlLT/wUi
 BXpdDCEHwKm/g==
Message-ID: <sashiko-outbox-198229@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/9] drm/i915/de: Introduce dislay->mmio and
 intel_de_init()
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261104221842.18799-2-ville.syrjala@linux.intel.com>
References: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
 <20261104221842.18799-2-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 22:31:47 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/i915/de: NULL display->mmio.uncore when intel_de_init() is ski=
pped
--

commit 0c47f694d22974ac99844e39b462f72389dd014b
Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

drm/i915/de: Introduce dislay->mmio and intel_de_init()

This commit adds a display->mmio struct and intel_de_init() to initialize
display->mmio.uncore, and updates __to_uncore() to return display->mmio.unc=
ore
instead of calling to_intel_uncore(display->drm).

[ ... ]

> diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i9=
15/display/intel_de.h
> index d0a239a369807..f1135ee5071b4 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.h
> +++ b/drivers/gpu/drm/i915/display/intel_de.h
> @@ -14,9 +14,11 @@
> =20
>  static inline struct intel_uncore *__to_uncore(struct intel_display *dis=
play)
>  {
> -	return to_intel_uncore(display->drm);
> +	return display->mmio.uncore;
>  }

[ ... ]

> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/driver=
s/gpu/drm/i915/display/intel_display_device.c
> index c74256359c253..f1bd1252a9602 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.c
> @@ -1798,6 +1798,13 @@ static void __intel_display_device_info_runtime_in=
it(struct intel_display *displ
>  	struct intel_display_runtime_info *display_runtime =3D DISPLAY_RUNTIME_=
INFO(display);
>  	enum pipe pipe;
> =20
> +	/*
> +	 * TODO end of intel_display_device_probe() would be a more
> +	 * logical place, but at the moment i915 calls that super
> +	 * early when things aren't fully set up yet.
> +	 */
> +	intel_de_init(display);

[Severity: High]
Can this leave display->mmio.uncore NULL and cause a NULL pointer dereferen=
ce
when HAS_DISPLAY(display) is already false before runtime init?

In drivers/gpu/drm/i915/display/intel_display_device.c,
intel_display_device_info_runtime_init() only calls
__intel_display_device_info_runtime_init() when HAS_DISPLAY(display) is tru=
e:

void intel_display_device_info_runtime_init(struct intel_display *display)
{
	if (HAS_DISPLAY(display))
		__intel_display_device_info_runtime_init(display);

On devices where intel_display_device_probe() sets DISPLAY_INFO() to
no_display=E2=80=94such as Ivybridge Quanta server SKUs (INTEL_IVB_Q_IDS via
has_no_display()), PCI IDs without an entry in intel_display_ids like Arctic
Sound-M (INTEL_ATS_M_IDS where find_platform_desc() returns NULL), or GMD_ID
platforms (INTEL_MTL_IDS / INTEL_ARL_IDS) where probe_gmdid_display() reads=
 0
from GMD_ID_DISPLAY=E2=80=94HAS_DISPLAY(display) is false and
__intel_display_device_info_runtime_init() is skipped.

Because __to_uncore(display) in drivers/gpu/drm/i915/display/intel_de.h now
returns display->mmio.uncore instead of computing
to_intel_uncore(display->drm), any subsequent unconditional intel_de_*() ca=
ll
will pass a NULL struct intel_uncore pointer to intel_uncore_read*() or
intel_uncore_write*():

1. On INTEL_IVB_Q_IDS, ilk_irq_handler() in drivers/gpu/drm/i915/i915_irq.c
   unconditionally calls ilk_display_irq_master_disable() and
   ilk_display_irq_master_enable() in
   drivers/gpu/drm/i915/display/intel_display_irq.c on every interrupt, whi=
ch
   call intel_de_read_fw(display, DEIER) and intel_de_write_fw(display, DEI=
ER,
   ...).

2. On INTEL_ATS_M_IDS and headless GMD_ID platforms, gen11_irq_handler() and
   dg1_irq_handler() unconditionally call gen11_gu_misc_irq_ack() in
   drivers/gpu/drm/i915/display/intel_display_irq.c when GEN11_GU_MISC_IRQ =
is
   set, which calls intel_de_read_fw(display, GEN11_GU_MISC_IIR) and
   intel_de_write_fw(display, GEN11_GU_MISC_IIR, iir).

3. During system resume, i915_drm_resume() in
   drivers/gpu/drm/i915/i915_driver.c unconditionally calls
   intel_gmbus_reset(display) in drivers/gpu/drm/i915/display/intel_gmbus.c,
   which calls intel_de_write_fw(display, GMBUS0(display), 0) and
   intel_de_write_fw(display, GMBUS4(display), 0).

Should intel_de_init(display) be called unconditionally at the start of
intel_display_device_info_runtime_init() before the HAS_DISPLAY(display)
check?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104221842.1879=
9-1-ville.syrjala@linux.intel.com?part=3D1
