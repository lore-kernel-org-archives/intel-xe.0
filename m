Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D28F606D815
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 01:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hwDW7N4C
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352AD10E662;
	Wed,  4 Nov 2026 01:11:00 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A83210E662
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 01:10:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 669BC60142;
 Wed,  4 Nov 2026 01:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C561F00A17;
 Wed,  4 Nov 2026 01:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793754653;
 bh=2rGOuhUReqlnOClPx2hGTg9Cp/EY/CIAFgGb7Yo1EdM=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=hwDW7N4C7sOY/sjFDQR81h0dD33Ys+3oCFOGRLxCgvI6H+5nzoSyrFHqF0IxZitiA
 SCYv8A1TroTHOe7HaC/ECn3ga9nFcu8WVs6nMDM6dVAGzvSfcuGceqEkClaUIAJJ/0
 p1qJmy5vs1g/+bC/9IZ0JFMp7FyDFve8FONtWRp5Npcm/z+peDzXTM1oHa2oHv6OuJ
 QRKFNIH8XPtwKE/517HCUjKwkX9cJ5JoYpvZDIEi/ZlZbLuy8CgYRAyy36dv3PLJsa
 lc6U0H3QYhWX9qn04tyuDx9j4yjm3M/5W/bfsx9nGnKg+jV58GWSD4UFydnZ2ate0W
 BMXhQ4evUy4Ng==
Message-ID: <sashiko-outbox-196348@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/5] drm/xe/oa: Use the drm device address_space for
 the OA stream fd
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261104005221.3230003-8-umesh.nerlige.ramappa@intel.com>
References: <20261104005221.3230003-7-umesh.nerlige.ramappa@intel.com>
 <20261104005221.3230003-8-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 01:10:52 +0000
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
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,T_SPF_TEMPERROR
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/xe/oa: missing vm_pgoff check in xe_oa_mmap() allows OOB fault
--

commit fbfcd89abe0e799c3080815623130528c7cfb1de
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/oa: Use the drm device address_space for the OA stream fd

This commit points the OA stream file's f_mapping at the DRM device's
anon_inode address_space so that drm_dev_unplug() zaps OA buffer mmaps
alongside GEM mmaps when the device is unplugged.

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 838802482adaf..09043bc90de94 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -1869,6 +1869,7 @@ static int xe_oa_stream_open_ioctl_locked(struct xe=
_oa *oa,
>  {
>  	struct xe_oa_stream *stream;
>  	struct drm_syncobj *ufence_syncobj;
> +	struct file *file;
>  	int stream_fd;
>  	int ret;
> =20
> @@ -1910,12 +1911,27 @@ static int xe_oa_stream_open_ioctl_locked(struct =
xe_oa *oa,
>  			goto err_destroy;
>  	}
> =20
> -	stream_fd =3D anon_inode_getfd("[xe_oa]", &xe_oa_fops, stream, 0);
> +	stream_fd =3D get_unused_fd_flags(0);
>  	if (stream_fd < 0) {
>  		ret =3D stream_fd;
>  		goto err_disable;
>  	}
> =20
> +	file =3D anon_inode_getfile("[xe_oa]", &xe_oa_fops, stream, 0);
> +	if (IS_ERR(file)) {
> +		ret =3D PTR_ERR(file);
> +		put_unused_fd(stream_fd);
> +		goto err_disable;
> +	}
> +
> +	/*
> +	 * Don't use the address_space of the anon inode singleton, which is sh=
ared with
> +	 * unrelated anon files. Use the drm device's address_space instead, sa=
me as drm fds,
> +	 * so that drm_dev_unplug() also zaps the OA buffer mmaps.
> +	 */
> +	file->f_mapping =3D oa->xe->drm.anon_inode->i_mapping;
> +	fd_install(stream_fd, file);

[Severity: High]
Does sharing oa->xe->drm.anon_inode->i_mapping require xe_oa_mmap() to
reject a non-zero vma->vm_pgoff?

The commit message notes that GEM mmaps live at fake offsets starting at
DRM_FILE_PAGE_OFFSET_START while userspace maps the OA buffer at offset 0.
However, in drivers/gpu/drm/xe/xe_oa.c, xe_oa_mmap() only checks the VMA
size and does not verify that vma->vm_pgoff is 0:

drivers/gpu/drm/xe/xe_oa.c:xe_oa_mmap() {
	...
	/* Can mmap the entire OA buffer or nothing (no partial OA buffer mmaps) */
	if (vma->vm_end - vma->vm_start !=3D xe_bo_size(bo)) {
		drm_dbg(&stream->oa->xe->drm, "Wrong mmap size, must be OA buffer size\n"=
);
		return -EINVAL;
	}

	return drm_gem_mmap_obj(&bo->ttm.base, xe_bo_size(bo), vma);
}

Because stream_fd is backed by anon_inode_inode (which is not S_ISREG),
do_mmap() allows arbitrary page-aligned offsets, and neither xe_oa_mmap()
nor the drm_gem_mmap_obj() -> xe_gem_object_mmap() -> drm_gem_ttm_mmap() ->
ttm_bo_mmap_obj() call chain checks vma->vm_pgoff.

If userspace calls mmap() on stream_fd with a non-zero offset in the
DRM_FILE_PAGE_OFFSET_START range, the OA VMA is inserted into
oa->xe->drm.anon_inode->i_mapping->i_mmap at [vma->vm_pgoff,
vma->vm_pgoff + vma_pages(vma) - 1], colliding with GEM BO vma_node ranges
so that drm_vma_node_unmap() on a GEM BO at that range will unexpectedly
zap the OA VMA.

In addition, stream->oa_buffer.bo is allocated in xe_oa_alloc_oa_buffer()
as ttm_bo_type_kernel, so drm_vma_node_start(&bo->ttm.base.vma_node) is 0.
When a page fault occurs via xe_bo_cpu_fault() -> __xe_bo_cpu_fault() ->
ttm_bo_vm_fault_reserved() in drivers/gpu/drm/ttm/ttm_bo_vm.c:

drivers/gpu/drm/ttm/ttm_bo_vm.c:ttm_bo_vm_fault_reserved() {
	...
	page_offset =3D linear_page_index(vma, address) -
		drm_vma_node_start(&bo->base.vma_node);
	page_last =3D vma_end_pgoff(vma) -
		drm_vma_node_start(&bo->base.vma_node);

	if (unlikely(page_offset >=3D PFN_UP(bo->base.size)))
		return VM_FAULT_SIGBUS;
	...
}

If 0 < vma->vm_pgoff < PFN_UP(bo->base.size) and userspace faults at an
address where page_offset < PFN_UP(bo->base.size) (for example,
PFN_UP(bo->base.size) - 1), the initial bounds check passes, and the
prefault loop increments page_offset up to page_last - 1 (which is
vma->vm_pgoff + PFN_UP(bo->base.size) - 1), reading past the end of
ttm->pages[] or the BO's VRAM resource and mapping out-of-bounds physical
pages into userspace?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104005221.3230=
003-7-umesh.nerlige.ramappa@intel.com?part=3D1
