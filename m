Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B0FC77B7E
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 22:44:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DAC10E784;
	Thu, 25 May 2023 22:44:22 +0000 (UTC)
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EB210E784
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 22:44:20 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-19a156dd5d2so169733fac.0
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 15:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685054659; x=1687646659;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=go+I5I2cbujhN7XjLM5c8EZxX/zEuMsNEl1Bom+gcLs=;
 b=NWh/GVsEYsnsdtqa0uJxoMCeCKx9SuV/FtR8J7vuuG6563OLABjdfvS8u/HsoPuJCU
 PKg9EjH5Jebq1Kw9mdx6v5YljiDfuT5InKK0SLUBj/00KuqvdsFpAUkxkqZFE5gdBMqn
 CfjBKbwlIsidbeIqhGjNw7qVrvifc3O7Cck4PvyRdhZRTVuvseVw7QgKRKWwDwrYusHo
 yGR+QPsOTpTXRcAop+c9iFuWeiaRnpooB9DAyY7Ol8jWicgsa+ZGdSJqPh6j15UdtFCt
 ktqpWkYlGuOrdbqnVOfdHEHYT9IPLzYIF4u4EX9DuBy+KPA222XtXKWFb5fFaHqeLXyj
 euWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685054659; x=1687646659;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=go+I5I2cbujhN7XjLM5c8EZxX/zEuMsNEl1Bom+gcLs=;
 b=ls6Ilg/NLMFntdStUZHphxPnwBDgXCTs28/tmd5ngmqPFYDP/wPYC4+YvaCHkzBNMN
 ns2SV4LJcE61dd3lS8BB0IDyv1rnwnh/1kdC51+gRcKkJAANE0S5COmCODheQFlm8hKH
 rSIScQS/b/w8q00J04QHRyqhh/nO5/1rOx9kWGQ7uAvgTo8fZGrvsumevZmEChvG81FY
 H65TOTw4lqG2R5lWyVIhGcjAnLCcykUPNofS3ysbyED+2BZ3sLTFIjDiyLRe3CfTtQrA
 dUHkv9rQoG4MQLipL6BpkPhhCI1iDnyk02MnrAr/rDLGpfd4No1id2PB0tHUm6yFTNkX
 J+Ng==
X-Gm-Message-State: AC+VfDwFw59R7QUdGaUC2wQuW0z3gPW7LnIZlqoJqw2mfXrCM3gKSGco
 sIOKx6A5BPyUOW6mDR/C1/r5wUJyrCJR9/L7SmZbo0wBV3JjjQ==
X-Google-Smtp-Source: ACHHUZ7DSsItp6WsPQIDOf1Kc3WzIZNP2kZJFx3X6/7v9qs4JQA8vFQUjy3qT4USSNrzLjEXPw8gW0qcn/d+6rL7QCY=
X-Received: by 2002:a4a:4f52:0:b0:555:48c0:cc63 with SMTP id
 c79-20020a4a4f52000000b0055548c0cc63mr57743oob.2.1685054659255; Thu, 25 May
 2023 15:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230525015607.2192395-1-kode54@gmail.com>
 <44f4caa513b8b92e322ad7c725fd13b5053a6704.camel@intel.com>
 <can3buqui3msmblc7bkxo7mb5nfwpdlmsg7abo4sit2hqgpc33@rukg2yblkk67>
 <1918VR.US05UYXGP19H3@gmail.com>
 <3bpbea4zj7y2h66rn4vzb2vum5klwtbn2jtn5imlf2kov36zzf@knqmclpzpstx>
 <cd0ce7292aee8d8453477c32d47cecf6ce552682.camel@intel.com>
In-Reply-To: <cd0ce7292aee8d8453477c32d47cecf6ce552682.camel@intel.com>
From: Christopher Snowhill <kode54@gmail.com>
Date: Thu, 25 May 2023 15:44:08 -0700
Message-ID: <CA+aRtub_6JqwYAXr-TGMgei-+inD85UdF5eTHob==p_u2mm+jA@mail.gmail.com>
To: "Souza, Jose" <jose.souza@intel.com>
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
 Effie" <effie.yu@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 25, 2023 at 12:44=E2=80=AFPM Souza, Jose <jose.souza@intel.com>=
 wrote:
>
> On Thu, 2023-05-25 at 12:12 -0700, Lucas De Marchi wrote:
> > On Thu, May 25, 2023 at 08:48:37AM -0700, kode54@gmail.com wrote:
> > >
> > >
> > > On Thu, May 25 2023 at 08:13:43 AM -07:00:00, Lucas De Marchi
> > > <lucas.demarchi@intel.com> wrote:
> > > > On Thu, May 25, 2023 at 01:24:55PM +0000, Jose Souza wrote:
> > > > > Hi
> > > > >
> > > > > Planning to push this today,
> > > > > Christopher already have sent the Mesa MR and IGT patch series.
> > > >
> > > > the whole point of this series is being able to fix it without
> > > > having to
> > > > synchronize with the mesa / media / igt / intel-compute updates. Th=
ere
> > > > are some reordering in the structs that would better be done before
> > > > applying upstream and when that is done, then we need to sync all t=
he
> > > > UMDs. But not for this.
> > >
> > > Unfortunately, all userspace software which is also built for multili=
b
> > > must synchronize with this change, or else their 32-bit userspace wil=
l
> > > simply fail. In my experience, apps consuming Mesa 32-bit without thi=
s
> > > change will fail spectacularly, often crashing on startup.
> > >
> > > I suppose only Mesa really matters, since most users won't be
> > > installing proprietary software that consumes 32-bit OpenCL or VA-API=
,
> > > but there may yet be cases for that. This is usually proprietary
> > > software, often involving use of Wine, such as Steam's Proton
> > > distribution.
> >
> > yes, but 32bit was never properly supported before this patch. So if
> > they don't synchronize, they will continue in the current state of
> > not working at all.
> >
> > And I'd still try to pack the structs properly before having the
> > definite uapi in place, which only happens when this all is merged
> > upstream, which is *THE* most important synchronization point.
> > I also sync'ed with Jose to clarify on that.
> >
> > I'm about to push it, but since it's your patch I'd rather let you
> > confirm you are ok with it first.
>
> Christopher, until Xe is not enabled by default for the first platform uA=
PI can break.
>
> Was also about to push this to Xe and Mesa but lets wait for you ack then=
.

Yeah, sorry. I was considering Maarten Lankhorst's repacked structure,
but that also resizes several fields to uint64_t, which actually
breaks a few downstream packages I tried it in.

I guess we can stick with this for now, at least unless someone wants
to rearrange these structures in the near future. At least this way,
maybe we'll get some wider testing done to squash some of the bugs
I've experienced, of which I cannot tell whether it's Mesa or the
kernel driver. Mostly just CCS shenanigans with frame blitting of
large windows or video playback, or sometimes compositor animations.

I'm not sure, do you think we should hold off until the structure is
repacked? Unfortunately, the last person to attempt a restructuring,
mlankhorst, has appeared to have gone AFK for an extended period, or
is at least occasionally responding to other things on FD.O.

I'd like to consider his attempt again, but I forget if it had any
outstanding issues, other than the need to split the patches.
