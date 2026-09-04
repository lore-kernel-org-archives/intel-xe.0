Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF26C61DD3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 02:37:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B71310E07F;
	Fri,  4 Sep 2026 02:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nrW1zP1M";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4957910E07F
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 02:37:25 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2A81E60234;
 Fri,  4 Sep 2026 02:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3881F000E9;
 Fri,  4 Sep 2026 02:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788489443;
 bh=l1TFarXlnXJJAcIkA2a245DNwRempEu7q9RFk/yd9tg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=nrW1zP1M3Tzkj8JuQy+LCs0nUAfClC5uAOck/xUGaXj8CRmdSpZDvPIIKl5ujTQZ8
 fECAVW8u7NpxcIsVAikqhLBaZcKfRhXYBg5uYevk+nacy6+E9LvBX0zXwiiysl9Lkr
 1EpX3Xo0siglzwIXDXoXRRQrZmnaXewQmlaLLnp5r3NIhzdRufh4+vyrD1WZkG4K1y
 wAjzTLh4UcpbZeGUVqV1aMRxnLoFEfhWw067fu1oF7ZdEvCnzxwDgWBmuafid7oieh
 EZHoLHEhdlfkDYO5a6gO2xP/BGBfiLZxQGSnT+MbY5/uHcp/vQpFpindeYOn74O70s
 I5RebY3dHxwKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/25] drm/xe: Add
 xe_migrate_update_pgtables_cpu_execute helper
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904022207.3490018-3-matthew.brost@intel.com>
References: <20260904022207.3490018-1-matthew.brost@intel.com>
 <20260904022207.3490018-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 02:37:23 +0000
Message-Id: <20260904023723.AA3881F000E9@smtp.kernel.org>
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
- [Low] Defective sanity checks and unhandled null pointer dereference in d=
ebug assertions
--

commit e58d5ab50ce62f929a498f3193e4a6ff719f485b
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Add xe_migrate_update_pgtables_cpu_execute helper

This commit adds the xe_migrate_update_pgtables_cpu_execute helper to perfo=
rm
CPU-side page-table updates, supporting CPU binds. It extracts the logic fr=
om
xe_migrate_update_pgtables_cpu and adds basic sanity check assertions on the
function arguments.

Link: https://patch.msgid.link/20260228013501.106680-3-matthew.brost@intel.=
com

> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migr=
ate.c
> index 149c5fa654e67..68a0b05f56ec9 100644
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

[Severity: Low]
Are these assertions operating as intended in
xe_migrate_update_pgtables_cpu_execute?

Because update is assigned the address of an array element, checking update
in xe_tile_assert is a tautology and will always evaluate to true.

Additionally, in the triggering condition where update->pt_bo is actually
NULL, the third assertion passes the address of vmap to iosys_map_is_null.
Since vmap is an offset from NULL, iosys_map_is_null will dereference an
invalid pointer when checking the is_iomem flag. This causes an immediate
kernel page fault rather than allowing the assertion to safely log a warning
and continue execution.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904022207.3490=
018-1-matthew.brost@intel.com?part=3D2
