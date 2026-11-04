Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304AE606A333
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 22:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k8q+pJhA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBAD10FF7F;
	Wed,  4 Nov 2026 22:36:44 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E116210FF75;
 Wed,  4 Nov 2026 22:36:38 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2D1BD605D5;
 Wed,  4 Nov 2026 22:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A561F000C1;
 Wed,  4 Nov 2026 22:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793831797;
 bh=oaDFkMNfDSTf01y2bwiQ2I7YaVaGquWJi9M1iON7bNU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=k8q+pJhAtaePvk3DdyMoiDbWeXf0dPX4Tsci/DO3lpKmCQHoSs2kVIHzGLVWkhid4
 MNXhAvPbP7EviB0AZxCG23xvlLEhTEkZr67iQd4jo74apPqXK+5u1VF1mer9GI6aFj
 fnB5AerxerjSRL5TXYJeFSxeFaf/MNjNW4pY9JjSvitk4Q8YMluTJSTWbQq42xML76
 CAXBPE9L5PiJAwelhi9ikuIqSxm0OlBcFdJNiouUXyFHsDQLzE2j826CARpKM7X8Ok
 WFt2e+ivliVqiMxWdWfka86ZHIr97yLugNuW4aPZpkF2Dq+NMIjdpG7GXnVYEfL5zL
 h8n/BXHLhqp4A==
Message-ID: <sashiko-outbox-198239@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/9] drm/i915/de: Move unclaimed mmio detection into
 display code
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261104221842.18799-8-ville.syrjala@linux.intel.com>
References: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
 <20261104221842.18799-8-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 22:36:37 +0000
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] drm/i915/de: NULL deref on displayless devices in unclaimed MMIO c=
hecks
- [Medium] drm/i915/de: intel_de_init() enables FPGA_DBG check on Ivy Bridge
- [Medium] drm/i915/de: unclaimed MMIO status is not cleared on initializat=
ion
- [Low] drm/i915/display: unused mmio.mmio_debug field in struct intel_disp=
lay
--

commit 74c572411ef669251a5e2e347d14a7771407e433
Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

drm/i915/de: Move unclaimed mmio detection into display code

This commit moves the FPGA_DBG and CLAIM_ER unclaimed MMIO access detection
from intel_uncore into the display code, protecting the tracking state with
display->mmio.lock.

> diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i9=
15/display/intel_de.c
> index 8b7a4e696ff96..0a51105e0fbad 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.c
> +++ b/drivers/gpu/drm/i915/display/intel_de.c

[ ... ]

> @@ -163,8 +164,127 @@ u16 intel_de_read16(struct intel_display *display, =
intel_reg_t reg)

[ ... ]

> +bool intel_de_unclaimed_mmio_detected(struct intel_display *display)
> +{
> +	bool ret;
> +
> +	if (!display->mmio.funcs->check_for_unclaimed_mmio)
> +		return false;
> +
> +	spin_lock_irq(&display->mmio.lock);
> +	ret =3D display->mmio.funcs->check_for_unclaimed_mmio(display);
> +	spin_unlock_irq(&display->mmio.lock);
> +
> +	return ret;
> +}
> +
> +bool intel_de_arm_unclaimed_mmio_detection(struct intel_display *display)
> +{
> +	bool ret =3D false;
> +
> +	if (!display->mmio.funcs->check_for_unclaimed_mmio)
> +		return false;

[Severity: High]
Can intel_de_unclaimed_mmio_detected() and
intel_de_arm_unclaimed_mmio_detection() dereference a NULL display->mmio.fu=
ncs
pointer on devices without display?

On displayless devices where intel_display_device_probe() takes the no_disp=
lay
path (such as INTEL_IVB_Q_IDS, INTEL_ATS_M_IDS, or GMD_ID platforms where
GMD_ID_DISPLAY reads 0), HAS_DISPLAY(display) is false. During probe,
intel_display_device_info_runtime_init() skips
__intel_display_device_info_runtime_init():

drivers/gpu/drm/i915/display/intel_display_device.c:
intel_display_device_info_runtime_init() {
	if (HAS_DISPLAY(display))
		__intel_display_device_info_runtime_init(display);

Because intel_de_init() is only called from
__intel_display_device_info_runtime_init(), display->mmio.funcs remains NULL
and display->mmio.lock is never initialized.

Later, i915_drm_resume_early(), i915_pm_runtime_suspend(), and
i915_pm_runtime_resume() unconditionally call
intel_display_driver_mmio_resume_early() and
intel_display_driver_mmio_suspend_late(), which call
intel_de_unclaimed_mmio_detected() and intel_de_arm_unclaimed_mmio_detectio=
n()
and dereference display->mmio.funcs.

Additionally, if HAS_DISPLAY(display) is initially true so intel_de_init()
sets display->mmio.funcs =3D &ivb_mmio_funcs, and
__intel_display_device_info_runtime_init() subsequently jumps to
display_fused_off, display->mmio.funcs remains set while HAS_DISPLAY(displa=
y)
becomes false, causing suspend and resume to access FPGA_DBG even though
display is fused off.

Should intel_de_init() be called unconditionally (or display->mmio.funcs be
checked / reset when display is fused off), and should
intel_display_driver_mmio_suspend_late() and
intel_display_driver_mmio_resume_early() check HAS_DISPLAY(display)?

[ ... ]

> @@ -304,7 +470,11 @@ void intel_de_init(struct intel_display *display)
>  	spin_lock_init(&display->mmio.lock);
> =20
>  	if (driver_is_i915()) {
> -		if (display->platform.valleyview || display->platform.cherryview)
> +		if (display->platform.valleyview || display->platform.cherryview)
> +			display->mmio.funcs =3D &vlv_mmio_funcs;
> +		else if (DISPLAY_VER(display) >=3D 7)
> +			display->mmio.funcs =3D &ivb_mmio_funcs;
> +		else if (DISPLAY_VER(display) >=3D 6)
>  			display->mmio.funcs =3D &snb_mmio_funcs;
>  		else
>  			display->mmio.funcs =3D &i9xx_mmio_funcs;

[Severity: Medium]
Does checking DISPLAY_VER(display) >=3D 7 in intel_de_init() unintentionally
enable FPGA_DBG unclaimed MMIO checks on Ivy Bridge?

Previously, intel_uncore_init_mmio() gated FPGA_DBG unclaimed MMIO detection
on HAS_FPGA_DBG_UNCLAIMED(display). In
drivers/gpu/drm/i915/display/intel_display_device.c, has_fpga_dbg is set on
hsw_desc and bdw_desc onwards, whereas ivb_display has ip.ver =3D 7 and
has_fpga_dbg =3D 0. Checking DISPLAY_VER(display) >=3D 7 assigns ivb_mmio_f=
uncs to
Ivy Bridge as well, and leaves HAS_FPGA_DBG_UNCLAIMED(display) unused.

Should this check HAS_FPGA_DBG_UNCLAIMED(display) instead?

> @@ -314,4 +484,7 @@ void intel_de_init(struct intel_display *display)
>  		else
>  			display->mmio.funcs =3D &i9xx_mmio_funcs;
>  	}
> +
> +	if (display->mmio.funcs->check_for_unclaimed_mmio)
> +		display->mmio.unclaimed_mmio_check =3D 1;
>  }

[Severity: Medium]
Previously, intel_uncore_init_mmio() cleared any stale unclaimed MMIO bit l=
eft
set by BIOS or pre-boot firmware during initialization:

	/* clear out unclaimed reg detection bit */
	if (intel_uncore_unclaimed_mmio(uncore))
		drm_dbg(&i915->drm, "unclaimed mmio detected on uncore init, clearing\n");

With that removed and not replaced in intel_de_init(), if mmio_debug is
disabled by default, won't a stale FPGA_DBG_RM_NOCLAIM or CLAIM_ER bit from
boot firmware remain latched until intel_de_arm_unclaimed_mmio_detection()
runs at the end of the first modeset or in
intel_display_driver_mmio_suspend_late(), triggering a false-positive error=
 or
falsely arming oneshot mmio_debug reporting?

> diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/=
gpu/drm/i915/display/intel_display_core.h
> index aded2af8c92a6..cb18ee040b5d6 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_core.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_core.h
> @@ -539,11 +539,18 @@ struct intel_display {
>  		 * serializes all display register accesses done
>  		 * using intel_de_{read,write}(), but not those
>  		 * done using intel_de_{read,write}_fw().
> +		 *
> +		 * The lock also protects mmio.mmio_debug and
> +		 * mmio.unclaimed_mmio_check.
>  		 */
>  		spinlock_t lock;
> =20
>  		struct intel_uncore *uncore;
>  		const struct intel_mmio_funcs *funcs;
> +
> +		/* protected by mmio.lock */
> +		int mmio_debug;
> +		int unclaimed_mmio_check;
>  	} mmio;

[Severity: Low]
This isn't a bug, but display->mmio.mmio_debug is never used since
check_unclaimed_mmio_pre(), check_unclaimed_mmio_post(), and
intel_de_arm_unclaimed_mmio_detection() all use display->params.mmio_debug.
Should mmio.mmio_debug be dropped from struct intel_display?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104221842.1879=
9-1-ville.syrjala@linux.intel.com?part=3D7
