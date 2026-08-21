Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE652C5DF87
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 11:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB5910E210;
	Fri, 21 Aug 2026 11:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JHM8gtLh";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF9610E210
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 11:39:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E54B160A5D;
 Fri, 21 Aug 2026 11:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DDF11F000E9;
 Fri, 21 Aug 2026 11:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787312394;
 bh=LA5dMqImRUByPjPoIaBtbQvpHM/EogiJzN5EnFrVEBA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=JHM8gtLhV8lAt60tyUonIz9yHF4YzGXPTQa4AiX/cBShxysz3pCYSNvqMsTRX7uvV
 TQcK+Rh3mTaF5ee/dBSd0dNAomwU37D0+UXqVNpicf7D3nXIufXl0MhEV+HQuVWXbE
 MQaG4hZRBOZHpFKF755MdfIABiRDyEAr5I7YrHBEjOx1JkWsCOTmR2QEzd+z1Z4iJG
 nw3p0VBRMU/a/fOM3qWSC6krNvGkxYYP1we4XkkSFpFoMVAjAjtlrzRcZvAPGLp2EC
 J1ZgGaASFy631XhOh3OIPdyoQzhAyYNs5QjRV1rDp1lpog7kaZpV8iyK1ktwCDqXf8
 afxaUkgQgDCOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 06/10] drm/xe/migrate: Introduce xe_migrate_reinit()
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260821112436.545405-7-raag.jadav@intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
 <20260821112436.545405-7-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 11:39:54 +0000
Message-Id: <20260821113954.7DDF11F000E9@smtp.kernel.org>
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
- [High] xe_migrate_reinit() fails to clear the VRAM-backed page table BOs =
(m->pt_bo and the root page table) after a PCIe FLR, leaving garbage PDEs/P=
TEs.
--

--- Patch [6]: [PATCH v10 06/10] drm/xe/migrate: Introduce xe_migrate_reini=
t() ---
commit 897712e0d4905c2317c45ed76acb56c7362ca8d9
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/migrate: Introduce xe_migrate_reinit()

This commit introduces the xe_migrate_reinit() helper to re-initialize the
migrate context after a PCIe FLR. Since the migrate exec queue and pt_bo li=
ve
on VRAM, their contents are lost during FLR and require re-initialization.

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 75b83687f1b5d..eac91a4b78ed9 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c

[ ... ]

> @@ -454,6 +454,18 @@ static int xe_migrate_lock_prepare_vm(struct xe_tile=
 *tile, struct xe_migrate *m
>  	return err;
>  }
> =20
> +/**
> + * xe_migrate_reinit() - Re-initialize a migrate context
> + * @m: The migration context
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_migrate_reinit(struct xe_migrate *m)
> +{
> +	xe_migrate_prepare_vm(m->tile, m, m->q->vm, NULL);
> +	return xe_exec_queue_reinit(m->q);
> +}

[Severity: High]
Does this code leave garbage PDEs/PTEs in the VRAM-backed page table BOs
after a PCIe FLR?

Since the FLR garbles VRAM contents, and xe_migrate_prepare_vm() only writes
specific PDEs and PTEs rather than zeroing out the entire page table space,
the unwritten regions in m->pt_bo and the root page table will retain VRAM
garbage.

Could this cause the GPU page walker to speculatively fetch garbage PDEs/PT=
Es
(which may randomly have the Valid bit set), leading to unauthorized memory
accesses, fatal page faults, or GPU hangs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821112436.5454=
05-1-raag.jadav@intel.com?part=3D6
