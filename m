Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E9DC5DF68
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 22:17:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C6A10F148;
	Wed, 12 Aug 2026 22:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Pgc1PeFp";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E7E10E44A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:51:50 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 662E760A7D;
 Wed, 12 Aug 2026 19:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E569F1F000E9;
 Wed, 12 Aug 2026 19:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786564310;
 bh=fN9TfEzpkTu9L+CW95dmcmEkK/vv26zrBVVf7jRRj3o=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Pgc1PeFpaN3HUPs4hjHcwT4tzfCUnS+MUNgRshG1BCv9JpmTlRE+lcMkS20CUzhux
 tRfO+89VubWVVe8yq4edoA9y7aIutEz1oiCY+Dhch0ft+QeIzCJQDj1VukAnrFDjv+
 taRsoYoGiGPJvt1Uv39B7ZAMNacFsADUXKgDHI9gNBtvqkQ6ZD+5FvRBLdmQWQoKHq
 ZHc9qM33o6iJIJJpeOugfH4UskY8EXcaBPqOmt4cqz0bJsJ43ZwffQtALTet5KkKUZ
 VFWOiRmPd+jxTHDZrsVLvKyiCBZ9hd7V53WzT+UYVPDvU9JiJdup3gFZd4KvjpSqOG
 Pcwiq6j+VNXmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/10] drm/xe/vsec: Support possible hotplug exit
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260812193742.2170188-17-michael.j.ruhl@intel.com>
References: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
 <20260812193742.2170188-17-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 19:51:49 +0000
Message-Id: <20260812195149.E569F1F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `xe_pmt_telem_read` function performs a `memcpy_fromio` withou=
t validating that the requested telemetry read fits within the `xe->mmio.re=
gs` mapped region. The `user_offset` and `count` parameters passed from the=
 sysfs interface are bounded by `entry->size` (derived from the device's PM=
T discovery header). However, the hardware-provided size is implicitly trus=
ted and never validated against the driver's actual MMIO mapping limits. A =
malicious or buggy hardware device could advertise an artificially large `h=
eader->size`, bypassing the `sysfs` offset limits. Because `xe_pmt_telem_re=
ad` calculates `telem_addr =3D xe->mmio.regs + offset + user_offset` and pe=
rforms `memcpy_fromio`, this permits an out-of-bounds read past the end of =
the `xe->mmio.regs` mapping. Reading arbitrary unmapped physical memory or =
unrelated device registers could cause a system crash, leak sensitive hardw=
are state, or trigger unintended side effects from read-sensitive registers.
--

--- Patch [5]: [PATCH v2 05/10] drm/xe/vsec: Support possible hotplug exit =
---
commit 240693c221b75275ccbcc4f83244797a5eb5edf9
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Support possible hotplug exit

This patch adds drm_dev_enter() and drm_dev_exit() to xe_pmt_telem_read()
to verify the device is valid in the hotplug context before accessing it. It
also updates error handling to properly exit the DRM device context on fail=
ure.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
[ ... ]
> @@ -148,14 +155,20 @@ int xe_pmt_telem_read(struct device *dev, u32 guid,=
 u64 *data, loff_t user_offse
>  	u32 cap_type =3D FIELD_GET(GUID_CAP_TYPE, guid);
>  	u32 mem_region;
>  	u32 offset;
> -	int ret;
> +	int ret =3D 0;
> +	int idx;
> =20
> -	if (!xe->soc_remapper.set_telem_region)
> +	if (!drm_dev_enter(&xe->drm, &idx))
>  		return -ENODEV;
> =20
> +	if (!xe->soc_remapper.set_telem_region) {
> +		ret =3D -EINVAL;
> +		goto dev_exit;
> +	}
> +
>  	ret =3D xe_guid_decode(guid, &mem_region, &offset);
>  	if (ret)
> -		return ret;
> +		goto dev_exit;
> =20
>  	telem_addr +=3D offset + user_offset;

[Severity: High]
This is a pre-existing issue, but does this code need to validate that the
requested telemetry read fits within the xe->mmio.size limit?

If a device provides a malicious or buggy PMT discovery header that adverti=
ses a
large entry->size, the sysfs offset limits would allow large user_offset and
count values.

Could the subsequent memcpy_fromio(data, telem_addr, count) further down in=
 this
function then read past the end of the xe->mmio.regs mapping, potentially
causing a crash or leaking state from unmapped or read-sensitive registers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812193742.2170=
188-12-michael.j.ruhl@intel.com?part=3D5
