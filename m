Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE6BC79FAD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:57:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79ED010F134;
	Wed,  9 Sep 2026 12:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bXj3Twrp";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4221810F134
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:57:43 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 855A760219;
 Wed,  9 Sep 2026 12:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FEB71F00A3D;
 Wed,  9 Sep 2026 12:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788958662;
 bh=apW3MmKue8duZzWUhgJQsv03KVR15FeSLcZiDzxACRw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=bXj3TwrpaKr2XbJU26gK9HBaKOH2HpwGDNz0OhYMDChJtQBzU1DRLwEXAEw9iR3Zf
 DqgPlzRxN+iokUzV/BTruiEBPy+pFIXX1iGJC7e6bErqk3YvhytdK6JMsYc2jbWsSH
 H2wLX0uCrXWMalp4eIkH2XtU/+4QCCTOb6qWIi5jJ5dbDYLzl27FCg1aAuW7ydMR+D
 4cBlyu1sNtpbECQRU7SzGv1BpuXX5FmYr0QmzBx7LPfhG/zfmiuNp/cKlkcaVgIfe1
 5O4+VwA61bioPgzrVtQY1V7q240a58qFS6v10ZJoPkB/QH1jYVNvIa5AEmyTQtMaLT
 kLZHHFX5GCjcQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC v2 19/21] drm/xe/svm: Add MIGRATE_ON_ACCESS_COUNTER bind flag
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909124457.1610890-42-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
 <20260909124457.1610890-42-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 12:57:41 +0000
Message-Id: <20260909125742.0FEB71F00A3D@smtp.kernel.org>
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
- [High] The MIGRATE_ON_ACCESS_COUNTER flag unconditionally blocks VRAM mig=
ration on page faults, breaking device atomics and explicit madvise placeme=
nt.
--

commit 4c656fa9adbce2593cc353b10a62bd8a06ad4f02
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe/svm: Add MIGRATE_ON_ACCESS_COUNTER bind flag

This commit introduces a new bind flag allowing userspace to defer
first-touch VRAM migration until an access counter event indicates the
range is hot.

> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index fd42969d9e620..58063b1c97377 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
[ ... ]
> @@ -1381,7 +1384,13 @@ static int __xe_svm_range_setup(struct xe_vm *vm, =
struct xe_vma *vma,
>  	if (acc_ctr_trigger && !range_flags.migrate_devmem)
>  		goto out;
> =20
> +	/*
> +	 * With MIGRATE_ON_ACCESS_COUNTER, defer first placement to access
> +	 * counters: skip the eager migrate on a normal page fault, but still
> +	 * migrate when this setup was itself triggered by an AC event.
> +	 */
>  	if (--migrate_try_count >=3D 0 &&
> +	    (acc_ctr_trigger || !(vma->gpuva.flags & XE_VMA_MIGRATE_ON_ACC)) &&
>  	    xe_svm_range_needs_migrate_to_vram(range, vma, dpagemap)) {
>  		ktime_t migrate_start =3D xe_gt_stats_ktime_get();

[Severity: High]
Does this condition inadvertently block VRAM migration on initial faults
when XE_VMA_MIGRATE_ON_ACC is set, even if device atomics or madvise
require it?

If an application binds a VMA with the new flag and then performs a device
atomic operation (which sets ctx.devmem_only and need_vram to true) or
uses madvise to set a preferred device location (which provides dpagemap),
the page fault handler will reach this check with acc_ctr_trigger set to
false.

Because acc_ctr_trigger is false and the new flag is set, the condition
short-circuits. This skips xe_svm_alloc_vram() entirely in
__xe_svm_range_setup().

The subsequent xe_svm_range_get_pages() call will then fail with -EOPNOTSUPP
because ctx.devmem_only demands VRAM placement that was just bypassed, which
could result in an unresolvable page fault and cause the application to cra=
sh.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909124457.1610=
890-23-himal.prasad.ghimiray@intel.com?part=3D19
