Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4FFC79FBD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:03:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B974310F1F8;
	Wed,  9 Sep 2026 16:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TPomX29l";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5441210F1F4
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 16:02:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 31A2641FBB;
 Wed,  9 Sep 2026 16:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE3701F00A3A;
 Wed,  9 Sep 2026 16:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788969779;
 bh=EdJa9Pavw0JFLMEWostR++YvzmfLPMzYQENhfd26fA8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=TPomX29lxIA/jk0zBIHNkH7m+02BWq/SFfG9QMrZ+b/n647GiKH1+N/sec0gS72Lt
 durGjTHVc9+t62wk2TuPd+ciCocG4Hr822EClVsl/skupJyRTzVooXSfLpLwmXJzoM
 sa5ToB3u+GjjHY/29O4dH6HyifAOwau8+7CSfQjQVNyTmBeteFtRKTuNnaNh2jH12V
 xTQE3WJt68otMnTiYVT6c1QEqVrRMZo6E96u7ns7W2K+osagSyZ0cJSQkzdz4lHOqG
 aFeJuIxnENy4CegXa+ghcJeLngSR8i/UHnZyk9EMnZys/w5BlrBhEF2rmW42VSUwJX
 JqMmVrJOvkPaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 13/20] drm/xe/vsec: Add base_offset to allow for more
 flexibilty
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909154739.1515514-35-michael.j.ruhl@intel.com>
References: <20260909154739.1515514-22-michael.j.ruhl@intel.com>
 <20260909154739.1515514-35-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 16:02:58 +0000
Message-Id: <20260909160258.DE3701F00A3A@smtp.kernel.org>
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
- [High] Time-of-check to time-of-use (TOCTOU) race condition in xe_pmt_tel=
em_read when calculating telem_addr.
--

commit 7e5dc04a0fcd634a62684607ee28e4cb12e99eb2
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Add base_offset to allow for more flexibilty

This commit introduces a base_offset for pmt_telem_read() to support other
devices that require a non-fixed offset. It adds a check to verify that the
offset has been set before allowing device access.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index ca8414441a692..856973473fd75 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
[ ... ]
> @@ -173,14 +173,15 @@ static int xe_guid_decode(u32 guid, int *index, u32=
 *offset)
>   * Return:
>   * * -ENODEV device is not available (hotplug)
>   * * -EINVAL for VF and PMT WATCHER requests
> + * * -EAGAIN base_offset has not been set, so init path has not yet been=
 done.
>   * * count   number of bytes read on success
>   */
>  int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t us=
er_offset,
>  		      u32 count)
>  {
>  	struct xe_device *xe =3D kdev_to_xe_device(dev);
>  	u32 cap_type =3D FIELD_GET(GUID_CAP_TYPE, guid);
> +	void __iomem *telem_addr =3D xe->mmio.regs + xe->pmt.base_offset;

[Severity: High]
Can this cause an out-of-bounds MMIO read due to a time-of-check to
time-of-use (TOCTOU) race?

If an unprivileged user reads the hwmon sysfs files (e.g., energy1_input)
during driver load, xe_pmt_telem_read() can be invoked concurrently with
xe_device_probe() before xe_vsec_init() sets base_offset.

At this point, xe->pmt.base_offset is 0, so telem_addr is evaluated as
xe->mmio.regs.

>  	u32 mem_region;
>  	u32 offset;
>  	int ret =3D 0;
> @@ -194,6 +195,11 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, =
u64 *data, loff_t user_offse
>  		goto dev_exit;
>  	}
> =20
> +	if (!xe->pmt.base_offset) {
> +		ret =3D -EAGAIN;
> +		goto dev_exit;
> +	}

[Severity: High]
Because drm_dev_enter() (called just before this in the function) acts as a
compiler and memory barrier, if xe_vsec_init() executes concurrently and
sets base_offset:

CPU1
xe_vsec_init()
   xe->pmt.base_offset =3D BMG_TELEMETRY_OFFSET;

CPU2
xe_pmt_telem_read()
   // calculated telem_addr earlier with base_offset =3D=3D 0
   if (!xe->pmt.base_offset) // Now reads BMG_TELEMETRY_OFFSET, passes

Will the function then proceed to use the stale telem_addr (derived from 0)
instead of the proper offset, resulting in reading from the wrong hardware
registers when memcpy_fromio() is later called?

Should telem_addr be computed after this validation check to ensure the
correct offset is used?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909154739.1515=
514-22-michael.j.ruhl@intel.com?part=3D13
