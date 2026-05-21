Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1248CD4F3D
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 16:31:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9832010E4C3;
	Thu, 21 May 2026 16:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a24Uog9g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC2310E4C3
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 16:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779381112; x=1810917112;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ZEdv+zQuPWyEES5roOZHnkQVyoK3bDb3xC2rsRqtxGs=;
 b=a24Uog9gsLf+EY8iMm9Vs9ZUJAhBADL5MGA1aPWgps+z/28K41byaaBj
 GMEbb5ZOwrfCQ2rkZjmKh1DAwyBinOlqYQQbQaIFO8WkHHy0a3VpMknZG
 GxPvJj5ufgYgXw9yk3o0nscT4QabhNVO8kta2t2Cl+MxdreQiaYp6XR5n
 xyCfj/GKgmc6bSIduyRwdq4wy5zTniYL2xyVjzOUKwonp7vbmKyzlJC69
 EOYD/VNrjA9Ju8rpRYmgs4SyOuZJsDs57Dv2+RQdIWM+GL8TYryAJ+CJ/
 ntccz+y/w7CzzLPR8XzgtIjra4rPjYOyjUAetPEsvgP/Ja7Sdzj7joitU g==;
X-CSE-ConnectionGUID: JqK/06zMTgCFTeS52kF3eQ==
X-CSE-MsgGUID: ZsRlQxGFTl6b5Gjdvzbd1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80337244"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="80337244"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 09:31:51 -0700
X-CSE-ConnectionGUID: S6Sx9iFVRO6aa7A5LVCqEA==
X-CSE-MsgGUID: u2OcYM/4R3KfLfCU9Exhmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="242373934"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.105])
 ([10.245.244.105])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 09:31:50 -0700
Message-ID: <745c9abdd971c07342a2010e9aac9804605ffeae.camel@linux.intel.com>
Subject: Re: [PATCH 3/4] drm/xe: Restore userspace LRC BOs early on resume
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Francois Dugast	
 <francois.dugast@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Thu, 21 May 2026 18:31:47 +0200
In-Reply-To: <397bc3b9-2e0b-498a-9088-b99521ebb79c@intel.com>
References: <20260521144837.7363-1-thomas.hellstrom@linux.intel.com>
 <20260521144837.7363-4-thomas.hellstrom@linux.intel.com>
 <397bc3b9-2e0b-498a-9088-b99521ebb79c@intel.com>
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

On Thu, 2026-05-21 at 17:09 +0100, Matthew Auld wrote:
> On 21/05/2026 15:48, Thomas Hellstr=C3=B6m wrote:
> > When GuC registers a context (REGISTER_CONTEXT G2H action), the LRC
> > buffer object must already be present in VRAM with valid content.
> > Userspace LRC BOs currently carry XE_BO_FLAG_PINNED_LATE_RESTORE,
> > which
> > defers their restore to xe_bo_restore_late() =E2=80=94 a blitter copy t=
hat
> > runs
> > after xe_gt_resume().=C2=A0 However, xe_gt_resume() itself calls
> > xe_guc_submit_start(), which drives guc_exec_queue_start() ->
> > xe_sched_resubmit_jobs() -> guc_exec_queue_run_job() ->
> > register_exec_queue(), all before xe_bo_restore_late() has had a
> > chance
> > to repopulate the BO.=C2=A0 The result is that GuC reads LRC state from
> > uninitialised VRAM and raises an exception.
>=20
> Hmm, thinking out aloud here, but what stops the hw executing the
> ring=20
> if we can get as far as run_job() this early? Thinking about non-LR,
> can=20
> we not have pending jobs that get re-submitted, before we have had a=20
> chance to restore the bb, page-tables, other user BOs etc, since that
> is=20
> maybe late restore also.

Good point. Need to look at that.

/Thomas

>=20
> >=20
> > Fix this by dropping XE_BO_FLAG_PINNED_LATE_RESTORE from the
> > userspace
> > LRC BO flags.=C2=A0 Without that flag, the BO lands in the
> > pinned.early.kernel_bo_present list and is restored by
> > xe_bo_restore_early() via CPU/BAR copy before xe_gt_resume() is
> > entered.
> > By the time any context registration fires the LRC VRAM is valid.
> >=20
> > xe_bo_create_pin_map_novm() already adds
> > XE_BO_FLAG_NEEDS_CPU_ACCESS and
> > XE_BO_FLAG_PINNED, satisfying the requirements of the CPU copy
> > path.
> > Dropping XE_BO_FLAG_PINNED_LATE_RESTORE also makes
> > force_contiguous()
> > return true for these BOs (PINNED without LATE_RESTORE), which is
> > already
> > required for the GGTT mapping they carry.
> >=20
> > Assisted-by: GitHub_Copilot:claude-sonnet-4.6
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0 drivers/gpu/drm/xe/xe_lrc.c | 2 +-
> > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c
> > b/drivers/gpu/drm/xe/xe_lrc.c
> > index a4292a11391d..c9ea5a3e5365 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -1661,7 +1661,7 @@ static int xe_lrc_init(struct xe_lrc *lrc,
> > struct xe_hw_engine *hwe, struct xe_v
> > =C2=A0=C2=A0		=C2=A0=C2=A0 XE_BO_FLAG_GGTT_INVALIDATE;
> > =C2=A0=20
> > =C2=A0=C2=A0	if ((vm && vm->xef) || init_flags &
> > XE_LRC_CREATE_USER_CTX) /* userspace */
> > -		bo_flags |=3D XE_BO_FLAG_PINNED_LATE_RESTORE |
> > XE_BO_FLAG_FORCE_USER_VRAM;
> > +		bo_flags |=3D XE_BO_FLAG_FORCE_USER_VRAM;
> > =C2=A0=20
> > =C2=A0=C2=A0	bo =3D xe_bo_create_pin_map_novm(xe, tile, bo_size,
> > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_type_kernel=
,
