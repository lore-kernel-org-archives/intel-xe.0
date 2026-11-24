Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C5D606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 01:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ldf1FqJE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA2710ED02;
	Tue, 24 Nov 2026 01:00:58 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD8C10ED02
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 01:00:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E01B541324;
 Tue, 24 Nov 2026 01:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59AB1F000CA;
 Tue, 24 Nov 2026 01:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795482051;
 bh=5vX1+0nbLu+VPeK+x8X4LSK6ucpoLzROm3KhiSd908s=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Ldf1FqJEFQi3UIeu0SyDIhIVNzkdz55yCVGau4qKlr5Bz8ggndnLxwj/m7+eTHlOJ
 m4t3vbwkGWRI4um7ohWDUa15212GcNNW1ODfL7jFp9bF/VJg4Qd3IeZv3j6eevLtfB
 /XDuXD1sS21htlaKMIzblH7dd9r4yYuc4u2vvNLoM1T5dUUM289uuho2q34FFcBD8C
 kA4eKzD/oeR4mgmcD39FgD9hA7ewJbQkAmjIhBCHzFJm3w6fJoFQyIxkKmK8qDZHGK
 AKUTQeb3SuH4VwPYhtksHJEMTWEqz9o+23LENYapLfud+pbEb/4I7XBXPNqVgT7TWQ
 leQsQZ5YtZUFg==
Message-ID: <sashiko-outbox-230326@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 15/19] drm/xe/vsec: Support late bind fw information
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261124003856.4145635-36-michael.j.ruhl@intel.com>
References: <20261124003856.4145635-21-michael.j.ruhl@intel.com>
 <20261124003856.4145635-36-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 01:00:51 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] drm/xe/vsec: missing wait_for_fw() in xe_pmt_discovery_read()
- [Medium] drm/xe/vsec: leaked drm_dev_enter() SRCU lock in
  xe_pmt_discovery_read()
--

commit db9b729d9b741b77f6f983b146c3a361055299c3
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Support late bind fw information

This commit defers Crescent Island VSEC registration to a delayed work
item and adds firmware readiness polling to PMT access callbacks until
late-bind firmware is initialized.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 188eaf13d68ff..26ed4e85614f9 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
[ ... ]
> @@ -470,6 +533,10 @@ static int xe_pmt_read_reg(struct device *dev, u32 g=
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
> @@ -477,6 +544,7 @@ static int xe_pmt_read_reg(struct device *dev, u32 gu=
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

On resume from D3cold or system suspend, xe_late_bind_pm_resume() queues
xe_late_bind_work to reload the oCode firmware asynchronously after the
device becomes runtime active.  If a PMT auxiliary driver probes or
rebinds during that window, pmt_get_headers() -> xe_pmt_discovery_read()
succeeds on xe_pm_runtime_get_if_active(xe) and reads discovery MMIO
before the firmware is ready:

drivers/gpu/drm/xe/xe_vsec.c:xe_pmt_discovery_read() {
	if (!drm_dev_enter(&xe->drm, &idx))
		return -ENODEV;

	if (!xe_pm_runtime_get_if_active(xe))
		return -ENODATA;
    ...
	scoped_guard(mutex, &xe->pmt.lock) {
		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
		memcpy_fromio(disc_data, disc_addr, PMT_DISC_DWORDS * sizeof(u32));
	}

dev_exit:
	xe_pm_runtime_put(xe);
	drm_dev_exit(idx);
}

[Severity: Medium]
In xe_pmt_discovery_read() above, does the early return when
xe_pm_runtime_get_if_active(xe) fails leak the drm_dev_enter() SRCU read
lock?

Returning -ENODATA without calling drm_dev_exit(idx) leaves
drm_unplug_srcu held, which triggers lockdep warnings and causes later
drm_dev_unplug() calls to hang waiting on synchronize_srcu().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124003856.4145=
635-21-michael.j.ruhl@intel.com?part=3D15
