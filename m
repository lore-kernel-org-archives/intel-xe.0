Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B55C982DA
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 14:36:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E62510F16F;
	Fri, 18 Sep 2026 14:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NN/9C4+5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1424310F16F
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 14:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789742161; x=1821278161;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ot8Tb7RYx08WMlEjevn1gXX3bL83Futgu6go/Jy1K9Y=;
 b=NN/9C4+5lLcahKlpmjr0yGWxoWu/QbQJIKZ8jkLrRL0P32DZYtSiYfLo
 E+ufJ+IxSOM553KJCf4vNigF3KFGHrBAMmhnSkjP3MdBRfz4nWumGTmwq
 GutwxEOQ9Lf1u5Ykx1c2Hdn6gfyRKwuawSMS4YpmvlWTiGrei8t7W8gx7
 TRWJJ6aG31+kaXQK43oTJZNBGvDqt3FafB7SWBblnTxKDdat+W7zu2lDu
 SnF9U5vD8ahiJvWLPazHLVN5iBp3U2qdYju1789K3Vlkv7oJJlydXd3fk
 QZGO5TFf0oDfZjzmEPU76zgWGWmlkw1lDEghFjmt2MZ2tgPAb4aVQjdCy w==;
X-CSE-ConnectionGUID: 9ui+Zzq6SVu431RTwe/WgQ==
X-CSE-MsgGUID: X7aT/Mh5T3WKxukEVmYKuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="90118802"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="90118802"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 07:35:52 -0700
X-CSE-ConnectionGUID: PHLgrIX/Tg6mbuMPSHlzfg==
X-CSE-MsgGUID: A4g0KCaLQX61zwumOOUU2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="270131837"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.245.247])
 ([10.245.245.247])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 07:35:50 -0700
Message-ID: <8c1744e4012ab5b30d1f26f8129d4944da1dcfa3.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/vm: nuke PTs only after unlinking contested VMAs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
Date: Fri, 18 Sep 2026 16:35:43 +0200
In-Reply-To: <20260918131034.598078-2-matthew.auld@intel.com>
References: <20260918131034.598078-2-matthew.auld@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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

On Fri, 2026-09-18 at 14:10 +0100, Matthew Auld wrote:
> In xe_vm_close_and_put(), external-BO VMAs are queued on the
> contested
> list for deferred destruction via xe_vma_destroy_unlocked(). However,
> xe_vm_pt_destroy() was previously invoked before processing contested
> VMAs, destroying vm->pt_root while those VMAs were still linked to
> their
> respective buffer objects (vm_bo->list.gpuva).
>=20
> If a concurrent thread evicts one of those shared buffer objects,
> xe_bo_trigger_rebind() holding only bo->resv walks the BO's VMAs and,
> in
> fault mode, calls xe_vm_invalidate_vma() -> xe_pt_zap_ptes(). Because
> vm->pt_root[tile->id] is already NULL, dereferencing pt->level causes
> a
> NULL ptr deref.
>=20
> Fix this by deferring xe_vm_free_scratch() and xe_vm_pt_destroy()
> until
> after all contested VMAs have been unlinked and destroyed.
>=20
> User is reporting hitting a NULL ptr deref in xe_pt_zap_ptes(), which
> could be explained by this race.
>=20
> Assisted-by: LLM
> Fixes: b06d47be7c83 ("drm/xe: Port Xe to GPUVA")
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9290
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org> # v6.12+

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/xe/xe_vm.c | 21 +++++++++------------
> =C2=A01 file changed, 9 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 17dc4debe7c1..390da884c727 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1979,21 +1979,13 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> =C2=A0		vma->gpuva.flags |=3D XE_VMA_DESTROYED;
> =C2=A0	}
> =C2=A0
> -	/*
> -	 * All vm operations will add shared fences to resv.
> -	 * The only exception is eviction for a shared object,
> -	 * but even so, the unbind when evicted would still
> -	 * install a fence to resv. Hence it's safe to
> -	 * destroy the pagetables immediately.
> -	 */
> -	xe_vm_free_scratch(vm);
> -	xe_vm_pt_destroy(vm);
> =C2=A0	xe_vm_unlock(vm);
> =C2=A0
> =C2=A0	/*
> -	 * VM is now dead, cannot re-add nodes to vm->vmas if it's
> NULL
> -	 * Since we hold a refcount to the bo, we can remove and
> free
> -	 * the members safely without locking.
> +	 * Unlink and destroy all contested external-BO VMAs before
> destroying
> +	 * the page tables. Otherwise, concurrent eviction holding
> only bo->resv
> +	 * can walk the BO's VMAs and attempt to invalidate/zap page
> tables that
> +	 * have already been freed.
> =C2=A0	 */
> =C2=A0	list_for_each_entry_safe(vma, next_vma, &contested,
> =C2=A0				 combined_links.destroy) {
> @@ -2001,6 +1993,11 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> =C2=A0		xe_vma_destroy_unlocked(vma);
> =C2=A0	}
> =C2=A0
> +	xe_vm_lock(vm, false);
> +	xe_vm_free_scratch(vm);
> +	xe_vm_pt_destroy(vm);
> +	xe_vm_unlock(vm);
> +
> =C2=A0	xe_svm_fini(vm);
> =C2=A0
> =C2=A0	up_write(&vm->lock);
