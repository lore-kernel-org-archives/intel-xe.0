Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49F6CA5FCB
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 12:07:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8E010E410;
	Thu,  1 Oct 2026 12:07:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IY4MzLZk";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB93910E410
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 12:07:46 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 6F139601E4;
 Thu,  1 Oct 2026 12:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F791F00898;
 Thu,  1 Oct 2026 12:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790856466;
 bh=+p1OxlS0S0zKNI22ReZF6g8Z87SRBdSfM4TEtnCl46c=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=IY4MzLZk68oxRNOmHf+jsFfzdgyZC7biRuYnG83obsjBKM0Fcv43rgQgBnDpIVzJ6
 QrpJ+26faK24snIVPXtoghUkcI8GRyioYNsKBdKV2MwVnjMPMAFpeeQ8Lc5V+sPdMi
 Ncg1WQ4/D7vHE3BGNv+G22H64BgxLMCdyC8JXbfKIyz0PBc9Cfb90fVDQVocmFDmD6
 jR6Nckh+lo9sQ8kCQwJyNLRE/Nuv1yod2vZTCovx2C4tdynLUgoIz2zvsc/ORelWOS
 q5Uj+xac7Pb3AtYml+0TYvEdMbez6VX30pYWIc1eu3xKgvFZPy9ZMefQ8NqILytBIo
 AjDmzX5+s6AUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] drm/xe/i2c: Expose AMC Alert reason sysfs
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261001121302.4102629-2-badal.nilawar@intel.com>
References: <20261001121302.4102629-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 12:07:45 +0000
Message-Id: <20261001120746.06F791F00898@smtp.kernel.org>
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
- [Medium] xe: data race and incorrect ordering in AMC alert sysfs read
- [Low] sysfs: ABI documentation mismatch for xe_amc_alert_reason attribute
--

commit 18d032c7e5837ea6476300e788f566784a9575ac
Author: Badal Nilawar <badal.nilawar@intel.com>
Subject: drm/xe/i2c: Expose AMC Alert reason sysfs

This commit introduces a read-only sysfs attribute to expose the AMC
(Add-In Management Controller) alert reason. It adds documentation and
implements the sysfs creation and value update logic in xe_amc.c.

> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-amc b/Docume=
ntation/ABI/testing/sysfs-driver-intel-xe-amc
> new file mode 100644
> index 0000000000000..34927fa5dcfe8
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
> @@ -0,0 +1,24 @@
> +What:		/sys/bus/pci/drivers/xe/.../xe_amc_alert_reason

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
> index edd50bf8261ec..7f21044fd1b7b 100644
> --- a/drivers/gpu/drm/xe/xe_amc.c
> +++ b/drivers/gpu/drm/xe/xe_amc.c

[ ... ]

> @@ -104,6 +108,45 @@ static const struct amc_request amc_get_alert_reason=
 =3D {
>  	},
>  };
> =20
> +/**
> + * DOC: AMC Alert Reason
> + *
> + * Expose AMC alert reason through device sysfs
> + *
> + * See Documentation/ABI/testing/sysfs-driver-intel-xe-amc for the ABI
> + * specification.
> + */
> +
> +static ssize_t amc_alert_reason_show(struct device *dev,
> +				     struct device_attribute *attr, char *buf)
> +{
> +	struct xe_device *xe =3D pdev_to_xe_device(to_pci_dev(dev));
> +	struct xe_amc *amc =3D xe->i2c->amc;
> +	u8 alert_reason;
> +
> +	if (!amc->alert_seen)

[Severity: Medium]
Could this read of amc->alert_seen cause a data race?

The sysfs reader relies on this boolean flag to decide whether to read
alert_reason, but it lacks memory barriers or READ_ONCE(). A concurrent
sysfs reader might observe an inconsistent state here while a new alert
is being processed.

> +		return sysfs_emit(buf, "none\n");
> +
> +	alert_reason =3D READ_ONCE(amc->alert_reason);
> +
> +	return sysfs_emit(buf, "%s\n", amc_alert[alert_reason]);
> +}
> +static DEVICE_ATTR_RO(amc_alert_reason);

[Severity: Low]
Does this macro create an attribute named amc_alert_reason, rather than the
documented ABI name?

The ABI documentation specifies the attribute name as xe_amc_alert_reason,
but this macro creates it without the xe_ prefix. Userspace tools relying on
the ABI documentation might fail to find the sysfs file.

[ ... ]

> @@ -153,17 +196,26 @@ static void xe_amc_work(struct work_struct *work)
>  out_reassert_interrupt:
>  	xe_mmio_rmw32(amc->i2c->mmio, I2C_CONFIG_CMD, PCI_COMMAND_INTX_DISABLE,=
 0);
> =20
> +	amc->alert_seen =3D true;
> +

[Severity: Medium]
Does setting amc->alert_seen to true before updating amc->alert_reason
expose a race window?

A concurrent sysfs read of the alert attribute could observe
alert_seen =3D=3D true and then read an uninitialized or stale alert_reason=
 value,
returning an incorrect or default alert reason to userspace.

>  	switch (alert_reason) {
>  	case AMC_ALERT_FW_DOWNLOAD:
>  	case AMC_ALERT_THERMAL_TRIP:
>  	case AMC_ALERT_OOB_REQUEST:
>  	case AMC_ALERT_OOB_RESET:
> -	case AMC_ALERT_CATERR:
> -		dev_warn(amc->i2c->drm_dev, "AMC Alert: %s\n", amc_alert[alert_reason]=
);
> -		xe_device_declare_wedged(i2c_client_to_xe_device(client));
> +	case AMC_ALERT_CATERR: {
> +		struct xe_device *xe =3D i2c_client_to_xe_device(client);
> +
> +		WRITE_ONCE(amc->alert_reason, alert_reason);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001121302.4102=
629-2-badal.nilawar@intel.com?part=3D1
