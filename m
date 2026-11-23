Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFC8606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 08:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UHZ3ASk5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4729310E37B;
	Mon, 23 Nov 2026 08:35:19 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAAF10E37B
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 08:35:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 360CD42B66;
 Mon, 23 Nov 2026 08:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3BF71F000D3;
 Mon, 23 Nov 2026 08:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795422911;
 bh=jlzpC1ShSdqObI3rLGBdQZfaox1VfOZg69GOgrapkNE=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=UHZ3ASk53dT7F332iVsOulMEJzZnCSXQsT9lm+cMmgMc91xe3Hek7oZDEAlzmZq3a
 HWFESRJJTDbR/lZ2N5AJVyMkLN9GlVMnIeHAzBGX4bIfPdWpebRCnABgihV6VejPdc
 8W8NvGyXSh37ntg7ODIR2yyOZ4crgEO3mwIf2nhigxDRd2BK0jVBjWf9JC626dUrRf
 4gUGzRQJEsSeRO1TkVbmhzJv5fwEC/q4WVgPxOT7DRI+eFfZlgVF1hV5492mi5xc0o
 fcW29Y5Hfk3+Udt6ZpECTSLcDHVDeZgUd5y1HOD6BejEmBhyq44naJrOMNeKuSSqGL
 Vu/ihwCpahnZw==
Message-ID: <sashiko-outbox-228904@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/xe/vm: Hold a device reference until VM teardown
 completes
To: "Sanjay Yadav" <sanjay.kumar.yadav@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261123081438.3640008-2-sanjay.kumar.yadav@intel.com>
References: <20261123081438.3640008-2-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 08:35:11 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/xe/vm: race in xe_vm_free() still lets drm_gpuvm_free()
  drop last dev ref
--

commit 80967a1a111f8536a1b5834e96436f633bdd34db
Author: Sanjay Yadav <sanjay.kumar.yadav@intel.com>

drm/xe/vm: Hold a device reference until VM teardown completes

This commit takes a drm_device reference in xe_vm_free(), queues
vm->destroy_work on xe_destroy_wq, and drops the device reference at the end
of vm_destroy_work_func().

> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index dd855876f571c..bd589b1268eb9 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2109,6 +2109,9 @@ static void vm_destroy_work_func(struct work_struct=
 *w)
>  		xe_file_put(vm->xef);
> =20
>  	kfree(vm);
> +
> +	/* Pairs with xe_vm_free(), may run device teardown. */
> +	drm_dev_put(&xe->drm);
>  }
> =20
>  static void xe_vm_free(struct drm_gpuvm *gpuvm)
> @@ -2116,11 +2119,12 @@ static void xe_vm_free(struct drm_gpuvm *gpuvm)
>  	struct xe_vm *vm =3D container_of(gpuvm, struct xe_vm, gpuvm);
> =20
>  	/*
> -	 * To destroy the VM we need to be able to sleep.
> -	 * drm_gpuvm keeps at least one device reference at this
> -	 * point so xe->destroy_wq must still be alive.
> +	 * Destroy needs to sleep. Hold a device ref until it is done so a VM
> +	 * put can't drop the last one, and use xe_destroy_wq since
> +	 * xe->destroy_wq goes away with the device.
>  	 */
> -	queue_work(vm->xe->destroy_wq, &vm->destroy_work);
> +	drm_dev_get(&vm->xe->drm);
> +	xe_destroy_wq_queue(&vm->destroy_work);
>  }

[Severity: Medium]
Can drm_gpuvm_free() still drop the last drm_device reference in the
xe_vm_put() caller's context if vm_destroy_work_func() finishes first?

drm_gpuvm_free() drops its own drm_device reference after
gpuvm->ops->vm_free() returns:

drivers/gpu/drm/drm_gpuvm.c:drm_gpuvm_free() {
    ...
	gpuvm->ops->vm_free(gpuvm);
	drm_dev_put(drm);
}

Because xe_destroy_wq is unbound, a worker on another CPU can run
vm_destroy_work_func() to completion before the caller executes that traili=
ng
drm_dev_put():

CPU0 (xe_bo_dev_work_func)        CPU1 (xe_destroy_wq)
drm_gpuvm_free()
  xe_vm_free()
    drm_dev_get(&vm->xe->drm)
    xe_destroy_wq_queue(...)
                                  vm_destroy_work_func()
                                    ...
                                    kfree(vm)
                                    drm_dev_put(&xe->drm)
  drm_dev_put(drm)
    ...
      xe_bo_dev_fini()
        flush_work(&bo_dev->async_free)
          <-- recursive flush deadlock

When the dying VM holds the last device reference, CPU1 drops the refcount
from 2 to 1 and CPU0 drops it from 1 to 0, running device teardown
synchronously in the caller (deadlocking in xe_bo_dev_fini() or freeing
xe_device underneath xe_ttm_bo_destroy()).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123081438.3640=
008-2-sanjay.kumar.yadav@intel.com?part=3D1
