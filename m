Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2863AD41D74
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 10:08:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB1810E253;
	Mon, 15 Dec 2025 10:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Un9QbXS1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06AF10E253
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 10:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765793324; x=1797329324;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=GgyigM9xZn1l1C5F6TEKJC91mNJ7snPo8EYMB/cG2/E=;
 b=Un9QbXS1nKRU0c8PMU9xLv+bFwlvb52L/BPfvPrdsrALUfQy9dk0eTuW
 01KhFp+zGXdokQeT26TI0UQWatsDwLFZFp2KOuzjTPVfngaTK4Z1xQ+cb
 C2StVdy8oAYlcAyT3eCpqzOAcnhvsJFZ+zSLkJHls8jLMVC/MtaZ7gCIo
 VGWGP1ihDV5rsNSy/YXeQECGE841yxgkOO7JiQqKQiMtQGuRE51Ej4GeF
 5CW2M86lM1QCLARVaAHReYcioL+k7W36Lc0EGmaeSm2WkPlWhcKpxLXRC
 DyFdswYYxYbNUluQ9qcGZ85/lG+PuEy/mbfn/Gblue6Kx2SqQacWlgcGb g==;
X-CSE-ConnectionGUID: xpdwa1S4T3iyyhPNPUYENg==
X-CSE-MsgGUID: bD0o8cocT6eBphJ4k0szLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="93166054"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="93166054"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 02:08:44 -0800
X-CSE-ConnectionGUID: pPO5zaJ6SUOa4lnCcB2iuw==
X-CSE-MsgGUID: A8/Xw3QsT7Gu5inbwdbE1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="235076023"
Received: from zzombora-mobl1 (HELO [10.245.244.10]) ([10.245.244.10])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 02:08:42 -0800
Message-ID: <86788bb40fabb2eee6cfe741514805d48d4e824f.camel@linux.intel.com>
Subject: Re: [PATCH v2 1/7] drm/xe: Adjust long-running workload timeslices
 to reasonable values
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, michal.mrozek@intel.com
Date: Mon, 15 Dec 2025 11:08:21 +0100
In-Reply-To: <20251212182847.1683222-2-matthew.brost@intel.com>
References: <20251212182847.1683222-1-matthew.brost@intel.com>
 <20251212182847.1683222-2-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Fri, 2025-12-12 at 10:28 -0800, Matthew Brost wrote:
> A 10ms timeslice for long-running workloads is far too long and
> causes
> significant jitter in benchmarks when the system is shared. Adjust
> the
> value to 5ms for preempt-fencing VMs, as the resume step there is
> quite
> costly as memory is moved around, and set it to zero for pagefault
> VMs,
> since switching back to pagefault mode after dma-fence mode is
> relatively fast.
>=20
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
> GPUs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Please add a comment in the commit message explaining why the type was
changed.

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5 =
++++-
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h | 2 +-
> =C2=A02 files changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index c2012d20faa6..4648f8a458cf 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1508,7 +1508,10 @@ struct xe_vm *xe_vm_create(struct xe_device
> *xe, u32 flags, struct xe_file *xef)
> =C2=A0	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
> =C2=A0
> =C2=A0	INIT_LIST_HEAD(&vm->preempt.exec_queues);
> -	vm->preempt.min_run_period_ms =3D 10;	/* FIXME: Wire up to
> uAPI */
> +	if (flags & XE_VM_FLAG_FAULT_MODE)
> +		vm->preempt.min_run_period_ms =3D 0;
> +	else
> +		vm->preempt.min_run_period_ms =3D 5;
> =C2=A0
> =C2=A0	for_each_tile(tile, xe, id)
> =C2=A0		xe_range_fence_tree_init(&vm->rftree[id]);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index 3bf912bfbdcc..18bad1dd08e6 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -263,7 +263,7 @@ struct xe_vm {
> =C2=A0		 * @min_run_period_ms: The minimum run period before
> preempting
> =C2=A0		 * an engine again
> =C2=A0		 */
> -		s64 min_run_period_ms;
> +		unsigned int min_run_period_ms;
> =C2=A0		/** @exec_queues: list of exec queues attached to
> this VM */
> =C2=A0		struct list_head exec_queues;
> =C2=A0		/** @num_exec_queues: number exec queues attached to
> this VM */

