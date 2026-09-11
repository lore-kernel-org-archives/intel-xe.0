Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20CFC88E53
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 20:26:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8CE10E324;
	Fri, 11 Sep 2026 20:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nlSNfGtn";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64BA10E324
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 20:26:15 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 6973A600AA;
 Fri, 11 Sep 2026 20:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8FCE1F000FF;
 Fri, 11 Sep 2026 20:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789158375;
 bh=g+dP/W3822kgbD1Lg4z6OXx5dLTpfkLXGB3NIups9ig=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=nlSNfGtnMpb/5C04TatdSHwcypILgoCFJwBl7z/DL6dauIIscLoQ/VpcV3K0SBiDF
 Pf40Iv14UAbxbUnl+U7io/GT83i2YCY9/WiWS0Qt8R+MUZWZKIlPfqxV40fvay3izu
 RkmOQALJmaiybHnBE8Wp+rRFBkqrVez5AeEXJyVwxlwfxyLXePjISQbQ2GA1JeHQah
 yRGMCNFtni3Kif+YEEmAUfqAarBN2o0uEPdYGutDbkKhtGwDSRjet8bw1MexO+C/RQ
 NM5xfi0Hn1qUCiE9qXdxr/KRvwsqpMqWsONNRvHk8Ak5dqCPo8fIKowRYsCh/+KPba
 Io9om1SrpQiuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 05/20] platform/x86/intel/pmt: Do not remap when
 using callbacks
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260911201148.1610547-27-michael.j.ruhl@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-27-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 20:26:14 +0000
Message-Id: <20260911202614.E8FCE1F000FF@smtp.kernel.org>
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
- [High] `pmt_telem_read32()` does not check for the `read_telem` callback =
and unconditionally dereferences `ep->base`, which the target patch now lea=
ves as NULL for callback-driven devices.

Pre-existing issues:
- [High] The sysfs `mmap` interface (`intel_pmt_mmap`) unconditionally maps=
 physical memory directly to userspace, completely bypassing the `read_tele=
m` callback required for safe hardware access and power management.
--

commit a61b8465842029c0f2ced5b0fa7ec2cd402fcbfa
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

platform/x86/intel/pmt: Do not remap when using callbacks

A callback indicates that the parent driver is responsible for accessing
the data area.  Creating a PMT memory remap is redundant.

If a read_telem callback has been provided, do not create a remap.

> diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x8=
6/intel/pmt/class.c
> index 402d51df834a6..1c7a372b4fc42 100644
> --- a/drivers/platform/x86/intel/pmt/class.c
> +++ b/drivers/platform/x86/intel/pmt/class.c
[ ... ]
> @@ -403,14 +403,19 @@ static int intel_pmt_dev_register(struct intel_pmt_=
entry *entry,
>  	if (!entry->size)
>  		return 0;
> =20
> -	res.start =3D entry->base_addr;
> -	res.end =3D res.start + entry->size - 1;
> -	res.flags =3D IORESOURCE_MEM;
> +	/*
> +	 * The read_telem callback is responsible for this mapping, and may have
> +	 * different requirements for use. If the callback is present do not
> +	 * create the map.
> +	 */
> +	if (!(entry->cb && entry->cb->read_telem)) {
> +		struct resource res =3D DEFINE_RES_MEM(entry->base_addr, entry->size);
> =20
> -	entry->base =3D devm_ioremap_resource(dev, &res);
> -	if (IS_ERR(entry->base)) {
> -		ret =3D PTR_ERR(entry->base);
> -		goto fail_ioremap;
> +		entry->base =3D devm_ioremap_resource(dev, &res);
> +		if (IS_ERR(entry->base)) {
> +			ret =3D PTR_ERR(entry->base);
> +			goto fail_ioremap;
> +		}
>  	}

[Severity: High]
Since this change leaves entry->base as NULL when a callback is present,
will calling the exported pmt_telem_read32() API on a callback-driven
endpoint result in a NULL pointer dereference?

In drivers/platform/x86/intel/pmt/telemetry.c:pmt_telem_read32():
    ...
    memcpy_fromio(data, ep->base + offset, NUM_BYTES_DWORD(count));
    ...

The function unconditionally dereferences ep->base without checking if a
read_telem callback should be used instead.


> =20
>  	sysfs_bin_attr_init(&entry->pmt_bin_attr);

[Severity: High]
This is a pre-existing issue, but does unconditionally exposing the mmap
handler to userspace allow users to circumvent the hardware state management
that the read_telem callback is meant to provide?

In drivers/platform/x86/intel/pmt/class.c:intel_pmt_dev_register():
    ...
    entry->pmt_bin_attr.mmap =3D intel_pmt_mmap;
    ...

Because intel_pmt_mmap() maps physical memory directly to userspace:

In drivers/platform/x86/intel/pmt/class.c:intel_pmt_mmap():
    ...
    if (io_remap_pfn_range(vma, vma->vm_start, pfn,
        vsize, vma->vm_page_prot))
    ...

A user can read from the mapped memory region directly. Could this bypass
locking and power management (like pm_runtime_get_sync), leading to hangs
or Machine Check Exceptions if userspace accesses PCIe MMIO space while the
device is in D3?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911201148.1610=
547-22-michael.j.ruhl@intel.com?part=3D5
