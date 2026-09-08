Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BA0C79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 17:23:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4168C10E339;
	Tue,  8 Sep 2026 17:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nrT+sZxT";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E66310E339
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 17:23:38 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2D73443833;
 Tue,  8 Sep 2026 17:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78F41F00A3A;
 Tue,  8 Sep 2026 17:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788888218;
 bh=ELlGTlCBgu+T97s67mBoz6fRP5fTjOY+nLNMib4Xwjs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=nrT+sZxTmFpG+3pKp3mPdIo7ly/MnXB7jCveb2bPegCT8AY4v97Vm+IKsBbC8WawH
 opbm8i9k4PwikGbcG6UlpsiOzKDi+wntf+Rn2P9+nRQ5GRfhdkRBkpNRC2rIMEUVmG
 E3+yPId+zkPyZatoGqHixsEEClmu/9Kr4HlOYBExHIZqwI1NB2/EnZwgGv9XnD9MV6
 BdXIQK2bILz92um/g/la3IzfBY1FVWeBP76GXLWErt8Pw24FPcQjWNRo5GMKWhX9WS
 OAzvEsOHkJxqctw7hkWZTKToS3JzwSWEgVcDZ+m43z8LUZIHVw19+PxIhQHQ2nvUKn
 V8l7P3F7UE9LQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 8/8] drm/xe: convert PCI barrier mmap to use xe_mmio_gem
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260908165046.1393557-18-matthew.auld@intel.com>
References: <20260908165046.1393557-10-matthew.auld@intel.com>
 <20260908165046.1393557-18-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 17:23:37 +0000
Message-Id: <20260908172337.E78F41F00A3A@smtp.kernel.org>
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
- [High] The conversion to generic `xe_mmio_gem_mmap` drops the read access=
 restrictions for the PCI barrier, allowing unprivileged userspace to map t=
he write-only PCIe doorbell with `PROT_READ`.
--

commit ef90a93714d00fe81619728388f0697e023978dd
Author: Matthew Auld <matthew.auld@intel.com>

drm/xe: convert PCI barrier mmap to use xe_mmio_gem

This commit converts the PCI barrier mmap to use xe_mmio_gem, which
replaces the hard-coded fake offset design and removes duplicate code.
Userspace still queries the fake offset as before, but it is now managed
by the generic component.

> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
[ ... ]
> @@ -3664,6 +3665,39 @@ int xe_gem_create_ioctl(struct drm_device *dev, vo=
id *data,
>  	return err;
>  }
> =20
> +static int xe_gem_pci_barrier_mmap_offset(struct xe_device *xe, struct d=
rm_file *file,
> +					  struct drm_xe_gem_mmap_offset *args)
> +{
[ ... ]
> +		if (!*barrier) {
> +			phys_addr_t phys_addr;
> +
> +#define LAST_DB_PAGE_OFFSET 0x7ff000
> +			phys_addr =3D pci_resource_start(to_pci_dev(xe->drm.dev), 0) +
> +				LAST_DB_PAGE_OFFSET;
> +			*barrier =3D xe_mmio_gem_create(xe, file, phys_addr, SZ_4K);

[Severity: High]
Does the conversion to the generic xe_mmio_gem framework drop the read
access restrictions for the PCI barrier?

The original xe_pci_barrier_mmap handler explicitly checked and rejected
read access before it was removed in this patch:

xe_pci_barrier_mmap() {
        ...
        if (vma->vm_flags & (VM_READ | VM_EXEC))
                return -EINVAL;

        vm_flags_clear(vma, VM_MAYREAD | VM_MAYEXEC);
        ...
}

Without this protection, unprivileged userspace might be able to map the
write-only PCIe doorbell with PROT_READ. If userspace issues a memory read
to this write-only hardware register, the PCIe endpoint typically returns
an Unsupported Request (UR) completion.

Could this trigger Advanced Error Reporting (AER) faults, Machine Check
Exceptions (MCE), or system hangs, leading to a local denial of service?

> +			if (IS_ERR(*barrier)) {
> +				int err =3D PTR_ERR(*barrier);
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908165046.1393=
557-10-matthew.auld@intel.com?part=3D8
