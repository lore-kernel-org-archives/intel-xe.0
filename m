Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF63DC624D7
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 20:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A04D10E256;
	Thu,  3 Sep 2026 20:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z1Uqjmjp";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D8D10E256
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 20:24:20 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9D9E841473;
 Thu,  3 Sep 2026 20:24:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE301F000E9;
 Thu,  3 Sep 2026 20:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788467060;
 bh=iN/8MpCfpf/M3XNkoYbn3TLnxNf5y19OU5VCHvVZR8E=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Z1Uqjmjpnuq0ZLitZ+ov1zo4YaKuX7xBvV7VoQylvJ1VQMVuJH94jlOjvD5CnwVR9
 /fqOmoOJ3k9mCCZbcO+Pj7iREBM9C6tqnaIjeUW3RdMz6Rb8FuM1V/390o8mxmRmpw
 8YYp+tzPJ4q3yIhQ33cQWj6jhO40CBFarq8fW+8cf29JmQ34kiJYeFgvsILqtMBft5
 V1Y9j7/bzwUrQKTeJGG8rgeM6n9MuhrXwJJyHBQfEG6kRChnP2959sVkrNhOGI3VyG
 /VjJRWHGWKDGFO6Sc4VQphFwMoZbRMH6bCRTQ3wLWJcMzlFaaU60jxNQvBjM7XWfJF
 gIFEOIEm8Nr4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 05/18] platform/x86/intel/pmt: Do not remap when
 using callbacks
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903201002.1064889-25-michael.j.ruhl@intel.com>
References: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
 <20260903201002.1064889-25-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 20:24:19 +0000
Message-Id: <20260903202420.5FE301F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] NULL pointer dereference in `pmt_telem_read32()` when accessing te=
lemetry endpoints that provide a callback.
- [Medium] PMT regions using callbacks break the `telemetry_region` API con=
tract, causing KUnit test failures and silently dropped telemetry data.

Pre-existing issues:
- [High] Userspace mmap unconditionally exposes telemetry memory, allowing =
it to bypass the `read_telem` callback and hardware protections.
--

commit 12a3129bb64bc1b8ec1d2e409cf11d07b5c7a14a
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>
Subject: platform/x86/intel/pmt: Do not remap when using callbacks

This commit updates the Intel PMT driver to skip creating a memory remap wh=
en
a read_telem callback is provided. It avoids redundant mappings for devices
where the parent driver manages data access.

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
Does skipping the memory mapping here cause a NULL pointer dereference in
exported APIs?  When pmt_telem_read32() is called on a callback-enabled
endpoint, it unconditionally dereferences ep->base without checking:

drivers/platform/x86/intel/pmt/telemetry.c:pmt_telem_read32() {
    ...
    memcpy_fromio(data, ep->base + offset, NUM_BYTES_DWORD(count));
    ...
}

Since this patch leaves entry->base (and subsequently ep->base) as NULL,
will this result in a kernel panic when consumers use pmt_telem_read32()?

[Severity: Medium]
Similarly, does skipping the map break the telemetry_region API contract?
In pmt_copy_region(), the region address is populated using ep->base:

drivers/platform/x86/intel/pmt/telemetry.c:pmt_copy_region() {
    ...
    region->addr =3D entry->ep->base;
    region->size =3D entry->size;
    ...
}

This sets region->addr to NULL for callback-enabled devices. Existing
consumers expect a valid address, and the KUnit test for PMT regions
explicitly fails on this:

drivers/platform/x86/intel/pmt/discovery-kunit.c:validate_pmt_regions() {
    ...
    KUNIT_ASSERT_NOT_ERR_OR_NULL(test, (__force const void *)region->addr);
    ...
}

> =20
>  	sysfs_bin_attr_init(&entry->pmt_bin_attr);
>  	entry->pmt_bin_attr.attr.name =3D ns->name;
>  	entry->pmt_bin_attr.attr.mode =3D 0440;
>  	entry->pmt_bin_attr.mmap =3D intel_pmt_mmap;

[Severity: High]
This is a pre-existing issue, but does assigning this mmap handler
unconditionally expose telemetry memory and bypass the callbacks?

If a userspace process calls mmap on the PMT sysfs file, the
intel_pmt_mmap handler maps the raw physical memory directly into
userspace using io_remap_pfn_range().  For endpoints that provide a
read_telem callback, they rely on software mediation to safely access
data (like waking the device, acquiring locks, etc.).

Could userspace completely circumvent these protections and potentially
cause hardware lockups or incorrect data reads by mapping the physical
memory directly?

>  	entry->pmt_bin_attr.read =3D intel_pmt_read;
>  	entry->pmt_bin_attr.size =3D entry->size;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903201002.1064=
889-20-michael.j.ruhl@intel.com?part=3D5
