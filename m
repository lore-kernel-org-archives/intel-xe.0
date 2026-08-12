Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E18C5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 22:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3152910F13A;
	Wed, 12 Aug 2026 22:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VKJUihbt";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E8710E076
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 20:04:51 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1F455600AD;
 Wed, 12 Aug 2026 20:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1861F00A3A;
 Wed, 12 Aug 2026 20:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786565090;
 bh=/dJ3w0UB0fbqwNBesX417TCbnPuzSbWSYFkQ2yqnKME=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=VKJUihbtyPZTBt5ufjovmTxNNxhfehf9fwZCL2lRLZGN4bBayhpPhbl5Q6YWmhKkf
 nlIOc7opE4imfNCWTILr6qWfv7sJubmvr03DXRQhnTpl6AIoVuaW4ijQ2cGQn2lOJg
 Ov1rO+j8nKFsG0va0mUPNAGfUBX478r11UGqUm+rxLaJ0T7gMrdvPhr2FxYjPE7fQW
 R6woZM9/aaXwwAhq/cEGmjs0Kzsw3f/HxO3sYNdOGrQ3Zy/ZPXuy6hwg/Id2xLkX4u
 lg5EO449bA+Fo6bQ2vQ2Ki6TpM59MdJd6zHdqs3Ddg5iTVDyvmlBuM6ko6b9anqlVo
 FvWT7iMaimf7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/10] drm/xe/vsec: Update PMT internal access for CRI
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260812193742.2170188-22-michael.j.ruhl@intel.com>
References: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
 <20260812193742.2170188-22-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 20:04:50 +0000
Message-Id: <20260812200450.9D1861F00A3A@smtp.kernel.org>
X-Mailman-Approved-At: Wed, 12 Aug 2026 22:17:09 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The function `xe_pmt_write_reg` executes a double put on the runti=
me PM usage counter on its success path.
- [Low] Unused `mmio` parameter in `read_residency_counter`.
--

--- Patch [10]: [PATCH v2 10/10] drm/xe/vsec: Update PMT internal access fo=
r CRI ---
commit dad9ae19b6a680a51c5ad534968234e3d02be8a6
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Subject: drm/xe/vsec: Update PMT internal access for CRI

This commit adds a new API to access the PMT telemetry GUID based on the
platform. It updates the debugfs, hwmon, and pcode components to use this
new xe_vsec_get_guid() function instead of reading the GUID directly.

> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debu=
gfs.c
> index 8de78cd0aa03b..0ef62b1e0e91f 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -96,11 +96,16 @@ static void read_residency_counter(struct xe_device *=
xe, struct xe_mmio *mmio,
>  				   u32 offset, const char *name, struct drm_printer *p)
>  {
>  	u64 residency =3D 0;
> +	u32 guid;
>  	int ret;
> =20
> -	ret =3D xe_pmt_telem_read(xe->drm.dev,
> -				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
> -				&residency, offset, sizeof(residency));
> +	guid =3D xe_vsec_get_guid(xe);

[Severity: Low]
Is the mmio parameter still needed in read_residency_counter()?

With the switch to xe_vsec_get_guid(), it looks like the mmio argument is no
longer accessed in the function body and can probably be removed from the
signature.

> +	if (!guid) {
> +		drm_warn(&xe->drm, "PMT device is not powered\n");
> +		return;
> +	}
> +
> +	ret =3D xe_pmt_telem_read(xe->drm.dev, guid, &residency, offset, sizeof=
(residency));

[ ... ]

While reviewing this, I also noticed a pre-existing issue in xe_pmt_write_r=
eg():

drivers/gpu/drm/xe/xe_vsec.c:xe_pmt_write_reg() {
    ...
	memcpy_toio(disc_addr, &reg, sizeof(reg));

	mutex_unlock(&xe->pmt.lock);
	xe_pm_runtime_put(xe);

runtime_exit:
	xe_pm_runtime_put(xe);
    ...
}

[Severity: High]
This is a pre-existing issue, but does xe_pmt_write_reg() execute a double =
put
on the runtime PM usage counter on its success path?

When the register write completes successfully, it unlocks the mutex and ca=
lls
xe_pm_runtime_put(xe), but then falls through to the runtime_exit label whi=
ch
calls xe_pm_runtime_put(xe) a second time. Can this lead to an underflow and
cause the device to enter runtime suspend prematurely while still in use?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812193742.2170=
188-12-michael.j.ruhl@intel.com?part=3D10
