Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E8AC79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 14:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF94110EC12;
	Tue,  8 Sep 2026 14:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NWcns4FP";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4886710EC13
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 14:09:40 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 20A174063C;
 Tue,  8 Sep 2026 14:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9811F00A3A;
 Tue,  8 Sep 2026 14:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788876580;
 bh=7VULVfebZbUxUztiRtSFYDATef8KX8/Mzcky7QH/mQM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=NWcns4FPmF3zU63hmKTZVZ9wzZEsJI6mZAmWLcoGnaORqv9NwMntL268RUpeW9ai7
 rK7fPJo56Y/VgdxWY8mIIE0uQ4wNYtUDKWprjg1yegiUzcpphLaIyW/aXuxyIky+Hn
 uQLlqQyYaM8tB2oaW2sfijUxo8GPLdWL38YYDeQQVFZoU5rEaWXI9VdNySz3kyr8NT
 /Q/8BWr2+v//VolExIkeGkGHMo8xWMaJ8qRlasXXOvToe4yF67UxkKfr4vDPj2Mi5W
 FmmqEwZg+3jdFmefu4x23NWGOpAFvVtx0ywOKPqmPThQJgUT5qu6s8ttFG26iZlElr
 j4R0wYH1NTdUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 8/8] drm/xe: convert PCI barrier mmap to use xe_mmio_gem
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260908134955.1344429-18-matthew.auld@intel.com>
References: <20260908134955.1344429-10-matthew.auld@intel.com>
 <20260908134955.1344429-18-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 14:09:39 +0000
Message-Id: <20260908140939.CD9811F00A3A@smtp.kernel.org>
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
- [High] The migration of the PCI barrier mmap to use `xe_mmio_gem` removed=
 the `VM_READ` restriction, allowing userspace to map and read from the doo=
rbell register.
--

commit 545a53278606e03a94bbfc5ae72975b8ad8c6cae
Author: Matthew Auld <matthew.auld@intel.com>

drm/xe: convert PCI barrier mmap to use xe_mmio_gem

This commit converts the PCI barrier mmap over to use xe_mmio_gem, simplify=
ing
the codebase and replacing the hard coded fake offset design. It introduces=
 the
first user of xe_mmio_gem for mapping the PCIe doorbell register.

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
[ ... ]
> -static int xe_pci_barrier_mmap(struct file *filp,
> -			       struct vm_area_struct *vma)
> -{
[ ... ]
> -	if (vma->vm_flags & (VM_READ | VM_EXEC))
> -		return -EINVAL;
> -
> -	vm_flags_clear(vma, VM_MAYREAD | VM_MAYEXEC);

[Severity: High]
Does removing this VM_READ restriction allow userspace to map the PCIe
doorbell register with read permissions?

The original xe_pci_barrier_mmap implementation explicitly restricted mappi=
ngs
to write-only by rejecting VM_READ and clearing VM_MAYREAD. By migrating to
the generic xe_mmio_gem_mmap implementation in xe_mmio_gem.c, this read
restriction is dropped, as the generic code only restricts VM_EXEC:

drivers/gpu/drm/xe/xe_mmio_gem.c:xe_mmio_gem_mmap() {
        if (vma->vm_flags & VM_EXEC)
                return -EINVAL;

        vma->vm_page_prot =3D pgprot_noncached(vma_get_page_prot(vma));
        vm_flags_mod(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
                     VM_NORESERVE, VM_MAYEXEC);
}

Reading from write-only PCIe doorbell registers can trigger an Unsupported
Request or PCIe completion timeout, resulting in a Machine Check Exception
and a full system hang. Because this mapping is accessible to unprivileged
userspace, could this introduce a denial of service vulnerability?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908134955.1344=
429-10-matthew.auld@intel.com?part=3D8
