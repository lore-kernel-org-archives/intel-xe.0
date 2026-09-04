Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AB9C624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:37:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E505510E199;
	Fri,  4 Sep 2026 21:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PVE9ZZbM";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE87510E199
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:37:01 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0042B60A7A;
 Fri,  4 Sep 2026 21:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D5B31F00A3D;
 Fri,  4 Sep 2026 21:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788557820;
 bh=o3GxsEmIcGURZ4141bY2ifLwQdEEHCuwQ6HG4OqM4UQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=PVE9ZZbM1W+ICuWeK8tXt2bNltBz2FsPJAtP2z94zVgO9UMjbCtZcNHlgNdqBHtgd
 +wd9oiPZOuOLsvBYNm9Ij7UlQffZ1VTkBQwL4pnWDgfiVEjo2x3+8NpM/y/aFO6xRQ
 +gReuGPB0AV1kCRzh0GCzkwCL5Aoa2BcSBmoLCUvpi4CYoezm2dVOKbl8qB94gaYGe
 HZrMdEjrmsTsOk+6WeaEfKXlQzZhApLna4KbmtAHwAhMhak8Kk1YYk/vYZ7VapTxSV
 ouikPQ0IfHM4NFwv/aytKl4y+EU6tHPE0y7j6D+esE6m2IB/jvm6kuzLYJnPw0YgGy
 KEM8/ZSinuHuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/24] drm/xe: Update scheduler job layer to support
 PT jobs
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260904211613.3934307-8-matthew.brost@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-8-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 21:37:00 +0000
Message-Id: <20260904213700.8D5B31F00A3D@smtp.kernel.org>
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
- [Critical] PT jobs consume the TLB flush seqno without executing a hardwa=
re TLB flush, potentially causing subsequent GPU jobs to run with stale pag=
e tables.
--

commit 3d489d315c4f278dad409a11a04984a2139095c2
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: Update scheduler job layer to support PT jobs

Update the scheduler job layer to support PT jobs which execute entirely
on the CPU without requiring LRC fences or a batch address. Repurpose
LRC fence storage for PT-job arguments.

Link: https://patch.msgid.link/20260228013501.106680-8-matthew.brost@intel.=
com

> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sc=
hed_job.c
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
[ ... ]
> @@ -266,6 +293,9 @@ void xe_sched_job_arm(struct xe_sched_job *job)
>  		job->ring_ops_flush_tlb =3D true;
>  	}
> =20
> +	if (job->is_pt_job)
> +		goto arm;
> +
>  	/* Arm the pre-allocated fences */
>  	for (i =3D 0; i < q->width; prev =3D fence, ++i) {

[Severity: Critical]
Will this cause subsequent GPU jobs to run with stale page tables?

Looking at xe_sched_job_arm() in drivers/gpu/drm/xe/xe_sched_job.c, the code
just above this addition checks if a TLB flush is needed and updates
q->tlb_flush_seqno:

        if (vm && !xe_sched_job_is_migration(q) && !xe_vm_in_lr_mode(vm) &&
            (vm->batch_invalidate_tlb || vm->tlb_flush_seqno !=3D q->tlb_fl=
ush_seqno)) {
                xe_vm_assert_held(vm);
                q->tlb_flush_seqno =3D vm->tlb_flush_seqno;
                job->ring_ops_flush_tlb =3D true;
        }

If the current job is a PT job, the new check jumps to the arm label,
skipping the hardware ring submission where the flush would normally execut=
e.
Because q->tlb_flush_seqno was already updated, when a subsequent GPU paylo=
ad
job is submitted to this same queue, it will see the seqnos match and skip
flushing. This could allow the GPU to access memory using a stale TLB.

Should the job->is_pt_job check precede the TLB invalidation check to preve=
nt
the CPU-only PT job from stealing the flush notification?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904211613.3934=
307-1-matthew.brost@intel.com?part=3D7
