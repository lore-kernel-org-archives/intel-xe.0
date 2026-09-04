Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B66FC79F82
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 18:53:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E2C10E575;
	Fri,  4 Sep 2026 18:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZmbELXPr";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D30910E575
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 18:53:29 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D2EA4600D4;
 Fri,  4 Sep 2026 18:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC681F00A3D;
 Fri,  4 Sep 2026 18:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788548008;
 bh=GP5r36Ny6COVkTBdXPfoUfW94OzMosNSn3G7xzeKwNk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ZmbELXPrVjmL6Nuw1TS3Z5qyTtGyA6nbxRKKaRUn607CLuP/JML5v0JQ8e+WOEMqi
 k9qtjYhwOXMKjDhaRL/3K/p/RGHBs3CicAWM0lNxJnFySKEjLKVlDFdkn6avzrDseP
 E/9laJ3FE93RlRw2eCiuv/i7rU39j9BhoRbcOPQ0CU3Ad1nZaxSvWVDU1Gv5E+kxLc
 W15qY3gfLpZXR1OiO+92kp1+ghn+gtwP/8m6wWLugNnWhNppDW5UxiY32CPRfR1JQ9
 jGuoI42JqgbHVVcb2R1dEK1VxBeVwOj1n0LYtf7j2rEB3wnmthVQP0S7IcvhtReae+
 ZXzRZIrKZ78tg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 12/18] drm/xe/vsec: Refactor BattleMage PMT defines
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904182451.1164868-32-michael.j.ruhl@intel.com>
References: <20260904182451.1164868-20-michael.j.ruhl@intel.com>
 <20260904182451.1164868-32-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 18:53:27 +0000
Message-Id: <20260904185328.5EC681F00A3D@smtp.kernel.org>
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

New issues:
- [High] Uninitialized `xe->pmt.base_offset` causes `xe_pmt_telem_read()` t=
o read from the wrong MMIO address when accessed before `xe_vsec_init()` co=
mpletes.

Pre-existing issues:
- [High] Crashlog control sysfs attributes perform direct MMIO reads/writes=
 on Xe without waking the device, risking hardware hangs.
--

commit 584b4caa6a3ecc5f2e93919c5b1cb6ab09e0654c
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Refactor BattleMage PMT defines

This commit refactors PMT definitions for Battlemage and introduces a
configurable base offset to support multiple platforms. It modifies the
PMT telemetry read path to use the new offset rather than a hardcoded macro.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index a9baf0bfe572c..031c1c0ae5706 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
[ ... ]
> @@ -140,37 +201,79 @@ static int xe_guid_decode(u32 guid, int *index, u32=
 *offset)
[ ... ]
>  int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t us=
er_offset,
>  		      u32 count)
>  {
>  	struct xe_device *xe =3D kdev_to_xe_device(dev);
> -	void __iomem *telem_addr =3D xe->mmio.regs + BMG_TELEMETRY_OFFSET;
> +	u32 cap_type =3D FIELD_GET(GUID_CAP_TYPE, guid);
> +	void __iomem *telem_addr =3D xe->mmio.regs + xe->pmt.base_offset;

[Severity: High]
Does this read from the wrong MMIO address during early probe?

During device initialization in xe_device_probe(), xe_hwmon_register() is
called before xe_vsec_init(). The hwmon registration synchronously reads the
initial energy value through this call chain:

xe_hwmon_register()
  xe_hwmon_energy_is_visible()
    xe_hwmon_energy_get()
      xe_pmt_telem_read()

Since xe->pmt.base_offset is not initialized until xe_vsec_init() is called
later in the probe sequence, it will still be 0 here. This would cause an
out-of-bounds MMIO read (xe->mmio.regs + 0 + offset) that misses the
SOC_BASE offset entirely, potentially triggering a machine check exception
or hanging the system.

[ ... ]
> @@ -210,6 +313,9 @@ void xe_vsec_init(struct xe_device *xe)
> =20
>  	switch (platform) {
>  	case XE_VSEC_BMG:
> +		if (IS_SRIOV_VF(xe))
> +			return;
> +		xe->pmt.base_offset =3D BMG_TELEMETRY_OFFSET;
>  		info->priv_data =3D &xe_pmt_cb;
>  		break;

[Severity: High]
This is a pre-existing issue, but does the lack of .read_reg and .write_reg
callbacks in xe_pmt_cb risk unclocked MMIO accesses?

The crashlog.c driver implements sysfs attributes (e.g., clear, trigger)
that read and write PMT crashlog control registers. If the parent driver
doesn't provide .read_reg and .write_reg callbacks, pmt_crashlog_read_reg()
and pmt_crashlog_rmw() fall back to direct readl() and writel() on the
mapped MMIO region (entry->disc_table).

Since xe_pmt_cb only provides .read_telem, reading or writing these sysfs
attributes while the Xe device is suspended (D3cold) will trigger unclocked
MMIO accesses without waking the device via runtime PM. This can cause PCIe
Unsupported Request faults or system hangs.

Could .read_reg and .write_reg be implemented for Battlemage to ensure the
device is woken up during these accesses?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904182451.1164=
868-20-michael.j.ruhl@intel.com?part=3D12
