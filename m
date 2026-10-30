Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111D2606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 22:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PwB1h3Ka
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C462410E290;
	Fri, 30 Oct 2026 22:52:23 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5661210E290
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 22:52:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 55319601EE;
 Fri, 30 Oct 2026 22:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90E61F000C1;
 Fri, 30 Oct 2026 22:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793400737;
 bh=E7LrMKGRTLoPXDXZmcgRMoTg5eSGP8ZsP1OUkoy2C2U=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=PwB1h3KaA4U4yxoeCPHnAPOeYctRCL1DnyreZG7+AlE8tRnRYpm89VnFAmIeBqK1U
 DEBgwKohf6xz5fh8J7RTtLp3Xv0diIs/Ana+eZWbXHPBllFmMo8alLbElid3nzRkIg
 VJGm4DSK+Zh3zBYz+ykLwRWGpwHsh57XzRB8U9jfgWSsV2f3QzbpSVsxyrIPfny17K
 lihodZHoUdFUq0U5+x3Bs+M903T4wLg2YC62cXq85m5cVP7GWeOO8aDkRvnrcVHmK+
 l0r2mTefJHcrEG2nBgQ6z/CvA73ex+FIJNmREfGzl1i9O9lrzWAl6OF2FYhkoz7e6l
 NHtYayqhxd9/g==
Message-ID: <sashiko-outbox-191602@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] drm/xe/oa: Gate OA buffer mmap faults
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261030223056.2266638-7-umesh.nerlige.ramappa@intel.com>
References: <20261030223056.2266638-5-umesh.nerlige.ramappa@intel.com>
 <20261030223056.2266638-7-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 22:52:16 +0000
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] drm/xe/oa: ungated vm_ops->access in xe_oa_vm_ops via xe_bo_vm_acc=
ess()
- [Medium] drm/xe/oa: race in xe_oa_buffer_fault() allows dummy page instal=
l on unplug
--

commit 64c07f18c9e0cff9e9ee88554ddca7219cc0526e
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/oa: Gate OA buffer mmap faults

This commit adds xe_oa_buffer_fault() and xe_oa_vm_ops to return
VM_FAULT_SIGBUS when faulting on a mapped OA buffer after stream->dead is s=
et,
and rejects new mmaps in xe_oa_mmap() when the stream is dead. It also expo=
ses
xe_bo_cpu_fault() and xe_bo_vm_access() for reuse in xe_oa_vm_ops.

> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 7e3ebba0300d6..4916101fce541 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -1723,6 +1723,28 @@ static int xe_oa_release(struct inode *inode, stru=
ct file *file)
>  	return 0;
>  }
> =20
> +static vm_fault_t xe_oa_buffer_fault(struct vm_fault *vmf)
> +{
> +	struct xe_oa_stream *stream =3D vmf->vma->vm_file->private_data;
> +
> +	/*
> +	 * Once the stream is dead its OA buffer may already be gone (or about
> +	 * to be). Refuse to (re-)install a PTE rather than letting the
> +	 * generic BO fault handler touch a buffer that's being torn down.
> +	 */
> +	if (READ_ONCE(stream->dead))
> +		return VM_FAULT_SIGBUS;
> +
> +	return xe_bo_cpu_fault(vmf);
> +}

[Severity: Medium]
Can a page fault racing with device unplug, reset, or wedging bypass the
VM_FAULT_SIGBUS gate in xe_oa_buffer_fault() and install dummy zero-page PT=
Es
across the VMA via xe_bo_cpu_fault()?

In xe_oa_buffer_fault(), READ_ONCE(stream->dead) is checked locklessly outs=
ide
the drm_dev_enter() SRCU critical section before calling xe_bo_cpu_fault():

drivers/gpu/drm/xe/xe_bo.c:xe_bo_cpu_fault() {
	...
	if (xe_wedged(xe) || !drm_dev_enter(&xe->drm, &idx))
		return ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
	...
}

If a fault passes the check in xe_oa_buffer_fault() right before
drm_dev_unplug() sets dev->unplugged in xe_device_remove(),
drm_dev_enter(&xe->drm, &idx) in xe_bo_cpu_fault() returns false and calls
ttm_bo_vm_dummy_page() without holding drm_unplug_srcu. Because
synchronize_srcu(&drm_unplug_srcu) does not wait for that fault,
unmap_mapping_range() and OA buffer teardown can finish before
ttm_bo_vm_dummy_page() completes prefaulting zero pages across [vma->vm_sta=
rt,
vma->vm_end) and returning VM_FAULT_NOPAGE instead of VM_FAULT_SIGBUS.

Similarly, if the device is wedged via xe_wedge_declare() or
prepare_device_for_reset() while stream->dead and dev->unplugged are still
false, a fault on the OA buffer passes xe_oa_buffer_fault() and hits the
xe_wedged(xe) check in xe_bo_cpu_fault(), prefaulting dummy pages instead of
returning VM_FAULT_SIGBUS.

Additionally, in the follow-up commit ("drm/xe/oa: Quiesce OA streams on
driver unbind and PCI reset"), if a fault evaluates READ_ONCE(stream->dead)=
 as
false and is preempted before evaluating
drm_dev_is_unplugged(&stream->oa->xe->drm) while xe_oa_fini() completes
xe_oa_quiesce() and sets oa->xe =3D NULL, could dereferencing stream->oa->xe
cause a NULL pointer dereference?

> +
> +static const struct vm_operations_struct xe_oa_vm_ops =3D {
> +	.fault	=3D xe_oa_buffer_fault,
> +	.open	=3D ttm_bo_vm_open,
> +	.close	=3D ttm_bo_vm_close,
> +	.access	=3D xe_bo_vm_access,
> +};

[Severity: High]
Should xe_oa_vm_ops also gate or omit .access instead of wiring it directly=
 to
xe_bo_vm_access()?

In xe_oa_mmap(), the VMA is configured as read-only with VM_PFNMAP (and
drm_gem_mmap_obj() / ttm_bo_mmap_obj() sets VM_IO | VM_PFNMAP):

drivers/gpu/drm/xe/xe_oa.c:xe_oa_mmap() {
	...
	if (vma->vm_flags & (VM_WRITE | VM_EXEC | VM_SHARED | VM_MAYSHARE)) {
		drm_dbg(&stream->oa->xe->drm, "mmap must be read only\n");
		return -EINVAL;
	}
	vm_flags_mod(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_DONTCOPY,
		     VM_MAYWRITE | VM_MAYEXEC);
	...
}

When userspace accesses this mapping through /proc/<pid>/mem, ptrace(),
process_vm_readv(), or process_vm_writev(), __access_remote_vm() fails in
get_user_page_vma_remote() and falls back to vma->vm_ops->access(), which
calls xe_bo_vm_access():

drivers/gpu/drm/xe/xe_bo.c:xe_bo_vm_access() {
	struct ttm_buffer_object *ttm_bo =3D vma->vm_private_data;
	struct xe_bo *bo =3D ttm_to_xe_bo(ttm_bo);
	struct xe_device *xe =3D xe_bo_device(bo);

	guard(xe_pm_runtime)(xe);
	return ttm_bo_vm_access(vma, addr, buf, len, write);
}

Because vma->vm_private_data retains a GEM reference to the BO until the VMA
is unmapped, calling xe_bo_vm_access() after stream->dead is set bypasses t=
he
stream->dead check, takes a runtime PM reference, and calls ttm_bo_vm_acces=
s()
-> xe_ttm_access_memory() on the torn-down OA buffer. When the OA buffer was
placed in VRAM (mert_wa_14026633728) and vram_fini() has cleared
vram->mapping to NULL during unbind, xe_ttm_access_memory() will dereferenc=
e a
NULL vram->mapping pointer.

Furthermore, because __access_remote_vm() passes write =3D 1 on FOLL_WRITE =
and
neither xe_bo_vm_access() nor ttm_bo_vm_access() checks whether write is
non-zero, doesn't wiring .access to xe_bo_vm_access() also allow writing to
the read-only OA buffer via /proc/self/mem or process_vm_writev()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030223056.2266=
638-5-umesh.nerlige.ramappa@intel.com?part=3D2
