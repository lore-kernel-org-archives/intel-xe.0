Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D596606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 02:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aNJ2cD06
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FEB10F2CD;
	Tue, 24 Nov 2026 02:31:22 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E33210F2CD
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 02:31:17 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id DE05E43A14;
 Tue, 24 Nov 2026 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589751F000C6;
 Tue, 24 Nov 2026 02:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795487476;
 bh=syLxMQzFf912J/VdRpvDEfkn7p1xfd8oZoMdem9NX5s=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=aNJ2cD06dEAY1QnVPtLr/M/tsvhIHqlHuS0WfbDgY04CPxGCGOJeBki7hlbGK4woU
 RyX8GAFBRUzj2iEPJwqlp9dGXERL3atP7YCfH7P0vEo9/HT/pcSeDUBBiZkLxP7agf
 3o4DzRKmP+B8McrE7Uaqk+iaqz5NPfH5cSzp8ty4kV3aZN+i9t6BuG4iQR5H5y3p3c
 qHL7uKPHw7wL1F3nLzJNJVyRX5ndVQKM/5g2mrQ3ii0OGq0bZbAEzDJdkxZHlGN+om
 kQo6OVYFAA14I0vFXrLFzMBACSn7PWkNKzD1yA1XffcBVxy2cBdToibuqAWppcblPE
 Qz4gKX826o96A==
Message-ID: <sashiko-outbox-230408@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 15/19] drm/xe/vsec: Support late bind fw information
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261124020752.30551-36-michael.j.ruhl@intel.com>
References: <20261124020752.30551-21-michael.j.ruhl@intel.com>
 <20261124020752.30551-36-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 02:31:15 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/xe/vsec: missing wait_for_fw() in xe_pmt_discovery_read()
--

commit 2d33713440046c92de32fdf5a3aae46ed10a57ca
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Support late bind fw information

This commit defers Crescent Island VSEC registration to a delayed work
item until OOBMSM firmware is ready and adds firmware readiness waits to
PMT access callbacks.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 77fbb1257e09f..56aab437777ab 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c

[ ... ]

> @@ -474,6 +537,10 @@ static int xe_pmt_read_reg(struct device *dev, u32 g=
uid, u32 *reg, u32 offset)
>  	disc_addr +=3D inst + offset;
> =20
>  	xe_pm_runtime_get(xe);
> +	if (!wait_for_fw(xe)) {
> +		ret =3D -ENODATA;
> +		goto runtime_exit;
> +	}
> =20
>  	scoped_guard(mutex, &xe->pmt.lock) {
>  		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> @@ -481,6 +548,7 @@ static int xe_pmt_read_reg(struct device *dev, u32 gu=
id, u32 *reg, u32 offset)
>  		*reg =3D readl(disc_addr);
>  	}
> =20
> +runtime_exit:
>  	xe_pm_runtime_put(xe);
> =20
>  	drm_dev_exit(idx);

[Severity: Medium]
Should xe_pmt_discovery_read() also call wait_for_fw(xe) before reading
from CRI_IDX_TELEM_DISCOVERY?

Although cri_late_bind_probe_work() waits for OOBMSM firmware before
registering the VSEC auxiliary devices initially, those devices remain
registered across D3cold and system suspend/resume.  When the GPU resumes
from D3cold, xe_pm_runtime_resume() -> xe_late_bind_pm_resume() queues
the late-binding firmware reload asynchronously on late_bind.wq, so the
device becomes runtime-active before the firmware finishes loading.  If
pmt_telemetry or pmt_crashlog probes or rebinds during that window,
pmt_get_headers() -> xe_pmt_discovery_read() passes
xe_pm_runtime_get_if_active(xe) and reads discovery headers from
CRI_IDX_TELEM_DISCOVERY before the firmware is running.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124020752.3055=
1-21-michael.j.ruhl@intel.com?part=3D15
