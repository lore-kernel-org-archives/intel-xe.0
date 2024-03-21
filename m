Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42ADC6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 21:18:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FAEB10EE32;
	Thu, 21 Mar 2024 21:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cNSy8LrW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB82910EE32
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 21:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711055935; x=1742591935;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ndBMarDRcK6uB9g+q00OGgktfF7b8GdL8f4GARbx9EQ=;
 b=cNSy8LrWPsLFeSMhIJYHrI6ZW6eeIPqza9fu4jLC79ZTX42h481GU35i
 I1+42day80us94u9L30jvrm1zdTWNEgyDuqIYBfnmKerjuQQSir5DohXt
 Gdc/tnEl9YiI2N1RzbufmIT8Bqo7g8jHYY0xfmO0wLjFPeFtv9vsS06XT
 lpU//W2WfDR5C0MY3W2T04qDSc6FZDve5E3aPebn8vaPKWPYQ/tO2n5eO
 x3dQtviJFHXvBTBuU0QUEhUdFv96w2qhFDigJHYrpJNNjTFlRHes1I9Oq
 wtZdEBxPG4WmLqOaq2sibqOcD/6wkxD3ANrW3aMRdiLBzKiSHqY+j9dGR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="16631261"
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; d="scan'208";a="16631261"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 14:18:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; d="scan'208";a="14657818"
Received: from sinampud-mobl.amr.corp.intel.com (HELO [10.249.254.176])
 ([10.249.254.176])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 14:18:53 -0700
Message-ID: <29071b51eab6912bf06a67b6ec4cfd018affeffc.camel@linux.intel.com>
Subject: Re: [CI 4/7] drm/xe: Move vma rebinding to the drm_exec locking loop
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Mar 2024 22:18:50 +0100
In-Reply-To: <ZfyIsim3qY/W38DY@DUT025-TGLU.fm.intel.com>
References: <20240312140447.50437-1-thomas.hellstrom@linux.intel.com>
 <20240312140447.50437-4-thomas.hellstrom@linux.intel.com>
 <ZfyIsim3qY/W38DY@DUT025-TGLU.fm.intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi, Matt,

apparently I forget to remove the old series of patches before hitting
git-send-email so the whole series got mixed. :(, but please see below.


On Thu, 2024-03-21 at 19:21 +0000, Matthew Brost wrote:
> On Tue, Mar 12, 2024 at 03:04:44PM +0100, Thomas Hellstr=C3=B6m wrote:
> > Rebinding might allocate page-table bos, causing evictions.
> > To support blocking locking during these evictions,
> > perform the rebinding in the drm_exec locking loop.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/xe/xe_exec.c | 13 ++++++++++---
> > =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0 | 16 +++++++++-------
> > =C2=A02 files changed, 19 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > b/drivers/gpu/drm/xe/xe_exec.c
> > index 13d1fba2c9d7..f36fb22a7861 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -96,13 +96,20 @@
> > =C2=A0
> > =C2=A0static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec)
> > =C2=A0{
> > +	struct xe_vm *vm =3D container_of(vm_exec->vm, struct xe_vm,
> > gpuvm);
> > =C2=A0	struct drm_gem_object *obj;
> > =C2=A0	unsigned long index;
> > =C2=A0	int ret;
> > =C2=A0
> > -	ret =3D drm_gpuvm_validate(vm_exec->vm, &vm_exec->exec);
> > -	if (ret)
> > -		return ret;
> > +	do {
> > +		ret =3D drm_gpuvm_validate(vm_exec->vm, &vm_exec-
> > >exec);
> > +		if (ret)
> > +			return ret;
> > +
> > +		ret =3D xe_vm_rebind(vm, false);
> > +		if (ret)
> > +			return ret;
> > +	} while (!list_empty(&vm->gpuvm.evict.list));
> > =C2=A0
>=20
> You need to delete xe_vm_rebind from xe_exec_ioctl too.

Good catch. Thanks, I'll do that.


>=20
> > =C2=A0	drm_exec_for_each_locked_object(&vm_exec->exec, index,
> > obj) {
> > =C2=A0		ret =3D dma_resv_reserve_fences(obj->resv, 1);
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > index faad7f52b3ca..fad5b1ae7f2d 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -513,9 +513,15 @@ static int xe_preempt_work_begin(struct
> > drm_exec *exec, struct xe_vm *vm,
> > =C2=A0	if (err)
> > =C2=A0		return err;
> > =C2=A0
> > -	err =3D drm_gpuvm_validate(&vm->gpuvm, exec);
> > -	if (err)
> > -		return err;
> > +	do {
> > +		err =3D drm_gpuvm_validate(&vm->gpuvm, exec);
> > +		if (err)
> > +			return err;
> > +
> > +		err =3D xe_vm_rebind(vm, true);
> > +		if (err)
> > +			return err;
> > +	} while (!list_empty(&vm->gpuvm.evict.list));
>=20
> Same code pattern twice here? Opportunity for a helper?

I'll take a look.

>=20
> Matt
>=20
> > =C2=A0
> > =C2=A0	drm_exec_for_each_locked_object(exec, index, obj) {
> > =C2=A0		err =3D dma_resv_reserve_fences(obj->resv, vm-
> > >preempt.num_exec_queues);
> > @@ -575,10 +581,6 @@ static void preempt_rebind_work_func(struct
> > work_struct *w)
> > =C2=A0	if (err)
> > =C2=A0		goto out_unlock;
> > =C2=A0
> > -	err =3D xe_vm_rebind(vm, true);
> > -	if (err)
> > -		goto out_unlock;
> > -
> > =C2=A0	if (vm->rebind_fence) {
> > =C2=A0		dma_fence_wait(vm->rebind_fence, false);
> > =C2=A0		dma_fence_put(vm->rebind_fence);
> > --=20
> > 2.44.0
> >=20

