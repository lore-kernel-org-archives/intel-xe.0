Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C309F606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 00:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j1ZMgQGa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8355010E080;
	Tue, 24 Nov 2026 00:52:01 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9AD10E080
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 00:51:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0269D45046;
 Tue, 24 Nov 2026 00:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C171C1F000C6;
 Tue, 24 Nov 2026 00:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795481514;
 bh=A+yPcHQgPmQtHQ0Ve0IbXUcyn581xGS/OoaetVcfX2c=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=j1ZMgQGaSvx/GDPz88GXSMarrz8mDWE0lMKDgCcYTFYwO/DEZybWNO/LCsiO+Ybmf
 0krErOjWAWNTgdnI0qWsY5ODSTKMF679TZJg9DC+6RaQiVYePLBHJ12UB35L82zz5p
 O16VbBn+Q/tPJLzKiMyqORhWsltsQFXxhKdlK4M++zbP1e3Da5SZdTwyYEwBjVi65G
 /mHl/avcAhUjS7rNeix1oR9Q3hmBCtdMbcCvxYjX3CGJhznkcbjCOjRxAwDRKNrVrl
 Rcr2ARqesfcNgYORL9Yipd2A0eNQ3rwHyzfX/CFd4KmVQIDpZQCZpxzqgjm/k1LYRC
 R2Bg3+zMNhCyA==
Message-ID: <sashiko-outbox-230317@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 14/19] drm/xe/vsec: Crescent Island PMT callbacks
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261124003856.4145635-35-michael.j.ruhl@intel.com>
References: <20261124003856.4145635-21-michael.j.ruhl@intel.com>
 <20261124003856.4145635-35-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 00:51:54 +0000
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
- [High] drm/xe/vsec: missing drm_dev_exit() on error in
  xe_pmt_discovery_read()
--

commit 8c8761ddca798aa5d26ec62fcb0ab2b48dec6b52
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Crescent Island PMT callbacks

This commit introduces PMT discovery, register read/write, and telemetry
callbacks for Crescent Island (CRI) and registers CRI PMT functionality
during VSEC initialization.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index a814d7151eeae..188eaf13d68ff 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
[ ... ]
> @@ -358,20 +364,184 @@ int xe_pmt_telem_read(struct device *dev, u32 guid=
, u64 *data, loff_t user_offse
>  	return ret =3D=3D 0 ? count : ret;
>  }
> =20
> -static struct pmt_callbacks xe_pmt_cb =3D {
[ ... ]
> +static int xe_pmt_discovery_read(struct device *dev, unsigned long cap_i=
d, u32 element,
> +				 u32 *disc_data)
> +{
> +	struct xe_device *xe =3D kdev_to_xe_device(dev);
> +	void __iomem *disc_addr =3D xe->mmio.regs;
> +	struct intel_vsec_header *headers;
> +	int ret =3D 0;
> +	u32 offset;
> +	int idx;
> +
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> +
> +	if (!xe_pm_runtime_get_if_active(xe))
> +		return -ENODATA;
[ ... ]
> +dev_exit:
> +	xe_pm_runtime_put(xe);
> +	drm_dev_exit(idx);
> +
> +	return ret;
> +}

[Severity: High]
Does this leak the drm_unplug_srcu read lock acquired by drm_dev_enter()
when xe_pm_runtime_get_if_active() returns false?  Returning -ENODATA
without calling drm_dev_exit(idx) leaves the SRCU read lock held, which
triggers a lockdep warning on return to userspace and causes any later
drm_dev_unplug() to hang in synchronize_srcu().  Note that jumping to
dev_exit would also call an unbalanced xe_pm_runtime_put(xe).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124003856.4145=
635-21-michael.j.ruhl@intel.com?part=3D14
