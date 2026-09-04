Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF109C61DD3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 00:19:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1880910E0FD;
	Fri,  4 Sep 2026 00:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gNxOwqCl";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CF510E0FD
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 00:19:33 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 78DD04186A;
 Fri,  4 Sep 2026 00:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8F21F000E9;
 Fri,  4 Sep 2026 00:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788481173;
 bh=EYVLihRP5zGKTT5VMm3GWwi1T6+jGt/09GULShhS6Vw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=gNxOwqCl7GxtD00sLw2NUzYyUsna+5pVAmfvbHGSn43Ttp1mkMLpE5nY+sc/Do5lq
 otTyEGQ6W5TVK9O9u6NJoqIgNCprvYnq1LyZSLPgKdBEwb5XdxbyvX+d0++9b5mtME
 ev7XtRGog4KbC1DY4OdN8ChLlBWRlkjvmXSIlk3ZSnHXzVAoGKd39G279MiUCfhX8b
 S3qfnXLkQI5STewQetNsrrRRu9z2YOVfPX3C2GIB2cXp3TQMjgETsGvSSNTypKSV9q
 ttLHWQa+VqqafLV7/7DQJ9y/lrGQMJp0F6oBA5gvNlhp4/qS77WTG2mYehzuKcIMbk
 yG1tqAYQKOYgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 11/25] drm/xe: Store level in struct
 xe_vm_pgtable_update
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903235842.3401722-12-matthew.brost@intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
 <20260903235842.3401722-12-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 00:19:32 +0000
Message-Id: <20260904001933.3A8F21F000E9@smtp.kernel.org>
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

Pre-existing issues:
- [Critical] Silent failure during page-table unbind due to unhandled -ENOM=
EM can lead to GPU Use-After-Free.
--

commit e87f781059d52f2b1352d4dadd77d587b14fe864
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Store level in struct xe_vm_pgtable_update

This commit stores the level directly in struct xe_vm_pgtable_update to
avoid accessing struct xe_pt during bind jobs. This is necessary because
struct xe_pt may no longer be valid in memory when CPU binds are supported
in bind jobs.

Link: https://patch.msgid.link/20260228013501.106680-12-matthew.brost@intel=
.com

> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 4c277153398e6..486de8a46a6a5 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -389,6 +389,7 @@ xe_pt_new_shared(struct xe_walk_update *wupd, struct =
xe_pt *parent,
>  	entry->flags =3D 0;
>  	entry->qwords =3D 0;
>  	entry->pt_bo->update_index =3D -1;
> +	entry->level =3D parent->level;
> =20
>  	if (alloc_entries) {
>  		entry->pt_entries =3D kmalloc_objs(*entry->pt_entries, XE_PDES);

[Severity: Critical]
This is a pre-existing issue, but can this silent failure during page-table
unbind lead to a GPU use-after-free?

When unbind_op_prepare() calls xe_pt_stage_unbind(), the unbind uses
xe_pt_walk_shared() which eventually calls xe_pt_new_shared() with
alloc_entries=3Dtrue. If kmalloc_objs() fails here, -ENOMEM is returned up =
to
xe_pt_walk_shared(), terminating the walk early.

However, xe_pt_stage_unbind() ignores this failure by casting the return
value to (void):

drivers/gpu/drm/xe/xe_pt.c:xe_pt_stage_unbind() {
	...
	(void)xe_pt_walk_shared(&pt->base, pt->level, start, end,
				&xe_walk.base);
	...
}

Because the error is swallowed and a truncated update array is returned, the
unbind only partially unmaps the target VMA. The GPU page table retains val=
id
mappings to memory that is subsequently freed by the CPU.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903235842.3401=
722-1-matthew.brost@intel.com?part=3D11
