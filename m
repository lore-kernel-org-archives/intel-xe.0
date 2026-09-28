Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C417CA5FA2
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 12:24:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B435C10E2AD;
	Mon, 28 Sep 2026 12:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fnG1C1CC";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0312D10E2AD;
 Mon, 28 Sep 2026 12:24:40 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3975060052;
 Mon, 28 Sep 2026 12:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF9211F000FF;
 Mon, 28 Sep 2026 12:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790598278;
 bh=z+nF1H/1dc6GvHT/1VWP10dOAeD4/evEObFp2T9woJA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=fnG1C1CCcVm49GYTFPF70k9XTkePD8t8VRpZUbmqvr2Hlj/PCSoMg/WOAMCBPbQWN
 kKuT5cJGfBEdS5SSXsXb/Whyk4OgvR4KDhq0DqRj+Pr4CshftprC34Ojb4KhSIWcbD
 BkeY+lMISQFwpWi3+HdpfUXR70ahcdsm1r6pdsX+NXBgz6ZbgFsiCM+v25TE9CUut9
 /LpDOYdSa2tiOr906onqzq1Xtb26pp9H7pRzHLgTqNxgSfWB15AHXfMkWgkE+okP80
 2No+luhiRMBDw+5BA04Cxvu0LZdBfYjCg315xruTEJfZvTx/MzR6olk28uGmOxxvlH
 OJiz4ryF5glKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/1] drm/i915/gmbus: Add bit-banging debugfs control
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260928121940.728102-2-ramanaidu.naladala@intel.com>
References: <20260928121940.728102-1-ramanaidu.naladala@intel.com>
 <20260928121940.728102-2-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 12:24:38 +0000
Message-Id: <20260928122438.AF9211F000FF@smtp.kernel.org>
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
- [Medium] i915: gmbus force_bit counter leak via concurrent debugfs writes
--

commit f09d193c0d7afc5fe7e1a110befe13bd976b0393
Author: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

drm/i915/gmbus: Add bit-banging debugfs control

This commit adds a debugfs interface, intel_force_bit_banging, to allow
enabling or disabling I2C bit-banging for Intel GMBUS adapters directly
from userspace.

> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm=
/i915/display/intel_gmbus.c
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
[ ... ]
> @@ -871,6 +873,71 @@ static const struct i2c_algorithm gmbus_algorithm =
=3D {
[ ... ]
> +static ssize_t intel_force_bit_banging_write(struct file *file,
> +						     const char __user *ubuf,
> +						     size_t len, loff_t *offp)
> +{
> +	struct seq_file *m =3D file->private_data;
> +	struct intel_connector *connector =3D m->private;
> +	struct intel_gmbus *bus =3D container_of(connector->base.ddc,
> +					       struct intel_gmbus, adapter);
> +	bool force_bit_banging;
> +	int ret;
> +
> +	ret =3D kstrtobool_from_user(ubuf, len, &force_bit_banging);
> +	if (ret)
> +		return ret;
> +
> +	if (force_bit_banging !=3D bus->debugfs_force_bit) {
> +		intel_gmbus_force_bit(connector->base.ddc, force_bit_banging);
> +		bus->debugfs_force_bit =3D force_bit_banging;
> +	}

[Severity: Medium]
Could this check-then-act block cause an issue if multiple threads write to
the debugfs file concurrently?

Since there is no lock protecting the read of bus->debugfs_force_bit and
the subsequent update, concurrent writes could see the same value for
bus->debugfs_force_bit and call intel_gmbus_force_bit() multiple times.

Because intel_gmbus_force_bit() manages a reference counter internally:

void intel_gmbus_force_bit(struct i2c_adapter *adapter, bool force_bit)
{
	...
	bus->force_bit +=3D force_bit ? 1 : -1;
	...
}

Redundant calls could permanently leak or underflow the bus->force_bit
counter, locking the GMBUS adapter into bit-banging mode and corrupting
the hardware transfer strategy. While debugfs is typically restricted to
root, a concurrent write sequence could still trigger this.

> +
> +	*offp +=3D len;
> +
> +	return len;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928121940.7281=
02-1-ramanaidu.naladala@intel.com?part=3D1
