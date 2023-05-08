Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C294C77B73
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 03:42:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBFE10E057;
	Mon,  8 May 2023 03:42:27 +0000 (UTC)
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990BD10E057
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 03:42:25 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-18f4a6d2822so29170026fac.1
 for <intel-xe@lists.freedesktop.org>; Sun, 07 May 2023 20:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683517344; x=1686109344;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6pfVFmQenL7h8ktRGkarPsSXOixEtq/3IGuJKmsheqs=;
 b=UYCIW40yCk96shvhE+Jv47OKJv31vpfcgplU5+Vask908p4Pf2qMTssW6+v13ERDCO
 g1FDquaf/xsTSKkw9l4J6qoORT1mmSbyZHXCco2qyy6Gv1ZqE2FssxEhbu8dtiqdjNER
 OSUZlb7vhZ/46YyA7e+elt93m6ALIrwhu7xHSMD58XLjXCMlfjWhkmxiZGpZvv6YEmih
 Z34LJpu2ZySIRxvy2HsIJzCtc8KQWJGy+TZJHoCBwk8sDFgjxBC0L2zhqoRTFqpGa8+V
 7XdBkrzYHnAbP+Kt1Aw8SHF5VKqF+MALuGsd8rPK6XDy/xPiPHhsEtjcjIGbELF/SpVA
 +5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683517344; x=1686109344;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6pfVFmQenL7h8ktRGkarPsSXOixEtq/3IGuJKmsheqs=;
 b=K+vAVCRPcc7xcvBdEsEaiCjz+KfrpgPl4gzh+RgeuqTBuK4Lij+tgo3rzL/jfvzqO0
 lzp3h64kfl9QvhRWiEQQUH1Q0PmcvtcMjB42flQZrsvr9deqb0wNTXgZqtXs+JezLgD/
 yas3Svf/xZmLTZdeDguObRCIrheeItpN6GMxpvldRCNMkuw5FEB6QXD8Jiep+PPUJjiQ
 9igWGsCAJs2UD9bUu/RldO+8N2ERwZW8380ywrx19ZhVFvNOSwIMEMsLdjFFo8VvPHED
 MJ2DLeq22Sed/nun66Y0HzMRuozYTd9TUhrVwGPKt8Nr6vIFkbxcR92CTvl044Con4yb
 V0Ng==
X-Gm-Message-State: AC+VfDz59yXIrKzIzr3iGwJEFbdPUQLi6Oln5xJ7HNQeKLjoyKQ/F5ve
 zSbrrBXsi5NuRC5UjOuQ5GI4eqM9E2/f0e/3CvCUCPSqB0IVAw==
X-Google-Smtp-Source: ACHHUZ6LrcfCrFwVGsSHph8Ai+0n7MepsVVpWynDSmhYXj4gTCC02W6qITrvCSKSumh6/njmRJmOseWUHmcHomlUAqA=
X-Received: by 2002:aca:e142:0:b0:38e:e4d3:83a8 with SMTP id
 y63-20020acae142000000b0038ee4d383a8mr7214665oig.2.1683517344215; Sun, 07 May
 2023 20:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230505144910.317943-1-matthew.auld@intel.com>
 <ZFhH7tppkQlfgZ9t@DUT025-TGLU.fm.intel.com>
 <CA+aRtuZC4E5+29nUC7=PSy+Q4obn6HMNCZDTPi4hE9Y=WC5R3w@mail.gmail.com>
 <CA+aRtuZ+DUg2Aaxb3AZbu3RFwgT8BbuF5-OWf8HxmU8eU=k8ZQ@mail.gmail.com>
In-Reply-To: <CA+aRtuZ+DUg2Aaxb3AZbu3RFwgT8BbuF5-OWf8HxmU8eU=k8ZQ@mail.gmail.com>
From: Christopher Snowhill <kode54@gmail.com>
Date: Sun, 7 May 2023 20:42:13 -0700
Message-ID: <CA+aRtuaWC=YR5z=0yA9XkheU3S-8mz4Ru8CsAYEQ-kWnJa16qg@mail.gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Why is XE_FENCE_INITIAL_SEQNO defined to (-127) when seqno variable
types are mostly unsigned everywhere, except for logic that is
checking for wraps?

On Sun, May 7, 2023 at 8:26=E2=80=AFPM Christopher Snowhill <kode54@gmail.c=
om> wrote:
>
> False alarm. Looks like there's a different seqno overflow somewhere in h=
ere:
>
> [  854.230925] xe 0000:28:00.0: [drm] Engine reset: guc_id=3D59
> [  854.236564] xe 0000:28:00.0: [drm] Timedout job: seqno=3D4294967169,
> guc_id=3D59, flags=3D0x8
> [  859.885349] xe 0000:28:00.0: [drm] Ioctl argument check failed at
> drivers/gpu/drm/xe/xe_exec.c:178: engine->flags & ENGINE_FLAG_BANNED
> [  859.885366] xe 0000:28:00.0: [drm] Ioctl argument check failed at
> drivers/gpu/drm/xe/xe_exec.c:178: engine->flags & ENGINE_FLAG_BANNED
>
> Also, curses to gmail for not defaulting to plain text mode.
>
>
> On Sun, May 7, 2023 at 8:19=E2=80=AFPM Christopher Snowhill <kode54@gmail=
.com> wrote:
> >
> > Wow, this patch made intel-compute-runtime suddenly start working prope=
rly instead of causing a "GPU hang" that wasn't really a hang but instead a=
 seqno overflow.
> >
> > On Sun, May 7, 2023 at 5:53=E2=80=AFPM Matthew Brost <matthew.brost@int=
el.com> wrote:
> >>
> >> On Fri, May 05, 2023 at 03:49:10PM +0100, Matthew Auld wrote:
> >> > Checking seqno_recv >=3D seqno looks like it will incorrectly report=
 true
> >> > when the seqno has wrapped (not unlikely given
> >> > TLB_INVALIDATION_SEQNO_MAX). Calling xe_gt_tlb_invalidation_wait() m=
ight
> >> > then return before the flush has been completed by the GuC.
> >> >
> >> > Fix this by treating a large negative delta as an indication that th=
e
> >> > seqno has wrapped around. Similar to how we treat a large positive d=
elta
> >> > as an indication that the seqno_recv must have wrapped around, but i=
n
> >> > that case the seqno has likely also signalled.
> >> >
> >> > It looks like we could also potentially make the seqno use the full
> >> > 32bits as supported by the GuC.
> >>
> >> Yea we def could use more of the space but in the end we have the seqn=
o
> >> wrap issue. I think I set this to a low value to prove the wrapping
> >> protection worked (it didn't) by triigering wraps more often than the
> >> wrapping 32 bits.
> >>
> >> With, this patch LGTM.
> >>
> >> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> >>
> >> >
> >> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> >> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >> > Cc: Matthew Brost <matthew.brost@intel.com>
> >> > ---
> >> >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 7 ++++---
> >> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/g=
pu/drm/xe/xe_gt_tlb_invalidation.c
> >> > index 604f189dbd70..67822b3dd353 100644
> >> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> >> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> >> > @@ -251,14 +251,15 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *g=
t,
> >> >
> >> >  static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno=
)
> >> >  {
> >> > -     if (gt->tlb_invalidation.seqno_recv >=3D seqno)
> >> > -             return true;
> >> > +     if (seqno - gt->tlb_invalidation.seqno_recv <
> >> > +         -(TLB_INVALIDATION_SEQNO_MAX / 2))
> >> > +             return false;
> >> >
> >> >       if (seqno - gt->tlb_invalidation.seqno_recv >
> >> >           (TLB_INVALIDATION_SEQNO_MAX / 2))
> >> >               return true;
> >> >
> >> > -     return false;
> >> > +     return gt->tlb_invalidation.seqno_recv >=3D seqno;
> >> >  }
> >> >
> >> >  /**
> >> > --
> >> > 2.40.0
> >> >
