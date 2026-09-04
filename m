Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77229C79F82
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:28:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CCD710E22C;
	Fri,  4 Sep 2026 21:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HxsEpOVh";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B67610E22C
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:28:14 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 74AD760209;
 Fri,  4 Sep 2026 21:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A8C1F00A3D;
 Fri,  4 Sep 2026 21:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788557293;
 bh=xdcc4aR4BIKePdK1BQDAQaKAhXA/ll8pot2MLbIho+Y=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=HxsEpOVhej+s/37FsfXnq9RTdsIbjuRVBd6fh2JgWBicdkHAUjWSLtVkiaWLm2KAp
 dxMUAUYEZEbYNKf/6gW9FLAtEX6SLT5GNu9vLsr13kCFRKhm49NzuGcbnhcUYEdnTa
 h1xYWEW5r/28oNAkK0rtHvTj5da02eFncEvewfS8VJjsrwU6DNHBfpkWIuoIGg7YgG
 2xWUF8CKwqUTwgF3tB74PqEGA1Rb4cj0Oyq+OqsCz7nNlQGYFVqBcpju3ST8XaJpgR
 6EEuwSRPR8c5GJOKgZEu0KZ9Ycj8ltmeChuTJxskaV7wsilrMGOIEmq3khF1u6Zz/R
 Iv4YNCDNVGWBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 02/24] drm/xe: Add
 xe_migrate_update_pgtables_cpu_execute helper
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904211613.3934307-3-matthew.brost@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 21:28:12 +0000
Message-Id: <20260904212813.00A8C1F00A3D@smtp.kernel.org>
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
- [Medium] Structurally flawed assertions cause kernel oops and include tau=
tological checks.
--

commit 780cddb686fdf43f07c0012e23c36d21d368d194
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Add xe_migrate_update_pgtables_cpu_execute helper

This commit extracts the CPU-side page-table update logic into a new helper
function xe_migrate_update_pgtables_cpu_execute. This helper is intended to
support implementing CPU binds when a bind job's dependencies are resolved.
It also introduces basic sanity checks on the function arguments.

Link: https://patch.msgid.link/20260228013501.106680-3-matthew.brost@intel.=
com

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 149c5fa654e67..68a0b05f56ec9 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c

[ ... ]

> @@ -1819,6 +1819,38 @@ struct migrate_test_params {
>  	container_of(_priv, struct migrate_test_params, base)
>  #endif
> =20
> +static void
> +xe_migrate_update_pgtables_cpu_execute(struct xe_vm *vm, struct xe_tile =
*tile,
> +				       const struct xe_migrate_pt_update_ops *ops,
> +				       struct xe_vm_pgtable_update_op *pt_op,
> +				       u32 num_ops)
> +{
> +	u32 j, i;
> +
> +	for (j =3D 0; j < num_ops; ++j, ++pt_op) {
> +		for (i =3D 0; i < pt_op->num_entries; i++) {
> +			const struct xe_vm_pgtable_update *update =3D
> +				&pt_op->entries[i];
> +
> +			xe_tile_assert(tile, update);
> +			xe_tile_assert(tile, update->pt_bo);
> +			xe_tile_assert(tile, !iosys_map_is_null(&update->pt_bo->vmap));

[Severity: Medium]
Are these assertions structurally flawed?

First, update is derived from &pt_op->entries[i], meaning the address is
evaluated inline and will never be NULL, making xe_tile_assert(tile, update)
a tautology.

Second, if update->pt_bo is indeed NULL, the
xe_tile_assert(tile, update->pt_bo) macro will warn but execution will
continue. The subsequent assertion computes &update->pt_bo->vmap, yielding =
an
invalid pointer (NULL + offset), and passes it to iosys_map_is_null(). This
inline function dereferences the pointer, causing a kernel oops/panic. This
defeats the purpose of the sanity checks, as an internal invariant violation
will cause a hard crash.

Note that this code is moved to xe_cpu_bind_update_pgtables_execute in
drivers/gpu/drm/xe/xe_cpu_bind.c by the later patch "drm/xe: Add CPU bind
layer", but the structural flaw remains unfixed there.

> +
> +			if (pt_op->bind)
> +				ops->populate(tile, &update->pt_bo->vmap,
> +					      NULL, update->ofs, update->qwords,
> +					      update);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904211613.3934=
307-1-matthew.brost@intel.com?part=3D2
