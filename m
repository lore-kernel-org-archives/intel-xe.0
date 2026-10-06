Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F764CA5FFC
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 18:05:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F3810E280;
	Tue,  6 Oct 2026 18:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SL1QWz2o";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE20310E280
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Oct 2026 18:04:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E9610602D3;
 Tue,  6 Oct 2026 18:04:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B141F0089B;
 Tue,  6 Oct 2026 18:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791309898;
 bh=LWpRIHlo+j8q8PgQ6fAk7KlSA1pMinNhGcbHXSDyE10=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=SL1QWz2obaWJrWB3Ume8DMYAS8G4JMgvTbc1lLlzYtEY0fA76U5DV8v60tnrPvaeU
 r2xxtIJyyfLvkAotah9Y+OaSZtIx1VxumLoM+j89tAHFq2V7vRV8l1rNgCZPQOUp58
 2lOUKe9Xg17/iF3E7+ZrVtHYi/znc520DDuq99IM/bypRdmjUXaBWnBuBXPmPTrmaS
 9UT3fgx0NSpGC9Q0wXNuCnTdeHdd0oEXTxHasrbZF3zxC3+JiUwoQ9cB9xB57KAvbl
 zspB2882wSZploR7a7SI0c3JHtdPfR/pIGbXr83OISH7J0e476oeIn0EUeNvB8B3WS
 AcOLhFleVT5jA==
Message-ID: <sashiko-outbox-162316@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 3/3] drm/xe/guc: Add dump_cache to optimize GuC
 CT/Log compression flow
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261006175129.3366784-8-alan.previn.teres.alexis@intel.com>
References: <20261006175129.3366784-5-alan.previn.teres.alexis@intel.com>
 <20261006175129.3366784-8-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 18:04:57 +0000
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
- [High] locking: Sleeping in atomic context when freeing vmalloc'd dump ca=
che under spinlock
--

commit 4127e505817735f2e0895aab3e86bcc1556be816
Author: Alan Previn <alan.previn.teres.alexis@intel.com>
Date:   Tue Oct 6 17:51:31 2026 +0000

drm/xe/guc: Add dump_cache to optimize GuC CT/Log compression flow
   =20
This commit introduces a dump_cache structure to store a compressed copy
of the GuC CT and log buffers. This avoids recompressing the buffers
multiple times during xe_devcoredump preparation.

> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_=
log.c
> index 47adaf70d5bfb..90aeaccea596c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c

[ ... ]

> @@ -296,30 +310,48 @@ static void xe_guc_print_blob_compressed(struct xe_=
gt *gt, struct drm_printer *p
>  err:
> -	drm_printf(p, "%s.length: 0x%zx Algo: ERROR (compression failed)\n",
> -		   length_label, total_size);
> -out:
>  	kvfree(dst);
>  	kvfree(wksp);
>  }
>  #endif
> =20
> +/**
> + * xe_guc_dump_cache_fini - release a dump blob's compression cache
> + * @cache: cache embedded in the snapshot being freed
> + */
> +void xe_guc_dump_cache_fini(struct xe_guc_dump_cache *cache)
> +{
> +	kvfree(cache->data);

[Severity: High]
Does this code risk sleeping in an atomic context when xe_guc_dump_cache_fi=
ni()
is called?

The xe_guc_dump_cache_fini() function calls kvfree() on cache->data, which
may be backed by vmalloc() if the compressed blob was large.

In drivers/gpu/drm/xe/xe_guc_ct.c, the ct_dead_worker_func() workqueue func=
tion
calls xe_guc_log_snapshot_free() while holding the ct->dead.lock spinlock:

	spin_lock_irq(&ct->dead.lock);

	xe_guc_log_snapshot_free(ct->dead.snapshot_log);

Calling kvfree() on a vmalloc pointer triggers vfree(), which can sleep whi=
le
acquiring the vmap_area_lock or performing page tree operations, potentially
leading to a deadlock since hardware interrupts are disabled.

> +	cache->data =3D NULL;
> +	cache->size =3D 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006175129.3366=
784-5-alan.previn.teres.alexis@intel.com?part=3D3
