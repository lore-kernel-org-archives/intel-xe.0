Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D043C98306
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 06:34:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 428AC10EA01;
	Fri, 25 Sep 2026 06:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dgHMoQbn";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D934E10EA01
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 06:34:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A8F06415C8;
 Fri, 25 Sep 2026 06:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D2D1F000FF;
 Fri, 25 Sep 2026 06:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790318052;
 bh=RIWyrutDcsmTnqulGi7F4O3U1nbxuz4bKghnFLSOsWg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=dgHMoQbnvhjMS+CyvrBOeqrqg/cHvo2nQLIKFlScVYaF8a/vMDLjSWAebc883IAA2
 Uh13WcqmXPFWRLfq+tscHwJH+X8OWDGpk+Vz9y5P9fVozUPMHZGwlRJCu7CSo1C63r
 PeyH63rf4x5EDoOo0u+A1NRYdB83mZI6/MotULLryUlynxaRc/ZnxLdcPfRP5mgNL8
 WBVhveGH0NfT/mcGJZm754PuWtwQ9wURqaB3tuHFbW+JTb+thIoK/VXm1ruN8+9C5W
 4tsCLtmxnTCxS3dpPtQJ7BZZg2AxSbgBUGM/Xvx/MQCaykyppIPQuXFFaNL26wdTOB
 ywOGVWLPhpZLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 19/24] drm/xe: Add ULLS migration job support to
 migration layer
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260925045320.1325860-20-matthew.brost@intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
 <20260925045320.1325860-20-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 06:34:11 +0000
Message-Id: <20260925063412.61D2D1F000FF@smtp.kernel.org>
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
- [High] drm/xe: Missing ULLS_EXIT in teardown leaves hardware parked on fr=
eed memory
--

commit 81f7dc64bc0d604133ac8c3a1f3ec0fd0a9dd8a1
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Add ULLS migration job support to migration layer

Add function to enter ULLS mode for migration job and delayed worker to
exit (power saving). ULLS mode expected to entered upon page fault or
SVM prefetch. ULLS mode exit delay is currently set to 5ms.

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 471ae5741836e..d7d13a25cdb91 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
[ ... ]
> @@ -95,9 +105,30 @@ struct xe_migrate {
>   */
>  #define MAX_PTE_PER_SDI 0x1FEU
> =20
> +static bool xe_migrate_ulls_enabled(struct xe_migrate *m)
> +{
> +	lockdep_assert_held(&m->job_mutex);
> +	return m->ulls.enabled;
> +}
> +
> +static void xe_migrate_ulls_toggle_enable(struct xe_migrate *m, bool ena=
bled)
> +{
> +	lockdep_assert_held(&m->job_mutex);
> +	m->ulls.enabled =3D enabled;
> +}
> +
>  static void xe_migrate_fini(void *arg)
>  {
>  	struct xe_migrate *m =3D arg;
> +	struct xe_device *xe =3D tile_to_xe(m->tile);
> +
> +	disable_delayed_work_sync(&m->ulls.exit_work);
> +	scoped_guard(mutex, &m->job_mutex) {
> +		if (xe_migrate_ulls_enabled(m)) {
> +			xe_pm_runtime_put(xe);
> +			xe_migrate_ulls_toggle_enable(m, false);

[Severity: High]
Does this missing ULLS_EXIT in the teardown sequence leave the hardware
parked on freed memory?

During driver unbind or probe failure in xe_migrate_fini(), if ULLS mode is
currently active (for example, within 5ms of a recent migration job), the
reserved hardware engine is actively spinning in a MI_SEMAPHORE_WAIT loop.

This teardown path cancels exit_work and clears the ULLS enabled flag, but
fails to push the ULLS_EXIT job or explicitly kill the queue. It then
proceeds to call xe_exec_queue_put() and free the page tables. Because
xe_exec_queue_kill() is never called, GuC is never instructed to preempt
and deregister the context.

Can this regression leave the hardware engine actively executing from the
ring buffer memory while the host frees it, potentially leading to IOMMU CAT
faults, GPU hangs, or host memory corruption?

> +		}
> +	}
> =20
>  	xe_vm_lock(m->q->vm, false);
>  	xe_bo_unpin(m->pt_bo);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925045320.1325=
860-1-matthew.brost@intel.com?part=3D19
