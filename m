Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27F9606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 16:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HDeChxHE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD8C10EAA8;
	Fri,  6 Nov 2026 16:26:34 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4D710EAA8
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 16:26:28 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 41F51601BF;
 Fri,  6 Nov 2026 16:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C634B1F008A1;
 Fri,  6 Nov 2026 16:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793982387;
 bh=5/13/68WlVL4d3H73q7k/9G/VX9vrfB/7Iqa1o9xlgU=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=HDeChxHEwt7y1i0p45MK7tiKmoLvyI456WL1f/u8xfxeC1bmaVBYCSFtiwteeDC7E
 +hk0IKT4My2I7GNR8IOlG+7RYrsVwBtYI5pX5kzSVmxRKfZ1owMn94ba9rUOLOLzv8
 TIOgQa4S2LWbbJsCXfqqN0ewID9p3AdX7z0+F+g7y+asIllvvq6NJQwh+NguWBn4wg
 M5gTpnC8PDsibnJD6SbY/tQWzEHV5gWGZwDyGJLmE82OW6kKOwPcNL6PXfSCsqn3pN
 58JWWDARm1BL2HWwD9oiWgQfUPAHilSUAhIe+ET5pUGdE5lvX0ZTniFVi+i0G1NFEg
 pk0kxwiZc7d8g==
Message-ID: <sashiko-outbox-201804@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] drm/xe/vf: Late fixups of LRCs after VF migration
To: "Tomasz Lis" <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261106155615.977330-2-tomasz.lis@intel.com>
References: <20261106155615.977330-1-tomasz.lis@intel.com>
 <20261106155615.977330-2-tomasz.lis@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 16:26:26 +0000
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
- [Medium] drm/xe/vf: premature mutex_destroy() of scratch_lock in
  vf_migration_fini()
--

commit 3d0fd68d1f87ea2f30e131438f2016a4f50af378
Author: Tomasz Lis <tomasz.lis@intel.com>

drm/xe/vf: Late fixups of LRCs after VF migration

This commit moves VF LRC HWSP rebasing from the post-migration recovery
worker to exec queue registration and unpause preparation, protecting the
shared migration scratch buffer with a mutex.

> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_=
gt_sriov_vf.c
> index 2a5f2064ad3e8..f8c03b741b084 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
[ ... ]
> @@ -1488,6 +1484,7 @@ static void vf_migration_fini(void *arg)
>  	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> =20
>  	cancel_work_sync(&gt->sriov.vf.migration.worker);
> +	mutex_destroy(&gt->sriov.vf.migration.scratch_lock);
>  }
> =20
>  /**
> @@ -1509,6 +1506,7 @@ int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
>  	if (!buf)
>  		return -ENOMEM;
> =20
> +	mutex_init(&gt->sriov.vf.migration.scratch_lock);
>  	gt->sriov.vf.migration.scratch =3D buf;

[Severity: Medium]
Can vf_migration_fini() destroy scratch_lock while GuC DRM scheduler
workers are still registering exec queues?

xe_gt_sriov_vf_init() registers vf_migration_fini() with devm at the end
of xe_gt_init(), after xe_guc_submit_init() registers guc_submit_fini().
During device unbind or unload, devres runs vf_migration_fini() before
guc_submit_fini() stops the GuC schedulers:

CPU0                              CPU1 (DRM sched worker)
vf_migration_fini()
  cancel_work_sync(&...worker)
  mutex_destroy(&...scratch_lock)
                                  guc_exec_queue_run_job()
                                    register_exec_queue()
                                      xe_exec_queue_lrcs_hwsp_rebase()
                                        mutex_lock(&...scratch_lock)
                                          <-- locks destroyed mutex
guc_submit_fini()

Also, if probe fails between xe_gt_sriov_vf_init_early() and
xe_gt_sriov_vf_init(), vf_migration_fini() is never registered and
scratch_lock is not destroyed.  Initializing scratch_lock with
drmm_mutex_init() in xe_gt_sriov_vf_init_early() would match the drmm
lifetime of migration.scratch and guc->submission_state.lock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106155615.9773=
30-1-tomasz.lis@intel.com?part=3D1
