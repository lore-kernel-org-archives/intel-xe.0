Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDC1C624D3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 18:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE80810E575;
	Fri,  4 Sep 2026 18:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hWnlxz/u";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7E010E575
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 18:55:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 910CE438E2;
 Fri,  4 Sep 2026 18:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 472811F00A3D;
 Fri,  4 Sep 2026 18:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788548126;
 bh=h4RI80N4n7nL1L5enhxz6D9CTZr5CtLBsvcMdIukQCE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=hWnlxz/uBdcb26WEg7D7OVjcXeW1py72nt0fnM63U0OuLNpcJE9T3FeZzxY7Qnow7
 C8p46KtHvkGzGSIcYuxXAOxvHaCSD4qA9XjhFbkfiQxO0pP02KE+m7pc8k0DrxAtbx
 kMZUzivaWdgjTF5dLedcf/Y+72fZ4AVofH3ds+E4Cvtjk7cXCcVjLlGPqj5KoOD4PJ
 eAnpjy9Nxb23RxsaeB1t0u6txYXT3//vSeaiQR/bat7Zd18bb++kboUTS5iD/ctkbb
 P6nq51QpkRtAl0Ed6tc12Nnh3krZPcO8PuZk9hPjqE1/9RvCsdFcfGOeBh19kr0HWH
 f13Tsw6zXn7tw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 17/18] drm/xe/vsec: Update PMT internal access
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904182451.1164868-37-michael.j.ruhl@intel.com>
References: <20260904182451.1164868-20-michael.j.ruhl@intel.com>
 <20260904182451.1164868-37-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 18:55:25 +0000
Message-Id: <20260904185526.472811F00A3D@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Uninitialized MMIO offset used in PMT telemetry reads during hardw=
are monitor registration, causing invalid MMIO accesses.
--

commit d59cca0476ebbe3cb43377a85bcbb964d1b8401f
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Update PMT internal access

Current PMT internal access assumes BMG devices. Use the new PMT GUID API
to read the device specific guid, and cleanup newly unused mmio parameter.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index b9740224e07ff..c44a7d24816d1 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -517,9 +517,15 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int chan=
nel, long *energy)
> =20
>  	if (hwmon->xe->info.platform =3D=3D XE_BATTLEMAGE) {
>  		u64 pmt_val;
> +		u32 guid;
> =20
> -		ret =3D xe_pmt_telem_read(hwmon->xe->drm.dev,
> -					xe_mmio_read32(mmio, BMG_PUNIT_TELEMETRY_GUID),
> +		ret =3D xe_vsec_get_guid(hwmon->xe, &guid);
> +		if (ret) {
> +			drm_warn(&hwmon->xe->drm, "PMT device is not available: %d\n", ret);
> +			*energy =3D 0;
> +			return;
> +		}
> +		ret =3D xe_pmt_telem_read(hwmon->xe->drm.dev, guid,

[Severity: High]
This is a pre-existing issue, but does this telemetry read target an invalid
MMIO address during hardware monitor registration?

xe_device_probe() calls xe_hwmon_register() before xe_vsec_init().
xe_hwmon_register() internally calls xe_hwmon_energy_get() during
preregistration, triggering this xe_pmt_telem_read().

Because xe->pmt.base_offset is still uninitialized (0) at this point, the
read in xe_pmt_telem_read():

drivers/gpu/drm/xe/xe_vsec.c:xe_pmt_telem_read() {
    void __iomem *telem_addr =3D xe->mmio.regs + xe->pmt.base_offset;
    ...
    telem_addr +=3D offset + user_offset;
    ...
    memcpy_fromio(data, telem_addr, count);
}

seems to evaluate to an incorrect platform-specific telemetry offset (e.g.,
xe->mmio.regs + 0 + 0x0230) instead of the correct base. Reading unmapped
PCI address space can cause a PCIe Unsupported Request and Machine Check
Exception during boot on BMG platforms.

>  					&pmt_val, BMG_ENERGY_STATUS_PMT_OFFSET,	sizeof(pmt_val));

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904182451.1164=
868-20-michael.j.ruhl@intel.com?part=3D17
