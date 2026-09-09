Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3662AC79FAD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:52:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA6210F130;
	Wed,  9 Sep 2026 12:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KnBwvzXJ";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5283310F130
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:52:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id CAB5960211;
 Wed,  9 Sep 2026 12:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A941F00A3A;
 Wed,  9 Sep 2026 12:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788958343;
 bh=pn2egXM7SnnVOk7tef6jN4au9/YS1L22DVSMYDijwYw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=KnBwvzXJMTIRxHfJfBNfMiq+Z4wFhrWoIvq1k/Xy0UKxLrCpzhe9ZtiAAP948/cJC
 lvQMHNhLuEzO44rDPLWK9xUewsym5S/WcT7Uc7pYP1anMIlp4gSk9MCARfkEM7ZTQP
 0HmRUgYMNIG64sUx9OZ+lZybHBYwvTWqoovlAKWeiWlBCNVbctXeYh32lIh0ZX6NyS
 12vIEncpCjYljySagdnvG5mXDEiXOO+JwerV+Cx0HLz8P4hVlXrymY/WpEi/ZeDY5d
 Soiu9MamtZGuo1/ttIqmCElxrYQKHYwEWQzUPcnTqlEFaiC9aXONhKdgy1Qo4DqaXq
 /rj1uVbJC74ZQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC v2 11/21] drm/xe/svm: Handle svm vma for acc_ctr trigger
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260909124457.1610890-34-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
 <20260909124457.1610890-34-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 12:52:22 +0000
Message-Id: <20260909125223.56A941F00A3A@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The early graceful bailout for non-migratable ranges on access c=
ounter triggers is unreachable on discrete GPUs, causing an incorrect `-EAC=
CES` error return.
- [Medium] Valid page fault statistics are incorrectly incremented for acce=
ss counter triggers, skewing hardware telemetry.
--

commit 67501dc98da68ff714f7eec618d994bd502ef87c
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: drm/xe/svm: Handle svm vma for acc_ctr trigger

This commit generalizes page fault handling into a range setup function to
support hardware access-counter triggers. It aims to skip page-fault-specif=
ic
bookkeeping and forcefully migrate triggered ranges to device memory if
possible.

> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
[ ... ]
> @@ -1314,7 +1316,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *=
vm, struct xe_vma *vma,
>  	if (IS_ERR(range))
>  		return PTR_ERR(range);
> =20
> -	xe_svm_range_fault_count_stats_incr(gt, range);
> +	if (!acc_ctr_trigger)
> +		xe_svm_range_fault_count_stats_incr(gt, range);

[Severity: Medium]
While this successfully skips the primary page fault stat increment, does it
leave the valid page fault statistics skewed for access counter triggers?

If the range is already valid, __xe_svm_range_setup() evaluates
xe_svm_range_is_valid() and unconditionally increments the valid fault stat:

        if (xe_svm_range_is_valid(range, tile, ctx.devmem_only, dpagemap)) {
                xe_svm_range_valid_fault_count_stats_incr(gt, range);
                range_debug(range, acc_ctr_trigger ? ...
                goto out;
        }

Should xe_svm_range_valid_fault_count_stats_incr() also be guarded by
!acc_ctr_trigger to prevent falsely inflating hardware telemetry during nor=
mal
operation?

> =20
>  	mutex_lock(&range->lock);
> =20
> @@ -1336,6 +1339,10 @@ static int __xe_svm_handle_pagefault(struct xe_vm =
*vm, struct xe_vma *vma,
> =20
>  	range_debug(range, "PAGE FAULT");
> =20
> +	if (acc_ctr_trigger && !range_flags.migrate_devmem) {
> +		goto out;
> +	}
> +

[Severity: Medium]
Will this newly added graceful bailout ever be reached on discrete GPUs?

Because ctx.devmem_only is initialized to (need_vram || acc_ctr_trigger) &&
devmem_possible, it evaluates to true during an access counter trigger on a
discrete GPU.

Earlier in __xe_svm_range_setup(), there is a pre-existing check before
reaching this code block:

        if (ctx.devmem_only && !range_flags.migrate_devmem) {
                err =3D -EACCES;
                goto err_out;
        }

Since both ctx.devmem_only and !range_flags.migrate_devmem are true for
non-migratable ranges during an access counter trigger, the function appears
to immediately return -EACCES. Does this bypass the intended graceful exit
added here, creating dead code and returning an incorrect error instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909124457.1610=
890-23-himal.prasad.ghimiray@intel.com?part=3D11
