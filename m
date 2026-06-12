Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F7ACD4F2C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 07:30:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D5510E2C9;
	Fri, 12 Jun 2026 07:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X9oZ4eXB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D982F10E2C9
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 07:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781249412; x=1812785412;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zA7dxqPw8oBYeChj0N56mKoPj7+d4jkgjfC+4Lj+Iwo=;
 b=X9oZ4eXBUKofa4UI3LECn0CnqEKRGoxc9hjGGnAqTAmInaxnzbm1vhJP
 8WA0JDt/6EMc+YdbmTPF6I4MjanQH4O4yKIPPmrNHxxRcXByfF6fKF9Vq
 gdzGyp0nHJ8TuORMTV116fAxfpRCfESkfRfr4oAplpDNWpmkKjHguHT25
 L4J6oMTR3ihWTiuuODU/9VP5vxLquhs1fo1D+SKoT/f00lGYkDBY0RTl/
 nJk0yq4h6ZAwbOquFoeML2xK9wrhcxITteADRBZAXmhe+6S1NFc0t5GFc
 Uu0elppaA5sXNPpZVlUSAuIeNg8cXCPjslqnuwSUApjx/G06iFnkC9akJ g==;
X-CSE-ConnectionGUID: yIpBwYdnQoee+as0DvUzuA==
X-CSE-MsgGUID: XuGPJwESSD6J+3oKoK/RuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85707351"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="85707351"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 00:30:11 -0700
X-CSE-ConnectionGUID: pCD3TQmeTkOULbFrRXuMwQ==
X-CSE-MsgGUID: irnM2sCRQTGcqGhw3dONcA==
X-ExtLoop1: 1
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.245.68])
 ([10.245.245.68])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 00:30:09 -0700
Message-ID: <74394f149197a849fccac334f1c46ade81175566.camel@linux.intel.com>
Subject: Re: [PATCH v3 3/5] drm/xe/guc: Add suspend refcount to exec queue ops
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Francois Dugast
 <francois.dugast@intel.com>,  Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>
Date: Fri, 12 Jun 2026 09:30:06 +0200
In-Reply-To: <aiuE99Kwu7Y3EqNw@nvishwa1-desk>
References: <20260525133051.91636-1-thomas.hellstrom@linux.intel.com>
 <20260525133051.91636-4-thomas.hellstrom@linux.intel.com>
 <ain9HQbDMBOqUt1o@gsse-cloud1.jf.intel.com>
 <aiuE99Kwu7Y3EqNw@nvishwa1-desk>
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

Hi, Niranjana. Thanks for revieiwing.

On Thu, 2026-06-11 at 21:03 -0700, Niranjana Vishwanathapura wrote:
> On Wed, Jun 10, 2026 at 05:11:09PM -0700, Matthew Brost wrote:
> > On Mon, May 25, 2026 at 03:30:49PM +0200, Thomas Hellstr=C3=B6m wrote:
> > > Concurrent call sites that suspend exec queues (PM, mode
> > > switching,
> > > preempt fences) each need to pair their own suspend/resume
> > > without
> > > caring about other callers. Without coordination, a resume from
> > > one
> > > path can prematurely re-enable a queue still suspended by
> > > another.
> > >=20
> > > Add a reference count to exec queue suspend operations. A queue
> > > remains
> > > suspended as long as any caller holds a suspend; it resumes only
> > > when
> > > the last caller releases it. Each caller simply pairs its own
> > > suspend
> > > with a resume without needing to know about others.
> > >=20
> >=20
> > +Niranjana
> >=20
> > The patch LGTM; however, this is likely to collide with
> > conceptually
> > similar WIP work from Niranjana [1] for multi-q suspend. I wonder
> > if
> > your patch and his could combine ideas so that his solution is
> > congruent
> > with what this patch is doing. I=E2=80=99ll also reply to [1] suggestin=
g
> > that he
> > take a look at this and perhaps rebase on top of it.
> >=20
> > Matt
> >=20
> > [1] https://patchwork.freedesktop.org/series/168035/
> >=20
>=20
> Thanks. Yes, it really helps with multi-queue supspend as we can
> piggy
> back on the suspend_count of this patch and no separate counter or
> status flag required.
>=20
> Can we fast track this patch?
>=20
> I also have couple comments below.
>=20
> > > Assisted-by: GitHub_Copilot:claude-sonnet-4.6
> > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > <thomas.hellstrom@linux.intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |=C2=A0 7 ++++++
> > > =C2=A0drivers/gpu/drm/xe/xe_guc_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 24 ++++++++++++--
> > > ------
> > > =C2=A02 files changed, 22 insertions(+), 9 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > > b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > > index e5e53b421f29..1207d51cf770 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > > @@ -49,6 +49,13 @@ struct xe_guc_exec_queue {
> > > =C2=A0	wait_queue_head_t suspend_wait;
> > > =C2=A0	/** @suspend_pending: a suspend of the exec_queue is
> > > pending */
> > > =C2=A0	bool suspend_pending;
> > > +	/**
> > > +	 * @suspend_count: Reference count of active suspend
> > > requests. The
> > > +	 * exec_queue remains suspended while this is non-zero,
> > > allowing
> > > +	 * multiple concurrent callers to independently hold a
> > > suspend without
> > > +	 * prematurely re-enabling the queue. Protected by
> > > @sched.msg_lock.
> > > +	 */
> > > +	int suspend_count;
> > > =C2=A0	/**
> > > =C2=A0	 * @needs_cleanup: Needs a cleanup message during VF
> > > post migration
> > > =C2=A0	 * recovery.
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index f1a6f13011b5..7800a9d1d377 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -2131,15 +2131,18 @@ static int
> > > guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
> > >=20
> > > =C2=A0static int guc_exec_queue_suspend(struct xe_exec_queue *q)
> > > =C2=A0{
> > > -	struct xe_gpu_scheduler *sched =3D &q->guc->sched;
> > > -	struct xe_sched_msg *msg =3D q->guc->static_msgs +
> > > STATIC_MSG_SUSPEND;
> > > +	struct xe_guc_exec_queue *ge =3D q->guc;
> > > +	struct xe_gpu_scheduler *sched =3D &ge->sched;
> > > +	struct xe_sched_msg *msg =3D ge->static_msgs +
> > > STATIC_MSG_SUSPEND;
> > >=20
> > > =C2=A0	if (exec_queue_killed_or_banned_or_wedged(q))
> > > =C2=A0		return -EINVAL;
> > >=20
> > > =C2=A0	xe_sched_msg_lock(sched);
> > > -	if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
> > > -		q->guc->suspend_pending =3D true;
> > > +	if (++ge->suspend_count =3D=3D 1) {
> > > +		if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
> > > +			ge->suspend_pending =3D true;
> > > +	}
>=20
> Bit confusing as it appears that the case of
> guc_exec_queue_try_add_msg()
> returning false is not handled properly (though it is). May be add a
> comment clarifying it or add an assert that
> guc_exec_queue_try_add_msg()
> always returns true here.

If I understand you correctly, since we're now introducing a refcount
then msg->link should always be empty. Yeah I agree that should be the
case and then an assert would make reading the code simpler. Agreed.

>=20
> > > =C2=A0	xe_sched_msg_unlock(sched);
> > >=20
> > > =C2=A0	return 0;
> > > @@ -2190,14 +2193,17 @@ static int
> > > guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> > >=20
> > > =C2=A0static void guc_exec_queue_resume(struct xe_exec_queue *q)
> > > =C2=A0{
> > > -	struct xe_gpu_scheduler *sched =3D &q->guc->sched;
> > > -	struct xe_sched_msg *msg =3D q->guc->static_msgs +
> > > STATIC_MSG_RESUME;
> > > +	struct xe_guc_exec_queue *ge =3D q->guc;
> > > +	struct xe_gpu_scheduler *sched =3D &ge->sched;
> > > +	struct xe_sched_msg *msg =3D ge->static_msgs +
> > > STATIC_MSG_RESUME;
> > > =C2=A0	struct xe_guc *guc =3D exec_queue_to_guc(q);
> > >=20
> > > -	xe_gt_assert(guc_to_gt(guc), !q->guc->suspend_pending);
> > > -
> > > =C2=A0	xe_sched_msg_lock(sched);
> > > -	guc_exec_queue_try_add_msg(q, msg, RESUME);
> > > +	xe_gt_assert(guc_to_gt(guc), ge->suspend_count > 0);
> > > +	if (--ge->suspend_count =3D=3D 0) {
> > > +		xe_gt_assert(guc_to_gt(guc), !ge-
> > > >suspend_pending);
>=20
> So, if the intended usecase is for user to always wait for
> suspend_wait()
> before calling resume, may be we should have this assert always here
> instead of only when suspend_count reaches 0?

Definitely.

Although I'm totally for making the caller being able to call this
function without waiting for suspend first (I figure then the wait
needs to happen in this call). But that's IMO for a separatate patch

For this patch we should keep the assert where it was.

Thanks,
Thomas



>=20
> Niranjana
>=20
> > > +		guc_exec_queue_try_add_msg(q, msg, RESUME);
> > > +	}
> > > =C2=A0	xe_sched_msg_unlock(sched);
> > > =C2=A0}
> > >=20
> > > --
> > > 2.54.0
> > >=20
