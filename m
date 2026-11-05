Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875D7606D809
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 16:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JArpcvEX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411C410E302;
	Thu,  5 Nov 2026 16:25:05 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC07510E302
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 16:24:58 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0E491602C3;
 Thu,  5 Nov 2026 16:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E11D1F00919;
 Thu,  5 Nov 2026 16:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793895897;
 bh=m7MH4XzgL7nwxE4y+sBHb8l0TSz/ubtQCzO1BD4N51w=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=JArpcvEXh1CQy3yGoUUA4Ij6EB2sv4QbNGcYKcEV4gVN5yHQOWPOpjbz2c2nbFPDb
 ANi253C/AU9n9xbvZw7/ySEDzWC5qt55d51PoShKjI7cf0RktZLcahuB+brOybx9xU
 VwbOiACc0JMUdZfmBiRpwjQudT5KiwqH8pzGRQ7sxIXDIWIVuf+X4NWQ+szGUzOZlJ
 dD4GrS2UykAb4KNQRO1bp9IjUBPMwgNdc+mahSJnNWUNl1uxinSt2DJ8ky5WD7/ufp
 nZHA1l/EHFd9izf6DSYnn0YFW4+VDeq3umnQZpjTUsr9060ysOLQziGpxjoLVYf7AX
 dvuFSAbMwY3TA==
Message-ID: <sashiko-outbox-199483@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/4] vfio/pci: Allow hiding BAR ranges from the VFIO
 user
To: =?utf-8?b?UGnDs3Jrb3dza2ksIFBpb3Ry?= <piotr.piorkowski@intel.com>,
 kvm@vger.kernel.org
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261105153738.1938345-3-piotr.piorkowski@intel.com>
References: <20261105153738.1938345-1-piotr.piorkowski@intel.com>
 <20261105153738.1938345-3-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 16:24:56 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] vfio/pci: MSIX_MAPPABLE cap added before vfio_pci_hidden_add_spa=
rse_mmap()
--

commit 34f058d0ce2fee9063501ec235bccdb3f8fe57f0
Author: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>

vfio/pci: Allow hiding BAR ranges from the VFIO user

This commit adds vfio_pci_core_hide_bar_ranges() to allow VFIO PCI drivers
to hide parts of their memory BARs from userspace across region reads and
writes, mmap, ioeventfd, and dma-buf operations, while listing the hidden
ranges in sysfs.

> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci=
_core.c
> index fcbb2da860e2a..cd6cb3d829b51 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -1147,6 +1147,10 @@ int vfio_pci_ioctl_get_region_info(struct vfio_dev=
ice *core_vdev,
>  				if (ret)
>  					return ret;
>  			}
> +
> +			ret =3D vfio_pci_hidden_add_sparse_mmap(vdev, info, caps);
> +			if (ret)
> +				return ret;
>  		}
> =20
>  		break;

[Severity: Medium]
Does calling msix_mmappable_cap() before vfio_pci_hidden_add_sparse_mmap()
report inconsistent region capabilities when hidden ranges are present on
vdev->msix_bar?

In vfio_pci_ioctl_get_region_info(), when vdev->bar_mmap_supported[info->in=
dex]
is true and info->index =3D=3D vdev->msix_bar, msix_mmappable_cap() appends
VFIO_REGION_INFO_CAP_MSIX_MAPPABLE to caps before
vfio_pci_hidden_add_sparse_mmap() runs:

drivers/vfio/pci/vfio_pci_core.c:vfio_pci_ioctl_get_region_info() {
		if (vdev->bar_mmap_supported[info->index]) {
			info->flags |=3D VFIO_REGION_INFO_FLAG_MMAP;
			if (info->index =3D=3D vdev->msix_bar) {
				ret =3D msix_mmappable_cap(vdev, caps);
				if (ret)
					return ret;
			}

			ret =3D vfio_pci_hidden_add_sparse_mmap(vdev, info, caps);
			if (ret)
				return ret;
		}
}

If hidden ranges cover all pages of that BAR, vfio_pci_hidden_add_sparse_mm=
ap()
computes nr_areas =3D=3D 0 and clears VFIO_REGION_INFO_FLAG_MMAP:

drivers/vfio/pci/vfio_pci_hidden_bar_ranges.c:vfio_pci_hidden_add_sparse_mm=
ap() {
	if (!nr_areas) {
		info->flags &=3D ~VFIO_REGION_INFO_FLAG_MMAP;
		goto out;
	}
}

Because VFIO_REGION_INFO_CAP_MSIX_MAPPABLE was already added to caps,
VFIO_DEVICE_GET_REGION_INFO will return a region with
VFIO_REGION_INFO_FLAG_MMAP cleared while still advertising
VFIO_REGION_INFO_FLAG_CAPS and VFIO_REGION_INFO_CAP_MSIX_MAPPABLE.

Similarly, even when nr_areas > 0, if a hidden range overlaps the page(s)
containing the MSI-X table (vdev->msix_offset to vdev->msix_offset +
vdev->msix_size), those pages are excluded from
VFIO_REGION_INFO_CAP_SPARSE_MMAP and faulting them in
vfio_pci_mmap_huge_fault() returns VM_FAULT_SIGBUS, while
VFIO_REGION_INFO_CAP_MSIX_MAPPABLE still tells userspace the MSI-X range is
mmappable.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105153738.1938=
345-1-piotr.piorkowski@intel.com?part=3D2
