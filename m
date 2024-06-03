Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2EFC25B78
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 20:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7821310E2F6;
	Mon,  3 Jun 2024 20:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LWjhVKj2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0779B10E2F6
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 20:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717446908; x=1748982908;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7eHa1Yqrt0tDnEDjpPZOHxjMRW6uBYRfUlymNYYsoes=;
 b=LWjhVKj2TzZgLWYgkGpDLFAuAgr+eOyvhSdh3Q5OuY+nwuBQwGRyrwbf
 W7cU4oij4vROODoOQmeNs0JvKnfkpB4XGzapCpS0gr67ux1JeZT9hz1VB
 DdrHLs3yPmbBgQGV4F8pdcE7jyu8cg8MblPs9Z2/vu1qJ80aFgh3Ue/IB
 7aDYfsElZnKYsSuwAddsXYo3NbhPPUYmaQ56itvu15WTt9jkbHkhfyXKO
 vw4h0FMbEeFCN5aLh7JUbVAWbF1rmHoZ93ghOS6mLbWaPBsftWR1xKi6n
 3jrxiUVgvR2IkGHxW3twH8ZVnvUA0Q6m8S0pRwA3L4Sm48MDZ65Qns3LX A==;
X-CSE-ConnectionGUID: 1QEso+fqRmyDCKWaY+esvg==
X-CSE-MsgGUID: H60P/MieQIusV3Rdu46NjA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="25360913"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="25360913"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 13:35:04 -0700
X-CSE-ConnectionGUID: U4Wy/G31QCiqLCmiIDwrpw==
X-CSE-MsgGUID: irNGILlPREeu+8N2UBdNPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="74476013"
Received: from unknown (HELO [10.245.245.174]) ([10.245.245.174])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 13:35:03 -0700
Message-ID: <9b4fb5ec23d737b30b5377d3b00fb59aa572e9fd.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe: flush gtt before signalling user fence on
 all engines
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, intel-xe@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>
Date: Mon, 03 Jun 2024 22:35:00 +0200
In-Reply-To: <Zl4AbmvJs7REtG83@DUT025-TGLU.fm.intel.com>
References: <20240522-xu_flush_vcs_before_ufence-v2-1-9ac3e9af0323@intel.com>
 <e28c1e17fd9a6b7153432ff204ada2102706fb28.camel@linux.intel.com>
 <Zljle1kB6gR51RX4@DUT025-TGLU.fm.intel.com>
 <93ca58d4cbbd37cd93ce82959a8da30efd91307a.camel@linux.intel.com>
 <2f068913-5010-41a6-b24a-2a8057fa8e1c@intel.com>
 <8c242b147e2bebb614ea145ccc1a799423114043.camel@linux.intel.com>
 <Zl4AbmvJs7REtG83@DUT025-TGLU.fm.intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi, Matt.

On Mon, 2024-06-03 at 17:42 +0000, Matthew Brost wrote:
> On Mon, Jun 03, 2024 at 10:47:32AM +0200, Thomas Hellstr=C3=B6m wrote:
> > Hi,
> >=20
> > On Mon, 2024-06-03 at 10:11 +0200, Andrzej Hajda wrote:
> > >=20
> > >=20
> > > On 03.06.2024 09:35, Thomas Hellstr=C3=B6m wrote:
> > > > On Thu, 2024-05-30 at 20:45 +0000, Matthew Brost wrote:
> > > > > On Thu, May 30, 2024 at 01:17:32PM +0200, Thomas Hellstr=C3=B6m
> > > > > wrote:
> > > > > > Hi, All.
> > > > > >=20
> > > > > > I was looking at this patch for drm-xe-fixes but it doesn't
> > > > > > look
> > > > > > correct to me.
> > > > > >=20
> > > > > > First, AFAICT, the "emit flush imm ggtt" means that we're
> > > > > > flushing
> > > > > > outstanding / posted writes, and then write a DW to a ggtt
> > > > > > address,
> > > > > > so
> > > > > > we're not really "flushing gtt"
> > > > > >=20
> > > > > So, is this a bad name? I think I agree. It could have been a
> > > > > holdover
> > > > > from the i915 names. Maybe we should do a cleanup in
> > > > > xe_ring_ops
> > > > > soon?
> > > > >=20
> > > > > Or are you saying that the existing emit_flush_imm_ggtt is
> > > > > not
> > > > > sufficient to ensure all writes from batches are visible? If
> > > > > this
> > > > > were
> > > > > true, I would think we'd have all sorts of problems popping
> > > > > up.
> > > > It was more the title of the patch that says "flush gtt" when I
> > > > think
> > > > it should say "flush writes" or something similar.
> > > >=20
> > > >=20
> > > > > > Second, I don't think we have anything left that explicitly
> > > > > > flushes
> > > > > > the
> > > > > > posted write of the user-fence value?
> > > > > >=20
> > > > > I think this might be true. So there could be a case where we
> > > > > get
> > > > > an
> > > > > IRQ
> > > > > and the user fence value is not yet visible?
> > > > Yes, exactly.
> > > >=20
> > > > > Not an expert ring programming but are instructions to store
> > > > > a
> > > > > dword
> > > > > which make these immediately visible? If so, I think that is
> > > > > what
> > > > > should
> > > > > be used.
> > > > There are various options here, using various variants of
> > > > MI_FLUSH_DW
> > > > and pipe_control, and I'm not sure what would be the most
> > > > performant
> > > > but I think the simplest solution would be to revert the patch
> > > > and
> > > > just
> > > > emit an additional MI_FLUSH_DW as a write barrier before
> > > > emitting
> > > > the
> > > > posted userptr value.
> > >=20
> > > As the patch already landed I have posted fix for it:
> > > https://patchwork.freedesktop.org/series/134354/
> > >=20
> > > Regards
> > > Andrzej
> >=20
> > I'm still concerned about the userptr write happening after the
> > regular
> > seqno write. Let's say the user requests a userptr write to a bo.=20
> >=20
>=20
> I don't think this is a valid concern. User fences should be limited
> to
> LR VMs. We don't enforce this, but I think we should add that
> restriction. It should be okay to do so unless we have UMD using user
> fences in a non-LR VM (which we don't).
>=20
> I'm going to post a patch for this now.
>=20
> > 1) The LRC fence signals.
>=20
> In LR mode, the hw seqno / LRC ires unused. We signal LR jobs fences
> immediately on upon scheduling.
>=20
> > 2) Bo is evicted / userptr invalidated. pages returned to system.
>=20
> In LR mode if a BO is evicted / userptr invalidated either we kick
> jobs
> off the HW via preempt fences or if in faulting we invalidate PPGTT
> mapping which causes a recoverable fault.
>=20
> > 3) The user-fence writes to pages that we no longer own, or causes
> > a
> > fault.
>=20
> Either exceution is resumed via rebind worker with valid mappings or
> upon page fault we create valid mappings.
>=20
> With this, I believe the original patch along wiht upcoming fix [1]
> is
> correct.
>=20
> Matt

While I agree with your analysis that this is not a concern for LR VMs,
I definitely think we need to take a step back here and we should *not*
rush in a fix for a fix that involves changing the uAPI, because if we
have to revert that, things are going to get really messy.

First, I've been holding the original patch back because I think it
isn't correct. And it obviously introduces a security hole with the
ordering change here. I think this patch should be reverted so that we
don't have to add a "fixes for fixes" patch, and I can leave both the
patch and the revert out of the fixes pull.

Restricting user-fences to LR vm's should be a separate discussion.
I've definitely recommended using user-fences for synchronous vm-binds
because of their simplicity, but those are cpu-signaled so a different
story, but if we don't use user-fences for !LR vms, I wonder why does
the first version of the patch attempt to correct the behaviour of
user-fence in the media ring ops? Are we using LR vms with media, or
how was the flaw discovered? In any case, this needs to go the proper
way with uAPI change discussions and UMD acks.

To fix the original issue, couldn't we use something along the lines of
(if I don't misread the MI_FLUSH_DW docs)

	if (job->user_fence.used) {

+		dw[i++] =3D MI_FLUSH_DW; // Utility function for this.
+		dw[i++] =3D 0;
+		dw[i++] =3D 0;
+		dw[i++] =3D 0;

		i =3D emit_store_imm_ppgtt_posted(job->user_fence.addr,
						job->user_fence.value,
						dw, i);
	}

So, in short, from a maintainers POW I'd like to see

1) Revert of the original patch. (drm-xe-next only)
2) Proper fix (drm-xe-next) pulled into drm-xe-fixes.
3) Any change in uapi discussed introduced the proper way.

Thanks,
Thomas

>=20
> [1] https://patchwork.freedesktop.org/series/134354/
>=20
> >=20
> > /Thomas
> >=20
> > >=20
> > > >=20
> > > > >=20
> > > > >=20
> > > > > We should also probably check how downstream i915 did this
> > > > > too.
> > > > >=20
> > > > > > and finally the seqno fence now gets flushed before the
> > > > > > user-
> > > > > > fence.
> > > > > > Perhaps that's not a bad thing, though.
> > > > > >=20
> > > > > I don't think this is an issue, I can't think of a case where
> > > > > this
> > > > > reordering would create a problem.
> > > > >=20
> > > > > Matt
> > > > /Thomas
> > > >=20
> > > > > =C2=A0=20
> > > > > > /Thomas
> > > > > >=20
> > > > > >=20
> > > > > > On Wed, 2024-05-22 at 09:27 +0200, Andrzej Hajda wrote:
> > > > > > > Tests show that user fence signalling requires kind of
> > > > > > > write
> > > > > > > barrier,
> > > > > > > otherwise not all writes performed by the workload will
> > > > > > > be
> > > > > > > available
> > > > > > > to userspace. It is already done for render and compute,
> > > > > > > we
> > > > > > > need
> > > > > > > it
> > > > > > > also for the rest: video, gsc, copy.
> > > > > > >=20
> > > > > > > v2: added gsc and copy engines, added fixes and r-b tags
> > > > > > >=20
> > > > > > > Closes:
> > > > > > > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1488
> > > > > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver
> > > > > > > for
> > > > > > > Intel
> > > > > > > GPUs")
> > > > > > > Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > ---
> > > > > > > Changes in v2:
> > > > > > > - Added fixes and r-b tags
> > > > > > > - Link to v1:
> > > > > > > https://lore.kernel.org/r/20240521-xu_flush_vcs_before_ufence=
-v1-1-ded38b56c8c9@intel.com
> > > > > > > ---
> > > > > > > Matthew,
> > > > > > >=20
> > > > > > > I have extended patch to copy and gsc engines. I have
> > > > > > > kept
> > > > > > > your
> > > > > > > r-b,
> > > > > > > since the change is similar, I hope it is OK.
> > > > > > > ---
> > > > > > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_ring_ops.c | 8 ++++----
> > > > > > > =C2=A0=C2=A01 file changed, 4 insertions(+), 4 deletions(-)
> > > > > > >=20
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > > b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > > index a3ca718456f6..a46a1257a24f 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > > > > > @@ -234,13 +234,13 @@ static void
> > > > > > > __emit_job_gen12_simple(struct
> > > > > > > xe_sched_job *job, struct xe_lrc *lrc
> > > > > > > =C2=A0=20
> > > > > > > =C2=A0=C2=A0	i =3D emit_bb_start(batch_addr, ppgtt_flag, dw,
> > > > > > > i);
> > > > > > > =C2=A0=20
> > > > > > > +	i =3D
> > > > > > > emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc),
> > > > > > > seqno,
> > > > > > > false, dw, i);
> > > > > > > +
> > > > > > > =C2=A0=C2=A0	if (job->user_fence.used)
> > > > > > > =C2=A0=C2=A0		i =3D emit_store_imm_ppgtt_posted(job-
> > > > > > > > user_fence.addr,
> > > > > > > =C2=A0=C2=A0						job-
> > > > > > > > user_fence.value,
> > > > > > > =C2=A0=C2=A0						dw, i);
> > > > > > > =C2=A0=20
> > > > > > > -	i =3D
> > > > > > > emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc),
> > > > > > > seqno,
> > > > > > > false, dw, i);
> > > > > > > -
> > > > > > > =C2=A0=C2=A0	i =3D emit_user_interrupt(dw, i);
> > > > > > > =C2=A0=20
> > > > > > > =C2=A0=C2=A0	xe_gt_assert(gt, i <=3D MAX_JOB_SIZE_DW);
> > > > > > > @@ -293,13 +293,13 @@ static void
> > > > > > > __emit_job_gen12_video(struct
> > > > > > > xe_sched_job *job, struct xe_lrc *lrc,
> > > > > > > =C2=A0=20
> > > > > > > =C2=A0=C2=A0	i =3D emit_bb_start(batch_addr, ppgtt_flag, dw,
> > > > > > > i);
> > > > > > > =C2=A0=20
> > > > > > > +	i =3D
> > > > > > > emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc),
> > > > > > > seqno,
> > > > > > > false, dw, i);
> > > > > > > +
> > > > > > > =C2=A0=C2=A0	if (job->user_fence.used)
> > > > > > > =C2=A0=C2=A0		i =3D emit_store_imm_ppgtt_posted(job-
> > > > > > > > user_fence.addr,
> > > > > > > =C2=A0=C2=A0						job-
> > > > > > > > user_fence.value,
> > > > > > > =C2=A0=C2=A0						dw, i);
> > > > > > > =C2=A0=20
> > > > > > > -	i =3D
> > > > > > > emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc),
> > > > > > > seqno,
> > > > > > > false, dw, i);
> > > > > > > -
> > > > > > > =C2=A0=C2=A0	i =3D emit_user_interrupt(dw, i);
> > > > > > > =C2=A0=20
> > > > > > > =C2=A0=C2=A0	xe_gt_assert(gt, i <=3D MAX_JOB_SIZE_DW);
> > > > > > >=20
> > > > > > > ---
> > > > > > > base-commit: 188ced1e0ff892f0948f20480e2e0122380ae46d
> > > > > > > change-id: 20240521-xu_flush_vcs_before_ufence-
> > > > > > > a7b45d94cf33
> > > > > > >=20
> > > > > > > Best regards,
> > >=20
> >=20

