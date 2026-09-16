Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56126C88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 11:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4D210E011;
	Wed, 16 Sep 2026 11:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BnsNTJVx";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C981410E011
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 11:33:02 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id CA01560234;
 Wed, 16 Sep 2026 11:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B98D1F000FF;
 Wed, 16 Sep 2026 11:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789558381;
 bh=UD6OufiDuUyaM4Kgl/tG9k8PcCG850liwQvpi6I+mg8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=BnsNTJVxMov4VeirrrBwq11tMhRNRKsUYOj5e8yWZJn5PFXMPjN8vhpV/bTfMG+oU
 7iTMJbREtZz/NtjCIdfmPInJJxLV1W3se0LSR8SkU+PyKE3W4qpt8ihqmM5FnrFW3m
 Lz9bBhXTPqq2x/c9xgsfFjA/PngKqT1iXInrIqpC8elA4YZA5SUNETRF5125tLGBJB
 zgZExEz82iqrjfoyyRuspfHXOZ8lH+jnqkwZR7MbjVQh27d8BfFNEYID7LAvQPzsef
 5Eay0DPQjvtQP7/FBHbn2bYBRQXjMDRz8PsffSf5kTtiObRjYJoL2KAxWWCxdQE334
 m4gysQhYCej7Q==
From: sashiko-bot@kernel.org
Subject: Re: [RFC 4/4] drm/xe: Bump prefetch BO LRU for already-valid ranges
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260916112828.2528881-10-himal.prasad.ghimiray@intel.com>
References: <20260916112828.2528881-6-himal.prasad.ghimiray@intel.com>
 <20260916112828.2528881-10-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 11:33:01 +0000
Message-Id: <20260916113301.6B98D1F000FF@smtp.kernel.org>
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
- [Medium] drm/xe: memory leak of svm_range on prefetch_lru_bump failure
--

commit 09ec19c469b99c340c07a04780a85f997af72901
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe: Bump prefetch BO LRU for already-valid ranges

This commit introduces xe_svm_range_prefetch_lru_bump to re-fault CPU pages
without touching DMA mappings and move backing BOs to the LRU tail for
already-valid prefetch ranges.

> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index fe9ccaa129122..948060a702470 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c

[ ... ]

> @@ -2583,6 +2583,15 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct =
xe_vma_ops *vops,
>  						  dpagemap, &valid_pages)) {
>  				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
>  				xe_assert(vm->xe, valid_pages);
> +
> +				if (dpagemap) {
> +					err =3D xe_svm_range_prefetch_lru_bump(vm, vma,
> +									     svm_range,
> +									     dpagemap);
> +					if (err)
> +						goto unwind_prefetch_ops;

[Severity: Medium]
Does this code leak the svm_range?

During a VM_BIND ioctl with prefetch, xe_svm_range_find_or_insert() returns
an svm_range with an incremented reference count. If=20
xe_svm_range_prefetch_lru_bump() fails here, we jump to unwind_prefetch_ops.

Because this error path is taken before the svm_range is tracked in the
op->prefetch_range.range xarray, the cleanup routine
xe_svm_prefetch_gpuva_ops_fini() will not know about it and will not free i=
t.

Should this error path call xe_svm_range_put(svm_range) before jumping to
unwind_prefetch_ops to avoid leaking the reference?

> +				}
> +
>  				need_put =3D true;
>  				goto check_next_range;
>  			}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916112828.2528=
881-6-himal.prasad.ghimiray@intel.com?part=3D4
