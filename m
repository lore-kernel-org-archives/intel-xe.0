Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B33C982ED
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 18:10:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D1A10E197;
	Mon, 21 Sep 2026 18:10:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HkqQshm4";
	dkim-atps=neutral
Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com
 [74.125.224.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95DD10E1CF
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 18:10:18 +0000 (UTC)
Received: by mail-yx2-f13.google.com with SMTP id
 956f58d0204a3-66e4ab20f4bso3424545d50.0
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 11:10:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790014218; cv=none;
 d=google.com; s=arc-20260327;
 b=FtFjlWvteub4qdAZBTa0PpLq5uGgu2SPzObfvZHP1vqSYMeSHgRXGKX6C7CPoBrasN
 KkBq+0XTuA3D+AZ7YcQYnjGImBNN6cpjtXNhO7LtJ6RptwmbxBVKlTYB/gDIzWPlkog9
 Jlo+x2PvHe6oqKe6IN+nh5D/tH5Y4oFluyuKNQYbNaxwgJK+gDm98c+vG2qYbdLMhftj
 CWZFgsI964EZHycwBmXsBZhyjDwpAC4t4R5tE2Qx0Jl1Pb1p9epJvaRl8mxarBcnYaB5
 n0ndp+Jn/kM5XeSpbnWlAOTfWpwe3c/ZfnTGyRC1ejUJYPqnp/Xkp/qQWUEXgeL13vQ7
 VkRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=McnccCqdTKdE5l98Nw/AhwYUV3SO2JkPjhats+z4fEM=;
 fh=/oe6XVzzJWJTH1XBcpaK4Yrtk3Moj7rEq3xAprf0tR0=;
 b=E91GnZ8o/daY569c2uq8v/SLK9rsfZvpKrfnlzjovbujOsSiujRDecLPQucw6buWDq
 SdDO99uqyymfrpSTwnMSNKD+6kYKWXxp5VVM8T+VnebrD/Yb+ZA7SGyBxfdLh8TX4wUL
 M63kRAsQNlo/nAW309pzIFarxi8wuKly6Ambf3g6tKoJMh7M+vCBxY7fnky8tzRTLl1N
 DtV4KJN918FA2mQRgloMUJkbkEmDexlbA8NCHmoVtaW0N1x15dAobOE8SeA8huGBBSu2
 gqaJTZ6tMI3Il5j2HyOFAkn0sCiUzLb14GJHcrP8I0HG3wuyNN8SEJAKyDKi6yIJxFtd
 IRsQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790014217; x=1790619017; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=McnccCqdTKdE5l98Nw/AhwYUV3SO2JkPjhats+z4fEM=;
 b=HkqQshm4sZENKWMBbIFULHndYgA4xSRXsB7CoMb1+G44vVP1KU6IICCRYIg4DLcwoO
 oVxZKF/s27RVTPqeDXk3rc4UN5uwjMek7YUL8fDzdvpz0a2LrDKT2cdODjqDYde50DDC
 Y/cgGwerrXGwVV+0ZTkLJNGG9C4krnpAkhjHQclLX/yJTvmQdAhWwyJp6Nb64R9Sj1Hp
 PgGijS+DHYxnusQ8HIRktVNgbqvPryNXKpg6+ivBGGI8SC8tXUqYwDkjTDmHq0Quq2qz
 4A+1WErW2XqqYkxugeP2aR1ZAbfyp8+YmqJD0ZESXlUVZ8KF1dEDlIZkHQx0bnptpxc2
 IUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790014217; x=1790619017;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=McnccCqdTKdE5l98Nw/AhwYUV3SO2JkPjhats+z4fEM=;
 b=rOonPSBcOAkBNoqoAWqMQHcGHuPzMRbUBxcGRZEyt31tOELt1ZIKv1MgUA6ADmTyYk
 p10xhXoqcpX/B+QJwM/Q6gHhFjY2g7aSHsrM3NmmnvLnhzUUSwiWaawYjM049sy1g/al
 CEXWAe1/k+LBIkoqmzQNPKl4sKCHB0eYFF03PSS9HGC7mWlTDOLApW3DA+NI7WG2ij3D
 chOP2/htoQC1hZei5G4BNt1oU6UtxcO9sAU3r7wCeHCny7/YEK5WdbkIupsc5I4s+BVQ
 FKY3aFpliF48o1khV/IfNZ6wW3jjrW6WQd39jzVhSDvKmS/b6A4MD+ldq8LX4VrSQnZJ
 sA+g==
X-Gm-Message-State: AFuF++l+zAKjRcCz2ZpLplN/sByubQp4vzUUgjOMaaP8rWXv8kjAMZsE
 OK3pRXHQnAa0aYZxNwJOK0BG+jnRtNOgsxiXvDZBOMMCK6PcFaubSUFryEg730zbA1XbRLatZjE
 utF1uReamz7gSsoMOAlJPMm7dhvYB7hk=
X-Gm-Gg: AYBFou3Gvvasf6Iv6EiPi6zbiif4ODzSm9Br7G6spXNiUW+HZIUb2yAGHbtu7g4pXa0
 4ynN6vrpzZWPxBqkOniNPBf1Kp7rYAvLQ1EISg7TZcvjfjK6cxlcOncw+/po+BvomxQbIe4qi6A
 Y+1E96Bv5F3EWK2q42PzYM60edhsTcxOt40QqS758/eNsarHoK5tb6AnYjVkMlrJilLPrt4Zlew
 pzmdGNsyGbT/vicLfLtsNAc0UmjRNuMpN43VW556VvznBOzBCzwo7ZPEX8P707+TNFHbujIpMaA
 5xMD8n54TmLEd52QRsqK8iBBUIGZaJPOJA/7IhYgnrV2kqtYMzULvSXngDdpdYS3b2PP1vu966M
 u+n9ljxrXZm0VA/szmcbyY4+ju+7x7UynmAkKMSHCiw==
X-Received: by 2002:a05:690e:4148:b0:672:99e0:ebdd with SMTP id
 956f58d0204a3-67299e0ef69mr2479294d50.117.1790014217357; Mon, 21 Sep 2026
 11:10:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260917163553.1742580-1-talesam@gmail.com>
 <20260917163553.1742580-3-talesam@gmail.com>
 <aq214e+ia3nHVrKB@gsse-cloud1.jf.intel.com>
 <arDA2pUYH7uoUpE2@gsse-cloud1.jf.intel.com>
In-Reply-To: <arDA2pUYH7uoUpE2@gsse-cloud1.jf.intel.com>
From: =?UTF-8?B?VGFsZXMgQS4gTWVuZG9uw6dh?= <talesam@gmail.com>
Date: Mon, 21 Sep 2026 15:10:06 -0300
X-Gm-Features: AcwNN1UspgceXu2XSQzAXAliKGt4l6lKR8epHpezxC-O5yyR8-PuS2rhqKIIB8g
Message-ID: <CAHBRX4E4jhtua0kbL43pAg0berdc6bL2Loki9r0c6eP=7s_XpQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] drm/xe: Log when a timed out TLB invalidation ack
 finally arrives
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, daniele.ceraolospurio@intel.com, 
 stuart.summers@intel.com, julia.filipchuk@intel.com, 
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
 jani.nikula@intel.com, navonjohnlukose@gmail.com, 
 dri-devel@lists.freedesktop.org
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

On Sun, Sep 20, 2026 at 10:30:00PM -0700, Matthew Brost wrote:
> I discussed with my colleagues - the we agree the TLB component should
> hook into SIGID for logging but we will do this as a follow up on top of
> this change.
>
> So this is:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks Matt, and thanks for taking the question to the people who own
SIGID rather than letting it sit.

I will carry your tag on this patch in v5. Agreed on leaving the SIGID
conversion as a follow-up: there is no TLB component in
DEFINE_XE_LOG_COMPONENTS() yet, so adding one touches the log ABI and
belongs with the people doing that work rather than bolted onto a bug
fix. Happy to rebase on top of it once it lands.

v5 is otherwise ready and goes out this week. The only code delta is in
patch 1, from the data race Sashiko spotted after v4.

While you are here - patch 3 is the one that actually stops the stalls,
and it is still the only one without review. It applies
XE_BO_FLAG_NEEDS_UC to the GuC-shared allocations (CTBs, log, ADS, SLPC,
engine activity) on the standalone media GT, scoped by a new OOB rule
(22016122933 MEDIA_VERSION(1300)). The approach was Daniele's
suggestion. It has been running on two ARL machines for about six weeks
across several kernel versions, with over 10 million invalidations and
zero stalls; before it, both machines hit the ~2.3s ack delay 20-60
times a day.

Daniele, Stuart, would either of you be able to take a look at that one?

Tales

Em seg., 21 de set. de 2026 =C3=A0s 02:30, Matthew Brost
<matthew.brost@intel.com> escreveu:
>
> On Fri, Sep 18, 2026 at 03:06:25PM -0700, Matthew Brost wrote:
> > On Thu, Sep 17, 2026 at 01:35:52PM -0300, Tales A. Mendon=C3=A7a wrote:
> > > When a TLB invalidation fence times out we log the timeout, but if th=
e
> > > ack for that seqno later shows up there is no record of it, making it
> > > impossible to tell from logs whether the ack was lost forever or mere=
ly
> > > (very) late.
> > >
> > > Track the most recent timed out seqno and log how late its ack arrive=
s,
> > > relative to both the original request and the moment the fence was
> > > signaled with -ETIME.
> > >
> > > On ARL with GuC 70.53.0 this shows the acks are never lost: they
> > > consistently arrive ~2.3s after the request, tens of milliseconds aft=
er
> > > the TDR has already signaled the fence:
> > >
> > >   TLB invalidation fence timeout, seqno=3D10992 recv=3D10991
> > >   TLB invalidation late ack: seqno=3D10992 recv=3D10992,
> > >     request-to-ack=3D2314ms, timeout-to-ack=3D45ms
> > >
> > > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8678
> > > Signed-off-by: Tales A. Mendon=C3=A7a <talesam@gmail.com>
> >
> > I would give this an RB but my colleagues have done a bunch of work on
> > SIGID and I haven't been involved at all, so I need some help here.
> >
>
> I discussed with my colleagues - the we agree the TLB component should
> hook into SIGID for logging but we will do this as a follow up on top of
> this change.
>
> So this is:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>
> > > ---
> > >  drivers/gpu/drm/xe/xe_tlb_inval.c       | 19 +++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_tlb_inval_types.h | 17 +++++++++++++++++
> > >  2 files changed, 36 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/x=
e_tlb_inval.c
> > > index 7a0c04fac60..7047a347551 100644
> > > --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > > @@ -14,6 +14,7 @@
> > >  #include "xe_guc_tlb_inval.h"
> > >  #include "xe_mmio.h"
> > >  #include "xe_pm.h"
> > > +#include "xe_printk.h"
> > >  #include "xe_tlb_inval.h"
> > >  #include "xe_trace.h"
> > >
> > > @@ -99,6 +100,11 @@ static void xe_tlb_inval_fence_timeout(struct wor=
k_struct *work)
> > >                     fence->seqno, tlb_inval->seqno_recv);
> > >
> > >             timedout_seqno =3D fence->seqno;
> > > +           if (!tlb_inval->timedout_seqno) {
> > > +                   tlb_inval->timedout_seqno =3D fence->seqno;
> > > +                   tlb_inval->timedout_inval_time =3D fence->inval_t=
ime;
> > > +                   tlb_inval->timedout_time =3D ktime_get();
> > > +           }
> > >
> > >             fence->base.error =3D -ETIME;
> > >             xe_tlb_inval_fence_signal(fence);
> > > @@ -227,6 +233,7 @@ void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_=
inval)
> > >     else
> > >             pending_seqno =3D tlb_inval->seqno - 1;
> > >     WRITE_ONCE(tlb_inval->seqno_recv, pending_seqno);
> > > +   tlb_inval->timedout_seqno =3D 0;
> > >
> > >     list_for_each_entry_safe(fence, next,
> > >                              &tlb_inval->pending_fences, link)
> > > @@ -454,6 +461,18 @@ void xe_tlb_inval_done_handler(struct xe_tlb_inv=
al *tlb_inval, int seqno)
> > >
> > >     WRITE_ONCE(tlb_inval->seqno_recv, seqno);
> > >
> > > +   if (tlb_inval->timedout_seqno &&
> > > +       xe_tlb_inval_seqno_past(tlb_inval, tlb_inval->timedout_seqno)=
) {
> > > +           ktime_t now =3D ktime_get();
> > > +
> > > +           xe_warn(xe,
> > > +                   "TLB invalidation late ack: seqno=3D%d recv=3D%d,=
 request-to-ack=3D%lldms, timeout-to-ack=3D%lldms",
> > > +                   tlb_inval->timedout_seqno, seqno,
> > > +                   ktime_ms_delta(now, tlb_inval->timedout_inval_tim=
e),
> > > +                   ktime_ms_delta(now, tlb_inval->timedout_time));
> >
> > Should this be some type SIGID message?
> >
> > Matt
> >
> > > +           tlb_inval->timedout_seqno =3D 0;
> > > +   }
> > > +
> > >     list_for_each_entry_safe(fence, next,
> > >                              &tlb_inval->pending_fences, link) {
> > >             trace_xe_tlb_inval_fence_recv(xe, fence);
> > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/dr=
m/xe/xe_tlb_inval_types.h
> > > index d77be1aedc9..80d2019fa20 100644
> > > --- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > > @@ -112,6 +112,23 @@ struct xe_tlb_inval {
> > >      * @pending_lock: protects @pending_fences and updating @seqno_re=
cv.
> > >      */
> > >     spinlock_t pending_lock;
> > > +   /**
> > > +    * @timedout_seqno: seqno of the most recent timed out TLB
> > > +    * invalidation, 0 if none. Used to measure how late the ack for =
a
> > > +    * timed out invalidation actually arrives. Protected by
> > > +    * @pending_lock.
> > > +    */
> > > +   int timedout_seqno;
> > > +   /**
> > > +    * @timedout_inval_time: request time of @timedout_seqno. Protect=
ed by
> > > +    * @pending_lock.
> > > +    */
> > > +   ktime_t timedout_inval_time;
> > > +   /**
> > > +    * @timedout_time: time @timedout_seqno was signaled with -ETIME.
> > > +    * Protected by @pending_lock.
> > > +    */
> > > +   ktime_t timedout_time;
> > >     /**
> > >      * @fence_tdr: schedules a delayed call to xe_tlb_fence_timeout a=
fter
> > >      * the timeout interval is over.
> > > --
> > > 2.55.0
> > >



--=20
Com os cumprimentos,

Tales A. Mendon=C3=A7a
talesam.org
communitybig.org
