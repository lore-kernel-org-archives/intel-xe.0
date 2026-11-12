Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E74606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 09:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sm6hOuRZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A2610FF61;
	Thu, 12 Nov 2026 09:43:48 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B4E10FF61
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 09:43:42 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B256463A9C;
 Thu, 12 Nov 2026 09:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550951F00A05;
 Thu, 12 Nov 2026 09:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794476621;
 bh=K/5ZZHYh69HhBS/id/8+qIi2unXa/e5oDMsoEFF9TfQ=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Sm6hOuRZT0Z5VwVgOouksngMIy2v/pg1Iku62bZGCuPHU8cOjEum+Jx6If7vWXdlA
 KMtRiSQy/1a0x4L+E1y7uF6TOEz5UltZPIoe6XO9ngEh86xuyCp+Q7oj/9mNspOQ6w
 oE6aT9jwjlLpEUdqkTqB3TE2FuJKN+z1B0FbWFVN5lOtUj0vbN7UtL7jFD5ZS0R8gz
 Y5dBCAJebTTM0vVypIHPP6xxgFyp3XT3qUKd73EvL4CwH3R2GTkv73pi7QomJmV3vN
 ivegebpwclbAQSAkwTo7nz9VDPf+jo/vQvbE91K0L6UrbZaO2lfmMMvHNpV0fH1p2c
 wqHCD3ff8GR5A==
Message-ID: <sashiko-outbox-210894@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 06/10] drm/xe/migrate: Introduce xe_migrate_reinit()
 and xe_cpu_bind_reinit()
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261112091033.1813803-7-raag.jadav@intel.com>
References: <20261112091033.1813803-1-raag.jadav@intel.com>
 <20261112091033.1813803-7-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 09:43:40 +0000
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
- [Medium] drm/xe/migrate: race between xe_migrate_flr_prepare() and
  xe_migrate_ulls_enter()
--

commit 7621242dd72f22e276d3072cbfb172bd04d6eb8f
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/migrate: Introduce xe_migrate_reinit() and xe_cpu_bind_reinit()

This commit adds helpers to prepare and re-initialize the migration and
CPU bind contexts across a PCIe FLR.

> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 3c65b251b907e..fe71cb011d3a0 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -913,6 +913,13 @@ static int do_gt_restart(struct xe_gt *gt)
>  void xe_gt_flr_prepare(struct xe_gt *gt)
>  {
>  	xe_gt_sanitize(gt);
> +
> +	if (xe_gt_is_main_type(gt)) {
> +		struct xe_tile *tile =3D gt_to_tile(gt);
> +
> +		xe_migrate_flr_prepare(tile->migrate);
> +	}
> +
>  	xe_uc_flr_prepare(&gt->uc);
>  	xe_pagefault_reset(gt_to_xe(gt), gt);
>  	xe_tlb_inval_reset(&gt->tlb_inval);

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 19c37eb315893..d8f5744b0eb7c 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -272,9 +272,8 @@ static void xe_migrate_ulls_toggle_enable(struct xe_m=
igrate *m, bool enabled)
>  	m->ulls.enabled =3D enabled;
>  }
> =20
> -static void xe_migrate_fini(void *arg)
> +static void xe_migrate_ulls_fini(struct xe_migrate *m)
>  {
> -	struct xe_migrate *m =3D arg;
>  	struct xe_device *xe =3D tile_to_xe(m->tile);
> =20
>  	disable_delayed_work_sync(&m->ulls.exit_work);
> @@ -284,6 +283,13 @@ static void xe_migrate_fini(void *arg)
>  			xe_migrate_ulls_toggle_enable(m, false);
>  		}
>  	}
> +}

[ ... ]

> @@ -778,6 +784,35 @@ static void xe_migrate_ulls_exit(struct work_struct =
*work)
>  	drm_dev_exit(idx);
>  }
> =20
> +/**
> + * xe_migrate_flr_prepare() - Prepare migrate context for FLR
> + * @m: The migration context
> + */
> +void xe_migrate_flr_prepare(struct xe_migrate *m)
> +{
> +	xe_migrate_ulls_fini(m);
> +}
> +
> +/**
> + * xe_migrate_reinit() - Re-initialize a migrate context
> + * @m: The migration context
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_migrate_reinit(struct xe_migrate *m)
> +{
> +	int err;
> +
> +	xe_migrate_prepare_vm(m->tile, m, m->q->vm, NULL);
> +
> +	err =3D xe_exec_queue_reinit(m->q);
> +	if (err)
> +		return err;
> +
> +	enable_delayed_work(&m->ulls.exit_work);
> +	return 0;
> +}

[Severity: Medium]
Can an in-flight xe_migrate_ulls_enter() race with xe_migrate_flr_prepare()
and leak a runtime PM reference while leaving m->ulls.enabled stuck true?

xe_gt_flr_prepare() calls xe_migrate_flr_prepare() while pagefault workers
can still run, and xe_migrate_ulls_enter() drops m->job_mutex to allocate a
sched job before re-acquiring it:

CPU0                                  CPU1
xe_gt_flr_prepare()                   xe_pagefault_service()
  xe_migrate_flr_prepare()              ...
    xe_migrate_ulls_fini()                xe_migrate_ulls_enter()
      disable_delayed_work_sync(            job =3D xe_sched_job_create(...)
        &m->ulls.exit_work)
      mutex_lock(&m->job_mutex)
      m->ulls.enabled =3D false
      mutex_unlock(&m->job_mutex)
                                            mutex_lock(&m->job_mutex)
                                            xe_pm_runtime_get_noresume(xe)
                                            m->ulls.enabled =3D true
                                            mod_delayed_work(...,
                                              &m->ulls.exit_work, ...)
                                              <-- fails, work is disabled
                                            mutex_unlock(&m->job_mutex)
...
xe_gt_reinit()
  xe_migrate_reinit()
    xe_exec_queue_reinit(m->q)
    enable_delayed_work(&m->ulls.exit_work)

Because m->ulls.exit_work is disabled when xe_migrate_ulls_enter() calls
mod_delayed_work(), the exit worker is not queued.  When xe_migrate_reinit()
later calls enable_delayed_work(), it only decrements the disable depth
without scheduling the work or resetting m->ulls.enabled, so the runtime PM
reference taken in xe_migrate_ulls_enter() is leaked and m->ulls.enabled
remains true on the re-initialized queue.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112091033.1813=
803-1-raag.jadav@intel.com?part=3D6
