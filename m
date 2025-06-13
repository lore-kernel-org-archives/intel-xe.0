Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6F3C61DB2
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 08:40:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D7010E900;
	Fri, 13 Jun 2025 08:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XXWcS6Aq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C2410E2B0
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 08:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749804033; x=1781340033;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=CIN8QrnE13C6Nj7soW4Op+5pkoIlQPotbfp01V/MBEU=;
 b=XXWcS6AqsvPd0bQv7cUEle3ndB5WzRNhsfNqkchQ+3n/YfLykEuBX6ZU
 sd5dB0bG0BgVZ4wgCeO7DeSoqaOP5LUqd5rGP5ezm8bsKSU5GOWdMNeGt
 RkTXPY+Ju0+Bq+ytqkp/RMyRef1puQ7VdNikhg/XDEzUI0vD2JI188/r1
 Vlq6j8rpUamtrl+XTHAmUgQb6cvuRsiDwZB/aBNgs+3esm+SAHyMBM1LE
 1Rn+Wyd4BzACsP7NuWPkwtyg/LglMibiwpZ8Y/NR6xToEDGfKlMl8DBMp
 gLl1YP00UnSuZP8404fvYbEkpIj6CSJ7LSRFafpg7vaL/Q2sqR9WGxLM/ Q==;
X-CSE-ConnectionGUID: 5HjmrL5SRtaR0MFHq2fIpA==
X-CSE-MsgGUID: RAKsyukITUehEojZiEJl5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69585018"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="69585018"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 01:40:31 -0700
X-CSE-ConnectionGUID: Ewp7+9FpTu+zjveAfNtFfw==
X-CSE-MsgGUID: 5c4YdnEtQwKATJmw8cCOMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="148653971"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.245.83])
 ([10.245.245.83])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 01:40:22 -0700
Message-ID: <8beb96d239da664ecb2289ec6ae4369fd6c92685.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Use TLB innvalidation context for invalidations
 issued from bind queues
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, himal.prasad.ghimiray@intel.com
Date: Fri, 13 Jun 2025 10:40:19 +0200
In-Reply-To: <20250612214041.235258-1-matthew.brost@intel.com>
References: <20250612214041.235258-1-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Thu, 2025-06-12 at 14:40 -0700, Matthew Brost wrote:
> In order to avoid adding tons of invalidation fences to dma-resv
> BOOKKEEP slots, and thus jobs dependencies, when stream of unbinds
> arrives (e.g., many user frees or unmaps), use a dma fence tlb
> invalidation context associated with the queue issuing the bind
> operation.
>=20
> Two fence contexts are needed - one for each GT as TLB invalidations
> are only ordered on a GT. A per GT ordered wq is needed to queue the
> invalidations to maintain dma fence ordering as well.
>=20
> This fixes the below splat when the number of invalidations gets out
> of
> hand:
>=20
> [ 1661.638258] watchdog: BUG: soft lockup - CPU#2 stuck for 26s!
> [kworker/u65:8:75257]
> [ 1661.638262] Modules linked in: xe drm_gpusvm drm_gpuvm
> drm_ttm_helper ttm drm_exec gpu_sched drm_suballoc_helper drm_buddy
> drm_kms_helper x86_pkg_temp_thermal coretemp snd_hda_cod=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0
> ec_realtek
> snd_hda_codec_generic snd_hda_scodec_component mei_pxp mei_hdcp
> wmi_bmof
> snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep i2c_i801
> snd_hda_core i2c_mux snd_pcm i2c_s=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mbus vid=
eo wmi mei_me mei
> fuse
> igb e1000e i2c_algo_bit ptp ghash_clmulni_intel pps_core
> intel_lpss_pci
> [last unloaded: xe]
> [ 1661.638278] CPU: 2 UID: 0 PID: 75257 Comm: kworker/u65:8
> Tainted: G S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.16.0-rc1-xe+ #397 PREEMPT(unde=
f)
> [ 1661.638280] Tainted: [S]=3DCPU_OUT_OF_SPEC
> [ 1661.638280] Hardware name: Intel Corporation Raptor Lake Client
> Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS
> RPLSFWI1.R00.3492.A00.2211291114 11/29/2022
> [ 1661.638281] Workqueue: xe_gt_page_fault_work_queue
> xe_svm_garbage_collector_work_func [xe]
> [ 1661.638311] RIP: 0010:xas_start+0x47/0xd0
> [ 1661.638317] Code: 07 48 8b 57 08 48 8b 40 08 48 89 c1 83 e1 03
> 48 83 f9 02 75 08 48 3d 00 10 00 00 77 21 48 85 d2 75 29 48 c7 47 18
> 00
> 00 00 00 <c3> cc cc cc cc 48 c1 fa 02 85 d2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 74 c7 31 c0 c3 cc
> cc
> cc cc 0f b6
> [ 1661.638317] RSP: 0018:ffffc90003d9b968 EFLAGS: 00000297
> [ 1661.638318] RAX: ffff88810459b232 RBX: ffffc90003d9b9a0 RCX:
> 0000000000000006
> [ 1661.638319] RDX: 0000000000000009 RSI: 0000000000000003 RDI:
> ffffc90003d9b9a0
> [ 1661.638320] RBP: ffffffffffffffff R08: ffff888197a0a600 R09:
> 0000000000000228
> [ 1661.638320] R10: ffffffffffffffff R11: ffffffffffffffc0 R12:
> 0000000000000241
> [ 1661.638320] R13: ffffffffffffffff R14: 0000000000000040 R15:
> ffff8881014db000
> [ 1661.638321] FS:=C2=A0 0000000000000000(0000)
> GS:ffff88890aee8000(0000) knlGS:0000000000000000
> [ 1661.638322] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 1661.638322] CR2: 00007fc07287fff8 CR3: 000000000242c003 CR4:
> 0000000000f70ef0
> [ 1661.638323] PKRU: 55555554
> [ 1661.638323] Call Trace:
> [ 1661.638325]=C2=A0 <TASK>
> [ 1661.638326]=C2=A0 xas_load+0xd/0xb0
> [ 1661.638328]=C2=A0 xas_find+0x187/0x1d0
> [ 1661.638330]=C2=A0 xa_find_after+0x10f/0x130
> [ 1661.638332]=C2=A0 drm_sched_job_add_dependency+0x80/0x1e0
> [gpu_sched]
> [ 1661.638335]=C2=A0 drm_sched_job_add_resv_dependencies+0x62/0x120
> [gpu_sched]
> [ 1661.638337]=C2=A0 xe_pt_vm_dependencies+0x5b/0x2f0 [xe]
> [ 1661.638359]=C2=A0 xe_pt_svm_pre_commit+0x59/0x1a0 [xe]
> [ 1661.638376]=C2=A0 xe_migrate_update_pgtables+0x67f/0x910 [xe]
> [ 1661.638397]=C2=A0 ? xe_pt_stage_unbind+0x92/0xd0 [xe]
> [ 1661.638416]=C2=A0 xe_pt_update_ops_run+0x12e/0x7f0 [xe]
> [ 1661.638433]=C2=A0 ops_execute+0x1b1/0x430 [xe]
> [ 1661.638449]=C2=A0 xe_vm_range_unbind+0x260/0x2a0 [xe]
> [ 1661.638465]=C2=A0 xe_svm_garbage_collector+0xfe/0x1c0 [xe]
> [ 1661.638478]=C2=A0 xe_svm_garbage_collector_work_func+0x25/0x30 [xe]
> [ 1661.638491]=C2=A0 process_one_work+0x16b/0x2e0
> [ 1661.638495]=C2=A0 worker_thread+0x284/0x410
> [ 1661.638496]=C2=A0 ? __pfx_worker_thread+0x10/0x10
> [ 1661.638496]=C2=A0 kthread+0xe9/0x210
> [ 1661.638498]=C2=A0 ? __pfx_kthread+0x10/0x10
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +++++++
> =C2=A0drivers/gpu/drm/xe/xe_exec_queue_types.h=C2=A0=C2=A0=C2=A0 | 17 +++=
++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 23 ++++++++++++++++--=
-
> --
> =C2=A0drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |=C2=A0 4 +++-
> =C2=A0drivers/gpu/drm/xe/xe_pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++++++=
+--
> =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +++++--=
-
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +=
+++--
> =C2=A07 files changed, 64 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> b/drivers/gpu/drm/xe/xe_exec_queue.c
> index fee22358cc09..71e354c56ad9 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -94,6 +94,14 @@ static struct xe_exec_queue
> *__xe_exec_queue_alloc(struct xe_device *xe,
> =C2=A0	else
> =C2=A0		q->sched_props.priority =3D
> XE_EXEC_QUEUE_PRIORITY_NORMAL;
> =C2=A0
> +	if (q->flags & (EXEC_QUEUE_FLAG_PERMANENT |
> EXEC_QUEUE_FLAG_VM)) {
> +		int i;
> +
> +		for (i =3D 0; i < XE_EXEC_QUEUE_TLB_CONTEXT_COUNT;
> ++i)
> +			q->tlb_invalidation.context[i] =3D
> +				dma_fence_context_alloc(1);
> +	}

Hmm. If invalidations are ordered per GT, why don't we just allocate
one invalidation context per GT, rather than one per GT per exec_queue?

Also, moving forward, this seems like a fit for a one-per-gt
invalidation drm_scheduler?

Thanks,
Thomas

> +
> =C2=A0	if (vm)
> =C2=A0		q->vm =3D xe_vm_get(vm);
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index cc1cffb5c87f..81d240e561ee 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -132,6 +132,23 @@ struct xe_exec_queue {
> =C2=A0		struct list_head link;
> =C2=A0	} lr;
> =C2=A0
> +	/** @tlb_invalidation: TLB invalidations exec queue state */
> +	struct {
> +		/**
> +		 * @tlb_invalidation.context: The TLB invalidation
> context
> +		 * for the queue (VM and MIGRATION queues only)
> +		 */
> +#define XE_EXEC_QUEUE_TLB_CONTEXT_PRIMARY_GT	0
> +#define XE_EXEC_QUEUE_TLB_CONTEXT_MEDIA_GT	1
> +#define
> XE_EXEC_QUEUE_TLB_CONTEXT_COUNT		(XE_EXEC_QUEUE_TLB_CONTEXT_MEDIA_GT=C2=
=A0+1)
> +		u64 context[XE_EXEC_QUEUE_TLB_CONTEXT_COUNT];
> +		/**
> +		 * @tlb_invalidation.seqno: The TLB invalidation
> seqno for the
> +		 * queue (VM and MIGRATION queues only)
> +		 */
> +		u32 seqno[XE_EXEC_QUEUE_TLB_CONTEXT_COUNT];
> +	} tlb_invalidation;
> +
> =C2=A0	/** @pxp: PXP info tracking */
> =C2=A0	struct {
> =C2=A0		/** @pxp.type: PXP session type used by this queue
> */
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 084cbdeba8ea..0a2fcaaf04fc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -7,6 +7,7 @@
> =C2=A0
> =C2=A0#include "abi/guc_actions_abi.h"
> =C2=A0#include "xe_device.h"
> +#include "xe_exec_queue_types.h"
> =C2=A0#include "xe_force_wake.h"
> =C2=A0#include "xe_gt.h"
> =C2=A0#include "xe_gt_printk.h"
> @@ -294,7 +295,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
> =C2=A0		struct xe_gt_tlb_invalidation_fence fence;
> =C2=A0		int ret;
> =C2=A0
> -		xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
> +		xe_gt_tlb_invalidation_fence_init(gt, NULL, &fence,
> 0, true);
> =C2=A0		ret =3D xe_gt_tlb_invalidation_guc(gt, &fence);
> =C2=A0		if (ret)
> =C2=A0			return ret;
> @@ -431,7 +432,7 @@ void xe_gt_tlb_invalidation_vm(struct xe_gt *gt,
> struct xe_vm *vm)
> =C2=A0	u64 range =3D 1ull << vm->xe->info.va_bits;
> =C2=A0	int ret;
> =C2=A0
> -	xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
> +	xe_gt_tlb_invalidation_fence_init(gt, NULL, &fence, 0,
> true);
> =C2=A0
> =C2=A0	ret =3D xe_gt_tlb_invalidation_range(gt, &fence, 0, range, vm-
> >usm.asid);
> =C2=A0	if (ret < 0)
> @@ -551,7 +552,9 @@ static const struct dma_fence_ops
> invalidation_fence_ops =3D {
> =C2=A0/**
> =C2=A0 * xe_gt_tlb_invalidation_fence_init - Initialize TLB invalidation
> fence
> =C2=A0 * @gt: GT
> + * @q: exec queue issuing TLB invalidation, if NULL no queue
> associated
> =C2=A0 * @fence: TLB invalidation fence to initialize
> + * @tlb_context: TLB invalidation context for exec_queue
> =C2=A0 * @stack: fence is stack variable
> =C2=A0 *
> =C2=A0 * Initialize TLB invalidation fence for use.
> xe_gt_tlb_invalidation_fence_fini
> @@ -559,15 +562,25 @@ static const struct dma_fence_ops
> invalidation_fence_ops =3D {
> =C2=A0 * even on error.
> =C2=A0 */
> =C2=A0void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_exec_queue *q,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct
> xe_gt_tlb_invalidation_fence *fence,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int tlb_context,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool stack)
> =C2=A0{
> +	xe_gt_assert(gt, tlb_context <
> XE_EXEC_QUEUE_TLB_CONTEXT_COUNT);
> +
> =C2=A0	xe_pm_runtime_get_noresume(gt_to_xe(gt));
> =C2=A0
> =C2=A0	spin_lock_irq(&gt->tlb_invalidation.lock);
> -	dma_fence_init(&fence->base, &invalidation_fence_ops,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt->tlb_invalidation.lock,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_fence_context_alloc(1), 1);
> +	if (q)
> +		dma_fence_init(&fence->base,
> &invalidation_fence_ops,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt->tlb_invalidation.lock,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 q-
> >tlb_invalidation.context[tlb_context],
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ++q-
> >tlb_invalidation.seqno[tlb_context]);
> +	else
> +		dma_fence_init(&fence->base,
> &invalidation_fence_ops,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gt->tlb_invalidation.lock,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_fence_context_alloc(1), 1);
> =C2=A0	spin_unlock_irq(&gt->tlb_invalidation.lock);
> =C2=A0	INIT_LIST_HEAD(&fence->link);
> =C2=A0	if (stack)
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> index abe9b03d543e..8440c608a0ec 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> @@ -10,6 +10,7 @@
> =C2=A0
> =C2=A0#include "xe_gt_tlb_invalidation_types.h"
> =C2=A0
> +struct xe_exec_queue;
> =C2=A0struct xe_gt;
> =C2=A0struct xe_guc;
> =C2=A0struct xe_vm;
> @@ -29,8 +30,9 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
> =C2=A0int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32
> *msg, u32 len);
> =C2=A0
> =C2=A0void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_exec_queue *q,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct
> xe_gt_tlb_invalidation_fence *fence,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool stack);
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int tlb_context, bool stack);
> =C2=A0void xe_gt_tlb_invalidation_fence_signal(struct
> xe_gt_tlb_invalidation_fence *fence);
> =C2=A0
> =C2=A0static inline void
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index f39d5cc9f411..feab4b7c7e70 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1529,7 +1529,7 @@ static void invalidation_fence_cb(struct
> dma_fence *fence,
> =C2=A0
> =C2=A0	trace_xe_gt_tlb_invalidation_fence_cb(xe, &ifence->base);
> =C2=A0	if (!ifence->fence->error) {
> -		queue_work(system_wq, &ifence->work);
> +		queue_work(ifence->gt->ordered_wq, &ifence->work);
> =C2=A0	} else {
> =C2=A0		ifence->base.base.error =3D ifence->fence->error;
> =C2=A0		xe_gt_tlb_invalidation_fence_signal(&ifence->base);
> @@ -1551,13 +1551,15 @@ static void
> invalidation_fence_work_func(struct work_struct *w)
> =C2=A0static void invalidation_fence_init(struct xe_gt *gt,
> =C2=A0				=C2=A0=C2=A0=C2=A0 struct invalidation_fence
> *ifence,
> =C2=A0				=C2=A0=C2=A0=C2=A0 struct dma_fence *fence,
> +				=C2=A0=C2=A0=C2=A0 struct xe_exec_queue *q, int
> tlb_context,
> =C2=A0				=C2=A0=C2=A0=C2=A0 u64 start, u64 end, u32 asid)
> =C2=A0{
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	trace_xe_gt_tlb_invalidation_fence_create(gt_to_xe(gt),
> &ifence->base);
> =C2=A0
> -	xe_gt_tlb_invalidation_fence_init(gt, &ifence->base, false);
> +	xe_gt_tlb_invalidation_fence_init(gt, q, &ifence->base,
> tlb_context,
> +					=C2=A0 false);
> =C2=A0
> =C2=A0	ifence->fence =3D fence;
> =C2=A0	ifence->gt =3D gt;
> @@ -2467,10 +2469,14 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> struct xe_vma_ops *vops)
> =C2=A0		if (mfence)
> =C2=A0			dma_fence_get(fence);
> =C2=A0		invalidation_fence_init(tile->primary_gt, ifence,
> fence,
> +					pt_update_ops->q,
> +					XE_EXEC_QUEUE_TLB_CONTEXT_PR
> IMARY_GT,
> =C2=A0					pt_update_ops->start,
> =C2=A0					pt_update_ops->last, vm-
> >usm.asid);
> =C2=A0		if (mfence) {
> =C2=A0			invalidation_fence_init(tile->media_gt,
> mfence, fence,
> +						pt_update_ops->q,
> +						XE_EXEC_QUEUE_TLB_CO
> NTEXT_MEDIA_GT,
> =C2=A0						pt_update_ops-
> >start,
> =C2=A0						pt_update_ops->last,
> vm->usm.asid);
> =C2=A0			fences[0] =3D &ifence->base.base;
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index 13abc6049041..2edd1c52150e 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -227,7 +227,9 @@ static void xe_svm_invalidate(struct drm_gpusvm
> *gpusvm,
> =C2=A0			int err;
> =C2=A0
> =C2=A0			xe_gt_tlb_invalidation_fence_init(tile-
> >primary_gt,
> -							=C2=A0
> &fence[fence_id], true);
> +							=C2=A0 NULL,
> +							=C2=A0
> &fence[fence_id], 0,
> +							=C2=A0 true);
> =C2=A0
> =C2=A0			err =3D xe_gt_tlb_invalidation_range(tile-
> >primary_gt,
> =C2=A0							=C2=A0=C2=A0
> &fence[fence_id],
> @@ -241,8 +243,9 @@ static void xe_svm_invalidate(struct drm_gpusvm
> *gpusvm,
> =C2=A0			if (!tile->media_gt)
> =C2=A0				continue;
> =C2=A0
> -			xe_gt_tlb_invalidation_fence_init(tile-
> >media_gt,
> -							=C2=A0
> &fence[fence_id], true);
> +			xe_gt_tlb_invalidation_fence_init(tile-
> >media_gt, NULL,
> +							=C2=A0
> &fence[fence_id], 0,
> +							=C2=A0 true);
> =C2=A0
> =C2=A0			err =3D xe_gt_tlb_invalidation_range(tile-
> >media_gt,
> =C2=A0							=C2=A0=C2=A0
> &fence[fence_id],
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d18807b92b18..730319b78a0a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3896,8 +3896,9 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> =C2=A0		if (xe_pt_zap_ptes(tile, vma)) {
> =C2=A0			xe_device_wmb(xe);
> =C2=A0			xe_gt_tlb_invalidation_fence_init(tile-
> >primary_gt,
> +							=C2=A0 NULL,
> =C2=A0							=C2=A0
> &fence[fence_id],
> -							=C2=A0 true);
> +							=C2=A0 0, true);
> =C2=A0
> =C2=A0			ret =3D xe_gt_tlb_invalidation_vma(tile-
> >primary_gt,
> =C2=A0						=09
> &fence[fence_id], vma);
> @@ -3909,8 +3910,9 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
> =C2=A0				continue;
> =C2=A0
> =C2=A0			xe_gt_tlb_invalidation_fence_init(tile-
> >media_gt,
> +							=C2=A0 NULL,
> =C2=A0							=C2=A0
> &fence[fence_id],
> -							=C2=A0 true);
> +							=C2=A0 0, true);
> =C2=A0
> =C2=A0			ret =3D xe_gt_tlb_invalidation_vma(tile-
> >media_gt,
> =C2=A0						=09
> &fence[fence_id], vma);

