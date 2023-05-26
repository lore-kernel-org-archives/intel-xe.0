Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663E6C7EE29
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 00:33:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CCD310E00F;
	Fri, 26 May 2023 00:33:56 +0000 (UTC)
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272E510E00F
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 00:33:54 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-38ea3f8e413so163169b6e.2
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 17:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685061233; x=1687653233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jy4gdBINcG74dhI6r5+aXNH73STQJ2yoG9uQdG5tCB4=;
 b=KEPWX0ClX5/wUOXZqd4x9RZnxVm3JGZyRHzpTaBKTGOFZRjMh6xL3z4CjW1l5GH3le
 ND1BN3to8X1sPviRKBxDqijp9ie42KhOiPgkaqSzDHfNYlj/yCHvgPG7NPQuN+LJQFD8
 7TQd/db6H56jfs4n7vzAdGgCSHftarKHLjdK+19GbIed2Iyo/bsubO22TXq8KHdi/2Fj
 Txe6LORkEnQUbotfdcm14ftYVBVk9MKSomL519CqQn1vvqMewhBlhijOcg4kUOgqUx1d
 gTaDZ9h2k+LlfUB6gWB/0/UuNo3I2Np/3NjpeRx3niyDb94AHcxLQrA1354y0L/gdVDS
 Qtkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685061233; x=1687653233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jy4gdBINcG74dhI6r5+aXNH73STQJ2yoG9uQdG5tCB4=;
 b=MYyXXPsbTThKDCCxogI243zsoo2hAre5YNv1izlLc8D8nDHZDBsCwivHkTBA6i3OV/
 +OMfVtwtSb2205SGm9H0cpiU4bJTpgu2qOEg2hs64CV4CP+WF/xSs/Bb3VEwgUSy8JBX
 wJ1jz7pyIbZfCUumAdT9WB7O7nZQlgfnTJmLkltQvEylU4cZgKMI18jbT6SVApCtRdSh
 ELccHx2ag9AptArKz1eid+WGrS7XfeShWtndtRRsyeJZf7K1H6e1FlR9Z+R1Owv7S5u1
 gPBfW/scnHT0ztpBLVqMeNEcvJVXy/VkbyXNGpVfzHm1riYAsieXbe/rOBZvrTWhcWiF
 +2lA==
X-Gm-Message-State: AC+VfDzCKNgDW2rlIOfKRaAfCvXCw0cOeGe8FIUIFKdLmMsffo9BapnY
 hfmpH4hOQ/kGB0qPGNxVfilkPXOFS7O03VTNqXIIGmzXtUil8A==
X-Google-Smtp-Source: ACHHUZ46XJo7ys1njaGCQUC/aNYYyloNobNc6hqmX2954qoSLVA8E2Sr3HOoEEkcFIbbfUAPjW4+4jNMM8GirEy6fWc=
X-Received: by 2002:a05:6808:8c9:b0:396:25bd:5eb3 with SMTP id
 k9-20020a05680808c900b0039625bd5eb3mr112884oij.33.1685061232958; Thu, 25 May
 2023 17:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230525015607.2192395-1-kode54@gmail.com>
 <44f4caa513b8b92e322ad7c725fd13b5053a6704.camel@intel.com>
 <can3buqui3msmblc7bkxo7mb5nfwpdlmsg7abo4sit2hqgpc33@rukg2yblkk67>
 <1918VR.US05UYXGP19H3@gmail.com>
 <3bpbea4zj7y2h66rn4vzb2vum5klwtbn2jtn5imlf2kov36zzf@knqmclpzpstx>
 <cd0ce7292aee8d8453477c32d47cecf6ce552682.camel@intel.com>
 <CA+aRtub_6JqwYAXr-TGMgei-+inD85UdF5eTHob==p_u2mm+jA@mail.gmail.com>
 <djxnjryahlbbaexqqldv45tlcdlsufjo7zi5biwsmzkggdywmc@wmehm3yarb3q>
 <CA+aRtuYgPL0W2URbhHUY1rQ0NFxX5L6s8Yjt5kQoMGd5qSQJVw@mail.gmail.com>
In-Reply-To: <CA+aRtuYgPL0W2URbhHUY1rQ0NFxX5L6s8Yjt5kQoMGd5qSQJVw@mail.gmail.com>
From: Christopher Snowhill <kode54@gmail.com>
Date: Thu, 25 May 2023 17:33:41 -0700
Message-ID: <CA+aRtuZf0vT9gOHA4zBZPU8WNDo5XGpBROAfgiDjkMfsSYqm=Q@mail.gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH v2 0/2] Update Xe uAPI in a minimally
 invasive way
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
Cc: "Hazubski, Filip" <filip.hazubski@intel.com>, "Yu,
 Effie" <effie.yu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 5:23=E2=80=AFPM Christopher Snowhill <kode54@gmail.=
com> wrote:
>
> On Thu, May 25, 2023 at 3:47=E2=80=AFPM Lucas De Marchi
> <lucas.demarchi@intel.com> wrote:
> >
> > On Thu, May 25, 2023 at 03:44:08PM -0700, Christopher Snowhill wrote:
> > >On Thu, May 25, 2023 at 12:44=E2=80=AFPM Souza, Jose <jose.souza@intel=
.com> wrote:
> > >>
> > >> On Thu, 2023-05-25 at 12:12 -0700, Lucas De Marchi wrote:
> > >> > On Thu, May 25, 2023 at 08:48:37AM -0700, kode54@gmail.com wrote:
> > >> > >
> > >> > >
> > >> > > On Thu, May 25 2023 at 08:13:43 AM -07:00:00, Lucas De Marchi
> > >> > > <lucas.demarchi@intel.com> wrote:
> > >> > > > On Thu, May 25, 2023 at 01:24:55PM +0000, Jose Souza wrote:
> > >> > > > > Hi
> > >> > > > >
> > >> > > > > Planning to push this today,
> > >> > > > > Christopher already have sent the Mesa MR and IGT patch seri=
es.
> > >> > > >
> > >> > > > the whole point of this series is being able to fix it without
> > >> > > > having to
> > >> > > > synchronize with the mesa / media / igt / intel-compute update=
s. There
> > >> > > > are some reordering in the structs that would better be done b=
efore
> > >> > > > applying upstream and when that is done, then we need to sync =
all the
> > >> > > > UMDs. But not for this.
> > >> > >
> > >> > > Unfortunately, all userspace software which is also built for mu=
ltilib
> > >> > > must synchronize with this change, or else their 32-bit userspac=
e will
> > >> > > simply fail. In my experience, apps consuming Mesa 32-bit withou=
t this
> > >> > > change will fail spectacularly, often crashing on startup.
> > >> > >
> > >> > > I suppose only Mesa really matters, since most users won't be
> > >> > > installing proprietary software that consumes 32-bit OpenCL or V=
A-API,
> > >> > > but there may yet be cases for that. This is usually proprietary
> > >> > > software, often involving use of Wine, such as Steam's Proton
> > >> > > distribution.
> > >> >
> > >> > yes, but 32bit was never properly supported before this patch. So =
if
> > >> > they don't synchronize, they will continue in the current state of
> > >> > not working at all.
> > >> >
> > >> > And I'd still try to pack the structs properly before having the
> > >> > definite uapi in place, which only happens when this all is merged
> > >> > upstream, which is *THE* most important synchronization point.
> > >> > I also sync'ed with Jose to clarify on that.
> > >> >
> > >> > I'm about to push it, but since it's your patch I'd rather let you
> > >> > confirm you are ok with it first.
> > >>
> > >> Christopher, until Xe is not enabled by default for the first platfo=
rm uAPI can break.
> > >>
> > >> Was also about to push this to Xe and Mesa but lets wait for you ack=
 then.
> > >
> > >Yeah, sorry. I was considering Maarten Lankhorst's repacked structure,
> > >but that also resizes several fields to uint64_t, which actually
> > >breaks a few downstream packages I tried it in.
> > >
> > >I guess we can stick with this for now, at least unless someone wants
> > >to rearrange these structures in the near future. At least this way,
> > >maybe we'll get some wider testing done to squash some of the bugs
> > >I've experienced, of which I cannot tell whether it's Mesa or the
> > >kernel driver. Mostly just CCS shenanigans with frame blitting of
> > >large windows or video playback, or sometimes compositor animations.
> > >
> > >I'm not sure, do you think we should hold off until the structure is
> > >repacked? Unfortunately, the last person to attempt a restructuring,
> > >mlankhorst, has appeared to have gone AFK for an extended period, or
> > >is at least occasionally responding to other things on FD.O.
> >
> > reordering and repacking as we noticed may be problematic.
> > I'd just commit this now and leave that part for later.
> >
> > Lucas De Marchi
>
> Acked-by: Christopher Snowhill <kode54@gmail.com>

I sent the other patch anyway, as a request for commentary, and so it
will be available for a future date. Do not apply.

> > >
> > >I'd like to consider his attempt again, but I forget if it had any
> > >outstanding issues, other than the need to split the patches.
