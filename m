Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97843606A31C
	for <intel-xe@archiver.kernel.org>; Sat, 28 Nov 2026 06:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=igX+1hCj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6170B10E17F;
	Sat, 28 Nov 2026 06:12:27 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B048C10E17F
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Nov 2026 06:12:20 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C7F0B60626;
 Sat, 28 Nov 2026 06:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A73D1F00893;
 Sat, 28 Nov 2026 06:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795846339;
 bh=HD13/o/dik+hWqaRQwXKGDlPS7cNXLisEptugEWttKs=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=igX+1hCjv61a1pd3Iy23Ah6NBW2J5GEhoDanjN3EY8clxABv4jbspT42vTR5uCkBP
 fl+xP5oiQzYD6KYhwGtHWnz2IaVDnvndeMcKgTvDTOVTkR9Wf/3xNgyAqtvbKfl7+F
 0bZ8EFduDlEA6hTIpTnrDfpPaEyn1mP4M+wfFN3nRNctWkoG47C3Ur6aB5Q6wIVu20
 dUod+jDpSp3BDgCM8kCTktVPoI9OF/qasNLnTHvyMEuTxTJprYDuzQ/SB1AawLnh2c
 qY3K7zuNaS76raoYuNCrJl2z2udbhWoKTziAqFD6tjfkxveFgnlpsQa4Lysp5FaqUk
 zq2AMFOCvdQjw==
Message-ID: <sashiko-outbox-238487@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/10] drm/xe: Expose tjmax_fan_control_enable device
 sysfs
To: "Karthik Poosa" <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261128055923.3316956-10-karthik.poosa@intel.com>
References: <20261128055923.3316956-1-karthik.poosa@intel.com>
 <20261128055923.3316956-10-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 06:12:19 +0000
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
- [Medium] drm/xe: tjmax_fan_control_enable exposed as no-op on SR-IOV
  VFs
- [Medium] drm/xe: uninitialized val passed to xe_pcode_read() in
  fan_control_attr_is_visible()
--

commit f041e7b8d44d672ec8e023036136e0162ee46779
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe: Expose tjmax_fan_control_enable device sysfs

This commit adds a read-write tjmax_fan_control_enable sysfs attribute
to read and configure the firmware TjMax fan control mode via PCODE
mailbox commands.

> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe=
_device_sysfs.c
> index f6275e74eb317..3a4861b825485 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c

[ ... ]

> @@ -203,6 +206,73 @@ static const struct attribute_group late_bind_attr_g=
roup =3D {

[ ... ]

> +static umode_t fan_control_attr_is_visible(struct kobject *kobj,
> +					   struct attribute *attr, int n)
> +{
> +	struct device *dev =3D kobj_to_dev(kobj);
> +	struct xe_device *xe =3D pdev_to_xe_device(to_pci_dev(dev));
> +	u32 val;
> +	int ret;
> +
> +	guard(xe_pm_runtime)(xe);
> +	ret =3D xe_pcode_read(xe_device_get_root_tile(xe),
> +			    PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_TJMAX_FAN_CONTROL_MODE, 0),
> +			    &val, NULL);
> +
> +	return ret ? 0 : attr->mode;
> +}

[Severity: Medium]
Should val be initialized to 0 before calling xe_pcode_read(), as in
tjmax_fan_control_enable_show()?

xe_pcode_read() -> pcode_mailbox_rw() -> __pcode_mailbox_rw() treats
val0 as an in/out argument and unconditionally writes *data0 to
PCODE_DATA0 before issuing the mailbox command:

drivers/gpu/drm/xe/xe_pcode.c:__pcode_mailbox_rw() {
	...
	xe_mmio_write32(mmio, PCODE_DATA0, *data0);
	xe_mmio_write32(mmio, PCODE_DATA1, data1 ? *data1 : 0);
	xe_mmio_write32(mmio, PCODE_MAILBOX, PCODE_READY | mbox);
	...
}

Leaving val uninitialized writes stack garbage into PCODE_DATA0 during
driver probe, triggering KMSAN uninit-value warnings and risking command
rejection if firmware checks the data register.

[ ... ]

> @@ -428,5 +498,11 @@ int xe_device_sysfs_init(struct xe_device *xe)
>  			return ret;
>  	}
> =20
> +	if (xe->info.has_fan_control) {
> +		ret =3D devm_device_add_group(dev, &fan_control_attr_group);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return 0;
>  }

[Severity: Medium]
Can fan_control_attr_group be exposed on SR-IOV VFs where PCODE access
is disabled?

On platforms with both has_fan_control and has_sriov (such as
Battlemage), vf_update_device_info() sets xe->info.skip_pcode =3D 1 but
leaves xe->info.has_fan_control enabled.  Because pcode_mailbox_rw()
immediately returns 0 when skip_pcode is set,
fan_control_attr_is_visible() sees ret =3D=3D 0 and exposes
tjmax_fan_control_enable on VFs, where reads report a fabricated value
and writes silently succeed as no-ops.  Guarding registration with
!IS_SRIOV_VF(xe) (or !xe->info.skip_pcode), like
auto_link_downgrade_attr_group and late_bind_attr_group above, would
avoid registering it on VFs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128055923.3316=
956-1-karthik.poosa@intel.com?part=3D9
