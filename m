Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD487C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 00:23:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610B010E00F;
	Fri, 26 May 2023 00:23:53 +0000 (UTC)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2748210E00F
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 00:23:52 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-39817f3e08eso93228b6e.1
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 17:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685060631; x=1687652631;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WGo7+cieL4Sqh0msAp00GXrijVRjqlZTIldXrxg5mY8=;
 b=o71+LNhY2wmrYd0U5z3NmE4uvScuHMWQA36de0epzIz9paN++TEr2x8U902HauR/6i
 1bzQAteu4ZpsTSdh4LDOjQTtYkHNxtWar1oJF5iaZT6hExngEj+qVo6/YPKRnnFrpLNy
 iLEStVR100pWqCrMi+M2afKcS1N4BE5wP3u9fz22yRtWW8224yLwIqFy86AUHLQZkcnd
 jgnXH4fwt/G6b/1vW7nxfWfwMt7/P0VT9lP3/GR6ddPtYQvelCD5Oy7ykVvAnLY1I8/Y
 Dxx5/t8ShdYNNtFvqRLL8OgxwfpuJ9L9KQA7svFMn5+so8967uSK7m1m7jyh57V9i2xj
 x63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685060631; x=1687652631;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WGo7+cieL4Sqh0msAp00GXrijVRjqlZTIldXrxg5mY8=;
 b=c4WOF0UX0LY7OGuYv+r6pWn3wM5x5DkO+MLN3IqYS8yFgt/VKWC/z6pWYHUNkhM1hN
 z26s7QA7aSk5ciw46Vk5EIG+PoP0fsbnlbrdBlH066AMcX6VbvYej4K7zAWGKSvm6Jwg
 9pRygJYNCbBuBhMYDYfCn77WyHCnvymajq2h7X/Pn654yHLdu51Ax2UfgDz04PuDzlBT
 4580Lqu6+Co3iVdBmWZjiJTn7TYmF01iAs44ej1uMJEQRI5OAVZ8HCaRxYGfSEJdHYbB
 5t6FGL+OEU2GBuR0hrm52dkHfJcs3d1TSW8v+LOuuxVcq87WTX/48lTZtvMbjzGTgFLQ
 cEDA==
X-Gm-Message-State: AC+VfDxSeHF+e6crg5sEyEolKRjzM0t8FDgQvjHlbamEr0HA1OEk5Rn8
 HKnNl91yTa40/CKXbp7EP8yUl4p+O4VHATbER3rasJPAg6j9FA==
X-Google-Smtp-Source: ACHHUZ5dlzgJcFSjP2LhVG0qbCkq4M7s4lTmlHTJA/DHNldHhllvfU3dqzhINv0i+tMtvsb2mEJJLgZtt+DTi/RQ7uA=
X-Received: by 2002:a05:6808:1288:b0:398:d799:bd37 with SMTP id
 a8-20020a056808128800b00398d799bd37mr133858oiw.38.1685060630941; Thu, 25 May
 2023 17:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230525015607.2192395-1-kode54@gmail.com>
 <44f4caa513b8b92e322ad7c725fd13b5053a6704.camel@intel.com>
 <can3buqui3msmblc7bkxo7mb5nfwpdlmsg7abo4sit2hqgpc33@rukg2yblkk67>
 <1918VR.US05UYXGP19H3@gmail.com>
 <3bpbea4zj7y2h66rn4vzb2vum5klwtbn2jtn5imlf2kov36zzf@knqmclpzpstx>
 <cd0ce7292aee8d8453477c32d47cecf6ce552682.camel@intel.com>
 <CA+aRtub_6JqwYAXr-TGMgei-+inD85UdF5eTHob==p_u2mm+jA@mail.gmail.com>
 <djxnjryahlbbaexqqldv45tlcdlsufjo7zi5biwsmzkggdywmc@wmehm3yarb3q>
In-Reply-To: <djxnjryahlbbaexqqldv45tlcdlsufjo7zi5biwsmzkggdywmc@wmehm3yarb3q>
From: Christopher Snowhill <kode54@gmail.com>
Date: Thu, 25 May 2023 17:23:39 -0700
Message-ID: <CA+aRtuYgPL0W2URbhHUY1rQ0NFxX5L6s8Yjt5kQoMGd5qSQJVw@mail.gmail.com>
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

On Thu, May 25, 2023 at 3:47=E2=80=AFPM Lucas De Marchi
<lucas.demarchi@intel.com> wrote:
>
> On Thu, May 25, 2023 at 03:44:08PM -0700, Christopher Snowhill wrote:
> >On Thu, May 25, 2023 at 12:44=E2=80=AFPM Souza, Jose <jose.souza@intel.c=
om> wrote:
> >>
> >> On Thu, 2023-05-25 at 12:12 -0700, Lucas De Marchi wrote:
> >> > On Thu, May 25, 2023 at 08:48:37AM -0700, kode54@gmail.com wrote:
> >> > >
> >> > >
> >> > > On Thu, May 25 2023 at 08:13:43 AM -07:00:00, Lucas De Marchi
> >> > > <lucas.demarchi@intel.com> wrote:
> >> > > > On Thu, May 25, 2023 at 01:24:55PM +0000, Jose Souza wrote:
> >> > > > > Hi
> >> > > > >
> >> > > > > Planning to push this today,
> >> > > > > Christopher already have sent the Mesa MR and IGT patch series=
.
> >> > > >
> >> > > > the whole point of this series is being able to fix it without
> >> > > > having to
> >> > > > synchronize with the mesa / media / igt / intel-compute updates.=
 There
> >> > > > are some reordering in the structs that would better be done bef=
ore
> >> > > > applying upstream and when that is done, then we need to sync al=
l the
> >> > > > UMDs. But not for this.
> >> > >
> >> > > Unfortunately, all userspace software which is also built for mult=
ilib
> >> > > must synchronize with this change, or else their 32-bit userspace =
will
> >> > > simply fail. In my experience, apps consuming Mesa 32-bit without =
this
> >> > > change will fail spectacularly, often crashing on startup.
> >> > >
> >> > > I suppose only Mesa really matters, since most users won't be
> >> > > installing proprietary software that consumes 32-bit OpenCL or VA-=
API,
> >> > > but there may yet be cases for that. This is usually proprietary
> >> > > software, often involving use of Wine, such as Steam's Proton
> >> > > distribution.
> >> >
> >> > yes, but 32bit was never properly supported before this patch. So if
> >> > they don't synchronize, they will continue in the current state of
> >> > not working at all.
> >> >
> >> > And I'd still try to pack the structs properly before having the
> >> > definite uapi in place, which only happens when this all is merged
> >> > upstream, which is *THE* most important synchronization point.
> >> > I also sync'ed with Jose to clarify on that.
> >> >
> >> > I'm about to push it, but since it's your patch I'd rather let you
> >> > confirm you are ok with it first.
> >>
> >> Christopher, until Xe is not enabled by default for the first platform=
 uAPI can break.
> >>
> >> Was also about to push this to Xe and Mesa but lets wait for you ack t=
hen.
> >
> >Yeah, sorry. I was considering Maarten Lankhorst's repacked structure,
> >but that also resizes several fields to uint64_t, which actually
> >breaks a few downstream packages I tried it in.
> >
> >I guess we can stick with this for now, at least unless someone wants
> >to rearrange these structures in the near future. At least this way,
> >maybe we'll get some wider testing done to squash some of the bugs
> >I've experienced, of which I cannot tell whether it's Mesa or the
> >kernel driver. Mostly just CCS shenanigans with frame blitting of
> >large windows or video playback, or sometimes compositor animations.
> >
> >I'm not sure, do you think we should hold off until the structure is
> >repacked? Unfortunately, the last person to attempt a restructuring,
> >mlankhorst, has appeared to have gone AFK for an extended period, or
> >is at least occasionally responding to other things on FD.O.
>
> reordering and repacking as we noticed may be problematic.
> I'd just commit this now and leave that part for later.
>
> Lucas De Marchi

Acked-by: Christopher Snowhill <kode54@gmail.com>

>
> >
> >I'd like to consider his attempt again, but I forget if it had any
> >outstanding issues, other than the need to split the patches.
