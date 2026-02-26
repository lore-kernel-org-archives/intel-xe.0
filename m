Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290AFFD8FE8
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 17:56:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C601A10E9B9;
	Thu, 26 Feb 2026 17:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jUr21QI6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F96510E9B9
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 17:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772128593; x=1803664593;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5uVCZjlfyqDEZKbj8jHT3C9n6E90drRFuJAMZSlHiWA=;
 b=jUr21QI6g9MOCerRJ0oJr+2MhJRmrxNcGTWKHPiPQDufn5Jw215ZJJLo
 zItLtAkeKLBhOH2eCj0tR6akvZ6NxtxRF/pVP6unuoJUmSx6gqt3afNqh
 84sCFHLIwy1fisu/QG4kTlc9rCa+50yOqZznCXywfpaVR0twCravW1ndR
 HQLZa6W+dmRuQqA6TuVeXMPe0Pk3sXe2GUYYMC/sccCyJXeECv+0aGTM0
 TZrJVLvpREsd8NQ5g7S/g99Wggb2SCqIZC6TefTA6eTJOaDvwYJd/uSNQ
 b7eqGXaFLKF3reQgoOPWH6UazA8gIeACSJblAGTncsulKdNFhFzsf3v4Q g==;
X-CSE-ConnectionGUID: q/zUhFs5S0ymsX027RF2zg==
X-CSE-MsgGUID: 3v72wRnkQgqqzCZXv2hMsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83530779"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="83530779"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 09:56:33 -0800
X-CSE-ConnectionGUID: WbjhNKjzTAWURy2u4aX1SA==
X-CSE-MsgGUID: 61IHxPr+T/iT/h8XUGex4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="221156159"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.215])
 ([10.245.244.215])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 09:56:31 -0800
Message-ID: <980e782fb633f53db3a30594c3c8a893a19b664c.camel@linux.intel.com>
Subject: Re: [PATCH v3 3/3] drm/xe: Move LRC seqno to system memory to avoid
 slow dGPU reads
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, stuart.summers@intel.com, 
 francois.dugast@intel.com, daniele.ceraolospurio@intel.com, 
 michal.wajdeczko@intel.com
Date: Thu, 26 Feb 2026 18:56:29 +0100
In-Reply-To: <aaCCXVt2RTt2uuSq@lstrano-desk.jf.intel.com>
References: <20260218043319.809548-1-matthew.brost@intel.com>
 <20260218043319.809548-4-matthew.brost@intel.com>
 <95ad0e5b8ed775c2a8948a09ebab75c7acfd1a74.camel@linux.intel.com>
 <aaB+uBE28cSkeuBv@lstrano-desk.jf.intel.com>
 <aaCCXVt2RTt2uuSq@lstrano-desk.jf.intel.com>
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

On Thu, 2026-02-26 at 09:26 -0800, Matthew Brost wrote:
> On Thu, Feb 26, 2026 at 09:11:20AM -0800, Matthew Brost wrote:
>=20
> Missed a comment.
>=20
> >=20

8<------------------------

> > > > struct xe_hw_engine *hwe,
> > > > =C2=A0	if (IS_ERR(lrc->bo))
> > > > =C2=A0		return PTR_ERR(lrc->bo);
> > > > =C2=A0
> > > > +	seqno_bo =3D xe_bo_create_pin_map_novm(xe, tile,
> > > > PAGE_SIZE,
> > > > +					=C2=A0=C2=A0=C2=A0=C2=A0
> > > > ttm_bo_type_kernel,
> > > > +					=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_GGTT |
> > > > +					=C2=A0=C2=A0=C2=A0=C2=A0
> > > > XE_BO_FLAG_GGTT_INVALIDATE |
> > > > +					=C2=A0=C2=A0=C2=A0=C2=A0
> > > > XE_BO_FLAG_SYSTEM,
> > > > false);
> > >=20
> > > XE_BO_FLAG_PINNED_NORESTORE?
> > >=20
>=20
> Maybe (?), but this seems dangerous=E2=80=A6 Can=E2=80=99t fences be pend=
ing during
> hibernate? We also check whether a job has started (by looking at the
> start seqno) in the TDR, and if the seqno is in VRAM, nonsensical
> reads
> could confuse those checks. Also consider the case where the fence
> seqno
> is clobbered=E2=80=94we could end up with values in memory that indicate =
the
> next job we run is already signaled.
>=20
> So after typing this out, I actually think the answer is no to this
> flag.
>=20
> Matt

OK, I wasn't sure exactly what happens on suspend / resume with LR
jobs. The !LR jobs are idled AFAIR.

We have an issure registered somewhere with LR Jobs WRT Suspend /
Resume, since if we change the spinner to preemptible in
xe_exec_compute_mode@lr-mode-workload and suspend while it's running it
doesn't complete on resume, even if the VM gets properly preempted
during the VRAM eviction.

But that's ofc beyond this patch.

With the IS_ERR() fix,
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


>=20
> > > Thanks,
> > > Thomas
> > >=20
> > >=20
> > > > +	if (IS_ERR(seqno_bo)) {
> > > > +		err =3D PTR_ERR(lrc->bo);
> > > > +		goto err_lrc_finish;
> > > > +	}
> > > > +	lrc->seqno_bo =3D seqno_bo;
> > > > +
> > > > =C2=A0	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
> > > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 hwe->fence_irq, hwe->name);
> > > > =C2=A0
> > > > diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h
> > > > b/drivers/gpu/drm/xe/xe_lrc_types.h
> > > > index a4373d280c39..5a718f759ed6 100644
> > > > --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> > > > @@ -22,6 +22,12 @@ struct xe_lrc {
> > > > =C2=A0	 */
> > > > =C2=A0	struct xe_bo *bo;
> > > > =C2=A0
> > > > +	/**
> > > > +	 * @seqno_bo: Buffer object (memory) for seqno
> > > > numbers.
> > > > Always in system
> > > > +	 * memory as this a CPU read, GPU write path object.
> > > > +	 */
> > > > +	struct xe_bo *seqno_bo;
> > > > +
> > > > =C2=A0	/** @size: size of the lrc and optional indirect ring
> > > > state
> > > > */
> > > > =C2=A0	u32 size;
> > > > =C2=A0
