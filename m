Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3110BC98318
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 15:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C269C10F680;
	Thu, 24 Sep 2026 15:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gsARZPL+";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBF910F66C;
 Thu, 24 Sep 2026 15:36:42 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E78F7601DE;
 Thu, 24 Sep 2026 15:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B2891F000FF;
 Thu, 24 Sep 2026 15:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790264201;
 bh=GVD/OkLLNkpzpvvBUDDvU2PFPsttaitYj94/0tnnw2o=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=gsARZPL+APvFcCEgHdnuC4a9QeLn0KKhWoY/tMr+H5EUMRE4Snxxpv++yvdCy2T5j
 1676IJ4mBGTIyh2vAeVpTId7yi2VTJMkSwUA8sNfJ45VNUV9vkGaS1+IBoFhJ9fHrp
 /9+hECI9SXKJm2rsdJJTVt4EreFvedJwRz1+F2B3XBAmlQbMLOsfQ9i0t9WSXgSB66
 bftBj/6e2tFNzsfIYV+xMTzZWu7DTpc3YD5jWanrnD2KFkBLa87JdTJVQAnWlumYyG
 Vi+RUHP/FP7G6lwZyxPP5rd8lSWq07lI8/ZJWWA+DQbapNcULb8AH8XrIHdx78ZrC9
 PnBj7XsHvZyDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] drm/i915/gmbus: Add bit-banging debugfs control
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260924152812.439986-2-ramanaidu.naladala@intel.com>
References: <20260924152812.439986-1-ramanaidu.naladala@intel.com>
 <20260924152812.439986-2-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 15:36:40 +0000
Message-Id: <20260924153641.6B2891F000FF@smtp.kernel.org>
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
- [Medium] drm/i915: race in debugfs write causes force_bit refcount corrup=
tion
--

commit dbe416d20c046e80d3b0b6e516a640339bbbd1e9
Author: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

drm/i915/gmbus: Add bit-banging debugfs control

This commit adds a connector debugfs interface to enable or disable I2C
bit-banging for Intel GMBUS adapters.

> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm=
/i915/display/intel_gmbus.c
> index 60a70dea5d856..38d6d11483994 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c

[ ... ]

> +static ssize_t intel_force_bit_banging_write(struct file *file,
> +						     const char __user *ubuf,
> +						     size_t len, loff_t *offp)
> +{
> +	struct seq_file *m =3D file->private_data;
> +	struct intel_connector *connector =3D m->private;
> +	bool force_bit_banging;
> +	int ret;
> +
> +	ret =3D kstrtobool_from_user(ubuf, len, &force_bit_banging);
> +	if (ret)
> +		return ret;
> +
> +	if (force_bit_banging !=3D connector->force_bit_banging) {
> +		intel_gmbus_force_bit(connector->base.ddc, force_bit_banging);
> +		connector->force_bit_banging =3D force_bit_banging;
> +	}

[Severity: Medium]
Is this state transition safe against concurrent debugfs writes?

Since this read-modify-write block on connector->force_bit_banging
is not protected by any locks, multiple threads concurrently writing to
the intel_force_bit_banging debugfs file could trigger multiple calls to
intel_gmbus_force_bit() for the same state change.

Looking at intel_gmbus_force_bit(), it manages bus->force_bit as a
reference count:

drivers/gpu/drm/i915/display/intel_gmbus.c:intel_gmbus_force_bit() {
    ...
    mutex_lock(&display->gmbus.mutex);
    bus->force_bit +=3D force_bit ? 1 : -1;
    ...
}

Could unbalanced calls resulting from a race here cause the refcount to
underflow or leak, permanently forcing bit-banging mode for the adapter?

> +	*offp +=3D len;
> +
> +	return len;
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924152812.4399=
86-1-ramanaidu.naladala@intel.com?part=3D1
