Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF11AC624D3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 18:42:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D9E10E55D;
	Fri,  4 Sep 2026 18:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gVSXk+U1";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3FB10E55D
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 18:42:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7A08841A38;
 Fri,  4 Sep 2026 18:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AFCE1F00A3D;
 Fri,  4 Sep 2026 18:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788547336;
 bh=Gg9G3RR4CEe01KY6PZhP1NJq7zFjAEFDFBGjYG/FQj8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=gVSXk+U1T4Jt+R39Uua8xx2ZEabuU5JfiVj/DdZgoNfKrTWF3GBpy9pWj63mnf6UH
 Jwuqd76NaunhE6yL3wX9cDPH/ZLW92AtgxcMC13pC/wvcoCYgV2EHwmweLaoPM06oC
 S+6MQw+TweG/E/nFoIzIozdvCbjOqTOE2MUJRX0ivFviS4c6R4KkgPhSGjUiwa/Tvh
 BXICSg0LMITfwP9o9wf2O7bcx8IKKBz93Yn6vJNbZZi5IIqB+8IaHLxjyU7b5wpDhJ
 f1HYrLt7IvCIv8BXLeKIrfYQ6Do3zX8sZeYX4PP5Q2T0DRLcqMnBlqK7iYDdgtSRWo
 FRGx8uv55ikyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 05/18] platform/x86/intel/pmt: Do not remap when
 using callbacks
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904182451.1164868-25-michael.j.ruhl@intel.com>
References: <20260904182451.1164868-20-michael.j.ruhl@intel.com>
 <20260904182451.1164868-25-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 18:42:15 +0000
Message-Id: <20260904184216.3AFCE1F00A3D@smtp.kernel.org>
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
- [High] NULL pointer dereference in `pmt_telem_read32()` for callback-mana=
ged endpoints.
- [High] Resource access control bypass via sysfs `mmap` for callback-manag=
ed endpoints.
- [Medium] Application Energy Telemetry (AET) integration silently fails fo=
r callback-managed endpoints.
--

commit 4b5eaf240c4891c9b29025f06df395bf25b62269
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

platform/x86/intel/pmt: Do not remap when using callbacks

A callback indicates that the parent driver is responsible for accessing
the data area. Creating a PMT memory remap is redundant. If a read_telem
callback has been provided, do not create a remap.

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
Does leaving entry->base unmapped cause a NULL pointer dereference in
pmt_telem_read32()?

Because entry->base is intentionally left unmapped (NULL) for callback-mana=
ged
devices, any invocation of pmt_telem_read32() on such a device will
unconditionally dereference ep->base:

drivers/platform/x86/intel/pmt/telemetry.c:pmt_telem_read32() {
    ...
    memcpy_fromio(data, ep->base + offset, NUM_BYTES_DWORD(count));
    ...
}

[Severity: High]
Does unconditionally registering intel_pmt_mmap() in this function allow
userspace to bypass the device-specific callback requirements?

If a callback is required for safe access, the mmap handler still directly =
maps
the physical address to userspace:

drivers/platform/x86/intel/pmt/class.c:intel_pmt_mmap() {
    ...
	if (io_remap_pfn_range(vma, vma->vm_start, pfn,
		vsize, vma->vm_page_prot))
		return -EAGAIN;
    ...
}

Because entry->pmt_bin_attr.mmap =3D intel_pmt_mmap; is unconditionally set=
 a
few lines below, this exposes a lockless bypass to userspace for hardware t=
hat
explicitly requires callback synchronization.

[Severity: Medium]
Will this silently break Application Energy Telemetry (AET) integration for
callback-managed endpoints?

During runtime reads, the AET driver expects the region address to be mappe=
d,
but since it is now NULL, it skips all regions without emitting errors:

arch/x86/kernel/cpu/resctrl/intel_aet.c:intel_aet_read_event() {
    ...
	for (int i =3D 0; i < e->pfg->count; i++) {
		if (!e->pfg->regions[i].addr)
			continue;
        ...
		evtcount =3D readq(e->pfg->regions[i].addr + idx * sizeof(u64));
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904182451.1164=
868-20-michael.j.ruhl@intel.com?part=3D5
