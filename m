Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D4BCA0ECD
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 16:04:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719BC10E502;
	Mon, 11 Aug 2025 16:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="LQaIn4PT";
	dkim-atps=neutral
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1905110E502
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 16:04:39 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-55b733911b3so5212457e87.2
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 09:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754928277; x=1755533077;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZLxJ34wAGj+AOtt8mZ7vcowQI9Sl9ieJXbYqbsFcGE0=;
 b=LQaIn4PTZ/4hXU5jLI6uBzdw/nZA6C20YjTuUkVNNvVkVyJQ9cXMvb+R0QMZcHOmPy
 nRdlq6PtlYJVFtFwQ3uNKX5BnmJhKv1YDfHV8r7dmInS7dUPaOgcCJ1ISK2KcVvKGxxV
 LVwohgxFxpF/41GR7FjrNiDUdbKqG//nLQsCTb8A2pHre/Q14FfYp27nk05kABp6i4/h
 YgU8/GghjXeouEgYRr8n8VOYaiywQ4bCfWW1aqp8CaMlvp2n2YUhu+7d8FTf8uOa8xg8
 UwUg9sb7eVmdTQeqEVYHxCo8xryW6PpNSbjQrM45zq4NMmF1XIVQgfnC/kU698XslrX5
 8ITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754928277; x=1755533077;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZLxJ34wAGj+AOtt8mZ7vcowQI9Sl9ieJXbYqbsFcGE0=;
 b=ZdtWUoUCJb33muebuHM1qgmCLnsPAPnByuZZGVa1Ac5NIIZkOhSQtE4/pxl6itsvzb
 gPHW6N3ex+TD3CHA6lqvXA20p5uXbJIx3xuMrRn9oVE0iGCLSOxGzP0f2Bs/H8fc2Dz/
 uCChvprM2UVMrtznEjD8crnSpOZwIxSCeg1ZRJEBWwcoPzsS4ltVcob266Fww/wuvpds
 Ywb6bg5ceOKLo+3Bax7nVWqhME+tprFo6XcUxEegydMriQ0notIMFiYU1s4aLsFXPEBD
 752/dltDb7j9d0reL5DNgEyAQQhnl+F1vDO7inE4cwyB9DIeVekpWo9Qey4+cNJm7xRx
 JWCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrwEVGqwuz6QeKIuZCdxJfhy2pgWS6ZR/yajzqxM1KndaL/tFSDhpmw5n1nR+Mr+pRSfvPdU++eQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgUpmv2sxnUM++OXtfuPPdoWm4u4Gf2ewNkLFO6fP9UL7RvSpB
 XFCYgOfqVi9FMSZ9UAC8n9svVSRCGlxETWy5iiUwPCnavmRQ1qW3yO+5JDXOotif1ho8M6dHnUI
 rkoSprKC/qgV9F0lmP+mdwnsIiyWIWckrPfJAQQs=
X-Gm-Gg: ASbGncv8cdEtqsKTzdOVoHQu9nyhQJN56Ut8nKH13f92XL7LWbCVYpPkXV6Hh751UEH
 IVX9qzZg+cSluVVS37U4RVCseJ1YgC9NwRv7g3Pi0tZYosN4uVr2VJhn/yFzeUr2uhFHlnc9Ouy
 YtNjoJ9C3+zwXjagI6P9f79iPiRo7qpAu7k3Gv/bS1pzxzhJQMf1/MGmV+5zeC+vELnsnBHrGJj
 ydOoQSrMAIiQPBdLUnm2wNu8Ih5MQNfncyhihGdgr3zJOaHwXExFjUUfA==
X-Google-Smtp-Source: AGHT+IFL8gqszFsDuzAlAHwUImJZQGR0ByrrExcrECjETwNPPovWORvelfYdgZWd8HhAINQShBoBTTLkI87k09nVxAM=
X-Received: by 2002:a05:6512:1323:b0:55b:8e2e:8cc7 with SMTP id
 2adb3069b0e04-55cd7647e7cmr88905e87.42.1754928277055; Mon, 11 Aug 2025
 09:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <274f61b98745426050e545a37131b9408c3666f9.camel@arm.com>
 <e62cbfa7867055bb368762c86a91e78c7afbf087.camel@linux.intel.com>
In-Reply-To: <e62cbfa7867055bb368762c86a91e78c7afbf087.camel@linux.intel.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 11 Aug 2025 09:04:24 -0700
X-Gm-Features: Ac12FXzGhPx15CfUskF2TSI1T1OErYdd5_RF4fikUuNMSCvB2urQE9iEGbcFGp4
Message-ID: <CANDhNCpVU=c9fET1DzHwX2QMBbADtFdy3W=ui6eFiEMEvVbT7g@mail.gmail.com>
Subject: Re: [PATCH] locking/mutex: Add p->blocked_on wrappers for correctness
 checks
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Valentin Schneider <valentin.schneider@arm.com>,
 intel-xe@lists.freedesktop.org, "Connor O'Brien" <connoro@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
 K Prateek Nayak <kprateek.nayak@amd.com>
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

On Mon, Aug 11, 2025 at 7:39=E2=80=AFAM Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Hi Valentin,
>
> On Sat, 2025-07-12 at 03:33 +0000, Valentin Schneider wrote:
> > This lets us assert mutex::wait_lock is held whenever we access
> > p->blocked_on, as well as warn us for unexpected state changes.
> >
> > [fix conflicts, call in more places]
> > [jstultz: tweaked commit subject, reworked a good bit]
> > Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
> > Signed-off-by: Connor O'Brien <connoro@google.com>
> > Signed-off-by: John Stultz <jstultz@google.com>
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
> > Link:
> > https://lkml.kernel.org/r/20250712033407.2383110-4-jstultz@google.com
> > ---
> >  include/linux/sched.h        | 64
> > ++++++++++++++++++++++++++++++++++--
> >  kernel/locking/mutex-debug.c |  4 +--
> >  kernel/locking/mutex.c       | 32 ++++++++----------
> >  kernel/locking/ww_mutex.h    |  8 ++---
> >  4 files changed, 81 insertions(+), 27 deletions(-)
> >
>
> Our CI is hitting a lot of these:
>
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5826
>
> From looking at the code, the wound-wait code after wounding the mutex
> owner, wakes it up opportunistically, so that *if* it is waiting on
> another wound-wait mutex, should re-evaluate whether it should
> rollback. Ideally in this case, the blocked-on status should be removed
> by the process that was woken up?
>
> Otherwise if the wound-wait code misbehaves in doing this we need to
> fix it.

My apologies again for this one.

I've got a fix on the list, waiting to be picked up, here:
https://lore.kernel.org/lkml/20250805001026.2247040-1-jstultz@google.com/

As well as some improvements to the ww_mutex test driver to make sure
the test coverage doesn't miss this again.
https://lore.kernel.org/lkml/20250801023358.562525-1-jstultz@google.com/

thanks
-john
