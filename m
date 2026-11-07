Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD248606A332
	for <intel-xe@archiver.kernel.org>; Sat,  7 Nov 2026 00:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kTX2shxn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932FF10E3F4;
	Sat,  7 Nov 2026 00:13:24 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952F810E3F4
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Nov 2026 00:13:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 9F47260D69;
 Sat,  7 Nov 2026 00:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB3F1F0089F;
 Sat,  7 Nov 2026 00:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794010397;
 bh=pjsWTDD9FGV16EmhxmN2Eyv3ml8NOsBHSjDsdHA3K5c=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=kTX2shxniW3GxYP0jllFavUhxzr6Og/iVYq4rDc9thlLWflf49UrA2rgJ3+xO2LB+
 9f/ngZCKlny2IdSFWcVBV1xv6pygYa/M1gIqh71np/tCmPO7yLDNJ2pyDNfnjD6NQj
 yL/yz/YINCtxwsSJ4GtsDcBvP+LoUfBItGW/LIA3n6PyMvCkpGi4mY2ecqXB0DhkiC
 gcxl6eWpOWUhpEyNj274vmT+dvmFWZj/0GnUNJTOr8YVVLSMnkfk/PlQEQ1SaNywWp
 MIO3dpU7+nBbsilTG/vpKhfKRFRhYkwUOPtlFfSGdlpFMifKOfbRlj1Pv0KLk0VmJC
 rMUfhUcKXCoEw==
Message-ID: <sashiko-outbox-202416@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: drm/xe/guc: Use vzalloc for GuC log snapshot capture
To: "Carlos Santa" <carlos.santa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261106234806.704033-1-carlos.santa@intel.com>
References: <20261106234806.704033-1-carlos.santa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 00:13:16 +0000
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] drm/xe/guc: sleep in atomic and reclaim deadlock in
  xe_guc_log_snapshot_alloc()
- [Medium] drm/xe/guc: unused variables remain and i in
  xe_guc_log_snapshot_capture()
- [Low] drm/xe/guc: stale @copy kernel-doc and dead num_chunks in
  xe_guc_log_snapshot
- [Low] drm/xe/guc: inaccurate Fixes trailer in commit message
--

commit 0a6f134466ce80006b3408455a8492bd3452539a
Author: Carlos Santa <carlos.santa@intel.com>

> drm/xe/guc: Use vzalloc for GuC log snapshot capture
>
> When capturing a devcoredump following a GPU engine hang,
> xe_guc_log_snapshot_alloc() attempts to break the log into 2MB (SZ_2M)
> chunks using kmalloc() under GFP_ATOMIC:
>
>   kworker/u32:4: page allocation failure: order:9, mode:0x40820(GFP_ATOMI=
C|__GFP_COMP)
>   Call Trace:
>    <TASK>
>    warn_alloc+0x143/0x210
>    __alloc_frozen_pages_noprof+0x112c/0x2050
>    __kmalloc_noprof+0x40c/0x670
>    xe_guc_log_snapshot_capture+0xff/0x360 [xe]
>    xe_devcoredump+0x22e/0x340 [xe]
>    guc_exec_queue_timedout_job+0x6de/0xbe0 [xe]
>    drm_sched_job_timedout+0xec/0x1c0 [gpu_sched]
>    process_scheduled_works+0x218/0x6d0
>    worker_thread+0x188/0x3e0
>
> An order-9 GFP_ATOMIC allocation requires 512 physically contiguous pages
> and strictly forbids direct reclaim and compaction. Under severe memory
> fragmentation=E2=80=94even when hundreds of megabytes of free order-0 pag=
es
> remain=E2=80=94this allocation fails consistently. Consequently, the devc=
oredump
> is generated with a missing GuC log snapshot, losing critical telemetry
> needed for post-mortem hang analysis.
>
> Neither caller of xe_guc_log_snapshot_capture() (devcoredump and debugfs)
> runs in an interrupt or atomic context. Devcoredump executes from the DRM
> scheduler timeout worker (process context) and already relies on
> sleepable GFP_KERNEL allocations throughout. Furthermore, the GuC log
> snapshot buffer is purely a temporary CPU staging buffer formatted via
> xe_print_blob_ascii85() for sysfs reads; it is never accessed by GPU DMA,
> meaning physical contiguity is completely unnecessary.
>
> Drop the artificial atomic constraint, remove the high-order chunking
> and pointer array machinery, and allocate the snapshot buffer using
> vzalloc().
>
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Assisted-by: LLM
> Signed-off-by: Carlos Santa <carlos.santa@intel.com>

[Severity: Low]
xe_guc_log_snapshot_alloc() and the chunked GFP_ATOMIC kmalloc() logic were
not present in commit dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for
Intel GPUs").  Should the Fixes tag instead reference commit d8ce1a977226
("drm/xe/guc: Use a two stage dump for GuC logs and add more info")?

> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_=
log.c
> index 80d80393b05db..89dbb238becfb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
[ ... ]
> @@ -114,48 +115,22 @@ log_to_xe(struct xe_guc_log *log)
>  	return gt_to_xe(log_to_gt(log));
>  }
> =20
> -static struct xe_guc_log_snapshot *xe_guc_log_snapshot_alloc(struct xe_g=
uc_log *log, bool atomic)
> +static struct xe_guc_log_snapshot *xe_guc_log_snapshot_alloc(struct xe_g=
uc_log *log)
>  {
>  	struct xe_guc_log_snapshot *snapshot;
> -	size_t remain;
> -	int i;
> =20
> -	snapshot =3D kzalloc_obj(*snapshot, atomic ? GFP_ATOMIC : GFP_KERNEL);
> +	snapshot =3D kzalloc(sizeof(*snapshot), GFP_KERNEL);
>  	if (!snapshot)
>  		return NULL;
> =20
> -	/*
> -	 * NB: kmalloc has a hard limit well below the maximum GuC log buffer s=
ize.
> -	 * Also, can't use vmalloc as might be called from atomic context. So n=
eed
> -	 * to break the buffer up into smaller chunks that can be allocated.
> -	 */
>  	snapshot->size =3D xe_bo_size(log->bo);
> -	snapshot->num_chunks =3D DIV_ROUND_UP(snapshot->size, GUC_LOG_CHUNK_SIZ=
E);
> -
> -	snapshot->copy =3D kzalloc_objs(*snapshot->copy, snapshot->num_chunks,
> -				      atomic ? GFP_ATOMIC : GFP_KERNEL);
> -	if (!snapshot->copy)
> -		goto fail_snap;
> -
> -	remain =3D snapshot->size;
> -	for (i =3D 0; i < snapshot->num_chunks; i++) {
> -		size_t size =3D min(GUC_LOG_CHUNK_SIZE, remain);
> -
> -		snapshot->copy[i] =3D kmalloc(size, atomic ? GFP_ATOMIC : GFP_KERNEL);
> -		if (!snapshot->copy[i])
> -			goto fail_copy;
> -		remain -=3D size;
> +	snapshot->data =3D vzalloc(snapshot->size);
> +	if (!snapshot->data) {
> +		kfree(snapshot);
> +		return NULL;
>  	}
> =20
>  	return snapshot;
> -
> -fail_copy:
> -	for (i =3D 0; i < snapshot->num_chunks; i++)
> -		kfree(snapshot->copy[i]);
> -	kfree(snapshot->copy);
> -fail_snap:
> -	kfree(snapshot);
> -	return NULL;
>  }
> =20
>  /**
> @@ -167,17 +142,10 @@ static struct xe_guc_log_snapshot *xe_guc_log_snaps=
hot_alloc(struct xe_guc_log *
>   */
>  void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot)
>  {
> -	int i;
> -
>  	if (!snapshot)
>  		return;
> =20
> -	if (snapshot->copy) {
> -		for (i =3D 0; i < snapshot->num_chunks; i++)
> -			kfree(snapshot->copy[i]);
> -		kfree(snapshot->copy);
> -	}
> -
> +	vfree(snapshot->data);
>  	xe_guc_dump_cache_fini(&snapshot->dump_cache);
>  	kfree(snapshot);
>  }

[Severity: High]
Can xe_guc_log_snapshot_alloc() and xe_guc_log_snapshot_free() sleep in
atomic context or deadlock with memory reclaim?

In __xe_devcoredump() -> devcoredump_snapshot(), xe_guc_log_snapshot_captur=
e()
is called while holding coredump->lock (which is primed with fs_reclaim in
xe_devcoredump_init()) and inside a dma_fence_begin_signalling() critical
section:

drivers/gpu/drm/xe/xe_devcoredump.c:devcoredump_snapshot() {
	...
	cookie =3D dma_fence_begin_signalling();
	...
	ss->guc.log =3D xe_guc_log_snapshot_capture(&guc->log, true);
	...
	queue_work(system_dfl_wq, &ss->work);

	dma_fence_end_signalling(cookie);
}

Allocating with GFP_KERNEL and vzalloc() inside the dma_fence signalling pa=
th
and under coredump->lock inverts the fs_reclaim lock hierarchy and can
deadlock if memory reclaim waits on fences blocked by the hang recovery work
(sleepable allocations in devcoredump are deferred to
xe_devcoredump_deferred_snap_work()).

In addition, process_ct_dead() also calls xe_guc_log_snapshot_capture() and
xe_guc_log_snapshot_free():

drivers/gpu/drm/xe/xe_guc_ct.c:process_ct_dead() {
	...
	snapshot_log =3D xe_guc_log_snapshot_capture(&guc->log, true);
	snapshot_ct =3D xe_guc_ct_snapshot_capture((ct));

	spin_lock_irqsave(&ct->dead.lock, flags);

	if (ct->dead.snapshot_log || ct->dead.snapshot_ct) {
		xe_gt_err(ct_to_gt(ct), "Got unexpected dead CT capture!\n");
		xe_guc_log_snapshot_free(snapshot_log);
	...
}

process_ct_dead() is reachable from hardirq context holding ct->fast_lock v=
ia
xe_guc_ct_fast_path() -> g2h_read() -> ct_corrupted(), where vzalloc() hits
BUG_ON(in_nmi() || in_hardirq()) in __get_vm_area_node(), and from process
context holding spin_lock_irq(&ct->fast_lock) or the fs_reclaim-primed
ct->lock.  Moreover, calling xe_guc_log_snapshot_free() -> vfree() from task
context while holding spin_lock_irqsave(&ct->dead.lock, flags) sleeps in
atomic context because vfree() only defers to vfree_atomic() when
in_interrupt() is true.

> @@ -202,19 +170,10 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_cap=
ture(struct xe_guc_log *log,
>  	if (!log->bo)
>  		return NULL;
> =20
> -	snapshot =3D xe_guc_log_snapshot_alloc(log, atomic);
> +	snapshot =3D xe_guc_log_snapshot_alloc(log);
>  	if (!snapshot)
>  		return NULL;
> -
> -	remain =3D snapshot->size;
> -	for (i =3D 0; i < snapshot->num_chunks; i++) {
> -		size_t size =3D min(GUC_LOG_CHUNK_SIZE, remain);
> -
> -		xe_map_memcpy_from(xe, snapshot->copy[i], &log->bo->vmap,
> -				   i * GUC_LOG_CHUNK_SIZE, size);
> -		remain -=3D size;
> -	}
> -
> +	xe_map_memcpy_from(xe, snapshot->data, &log->bo->vmap, 0, snapshot->siz=
e);

[Severity: Medium]
Does removing the chunk loop leave the local variables remain and i unused =
in
xe_guc_log_snapshot_capture()?  This triggers -Wunused-variable warnings and
breaks the build when CONFIG_WERROR=3Dy or CONFIG_DRM_XE_WERROR=3Dy is enab=
led.
The GUC_LOG_CHUNK_SIZE macro in xe_guc_log.c and the atomic parameter of
xe_guc_log_snapshot_capture() are also left unused.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/x=
e_guc_log_types.h
> index a38e9619c95da..cb88712b94800 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
> @@ -39,7 +39,7 @@ struct xe_guc_log_snapshot {
>  	/** @size: Size in bytes of the @copy allocation */
>  	size_t size;
>  	/** @copy: Host memory copy of the log buffer for later dumping, split =
into chunks */
> -	void **copy;
> +	void *data;
>  	/** @num_chunks: Number of chunks within @copy */
>  	int num_chunks;
>  	/** @ktime: Kernel time the snapshot was taken */

[Severity: Low]
Renaming copy to data without updating the @copy kernel-doc tag causes the
hdrtest target (scripts/kernel-doc -Werror under CONFIG_DRM_XE_WERROR=3Dy) =
and
W=3D1 builds to fail on xe_guc_log_types.h.  The @size and @dump_cache
kernel-doc comments also still refer to @copy, and the num_chunks member is
now unused.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106234806.7040=
33-1-carlos.santa@intel.com?part=3D1
