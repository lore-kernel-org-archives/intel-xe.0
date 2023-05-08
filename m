Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E780C77B7C
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 03:20:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3BA110E057;
	Mon,  8 May 2023 03:20:07 +0000 (UTC)
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F088810E057
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 03:20:05 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-192d5ab4962so2388910fac.3
 for <intel-xe@lists.freedesktop.org>; Sun, 07 May 2023 20:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683516004; x=1686108004;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xGsSbOIcq+A/tEXSocNf4HrOB1ud0LV4hjc3hX+Im5E=;
 b=mdPtVXcxdBycKZABI4a4MxXmtvYWxFgvKJIiMA7yqMZkjYCfapDgmGl+JWN2cGon7p
 f4Mu5Ta26u9QxnhxOPC9oXOr1rdR1VX1RM8ibsA7Irt4jVfTbjytsd+4rzyLT8uAbpiJ
 BYAKGzZLqcLPeDl7mHnoOmxdcpg5QTfHCER9RxHK7TwM3cmJC+Ec5P0Xi+7kMP0J8C+w
 ziNfABkCajtTTga/sQ6boEabmG9/ISqJMxJsJdIN/BdAIaIbmV8xqaIGsgvdgQS28Ku1
 VBp9ISGpnLcK1VFLKIgPFs1IX1SB1G8h6J5l8fKbKnjFnPyfww7GA19nBNoabnONAkmZ
 Y/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683516004; x=1686108004;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xGsSbOIcq+A/tEXSocNf4HrOB1ud0LV4hjc3hX+Im5E=;
 b=QVVoeLQV8hG8gLMBTM2eaAIFJsZVNDeulAb0pMToWX5TLWtpZRNRAUIMjuS7i76W+f
 V2JX+RloRlrhtU8uSyPvq7sFjRjKybT50qoJZ2z08spbkx/VuUkKtFaqesQxX3gRJF6b
 2fFPj+2Q8cSz2H3ujBwJiv8kd29Qgr2QGkgD+JU1BDhsjCwcWkCHyVMS3QbuQ8ZxQOHp
 HbAIaW/LSlcNYyxrcJK6UNVpWi7VRpWEw+2QCqU6WwvbdqK23LVM8yTRMpe+RT0bYLjz
 byMq2KTexO5hU4oWd9tz//RQoMonr2Wk8Lq+DbenGGjD4JKY8jSMoJeqMpcaISXobOKH
 bXzQ==
X-Gm-Message-State: AC+VfDwblssQ7UICiqwRZFyMhGFPC+o9UFIRQHe8Vhp0i1uNmV0y0Qv+
 WWt/wCH1fHIko8dsH6S2rHEa85TKd1JA1kxKQbU=
X-Google-Smtp-Source: ACHHUZ6ttW9o1dwNs4/dvNHG1G22en03W5yCA8/XwcbHtqVr0ytpQ3c4cRYg7IvtyXYO8DQfBPfTD3pzpkxkVEZN8FI=
X-Received: by 2002:a05:6870:a445:b0:184:6a66:fd9e with SMTP id
 n5-20020a056870a44500b001846a66fd9emr4240955oal.8.1683516003837; Sun, 07 May
 2023 20:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230505144910.317943-1-matthew.auld@intel.com>
 <ZFhH7tppkQlfgZ9t@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZFhH7tppkQlfgZ9t@DUT025-TGLU.fm.intel.com>
From: Christopher Snowhill <kode54@gmail.com>
Date: Sun, 7 May 2023 20:19:52 -0700
Message-ID: <CA+aRtuZC4E5+29nUC7=PSy+Q4obn6HMNCZDTPi4hE9Y=WC5R3w@mail.gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: multipart/alternative; boundary="00000000000061ed1f05fb261d6c"
Subject: Re: [Intel-xe] [PATCH] drm/xe: fix tlb_invalidation_seqno_past()
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
Cc: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--00000000000061ed1f05fb261d6c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Wow, this patch made intel-compute-runtime suddenly start working properly
instead of causing a "GPU hang" that wasn't really a hang but instead a
seqno overflow.

On Sun, May 7, 2023 at 5:53=E2=80=AFPM Matthew Brost <matthew.brost@intel.c=
om>
wrote:

> On Fri, May 05, 2023 at 03:49:10PM +0100, Matthew Auld wrote:
> > Checking seqno_recv >=3D seqno looks like it will incorrectly report tr=
ue
> > when the seqno has wrapped (not unlikely given
> > TLB_INVALIDATION_SEQNO_MAX). Calling xe_gt_tlb_invalidation_wait() migh=
t
> > then return before the flush has been completed by the GuC.
> >
> > Fix this by treating a large negative delta as an indication that the
> > seqno has wrapped around. Similar to how we treat a large positive delt=
a
> > as an indication that the seqno_recv must have wrapped around, but in
> > that case the seqno has likely also signalled.
> >
> > It looks like we could also potentially make the seqno use the full
> > 32bits as supported by the GuC.
>
> Yea we def could use more of the space but in the end we have the seqno
> wrap issue. I think I set this to a low value to prove the wrapping
> protection worked (it didn't) by triigering wraps more often than the
> wrapping 32 bits.
>
> With, this patch LGTM.
>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>
> >
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > index 604f189dbd70..67822b3dd353 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > @@ -251,14 +251,15 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
> >
> >  static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
> >  {
> > -     if (gt->tlb_invalidation.seqno_recv >=3D seqno)
> > -             return true;
> > +     if (seqno - gt->tlb_invalidation.seqno_recv <
> > +         -(TLB_INVALIDATION_SEQNO_MAX / 2))
> > +             return false;
> >
> >       if (seqno - gt->tlb_invalidation.seqno_recv >
> >           (TLB_INVALIDATION_SEQNO_MAX / 2))
> >               return true;
> >
> > -     return false;
> > +     return gt->tlb_invalidation.seqno_recv >=3D seqno;
> >  }
> >
> >  /**
> > --
> > 2.40.0
> >
>

--00000000000061ed1f05fb261d6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Wow, this patch made intel-compute-runtime suddenly start =
working properly instead of causing a &quot;GPU hang&quot; that wasn&#39;t =
really a hang but instead a seqno overflow.<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, May 7, 2023 at 5:53=
=E2=80=AFPM Matthew Brost &lt;<a href=3D"mailto:matthew.brost@intel.com">ma=
tthew.brost@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Fri, May 05, 2023 at 03:49:10PM +0100, Matthew Auld=
 wrote:<br>
&gt; Checking seqno_recv &gt;=3D seqno looks like it will incorrectly repor=
t true<br>
&gt; when the seqno has wrapped (not unlikely given<br>
&gt; TLB_INVALIDATION_SEQNO_MAX). Calling xe_gt_tlb_invalidation_wait() mig=
ht<br>
&gt; then return before the flush has been completed by the GuC.<br>
&gt; <br>
&gt; Fix this by treating a large negative delta as an indication that the<=
br>
&gt; seqno has wrapped around. Similar to how we treat a large positive del=
ta<br>
&gt; as an indication that the seqno_recv must have wrapped around, but in<=
br>
&gt; that case the seqno has likely also signalled.<br>
&gt; <br>
&gt; It looks like we could also potentially make the seqno use the full<br=
>
&gt; 32bits as supported by the GuC.<br>
<br>
Yea we def could use more of the space but in the end we have the seqno<br>
wrap issue. I think I set this to a low value to prove the wrapping<br>
protection worked (it didn&#39;t) by triigering wraps more often than the<b=
r>
wrapping 32 bits.<br>
<br>
With, this patch LGTM.<br>
<br>
Reviewed-by: Matthew Brost &lt;<a href=3D"mailto:matthew.brost@intel.com" t=
arget=3D"_blank">matthew.brost@intel.com</a>&gt;<br>
<br>
&gt; <br>
&gt; Signed-off-by: Matthew Auld &lt;<a href=3D"mailto:matthew.auld@intel.c=
om" target=3D"_blank">matthew.auld@intel.com</a>&gt;<br>
&gt; Cc: Thomas Hellstr=C3=B6m &lt;<a href=3D"mailto:thomas.hellstrom@linux=
.intel.com" target=3D"_blank">thomas.hellstrom@linux.intel.com</a>&gt;<br>
&gt; Cc: Matthew Brost &lt;<a href=3D"mailto:matthew.brost@intel.com" targe=
t=3D"_blank">matthew.brost@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 7 ++++---<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu=
/drm/xe/xe_gt_tlb_invalidation.c<br>
&gt; index 604f189dbd70..67822b3dd353 100644<br>
&gt; --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c<br>
&gt; +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c<br>
&gt; @@ -251,14 +251,15 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,=
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int se=
qno)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (gt-&gt;tlb_invalidation.seqno_recv &gt;=3D se=
qno)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (seqno - gt-&gt;tlb_invalidation.seqno_recv &l=
t;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-(TLB_INVALIDATION_SEQNO_MAX / 2))<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (seqno - gt-&gt;tlb_invalidation.seqno_re=
cv &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(TLB_INVALIDATION_SEQNO_MAX / =
2))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0return false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return gt-&gt;tlb_invalidation.seqno_recv &gt;=3D=
 seqno;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /**<br>
&gt; -- <br>
&gt; 2.40.0<br>
&gt; <br>
</blockquote></div>

--00000000000061ed1f05fb261d6c--
