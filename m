Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BC5606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 23:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o0PfEOnH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F5B10E311;
	Fri, 30 Oct 2026 23:58:56 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53AF510E311
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 23:58:50 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id F277142DDB;
 Fri, 30 Oct 2026 23:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A88EC1F000C1;
 Fri, 30 Oct 2026 23:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793404729;
 bh=yYZDgN6AmpB8c/uMkaipDaPS1lAHUM999yj4lk5SRXM=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=o0PfEOnHUp46Ij5kgdY56ZnoDqsj7bg6gDykveTmdQnjT8urifjqHO5lNtE7lxFTG
 EV9gZTExR5okikxhBVArWWwE0sZdW+7562rMvknX9vle4+45mmohpvyKyi2j6bu2FH
 KSVToFF7N3wc2HzI0SYbfiaxmHv/+LkZzJ0Ljmqy821HEz/rk4O2afDfvVBpat3MLA
 9WRIGNE5jdRToz6bkkrSZ6+ur0SdKDuIN4IUSi4ri9As+YQfOEl1evL/jeEGZQhFnI
 YQEZ5uIjH7G4MaTo15ITkAqWwD5XwXac5D1D73Di8GUJEyFo0BKU2RkW76lId+ha6A
 XPKDj/RC/CEbw==
Message-ID: <sashiko-outbox-191661@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] drm/xe/oa: Gate OA buffer mmap faults
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261030233839.2284694-7-umesh.nerlige.ramappa@intel.com>
References: <20261030233839.2284694-5-umesh.nerlige.ramappa@intel.com>
 <20261030233839.2284694-7-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 23:58:49 +0000
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

commit ed8b71dc76a867bf05d811e39433598fc6bd1502
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/oa: Gate OA buffer mmap faults

This commit exposes xe_bo_cpu_fault() and xe_bo_vm_access() and introduces
xe_oa_buffer_fault() and xe_oa_vm_ops to return VM_FAULT_SIGBUS on OA buffer
page faults once stream->dead is set.

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
As reported by Sashiko on v2 [1], can a page fault on a mapped OA buffer
racing with device unplug, reset, or wedging bypass the VM_FAULT_SIGBUS gate
in xe_oa_buffer_fault() and install dummy pages via xe_bo_cpu_fault()
instead?

In xe_oa_buffer_fault(), READ_ONCE(stream->dead) (and in the follow-up
commit "drm/xe/oa: Quiesce OA streams on driver unbind and PCI reset",
drm_dev_is_unplugged(&stream->oa->xe->drm)) is checked locklessly outside
the drm_dev_enter() SRCU critical section before calling
xe_bo_cpu_fault(vmf):

drivers/gpu/drm/xe/xe_bo.c:xe_bo_cpu_fault() {
	...
	if (xe_wedged(xe) || !drm_dev_enter(&xe->drm, &idx))
		return ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
	...
}

If a fault passes the check in xe_oa_buffer_fault() just before
drm_dev_unplug() sets dev->unplugged =3D true in xe_device_remove(),
drm_dev_enter() in xe_bo_cpu_fault() returns false without holding
drm_unplug_srcu and calls ttm_bo_vm_dummy_page(). Because drm_unplug_srcu is
not held, synchronize_srcu(&drm_unplug_srcu) in drm_dev_unplug() does not
wait for the fault, allowing unmap_mapping_range() in drm_dev_unplug() and
drm_vma_node_unmap() in xe_oa_quiesce_oa_unit() to complete before
ttm_bo_vm_dummy_page() finishes prefaulting dummy zero-page PTEs across
[vma->vm_start, vma->vm_end) and returning VM_FAULT_NOPAGE.

Similarly, when the device is wedged via xe_wedge_declare() or
prepare_device_for_reset() (in xe_pci_error_detected() prior to
xe_pci_error_slot_reset()), xe_wedged(xe) is true while stream->dead and
dev->unplugged are still false, so a fault passes xe_oa_buffer_fault() and
hits ttm_bo_vm_dummy_page() in xe_bo_cpu_fault().

Additionally, in the follow-up commit "drm/xe/oa: Quiesce OA streams on
driver unbind and PCI reset", if a fault evaluates READ_ONCE(stream->dead)
as false and is preempted before evaluating
drm_dev_is_unplugged(&stream->oa->xe->drm) while xe_oa_fini() completes
xe_oa_quiesce() and sets oa->xe =3D NULL, dereferencing &stream->oa->xe->drm
will hit a NULL pointer dereference.

> +
> +static const struct vm_operations_struct xe_oa_vm_ops =3D {
> +	.fault	=3D xe_oa_buffer_fault,
> +	.open	=3D ttm_bo_vm_open,
> +	.close	=3D ttm_bo_vm_close,
> +	.access	=3D xe_bo_vm_access,
> +};

[Severity: High]
As reported by Sashiko on v2 [2], does wiring xe_oa_vm_ops.access directly
to xe_bo_vm_access() allow userspace to bypass the stream->dead check and
also write to the read-only OA buffer mapping?

Because xe_oa_mmap() sets VM_PFNMAP (and drm_gem_mmap_obj() /
ttm_bo_mmap_obj() sets VM_IO | VM_PFNMAP), accesses through /proc/<pid>/mem,
ptrace(PTRACE_PEEKDATA), process_vm_readv(), or process_vm_writev() fail
get_user_page_vma_remote() in __access_remote_vm() and fall back to
vma->vm_ops->access():

__access_remote_vm()
  -> vma->vm_ops->access()
    -> xe_bo_vm_access()
      -> guard(xe_pm_runtime)(xe)
      -> ttm_bo_vm_access()
        -> ttm_bo_access()
          -> xe_ttm_access_memory()

Because vma->vm_private_data holds a GEM reference to struct xe_bo until
munmap, calling xe_bo_vm_access() after stream->dead is set during PCI
unbind/remove unconditionally takes a runtime PM reference and accesses the
torn-down OA buffer BO. If the OA buffer was allocated in VRAM
(mert_wa_14026633728) and vram_fini() has already cleared
tile->mem.vram->mapping to NULL on unbind, xe_ttm_access_memory() will
dereference a NULL vram->mapping pointer.

Furthermore, although xe_oa_mmap() enforces a read-only mapping by rejecting
VM_WRITE and clearing VM_MAYWRITE, __access_remote_vm() with FOLL_WRITE
invokes vma->vm_ops->access() with write =3D 1 when get_user_page_vma_remot=
e()
fails, and neither xe_oa_vm_ops nor xe_bo_vm_access() / ttm_bo_vm_access()
rejects write !=3D 0. Should xe_oa_vm_ops wrap or omit .access so dead stre=
ams
and write accesses are rejected?

[1] https://lore.kernel.org/r/20261030223056.2266638-7-umesh.nerlige.ramapp=
a@intel.com
[2] https://lore.kernel.org/r/20261030223056.2266638-7-umesh.nerlige.ramapp=
a@intel.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030233839.2284=
694-5-umesh.nerlige.ramappa@intel.com?part=3D2
