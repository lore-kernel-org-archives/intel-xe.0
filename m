Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A97BC61DD3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 02:48:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC0110E0EC;
	Fri,  4 Sep 2026 02:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jxGWUAHX";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0805610E0EC
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 02:48:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 50A5360A6B;
 Fri,  4 Sep 2026 02:48:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB44B1F00A3F;
 Fri,  4 Sep 2026 02:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788490113;
 bh=yTt3FC1eksqWYQrQrPgOaCG9khrPmsaFzBCAtt2J50I=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=jxGWUAHX/Tr7fQn4G8bNTgiCvtYIA35nJaUe2qrfmRQu6xIQSS9CtZyo73c2p7Dq2
 CpX0ZvEKHSYFu2auCFG780CyOvvc0JElAacX/8LkF6I8sf6XidVZqwGOmYlC6PY7Mg
 MEVvxPWSjRfWqXqDb6eNrT7Juj2EPD1OBlIzlL65mZ1pIOONIMUF/8gZSuieTwuhMq
 Oq6lwvD5d2Jhg5xDzF5yXpHSbuLDZbCPQT0iK24278i9lCMEAVyNSXeDM5jY8ryQB4
 xRc9EpVBjAedexuPwTkSEvI28TsMaUikj/OHjI/fcQYiW12JTtFz+r9SeWQ0kUJvpQ
 QywXl12rm/vOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/25] drm/xe: Add struct xe_pt_job_ops
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904022207.3490018-10-matthew.brost@intel.com>
References: <20260904022207.3490018-1-matthew.brost@intel.com>
 <20260904022207.3490018-10-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 02:48:32 +0000
Message-Id: <20260904024832.DB44B1F00A3F@smtp.kernel.org>
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
- [Critical] Ignored return value of xe_pt_walk_shared() in xe_pt_stage_unb=
ind() can cause partial unbinds leading to device memory Use-After-Free.
--

commit becaaccdc6df0bb083fdb6279921f5ee714da885
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Add struct xe_pt_job_ops

Add struct xe_pt_job_ops, a dynamically refcounted object that contains
the information required to issue a CPU bind via a job after the initial
bind IOCTL returns.

Link: https://patch.msgid.link/20260228013501.106680-10-matthew.brost@intel=
.com

> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index e560f167fdf1b..30127ebf1b605 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c

[ ... ]

> @@ -2081,13 +2094,13 @@ xe_pt_commit_prepare_unbind(struct xe_vma *vma,

[Severity: Critical]
This is a pre-existing issue, but is it safe to ignore the return value of
xe_pt_walk_shared() in xe_pt_stage_unbind() just above this diff?

If memory allocation fails during VMA unbind, the page table walk is
prematurely aborted. The function casts the error to (void) and returns the
count of successfully processed entries:

drivers/gpu/drm/xe/xe_pt.c:xe_pt_stage_unbind() {
    ...
	(void)xe_pt_walk_shared(&pt->base, pt->level, start, end,
				&xe_walk.base);
    ...
}

If the caller proceeds to unbind only that subset of PTEs, does this allow
the physical memory backing the VMA to be freed and reallocated to another
process while the GPU retains a valid PTE mapping to it?

If an unprivileged user triggers this by allocating and unmapping memory
while intentionally applying memory pressure to force an allocation failure,
can this result in a use-after-free and memory corruption?

>  static struct xe_vm_pgtable_update_op *
>  to_pt_op(struct xe_vm_pgtable_update_ops *pt_update_ops, u32 op_idx)
>  {
> -	return &pt_update_ops->ops[op_idx];
> +	return &pt_update_ops->pt_job_ops->ops[op_idx];
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904022207.3490=
018-1-matthew.brost@intel.com?part=3D9
