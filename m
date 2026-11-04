Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECA1606A328
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 22:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WcqslnU3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4948010FF70;
	Wed,  4 Nov 2026 22:35:39 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68EBE10FF70;
 Wed,  4 Nov 2026 22:35:32 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 285074137F;
 Wed,  4 Nov 2026 22:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF7F1F00919;
 Wed,  4 Nov 2026 22:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793831732;
 bh=sE2e4vdfJ5xpPS3CDjMSMB3crUozUCUTh1eZPUuBfw0=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=WcqslnU3gP5OeKVsy3/sM3zg5QbAytmWuVmHefbo54yg9MOW+SRwyLzDnSP84jKX9
 NATDwSk3QzxuqN5lgphklBocWkiRXdYuhCDGmltw7fUCQ8XcFcn0xM26H5BdETycLb
 T5ja34TRF9QmDbCFeQQgJJHZGznIer7DtPwOrU2Z6ZkSz17505ZQD33HFAx8sJcjJB
 LyQ6s3nHCoBZyBohMgNKWzq6y8hJV7ppj06fUPXPG26U6o6K9V1343ply5f26ghsKK
 Xvl/F8N3Gyhgjj3I4OxYZdy/oyZanNRT2nvBuYHTApD3f1L9nwDSRQwVO4J+2IYy7t
 wXPXqpkO8gWiA==
Message-ID: <sashiko-outbox-198237@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/9] drm/i915/de: Introduce display->mmio.lock
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261104221842.18799-6-ville.syrjala@linux.intel.com>
References: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
 <20261104221842.18799-6-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 22:35:31 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/i915/de: intel_de_init() skipped when HAS_DISPLAY() is initial=
ly false
--

commit 86812b856eea85785d3fee2a5eb70c5246338748
Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

drm/i915/de: Introduce display->mmio.lock

This commit introduces a display-specific spinlock, display->mmio.lock, to
serialize non-fw display register accesses on SNB+ platforms in i915 and
switches explicit display users of uncore.lock over to display->mmio.lock.

> diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i9=
15/display/intel_de.c
> index 66de0d6be5699..8b7a4e696ff96 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.c
> +++ b/drivers/gpu/drm/i915/display/intel_de.c

[ ... ]

> @@ -245,12 +288,30 @@ static const struct intel_mmio_funcs lnl_mmio_funcs=
 =3D {
>  	.write =3D lnl_mmio_write,
>  };
> =20
> +static bool driver_is_i915(void)
> +{
> +#ifdef I915
> +	return true;
> +#else
> +	return false;
> +#endif
> +}
> +
>  void intel_de_init(struct intel_display *display)
>  {
>  	display->mmio.uncore =3D to_intel_uncore(display->drm);
> =20
> -	if (DISPLAY_VER(display) >=3D 20)
> -		display->mmio.funcs =3D &lnl_mmio_funcs;
> -	else
> -		display->mmio.funcs =3D &i9xx_mmio_funcs;
> +	spin_lock_init(&display->mmio.lock);

[Severity: High]
Can display->mmio.lock and display->mmio.uncore remain uninitialized when
HAS_DISPLAY(display) is false?

During i915_driver_mmio_probe(), intel_display_device_info_runtime_init()
only calls __intel_display_device_info_runtime_init() -> intel_de_init()
when HAS_DISPLAY(display) is true:

drivers/gpu/drm/i915/display/intel_display_device.c:
intel_display_device_info_runtime_init() {
	if (HAS_DISPLAY(display))
		__intel_display_device_info_runtime_init(display);
    ...
}

When intel_display_device_probe() takes the no_display path (such as on
INTEL_IVB_Q_IDS via has_no_display(), INTEL_ATS_M_IDS via
!find_platform_desc(), or GMD_ID platforms where GMD_ID_DISPLAY reads 0 in
probe_gmdid_display()), pipe_mask is 0, so HAS_DISPLAY(display) is false
and intel_de_init() is skipped.

However, several paths in i915 still access display registers when
HAS_DISPLAY(display) is false:

1. On INTEL_IVB_Q_IDS, ilk_irq_handler() unconditionally calls
   ilk_display_irq_master_disable() and ilk_display_irq_master_enable(),
   which call intel_de_read_fw(display, DEIER) and
   intel_de_write_fw(display, DEIER, ...) and dereference
   display->mmio.uncore while it is NULL.

2. On headless Gen11+ and GMD_ID platforms (such as INTEL_ATS_M_IDS),
   gen11_irq_handler() and dg1_irq_handler() unconditionally call
   gen11_gu_misc_irq_ack(), which calls
   intel_de_read_fw(display, GEN11_GU_MISC_IIR) when GEN11_GU_MISC_IRQ is
   signalled.

3. During resume, i915_drm_resume() unconditionally calls
   intel_gmbus_reset(display), which calls
   intel_de_write_fw(display, GMBUS0(display), 0).

Should intel_de_init() be called unconditionally even when
HAS_DISPLAY(display) is false so that display->mmio.uncore,
display->mmio.lock, and display->mmio.funcs are always initialized?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104221842.1879=
9-1-ville.syrjala@linux.intel.com?part=3D5
