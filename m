Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC2DC61DD3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 00:15:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF74310F7EE;
	Fri,  4 Sep 2026 00:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SeiBf14p";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E361510F80B
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 00:15:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4CF54437DB;
 Fri,  4 Sep 2026 00:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0545B1F000E9;
 Fri,  4 Sep 2026 00:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788480911;
 bh=r917WTKrS/U/0tpngihDi1jERUlKXZIHUAgg9+21ryA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=SeiBf14p4C+QMR9FNINGeP+SgbIgqzrmLTnk6HkWU92wE77SkU3xzKR7+EoJkkf/o
 nqKAXINePBgjw99pXR178gN4Ll94X6LHPerBBoI9zi3/hxl+XHg3Q7MBnmv9lKf9cw
 FRxIKExcYhFA0Pd7SkLpsHI4tp0BUPicp6BQayXQnPgjLEm04qPQCa/FtdSNsqtUMD
 XuDfOOlePweVaTVEmJBhuhL6hB7+i51BaAfUOtQJqFNcNySXyOruCDBLQOZYxLiTTH
 JXszmsCeP+9DGz3uz2tD9WqS+VmZw9wmXVz7N9VJQ4c87mNYlbqE5pDHXqMoeSgfSJ
 Z+c0Gc5bTgLUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/25] drm/xe: Add
 xe_migrate_update_pgtables_cpu_execute helper
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903235842.3401722-3-matthew.brost@intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
 <20260903235842.3401722-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 00:15:10 +0000
Message-Id: <20260904001511.0545B1F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] Flawed assertion sequence causes kernel panic instead of warning wh=
en `update->pt_bo` is NULL.
- [Low] Redundant and meaningless assertion on `update`.
- [Low] Type mismatch for `num_ops` argument.
--

commit f45575c8533ab8798dcc0ef542bd7c22dad7e2b3
Author: Matthew Brost <matthew.brost@intel.com>
drm/xe: Add xe_migrate_update_pgtables_cpu_execute helper

This commit adds the xe_migrate_update_pgtables_cpu_execute helper for
CPU-side page-table updates, allowing submission backends to call this
after resolving bind job dependencies. Asserts are also added to provide
basic sanity checks on function arguments.

Link: https://patch.msgid.link/20260228013501.106680-3-matthew.brost@intel.=
com

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 149c5fa654e67..084bfee0d0474 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1819,6 +1819,38 @@ struct migrate_test_params {
>  	container_of(_priv, struct migrate_test_params, base)
>  #endif
> =20
> +static void
> +xe_migrate_update_pgtables_cpu_execute(struct xe_vm *vm, struct xe_tile =
*tile,
> +				       const struct xe_migrate_pt_update_ops *ops,
> +				       struct xe_vm_pgtable_update_op *pt_op,
> +				       int num_ops)

[Severity: Low]
Is this type mismatch intentional? The source pt_update_ops->num_ops and
the loop counter j below are both defined as u32, but the helper function
takes int num_ops. This causes a narrowing conversion and a mixed-type
comparison in the loop.

> +{
> +	u32 j, i;
> +
> +	for (j =3D 0; j < num_ops; ++j, ++pt_op) {
> +		for (i =3D 0; i < pt_op->num_entries; i++) {
> +			const struct xe_vm_pgtable_update *update =3D
> +				&pt_op->entries[i];
> +
> +			xe_tile_assert(tile, update);

[Severity: Low]
Does this assertion provide any validation? The update pointer is derived by
taking the address of an array element (&pt_op->entries[i]). This is
mathematically guaranteed to be non-NULL, making the assertion a tautology.

> +			xe_tile_assert(tile, update->pt_bo);
> +			xe_tile_assert(tile, !iosys_map_is_null(&update->pt_bo->vmap));

[Severity: Low]
Can this sequence cause an unintended kernel panic?

If update->pt_bo is NULL, the first assertion will trigger a warning and
execution will continue. The next assertion evaluates &update->pt_bo->vmap
(calculating an offset from NULL, producing an invalid pointer) and passes =
it
to iosys_map_is_null(). This function dereferences the invalid pointer to
check map->is_iomem, which would cause a page fault panic, defeating the
non-fatal nature of xe_tile_assert.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903235842.3401=
722-1-matthew.brost@intel.com?part=3D2
