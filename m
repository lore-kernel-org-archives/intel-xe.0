Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836CE606A32C
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 22:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J4uBv9X+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6D910F274;
	Mon,  2 Nov 2026 22:39:27 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085AB10E710
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 22:39:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E1F8F40E00;
 Mon,  2 Nov 2026 22:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A715B1F00A16;
 Mon,  2 Nov 2026 22:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793659160;
 bh=d56BBnT9GP2STD6n/LvrDOWKiRAwJWsfe3xJXA4Sg6U=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=J4uBv9X+DifGAHd5Wzd0ODsfO4uN8vME5zw2C2LfgRjAVzPmndCEfn2dFypjtRSNe
 CgBdabn7JOnMUAp8JdWCEWQfyoUO/kGeEd7m6AyFZAbuYAuneCtr2Nj8y7B+of1s+A
 Ztw6vvxJ6rdZAPFxIklvmitiN4EVnC/C5EUD0+O9YvyYk4hlFoif5fa6r9rVUsyWTj
 Yk6cDSYdT1dEltACYUj1vhxr47tUXw0pHv65XJSerJSFlrnYBxUDwgMfQH33/J3XyQ
 xa65zKwzZI+r6zT+hdiueuoxCsspGmrqNEqY0e6bj/xwtK2/chCsPAJRkwNjlyXhct
 1iw/iCXUC71oQ==
Message-ID: <sashiko-outbox-194294@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 16/16] drm/xe/vsec: Support survivability mode for CRI
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261102221314.119028-34-michael.j.ruhl@intel.com>
References: <20261102221314.119028-18-michael.j.ruhl@intel.com>
 <20261102221314.119028-34-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 22:39:20 +0000
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
- [Medium] drm/xe/vsec: NULL sc->mmio dereference in wait_for_fw() on survi=
vability error
--

commit 6e126caaac7b556b33b3c1891921257efd2a418a
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Support survivability mode for CRI

This commit adds a VSEC configuration for Crescent Island in survivability
mode to expose the PUNIT crashlog PMT capability and initializes the SoC
remapper during boot survivability mode.

> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm=
/xe/xe_survivability_mode.c
> index d73cdad0b3a9c..4ce84bafcbf57 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
[ ... ]
> @@ -352,6 +353,7 @@ static int enable_boot_survivability_mode(struct pci_=
dev *pdev)
> =20
>  	xe_heci_gsc_init(xe);
> =20
> +	xe_soc_remapper_init(xe);
>  	xe_vsec_init(xe);
> =20
>  	if (survivability->fdo_mode) {
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 1ed904ec14965..6d4ef9cb9f60f 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
[ ... ]
> @@ -316,9 +336,10 @@ static void cri_late_bind_probe_work(struct work_str=
uct *work)
> =20
>  static bool wait_for_fw(struct xe_device *xe)
>  {
> +	struct xe_survivability *survivability =3D &xe->survivability;
>  	int retries =3D VSEC_LATE_BIND_RETRY;  /* wait up to 20 secs */
> =20
> -	if (xe->info.platform !=3D XE_CRESCENTISLAND)
> +	if (xe->info.platform !=3D XE_CRESCENTISLAND || survivability->mode)
>  		return true;
> =20
>  	while (retries--) {

[Severity: Medium]
Can this dereference a NULL xe->sc.mmio pointer and lock an uninitialized
xe->sc.cmd_lock mutex if enable_boot_survivability_mode() fails after
xe_vsec_init()?

During early probe in xe_device_probe_early(), xe_sysctrl_init() has not run
yet, so xe->sc.cmd_lock is uninitialized and xe->sc.mmio is NULL.
enable_boot_survivability_mode() sets survivability->mode =3D true and calls
xe_vsec_init(xe), which registers the crashlog auxiliary device via
intel_vsec_register() with devm-managed cleanup:

drivers/gpu/drm/xe/xe_survivability_mode.c:enable_boot_survivability_mode()=
 {
	...
	survivability->mode =3D true;

	xe_heci_gsc_init(xe);

	xe_soc_remapper_init(xe);
	xe_vsec_init(xe);

	if (survivability->fdo_mode) {
		ret =3D xe_nvm_init(xe);
		if (ret)
			goto failed;
	}

	ret =3D xe_i2c_probe(xe);
	if (ret)
		goto failed;
	...
failed:
	xe_log_err_fatal(pdev, SURVIVABILITY, ret, "Failed to enable Boot Mode!\n"=
);
	survivability->mode =3D false;
	return ret;
}

If xe_nvm_init() or xe_i2c_probe() fails, survivability->mode is reset to
false while the VSEC crashlog device and its sysfs attributes remain
registered until PCI probe teardown runs devres_release_all().

If userspace reads the crashlog sysfs attributes during that teardown windo=
w,
xe_pmt_telem_read() or xe_pmt_read_reg() calls wait_for_fw(xe), which sees
survivability->mode =3D=3D false and calls:

  wait_for_fw(xe)
    -> xe_sysctrl_is_oobmsm_fw_ready(xe)
      -> xe_sysctrl_send_command(xe, ...)
        -> guard(mutex)(&sc->cmd_lock)
        -> sysctrl_send_command(sc, ...)

Because xe_sysctrl_init() was never called, would this lock the uninitializ=
ed
sc->cmd_lock and dereference the NULL sc->mmio pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102221314.1190=
28-18-michael.j.ruhl@intel.com?part=3D16
