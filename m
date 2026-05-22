Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0B8CD5BB0
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 09:51:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B0410E191;
	Fri, 22 May 2026 09:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c2gl8cMc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8160D10E191
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 09:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779443511; x=1810979511;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=X2IxI9klkyy3ecMG3mYrF2RnXCsocrOYRtHXgR/2IqU=;
 b=c2gl8cMc10yHiLd/MfiFXik+4nj1bMeZGLkOKxGmp26CqsjAzpetajwB
 6+xoL9Y6UGrk1kem9b470kA3qkR2sEiCxX+14Q8++TJphYjom7W7KY+Nc
 y7/5R3PB14TG0yg233hwhmhc2zJWgdEduYE217Qk+vUAlWyajnsTlRO7P
 jYrxp2batOqzAD4k0BEZuGTsSzdtHo4WMvdaImS8u4vOdspfgseRpTh5u
 qKEOXUI5hCrhP8BgMztFKvWEiillQQqUxrkNKDuDXrp2CYDqjgM5CC9If
 v9I5FC/8fiXYfDjfcixvuSkQUVX0U9Az6IHVR/qH7dz6p1NdB5p1JQR6o w==;
X-CSE-ConnectionGUID: FOZoRVMTQmGBKxW4B36PKA==
X-CSE-MsgGUID: YWVQgw+PTcuvaxskIc9bhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="103049715"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="103049715"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 02:51:51 -0700
X-CSE-ConnectionGUID: FBPej0PIRaSuvusbofb24A==
X-CSE-MsgGUID: nOuOgoehTWW+tOauzQmmHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="241100346"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.219])
 ([10.245.244.219])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 02:51:48 -0700
Message-ID: <22bda18802acaeeb827d3b34540a0f97c6807d7f.camel@linux.intel.com>
Subject: Re: [PATCH 3/4] drm/xe: Restore userspace LRC BOs early on resume
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Francois Dugast	
 <francois.dugast@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Fri, 22 May 2026 11:51:44 +0200
In-Reply-To: <745c9abdd971c07342a2010e9aac9804605ffeae.camel@linux.intel.com>
References: <20260521144837.7363-1-thomas.hellstrom@linux.intel.com>
 <20260521144837.7363-4-thomas.hellstrom@linux.intel.com>
 <397bc3b9-2e0b-498a-9088-b99521ebb79c@intel.com>
 <745c9abdd971c07342a2010e9aac9804605ffeae.camel@linux.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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

On Thu, 2026-05-21 at 18:31 +0200, Thomas Hellstr=C3=B6m wrote:
> On Thu, 2026-05-21 at 17:09 +0100, Matthew Auld wrote:
> > On 21/05/2026 15:48, Thomas Hellstr=C3=B6m wrote:
> > > When GuC registers a context (REGISTER_CONTEXT G2H action), the
> > > LRC
> > > buffer object must already be present in VRAM with valid content.
> > > Userspace LRC BOs currently carry XE_BO_FLAG_PINNED_LATE_RESTORE,
> > > which
> > > defers their restore to xe_bo_restore_late() =E2=80=94 a blitter copy
> > > that
> > > runs
> > > after xe_gt_resume().=C2=A0 However, xe_gt_resume() itself calls
> > > xe_guc_submit_start(), which drives guc_exec_queue_start() ->
> > > xe_sched_resubmit_jobs() -> guc_exec_queue_run_job() ->
> > > register_exec_queue(), all before xe_bo_restore_late() has had a
> > > chance
> > > to repopulate the BO.=C2=A0 The result is that GuC reads LRC state
> > > from
> > > uninitialised VRAM and raises an exception.
> >=20
> > Hmm, thinking out aloud here, but what stops the hw executing the
> > ring=20
> > if we can get as far as run_job() this early? Thinking about non-
> > LR,
> > can=20
> > we not have pending jobs that get re-submitted, before we have had
> > a=20
> > chance to restore the bb, page-tables, other user BOs etc, since
> > that
> > is=20
> > maybe late restore also.
>=20
> Good point. Need to look at that.

That's actually the case. I figure this might be hit if we use VRAM
page-tables for system BOs.

That case would potentially be fatal for preempt-fence mode as well,
I'll have to respin the fault mode patch to unconditionally suspend the
preempt-fence exec-queues, since with that case we might not see
eviction and hence no preempt-fences firing.

To me a decent fix would be to split up gt resume into two separate
steps. One registers migrate exec-queues and activates migrate
schedulers. Second does the same for user-space.

/Thomas

>=20
> /Thomas
>=20
> >=20
> > >=20
> > > Fix this by dropping XE_BO_FLAG_PINNED_LATE_RESTORE from the
> > > userspace
> > > LRC BO flags.=C2=A0 Without that flag, the BO lands in the
> > > pinned.early.kernel_bo_present list and is restored by
> > > xe_bo_restore_early() via CPU/BAR copy before xe_gt_resume() is
> > > entered.
> > > By the time any context registration fires the LRC VRAM is valid.
> > >=20
> > > xe_bo_create_pin_map_novm() already adds
> > > XE_BO_FLAG_NEEDS_CPU_ACCESS and
> > > XE_BO_FLAG_PINNED, satisfying the requirements of the CPU copy
> > > path.
> > > Dropping XE_BO_FLAG_PINNED_LATE_RESTORE also makes
> > > force_contiguous()
> > > return true for these BOs (PINNED without LATE_RESTORE), which is
> > > already
> > > required for the GGTT mapping they carry.
> > >=20
> > > Assisted-by: GitHub_Copilot:claude-sonnet-4.6
> > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > <thomas.hellstrom@linux.intel.com>
> > > ---
> > > =C2=A0 drivers/gpu/drm/xe/xe_lrc.c | 2 +-
> > > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c
> > > b/drivers/gpu/drm/xe/xe_lrc.c
> > > index a4292a11391d..c9ea5a3e5365 100644
> > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > @@ -1661,7 +1661,7 @@ static int xe_lrc_init(struct xe_lrc *lrc,
> > > struct xe_hw_engine *hwe, struct xe_v
> > > =C2=A0=C2=A0		=C2=A0=C2=A0 XE_BO_FLAG_GGTT_INVALIDATE;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	if ((vm && vm->xef) || init_flags &
> > > XE_LRC_CREATE_USER_CTX) /* userspace */
> > > -		bo_flags |=3D XE_BO_FLAG_PINNED_LATE_RESTORE |
> > > XE_BO_FLAG_FORCE_USER_VRAM;
> > > +		bo_flags |=3D XE_BO_FLAG_FORCE_USER_VRAM;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	bo =3D xe_bo_create_pin_map_novm(xe, tile, bo_size,
> > > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_type_kern=
el,
