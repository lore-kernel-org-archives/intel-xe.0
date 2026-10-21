Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F2F606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 04:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Id0fDk6A
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DB210E26B;
	Wed, 21 Oct 2026 04:30:30 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83D310E26B
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 04:30:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 526CC43B8D;
 Wed, 21 Oct 2026 04:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101411F000C9;
 Wed, 21 Oct 2026 04:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792557024;
 bh=Zdp18Axz+xaz64G77j2YidKRB5eIwNrUDSdXTMyYd30=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Id0fDk6AKsp32NjrXA+v4QNK9rLdeQ9B86D4eZYiwq1HYhv3+x/Tsmgd0F1LVvyFq
 +8EXxsWaLsBZe8RENBnfzPf6Bxu1S3s3V6KUy3ymNUmLk7lO2iaUh8DyfVgzFupxvV
 XMp3/yzKTPbhEcCwn6Tk9YGKT0XA6xIv7Wq5R7H+VR6ru5py3gwW8tqwSi3dwV/laS
 EJJhiM5dXyvvhX0PRSpHvEsRwlAt/Tvo3pyt6PzA7wgxYmEuHCTk9ByyeDdOa5G/fj
 QSEyKnOmTUY0fPN5kruzVlbHfM5eF7F7lP/AtPrmCL0Eh3QGt+9cRGKEfaLFsCztZn
 iXRRrtdEg1qbw==
Message-ID: <sashiko-outbox-179783@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] drm/xe/vm: Setup SVA infrastructure for PASID support
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261021041117.1774877-3-naresh.kumar.g@intel.com>
References: <20261021041117.1774877-1-naresh.kumar.g@intel.com>
 <20261021041117.1774877-3-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 04:30:23 +0000
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/xe/vm: missing SVA unbind on device removal leaks DMA owner an=
d crashes
--

commit 08c0c9b32bbf8f35bf925eec1c7c7d7bb127ed1a
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe/vm: Setup SVA infrastructure for PASID support

This commit adds an sva_handle field to struct xe_vm and introduces helpers=
 to
bind and unbind a fault-mode VM to the current process address space via
iommu_sva_bind_device() and iommu_sva_unbind_device().

> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index b98f2e56bf6f4..3504b890ababf 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c

[ ... ]

> @@ -1674,6 +1675,41 @@ static void xe_vm_init_prove_locking(struct xe_dev=
ice *xe, struct xe_vm *vm)
>  	up_read(&vm->exec_queues.lock);
>  }
> =20
> +static void xe_vm_sva_handle_init(struct xe_vm *vm)
> +{
> +	struct device *dev =3D vm->xe->drm.dev;
> +	struct pci_dev *pdev =3D to_pci_dev(dev);
> +	struct iommu_sva *sva_handle;
> +
> +	/*
> +	 * Assumes the IOMMU driver has already decided and latched the
> +	 * device's ATS/PASID enablement by the time any VM is created (true
> +	 * for Intel VT-d, which enables both eagerly at IOMMU probe). If a
> +	 * backend instead enables them lazily on first SVA bind, this check
> +	 * will never see them set and SVA/PASID support is silently skipped.
> +	 */
> +	if (!xe_pci_ats_pasid_enabled(pdev))
> +		return;
> +
> +	sva_handle =3D iommu_sva_bind_device(dev, current->mm);
> +	if (IS_ERR(sva_handle)) {
> +		drm_err(&vm->xe->drm, "SVA binding failed, preventing PASID creation.\=
n");
> +		return;
> +	}
> +
> +	vm->sva_handle =3D sva_handle;
> +}
> +
> +static void xe_vm_sva_handle_fini(struct xe_vm *vm)
> +{
> +	xe_assert(vm->xe, xe_vm_is_closed(vm));
> +	if (!vm->sva_handle)
> +		return;
> +
> +	iommu_sva_unbind_device(vm->sva_handle);
> +	vm->sva_handle =3D NULL;
> +}

[Severity: High]
What happens if the pci device is unbound from the driver or hot-unplugged
while a userspace process still holds an open fault-mode xe_vm?

When xe_vm_create_ioctl() calls xe_vm_sva_handle_init(),
iommu_sva_bind_device() attaches a pasid domain and inserts an entry into
dev->iommu_group->pasid_array. However, vm->sva_handle is only unbound in
xe_vm_sva_handle_fini() during xe_vm_close_and_put(), which is tied to the
userspace file descriptor and vm lifetime rather than device removal in
drivers/gpu/drm/xe/xe_device.c:

void xe_device_remove(struct xe_device *xe)
{
	xe_display_unregister(xe);

	drm_dev_unplug(&xe->drm);

	xe_bo_pci_dev_remove_all(xe);
}

In addition, xe_vm_sva_handle_init() does not guard the
iommu_sva_bind_device() call with drm_dev_enter(), so an in-flight
xe_vm_create_ioctl() can also establish a new bond after drm_dev_unplug()
completes.

When __device_release_driver() finishes xe_pci_remove() -> xe_device_remove=
(),
it immediately calls pci_dma_cleanup() -> iommu_device_unuse_default_domain=
()
in drivers/iommu/iommu.c:

	mutex_lock(&group->mutex);
	if (!WARN_ON(!group->owner_cnt || !xa_empty(&group->pasid_array)))
		group->owner_cnt--;

	mutex_unlock(&group->mutex);

Because group->pasid_array is not empty while vm->sva_handle remains bound,
does this trigger the WARN_ON() and leak group->owner_cnt?

Furthermore, if the pci device is hot-unplugged and removed from the bus,
iommu_release_device() -> __iommu_group_remove_device() ->
iommu_deinit_device() clears dev->iommu_group to NULL. When userspace later
closes the file descriptor or destroys the vm:

xe_vm_close_and_put()
  xe_vm_sva_handle_fini()
    iommu_sva_unbind_device()
      iommu_detach_device_pasid()

drivers/iommu/iommu.c:iommu_detach_device_pasid() requires the caller to st=
ill
be a probed driver on dev and dereferences dev->iommu_group directly:

void iommu_detach_device_pasid(struct iommu_domain *domain, struct device *=
dev,
			       ioasid_t pasid)
{
	/* Caller must be a probed driver on dev */
	struct iommu_group *group =3D dev->iommu_group;

	mutex_lock(&group->mutex);

Wouldn't calling iommu_sva_unbind_device() after device removal dereference=
 a
NULL group pointer here? Should xe_device_remove() unbind active sva_handle
bonds before driver detach completes, and should xe_vm_sva_handle_init()
protect the bind with drm_dev_enter() / drm_dev_exit()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021041117.1774=
877-1-naresh.kumar.g@intel.com?part=3D2
