Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E931606A326
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 22:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F++8EZcP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1119010E710;
	Mon,  2 Nov 2026 22:39:02 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4021410E710
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 22:38:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 44FAF601EF;
 Mon,  2 Nov 2026 22:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D40091F00A16;
 Mon,  2 Nov 2026 22:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793659135;
 bh=2bjoyYT7Z7xR6TRpc6fiTdRwdQCirlHnTv8hlmvipX4=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=F++8EZcP52g5DZOyzDixebibbs+8KqWy3tREyTgfAr/eytSrHXbjLfpNg7Uh45g1X
 LbrxC+FExXrMybDTGXISohIFK0oRalozj6r/F6YpJsA577gKgR9HvLyNCJ1e+AU7g8
 fVEbHCiS+d/ir390ti/KwObUfPyrzYBC5ZdJlchU//WBfifGX6+kUPYCq1bflLirSi
 6crRLo5HVr6jZzG1zLBsNfDlnYnBzbqHxNB+idTEsscPVjUbEFnsU4ge7HwuTiOrnO
 kjQczMzxqKy52BHxXfJz2WECn17qEaFbd4ZQRgUJzlZpp2ArgNJ8Gp33NijJ8Vx0Hk
 9w1oEam+hW9nA==
Message-ID: <sashiko-outbox-194293@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 11/16] drm/xe/vsec: Crescent Island PMT callbacks
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261102221314.119028-29-michael.j.ruhl@intel.com>
References: <20261102221314.119028-18-michael.j.ruhl@intel.com>
 <20261102221314.119028-29-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 22:38:54 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] drm/xe/vsec: xe_pmt_telem_read() leaves CRI discovery window rem=
apped
- [Low] drm/xe/vsec: mixed goto and scoped_guard() cleanup in reg callbacks
--

commit dc4cd399324f5200a61e70ed93f8ba5b2a90435c
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Crescent Island PMT callbacks

This commit introduces Crescent Island PMT register read and write callbacks
to access the discovery status and control areas via the indexed MMIO window
and registers the CRI PMT functionality.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index a814d7151eeae..0f6e3be520c09 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -358,20 +358,120 @@ int xe_pmt_telem_read(struct device *dev, u32 guid=
, u64 *data, loff_t user_offse
>  	return ret =3D=3D 0 ? count : ret;
>  }
> =20
> -static struct pmt_callbacks xe_pmt_cb =3D {
> +/**
> + * xe_pmt_read_reg() - read a crashlog register
> + * @dev: the xe device that registered the callback
> + * @guid: PMT guid of the crashlog instance
> + * @reg: data read from the PMT data structure
> + * @offset: which data to read from the PMT data structure
> + *
> + * Read the requested PMT register based on the pcie device and guid.  T=
he
> + * supported struct is the Crashlog Type1 Version2.
> + *
> + * Currently this is for CRI only.
> + *
> + * Return:
> + * * -ENODEV device is not available (hotplug)
> + * * -EINVAL invalid guid
> + * * 0       success
> + */
> +static int xe_pmt_read_reg(struct device *dev, u32 guid, u32 *reg, u32 o=
ffset)
> +{
> +	struct xe_device *xe =3D kdev_to_xe_device(dev);
> +	void __iomem *disc_addr =3D xe->mmio.regs + xe->pmt.base_offset;
> +	int ret =3D 0;
> +	u32 inst;
> +	int idx;
> +
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> +
> +	if (FIELD_GET(GUID_DEVICE_ID, guid) !=3D CRI_DEVICE_ID ||
> +	    FIELD_GET(GUID_CAP_TYPE, guid) !=3D CRASHLOG) {
> +		ret =3D -EINVAL;
> +		goto dev_exit;
> +	}
> +
> +	inst =3D FIELD_GET(GUID_RECORD_ID, guid) =3D=3D PUNIT ?
> +		CRI_CRASHLOG_PUNIT_DISC_OFFSET : CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
> +	disc_addr +=3D inst + offset;
> +
> +	xe_pm_runtime_get(xe);
> +
> +	scoped_guard(mutex, &xe->pmt.lock) {
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +		*reg =3D readl(disc_addr);
> +	}
> +
> +	xe_pm_runtime_put(xe);
> +
> +dev_exit:
> +	drm_dev_exit(idx);
> +
> +	return ret;
> +}
> +
> +static int xe_pmt_write_reg(struct device *dev, u32 guid, u32 reg, u32 o=
ffset)
> +{
> +	struct xe_device *xe =3D kdev_to_xe_device(dev);
> +	void __iomem *disc_addr =3D xe->mmio.regs + xe->pmt.base_offset;
> +	int ret =3D 0;
> +	u32 inst;
> +	int idx;
> +
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return -ENODEV;
> +
> +	if (FIELD_GET(GUID_DEVICE_ID, guid) !=3D CRI_DEVICE_ID ||
> +	    FIELD_GET(GUID_CAP_TYPE, guid) !=3D CRASHLOG) {
> +		ret =3D -EINVAL;
> +		goto dev_exit;
> +	}
> +
> +	inst =3D FIELD_GET(GUID_RECORD_ID, guid) =3D=3D PUNIT ?
> +		CRI_CRASHLOG_PUNIT_DISC_OFFSET : CRI_CRASHLOG_OOBMSM_DISC_OFFSET;
> +	disc_addr +=3D inst + offset;
> +
> +	xe_pm_runtime_get(xe);
> +
> +	scoped_guard(mutex, &xe->pmt.lock) {
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +
> +		writel(reg, disc_addr);
> +	}
> +
> +	xe_pm_runtime_put(xe);
> +
> +dev_exit:
> +	drm_dev_exit(idx);
> +
> +	return ret;
> +}

[Severity: Low]
As reported by Sashiko on v11 [1], this isn't a bug, but both
xe_pmt_read_reg() and xe_pmt_write_reg() in drivers/gpu/drm/xe/xe_vsec.c mix
goto-based cleanup (goto dev_exit) with scope-based cleanup
(scoped_guard(mutex, &xe->pmt.lock)) in the same function, and duplicate
nearly identical bodies differing only in readl() vs writel().

Since the guid validation only inspects the u32 guid argument, could that
check be performed before drm_dev_enter() to avoid the dev_exit label (or
convert the remaining cleanup in these functions to a consistent pattern),
and could the shared setup between xe_pmt_read_reg() and xe_pmt_write_reg()
be factored into a common helper?

[ ... ]

> @@ -399,8 +499,15 @@ void xe_vsec_init(struct xe_device *xe)
>  	switch (platform) {
>  	case XE_VSEC_BMG:
>  		xe->pmt.base_offset =3D BMG_TELEMETRY_OFFSET;
> -		info->priv_data =3D &xe_pmt_cb;
> +		info->priv_data =3D &xe_bmg_pmt_cb;
>  		break;
> +
> +	case XE_VSEC_CRI:
> +		xe->pmt.base_offset =3D CRI_PMT_OFFSET;
> +		info->priv_data =3D &xe_cri_pmt_cb;
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +		break;

[Severity: Medium]
Can a call to xe_pmt_telem_read() leave the shared CRI_PMT_OFFSET MMIO wind=
ow
banked to a telemetry or crashlog payload region instead of
CRI_IDX_TELEM_DISCOVERY when PMT discovery headers are read during probe?

On Crescent Island, both the discovery tables and the telemetry/crashlog da=
ta
banks share the CRI_PMT_OFFSET window controlled by set_telem_region().
During auxiliary driver probe in pmt_telem_probe() and pmt_crashlog_probe(),
the Intel PMT drivers read the discovery headers directly from the ioremapp=
ed
CRI_PMT_OFFSET window without calling read_reg() or holding xe->pmt.lock:

drivers/platform/x86/intel/pmt/class.c:pmt_get_headers() {
    ...
	memset(entry->disc_header, 0, header_bytes);
	memcpy_fromio(entry->disc_header, disc_table,
		      min(header_bytes, resource_size(disc_res)));

	/* Used by crashlog driver */
	entry->disc_table =3D disc_table;
    ...
}

and:

drivers/platform/x86/intel/pmt/crashlog.c:pmt_crashlog_header_decode() {
    ...
	header->access_type =3D GET_ACCESS(readl(disc_table));
	header->guid =3D readl(disc_table + GUID_OFFSET);
	header->base_offset =3D readl(disc_table + BASE_OFFSET);

	/* Size is measured in DWORDS, but accessor returns bytes */
	header->size =3D GET_SIZE(readl(disc_table + SIZE_OFFSET));
    ...
}

However, in drivers/gpu/drm/xe/xe_vsec.c, xe_pmt_telem_read() switches the
remapper index to mem_region and does not restore CRI_IDX_TELEM_DISCOVERY
before releasing xe->pmt.lock:

	scoped_guard(mutex, &xe->pmt.lock) {
		/* set SoC re-mapper index register based on GUID memory region */
		xe->soc_remapper.set_telem_region(xe, mem_region);

		memcpy_fromio(data, telem_addr, count);
	}

In addition, xe_vsec_init() sets CRI_IDX_TELEM_DISCOVERY without holding
xe->pmt.lock.

If pmt_telemetry or pmt_crashlog probes asynchronously as a module or is
rebound via sysfs after any xe_pmt_telem_read() call (such as from debugfs
residency reads or an earlier telemetry sysfs read), wouldn't
pmt_get_headers() and pmt_crashlog_header_decode() read telemetry or crashl=
og
payload data instead of the discovery headers?

[1] https://lore.kernel.org/r/20260923181115.2514193-38-michael.j.ruhl@inte=
l.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102221314.1190=
28-18-michael.j.ruhl@intel.com?part=3D11
