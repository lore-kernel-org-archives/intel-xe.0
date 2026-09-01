Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D31C624D0
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 19:51:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F70210EED7;
	Tue,  1 Sep 2026 19:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YdpkAxFz";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDD010EED7
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 19:51:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3549240F36;
 Tue,  1 Sep 2026 19:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26A11F00A3A;
 Tue,  1 Sep 2026 19:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788292312;
 bh=lK9YGhq6xgO4lLI4qJKfsp/vFhiGY1lRJBRAOZpZj2k=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=YdpkAxFzmIYhgFJuHkS0Z+cKqJPYTmc2yJw+3x44mAJkqh4RrFvA+lFeHkX5zprKi
 N3IoXVwZgZAo5Z/9gTx0JilDoKy+3VhgoaGDy4xZSsAudcCdudEoW5RulNH7bjriGT
 styZ/0S1ZJmZRVmLQwXqpAVCGd4Mbu6IYsBjGCZFa+4c1Z5Y+PBZKUAhVq9hXPG5K0
 80q56UkxFx0CVYCn6Hg7E+MU4FeSPkRwAc7xC/Dnh7boHrLQZMSJqXFZC1AHGKf4te
 d/isOOarS0qZsPNwEELiAnT5y9uV8tBlyYdNrJdBfisAF7AMTVwXksKYCR8RuQYYlK
 Brv1AveqvDq7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/18] platform/x86/intel/pmt: Do not remap when
 using callbacks
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260901192736.626777-26-michael.j.ruhl@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
 <20260901192736.626777-26-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 19:51:51 +0000
Message-Id: <20260901195151.E26A11F00A3A@smtp.kernel.org>
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
- [High] NULL pointer dereference in `pmt_telem_read32()` when endpoints us=
e telemetry callbacks.
- [High] The sysfs `.mmap` handler unconditionally maps physical telemetry =
memory to userspace, bypassing the newly added parent driver read callback.
--

commit a657165fa233afba9ebccd9da3e933c1ff49ccee
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

platform/x86/intel/pmt: Do not remap when using callbacks

This commit updates the PMT class driver to skip creating a memory remap
when a read_telem callback is provided. It intends to let the parent
driver handle data area access when a callback is present.

> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x8=
6/intel/pmt/class.c
> index af7c951b569a2..350129121ff13 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c

[ ... ]

> @@ -403,14 +402,18 @@ static int intel_pmt_dev_register(struct intel_pmt_=
entry *entry,
>  	if (!entry->size)
>  		return 0;
> =20
> -	res.start =3D entry->base_addr;
> -	res.end =3D res.start + entry->size - 1;
> -	res.flags =3D IORESOURCE_MEM;
> +	if (!is_cb_read_telem(entry->cb)) {
> +		struct resource res =3D {0};
> =20
> -	entry->base =3D devm_ioremap_resource(dev, &res);
> -	if (IS_ERR(entry->base)) {
> -		ret =3D PTR_ERR(entry->base);
> -		goto fail_ioremap;
> +		res.start =3D entry->base_addr;
> +		res.end =3D res.start + entry->size - 1;
> +		res.flags =3D IORESOURCE_MEM;
> +
> +		entry->base =3D devm_ioremap_resource(dev, &res);
> +		if (IS_ERR(entry->base)) {
> +			ret =3D PTR_ERR(entry->base);
> +			goto fail_ioremap;
> +		}
>  	}

[Severity: High]
Does this leave entry->base uninitialized (NULL) when a telemetry callback
is present?

If a callback is provided, we skip mapping the device memory. However, the
exported pmt_telem_read32() API unconditionally dereferences ep->base witho=
ut
checking for the callback:

drivers/platform/x86/intel/pmt/telemetry.c:pmt_telem_read32() {
        ...
        memcpy_fromio(data, ep->base + offset, NUM_BYTES_DWORD(count));
        ...
}

Unlike pmt_telem_read(), which safely delegates to pmt_telem_read_mmio(),
any driver invoking pmt_telem_read32() on a callback-enabled endpoint might
trigger a NULL pointer dereference.

> =20
>  	sysfs_bin_attr_init(&entry->pmt_bin_attr);

[Severity: High]
Since the intel_pmt_mmap handler is unconditionally assigned to the sysfs
binary attribute just below this, can userspace map the physical telemetry
memory directly, bypassing the parent driver's read callback?

When userspace mmaps the sysfs file, intel_pmt_mmap() handles it:

drivers/platform/x86/intel/pmt/class.c:intel_pmt_mmap() {
        ...
        if (io_remap_pfn_range(vma, vma->vm_start, pfn,
                        vsize, vma->vm_page_prot))
                return -EAGAIN;
        ...
}

This directly maps the physical memory to userspace using
io_remap_pfn_range(), which seems to defeat the callback-based access
control and hardware state management intended by skipping the ioremap.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901192736.6267=
77-20-michael.j.ruhl@intel.com?part=3D6
