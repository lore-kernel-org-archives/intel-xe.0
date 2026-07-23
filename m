Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF085C4453A
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 02:08:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B1110EF70;
	Thu, 23 Jul 2026 02:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nLH/aN80";
	dkim-atps=neutral
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com
 [74.125.224.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3B010EF71
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 02:08:20 +0000 (UTC)
Received: by mail-yx1-f54.google.com with SMTP id
 956f58d0204a3-664c6304683so78326d50.2
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 19:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784772499; cv=none;
 d=google.com; s=arc-20260327;
 b=MSCwPX+bbqxYt20MSpTk4cLCZP6keD7V0cH7QDsC++2Mxm5nEb8yrShXRfI04+LoU3
 N1bxEuZKlE+6t4mQ94eIu/2Zhzv2UapX23ceYWaM99aHryNC4Rbkb4C2MO/oN4JLzSUo
 ZDdM/eZsEGEdmWQ+jIOk+eI85bhn5hVfyrN7KsWRVbsi3JvjE8yMDm8rtykR6fdLLuWv
 SB4yPmdFJahCOVARbnIH6NGbqHLztKbLOn95DzjL0/mvF1OjFJVrb+aEuQGBE14kD0Xb
 0SkM26X6RvKZUUkNvXeboHoZP0WZlH1CsZlD+pyJ/GmiHvJwRV7SNtdEooKqivbU98BV
 xGVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ZTwUiUc6QeJWkURc17v0Dq6cRf5YUlab9hiFz2Xp1Pk=;
 fh=t7QCpgFd0RHU1K1eWsAbzv63VlQeucgXOKE8KVsd2Kc=;
 b=g2zntlDudoJjHTnByHvtEoA0QkBAt1u9bb9/YDed4HiKu0uP8brg5KJK/GTqUgB7NC
 gO/lKmFtXUFsqPnrrYAdW+f+raqfwCReQaNJza4CFbo7ivn21IhxTDixBsdDIY2Sv+ud
 JL266kyP8xwBXRdhQ/NLub+CF2joKsgZdjhBB/PbTHfv7+gV3dAMckYJsgmLLWkiiOXd
 4bTPbH5HyQ5BrbhnfqpTcaSQ8jJtqrDd5rHMo73Aakvio8RYtBkkYQkgBhuh12shlLvj
 CN2j/dm05tUKKHKIlrDDjlYhDt/KzOh6BWuXG7Wnp/YNy6zgtPahG6k86sRIRl0KZ9Qd
 V2Kw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784772499; x=1785377299; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ZTwUiUc6QeJWkURc17v0Dq6cRf5YUlab9hiFz2Xp1Pk=;
 b=nLH/aN80H3UrSXmV1mcmCZgPPvroH37NutC3YHv9Qio9M8PGXB8eUBLSyKQgWWl+BD
 sa2p0N6jCNSM9bZJr4QVZf/uWCczQdoPI0TC/oVZ+ro5DiVTk21C0fo/4mY8jEvHZNFx
 mkab0uuh0HbrB4WBngwtbqsgAVTk8GjCgY/qtcjEUGQRD5uVhsL35FJGUvstf8TsXzLo
 xfaQ5CAxXFY4nxpbcPAKxHflbY7eJ3z0ItfU5uzuQrM3PTQ0VnfT955ku8SZ+epgNTzP
 dgg/hW8d3vuJot3j2QEZiE7gExiCtqrOw6WAUnBU3KMdhGDBbvCa0KT9ZB8NqJ8vzjBW
 yB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784772499; x=1785377299;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZTwUiUc6QeJWkURc17v0Dq6cRf5YUlab9hiFz2Xp1Pk=;
 b=dRF/B9mHAHBh/AKsZEBPa+liEt5sWKopsPJwslXooulXd9X2TiqjzQZhVBovqjwGNG
 ghEifcdwX3XK/GptaDnY6uxi6h6wx6R/erjDXktDr/6Uli9SjwmtioGvXd8Eq+AOBA2b
 4ETIlGGi82Y+pJpyPDvwV+0wrUgLaeS2vWTVV/CWZkgN1njVKDNKLQl9ejk6RlHXBHUG
 0CVBbldfoKbCnAalBU53rjl5GeI3o/9oOUFU/4mGjwl7COCEluDrqUKPzdSZ41PMZAVC
 027HT6a7S+9Gb1gYfO3B6tkxyHLxDA/MPvgrsTbZl3Nnr9uBIsbcFzIoEaMEZcf0OgCi
 rrdA==
X-Gm-Message-State: AOJu0YwDFIadV+IBAZI1reWFAHZSzwq5nMZD/QujUl8mQgojO53QkMN0
 qXeVbrsNcsPR29l9bcp/qp4rH6uksKn0udz5uCLPsfM4NLBEDthNed0/s3OboT2Kva3mgoky5LE
 wXnHM2d0MAlQ1+fBt7VD9YrXzRY1ZxBQ=
X-Gm-Gg: AR+sD12chBsPfpII+6Ts88RBeYtHDmdFSa48jvhn3KJKiuooidPX6z2ihHdXUF9r3lO
 kWrpgwWSqJQkFcQfnsXsniD7spg+x//CuV2E5X15BU9scfyVGLxhc6JLLbWuCyDC9P4VHWxF2Uc
 KE+1nFfSsvBwqRlwuQAnTtxQWjHj7+ySYchw/CLXGGJYAAemPexfMH/0IhQBPqF0+Bi+4wESpXG
 5FUepoziIOPDT8Kb1uStX3b1A2ZjPiNGpqdr1LZ1t34wVOL7Cfi84r9bQ/QZsxsQ9WpmUU8imi7
 S6HbSKOFW+mcC3B2AuIWRniWnlx3RQOJLiTBDNwqkE1XprKcrnOQYddjPvw=
X-Received: by 2002:a05:690e:2411:b0:668:7dbc:38cf with SMTP id
 956f58d0204a3-668a4fadfd8mr206156d50.80.1784772498504; Wed, 22 Jul 2026
 19:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260722004654.744249-1-talesam@gmail.com>
 <20260722004654.744249-4-talesam@gmail.com>
 <amExusdY0Qhs3LIx@gsse-cloud1.jf.intel.com>
 <amE+Ltrb8qKNKWd2@gsse-cloud1.jf.intel.com>
 <CAHBRX4HbDnpiEqgFauZNMWPq+Wtp6RhYYLKMW=zNbTphAB_xgw@mail.gmail.com>
 <amFftEnuIfPJKFPX@gsse-cloud1.jf.intel.com>
In-Reply-To: <amFftEnuIfPJKFPX@gsse-cloud1.jf.intel.com>
From: =?UTF-8?B?VGFsZXMgQS4gTWVuZG9uw6dh?= <talesam@gmail.com>
Date: Wed, 22 Jul 2026 23:08:07 -0300
X-Gm-Features: AUfX_myLY5owzMmm_jS9uGU5QKjsdZXKFnqTxYw1h4Z2teckkfFMeaG9OymchTg
Message-ID: <CAHBRX4G2BH5=DS_KpeZTFON+THsuknh7Us-ZtGQiMbrUHCaTXA@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] drm/xe/guc/ct: Queue G2H worker before flushing it
 in timeout paths
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Matt,

> What about the H2G CT?

Good question - I hadn't sampled it. I've just extended the
instrumentation to record H2G head/tail (both from the shared
descriptor, so it reflects the GuC's own consumption progress) at
timeout time, alongside the existing G2H sampling. That should tell us
whether the GuC hasn't even consumed the invalidation request or has
consumed it and is sitting on the ack. I'll have data from the next
round of testing, together with your series.

> Another thing to look at is getting a devcoredump on a TLB invalidation t=
imeout. [...] It would probably be worthwhile to add something like xe_devc=
oredump_gt(gt) to Xe to help debug hangs that are unrelated to queues or jo=
bs.

That sounds genuinely useful beyond this bug (and
platform-independent). I'd be happy to take a stab at
xe_devcoredump_gt() and hook it to the TLB invalidation timeout path,
if you wouldn't mind reviewing the result.

> That said, as Matt R. mentioned in an earlier patch, we don't officially =
support ARL on Xe, so our bandwidth to help here is limited.

Completely understood - I appreciate the time you've both already put
in. My aim here is mostly to make sure the data lands where it's
useful: for the LNL_FLUSH_* scoping decision (which does affect
supported platforms) and, if the GuC stall is firmware-side, a report
the firmware team can act on whenever ARL support materializes.

Thanks,
Tales

Em qua., 22 de jul. de 2026 =C3=A0s 21:26, Matthew Brost
<matthew.brost@intel.com> escreveu:
>
> On Wed, Jul 22, 2026 at 08:28:54PM -0300, Tales A. Mendon=C3=A7a wrote:
> > Hi Matt,
> >
> > Thanks for the detailed look - and you're right about the framing.
> > Later instrumentation on this system (sampling G2H CTB head/tail in
> > the TDR *before* the flush) refuted the lost-wakeup theory from my
> > commit message: in every observed timeout (30+ events across two ARL
> > machines, 7d51 and 7dd1) the CTB is empty at timeout time (head =3D=3D
>
> What about the H2G CT?
>
> > tail, 0 pending dwords), and the ack lands 5-475ms (median ~22ms)
> > later via the normal path. So the flush recovers nothing - the ack
> > simply hasn't been posted yet by the GuC at that point. The stall
> > appears to be firmware-side (GuC 70.53.0); I'm preparing a report with
> > the full data.
> >
> > That also means I agree with dropping this patch, and the data is
> > consistent with your suspicion that LNL_FLUSH_WORK papers over nothing
> > here.
> >
> > I'll test your series from
> > https://patchwork.freedesktop.org/series/170939/ on both ARL machines
> > (daily-driver workloads that reproduce the timeouts at ~1.5/h) and
> > report back.
> >
>
> Another thing to look at is getting a devcoredump on a TLB invalidation
> timeout. I thought we supported xe_devcoredump() without a queue or job,
> but I guess we never got around to doing that. If we had the CT state
> and GuC log, that would at least give us some hints about what is going
> on. It would probably be worthwhile to add something like
> xe_devcoredump_gt(gt) to Xe to help debug hangs that are unrelated to
> queues or jobs.
>
> That said, as Matt R. mentioned in an earlier patch, we don't officially
> support ARL on Xe, so our bandwidth to help here is limited. In other
> words, if you're hitting a platform-unsupported-specific bug, we may or
> may not be able to investigate it.
>
> Matt
>
> >  Thanks,
> >  Tales
> >
> > Em qua., 22 de jul. de 2026 =C3=A0s 19:03, Matthew Brost
> > <matthew.brost@intel.com> escreveu:
> > >
> > > On Wed, Jul 22, 2026 at 02:10:18PM -0700, Matthew Brost wrote:
> > > > On Tue, Jul 21, 2026 at 09:46:53PM -0300, Tales A. Mendon=C3=A7a wr=
ote:
> > > > > Timeout-recovery paths flush the G2H worker to pick up a response=
 that
> > > > > may have been posted by the GuC but not yet processed:
> > > > >
> > > > >  - guc_ct_send_recv() after the 1s wait for a G2H response fails
> > > > >  - the TLB invalidation backend's .flush() hook, called by
> > > > >    xe_tlb_inval_fence_timeout() before declaring a fence timed ou=
t
> > > > >
> > > > > However flush_work() on a work item that is neither queued nor ru=
nning
> > > > > is a no-op. If the GUC2HOST interrupt for the response was lost o=
r
> > > >
> > > > GUC2HOST messages getting lost are a different issue and would be
> > > > catastrophic for a variety of reasons. I'd like to dig into that if=
 it
> > > > occurs on a POR platform (i.e., LNL+).
> > > >
> > > > > coalesced, the G2H worker was never queued: the flush does not re=
ad the
> > > > > G2H CTB and the response sits there unprocessed until an unrelate=
d G2H
> > > > > interrupt arrives. For TLB invalidations this results in
> > > > >
> > > > >   TLB invalidation fence timeout, seqno=3DN recv=3DN-1
> > > > >
> > > > > with the fence force-signalled with -ETIME even though the ack ma=
y
> > > > > already be present in the CTB. Observed sporadically on ARL-H und=
er CPU
> > > > > load, always with recv =3D=3D seqno - 1 and self-recovering on th=
e next G2H
> > > > > interrupt, which is consistent with a lost wakeup rather than a
> > > > > GuC-side failure.
> > > > >
> > > > > Add xe_guc_ct_flush_g2h(), which queues the worker before flushin=
g it,
> > > > > guaranteeing the flush always drains the CTB, and use it in both
> > > > > timeout paths. A spurious worker run is safe: g2h_read() returns =
no
> > > > > data under fast_lock, and receive_g2h() copes with runtime-PM sta=
te and
> > > > > disabled CT communication.
> > > > >
> > > > > After this change the fence-timeout error only fires when the ack=
 is
> > > > > genuinely absent from the CTB, making the message a reliable indi=
cator
> > > > > of a GuC-side stall.
> > > > >
> > > > > Signed-off-by: Tales A. Mendon=C3=A7a <talesam@gmail.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_guc_ct.c        | 23 +++++++++++++++++++++=
+-
> > > > >  drivers/gpu/drm/xe/xe_guc_ct.h        |  1 +
> > > > >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c |  2 +-
> > > > >  3 files changed, 24 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/=
xe_guc_ct.c
> > > > > index fe70c0fd85c..11a05c2b8c7 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > > @@ -1377,7 +1377,7 @@ static int guc_ct_send_recv(struct xe_guc_c=
t *ct, const u32 *action, u32 len,
> > > > >  wait_again:
> > > > >     ret =3D wait_event_timeout(ct->g2h_fence_wq, READ_ONCE(g2h_fe=
nce.done), HZ);
> > > > >     if (!ret) {
> > > > > -           LNL_FLUSH_WORK(&ct->g2h_worker);
> > > > > +           xe_guc_ct_flush_g2h(ct);
> > > > >             if (READ_ONCE(g2h_fence.done)) {
> > > > >                     xe_gt_warn(gt, "G2H fence %u, action %04x, do=
ne\n",
> > > > >                                g2h_fence.seqno, action[0]);
> > > > > @@ -2046,6 +2046,27 @@ static void g2h_worker_func(struct work_st=
ruct *w)
> > > > >     receive_g2h(ct);
> > > > >  }
> > > > >
> > > > > +/**
> > > > > + * xe_guc_ct_flush_g2h() - Force processing of pending G2H messa=
ges
> > > > > + * @ct: GuC CT object
> > > > > + *
> > > > > + * The GUC2HOST interrupt for a G2H message may be lost or coale=
sced. When
> > > > > + * that happens the G2H worker is never queued and flushing it i=
s a no-op
> > > > > + * that does not read the G2H CTB, leaving messages the GuC has =
already
> > > > > + * posted unprocessed until the next interrupt arrives. Queue th=
e worker
> > > > > + * before flushing it so the flush always drains the G2H CTB. A =
spurious
> > > > > + * worker run is safe: it returns without side effects if the CT=
B is empty
> > > > > + * or CT communication is disabled.
> > > > > + */
> > > > > +void xe_guc_ct_flush_g2h(struct xe_guc_ct *ct)
> > > > > +{
> > > > > +   if (!xe_guc_ct_enabled(ct))
> > > > > +           return;
> > > > > +
> > > > > +   queue_work(ct->g2h_wq, &ct->g2h_worker);
> > > >
> > > > If the original queued work gets lost or is never submitted, then t=
here
> > > > is a bug somewhere else in the kernel, as mentioned above.
> > > >
> > > > As for the flush part, yes, it's possible that this could take a wh=
ile
> > > > if the scheduler goes out to lunch, but it shouldn't happen with a
> > > > sufficiently large timeout. Have you tried making the GuC CT worker=
 high
> > > > priority? We could also consider making the G2H handlers RT once th=
ose
> > > > land upstream.
> > > >
> > > > In general, I'm quite unhappy with the existing LNL_FLUSH_WORK, and=
 we
> > > > never determined the root cause of the original issue. In retrospec=
t, we
> > > > probably should never have merged that code. Looking at it now, the=
 LNL
> > > > flush code isn't even scoped to LNL, which makes this even worse th=
an I
> > > > initially thought, as it can paper over bugs. I'm going to post a p=
atch
> > > > to scope the existing workaround to LNL and earlier platforms (or m=
aybe
> > > > just removing it completely) and see what happens in our CI over th=
e
> > > > next several months before it makes its way into a kernel release.
> > > >
> > > > With that said, the patch as proposed is a no from me. If you want =
to
> > > > pursue my suggestion of scoping this change to LNL and earlier
> > > > platforms, we can discuss that separately.
> > >
> > > This is roughly what I had in mind:
> > >
> > > https://patchwork.freedesktop.org/series/170939/
> > >
> > > Compile tested only, so if you could give it try and see what pops up=
, I
> > > think that would be helpful. Fell free to use the code in anyway and
> > > give me feedback.
> > >
> > > Matt
> > >
> > > >
> > > > Matt
> > > >
> > > > > +   flush_work(&ct->g2h_worker);
> > > > > +}
> > > > > +
> > > > >  static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct x=
e_guc_ct *ct, bool atomic,
> > > > >                                                     bool want_ctb=
)
> > > > >  {
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/=
xe_guc_ct.h
> > > > > index 767365a33de..4e0338953f1 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > > > > @@ -22,6 +22,7 @@ void xe_guc_ct_runtime_suspend(struct xe_guc_ct=
 *ct);
> > > > >  void xe_guc_ct_stop(struct xe_guc_ct *ct);
> > > > >  void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
> > > > >  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> > > > > +void xe_guc_ct_flush_g2h(struct xe_guc_ct *ct);
> > > > >
> > > > >  struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_=
guc_ct *ct);
> > > > >  void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapsho=
t, struct drm_printer *p);
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/=
drm/xe/xe_guc_tlb_inval.c
> > > > > index 046d0655122..91960dc4ba9 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > > @@ -327,7 +327,7 @@ static void tlb_inval_flush(struct xe_tlb_inv=
al *tlb_inval)
> > > > >  {
> > > > >     struct xe_guc *guc =3D tlb_inval->private;
> > > > >
> > > > > -   LNL_FLUSH_WORK(&guc->ct.g2h_worker);
> > > > > +   xe_guc_ct_flush_g2h(&guc->ct);
> > > > >  }
> > > > >
> > > > >  static long tlb_inval_timeout_delay(struct xe_tlb_inval *tlb_inv=
al)
> > > > > --
> > > > > 2.55.0
> > > > >
> >
> >
> >
> > --
> > Com os cumprimentos,
> >
> > Tales A. Mendon=C3=A7a
> > talesam.org
> > communitybig.org



--=20
Com os cumprimentos,

Tales A. Mendon=C3=A7a
talesam.org
communitybig.org
