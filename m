Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A44C7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 10:12:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995D510E8B7;
	Wed,  5 Apr 2023 10:12:41 +0000 (UTC)
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1681B10E8B7
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 10:12:39 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 o25-20020a9d4119000000b006a11eb19f8eso17578208ote.5
 for <intel-xe@lists.freedesktop.org>; Wed, 05 Apr 2023 03:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680689559;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+oTyLhGTzln/7jPt/iX+Rd2l1L5Mgvm2dhW/v+eKHdk=;
 b=SvJki+8wMGruLAyCY5/FTP2J6ZrxeL6G/V0+7DyX35MmvN3DK/hVyQlJvhzr7qTT3D
 86kfNZ58Afcxs14xRFWqI9slHnzlQ3XAG3EWY08MqqlZjqTxk6yA268muJLWctoLdXWc
 rF4Ma6mHsXDT8RUvjNFQK33tcGAZ8hxY4Grh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680689559;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+oTyLhGTzln/7jPt/iX+Rd2l1L5Mgvm2dhW/v+eKHdk=;
 b=JsVeuAKvEDe/+pWTiaK2U5Xvi7uZvHAmnYmq5nf/i8QBGwPMGhn8k8ePMQc6449oW0
 fLXizychRLLaj+lJ66Uc/6POvDm3ynNJsrw2RyupPpCWYk+JfVKoxbRCMBCaPH4Xeuz2
 r95E+CfSEtVS9Jlq88B/WE6BsdpJclDPT6lawOVZ1A67yWGGROhf3utVZx48P+g1SifC
 i7yhOlLq3t+uz7Mz+s/a4T6kA7DUfOy8uevaRALJmDys34jazSYrn98g9me1qajiC0Kg
 ce1Xg/mEqdFsZ1KcRa0aEMKlEejU6bIBVqJV3xRllWDBoRxntbTUPmUVqMH04AADhXKR
 wmgg==
X-Gm-Message-State: AAQBX9eVvTB29oZzS4TbnTZedHsrNRaL8NI8ESqhOCmHk74+5QX5UKTc
 hk477crvwXSxJ5Ozryq8UvXfq6CjHkr3CotrnCdrsw==
X-Google-Smtp-Source: AKy350YzW3NqtFMtNfHbIUABteC1JZhEev3FUijNuV4dA35MCQFpjboQ6fn4Nm2jp6QIr8oPqpXEEXBinQr5XZN3eC4=
X-Received: by 2002:a9d:7e96:0:b0:69f:5701:de09 with SMTP id
 m22-20020a9d7e96000000b0069f5701de09mr1821049otp.6.1680689558972; Wed, 05 Apr
 2023 03:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <87c7f659-387c-3e23-69c6-03e0c9820bab@amd.com>
 <ZCwoL3Wgv90tlQWR@DUT025-TGLU.fm.intel.com>
 <d740a81a-8919-b6c8-a8c1-f5d8f9c5549c@amd.com>
 <ZC0yq9XZ2t9cV0Nz@phenom.ffwll.local>
 <a2236a9d-e21a-269c-aad3-184c402065b7@amd.com>
 <ZC06Rl6TGe7itZvW@phenom.ffwll.local>
 <ec128743-699b-3722-0ab2-ff96552fdddd@amd.com>
In-Reply-To: <ec128743-699b-3722-0ab2-ff96552fdddd@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 5 Apr 2023 12:12:27 +0200
Message-ID: <CAKMK7uFEGoaOmewGmP4H_ouqZiMKAiaKwEohGCZq5T-UJYMf_w@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [RFC PATCH 00/10] Xe DRM scheduler and long running
 workload plans
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
Cc: robdclark@chromium.org, airlied@linux.ie, lina@asahilina.net,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 5 Apr 2023 at 11:57, Christian K=C3=B6nig <christian.koenig@amd.com=
> wrote:
>
> Am 05.04.23 um 11:07 schrieb Daniel Vetter:
> > [SNIP]
> >> I would approach it from the complete other side. This component here =
is a
> >> tool to decide what job should run next.
> >>
> >> How that is then signaled and run should not be part of the scheduler,=
 but
> >> another more higher level component.
> >>
> >> This way you also don't have a problem with not using DMA-fences as
> >> dependencies as well as constrains for running more jobs.
> > I think we're talking about two things here and mixing them up.
> >
> > For the dependencies I agree with you, and imo that higher level tool
> > should probably just be an on-demand submit thread in userspace for the
> > rare case where the kernel would need to sort out a dependency otherwis=
e
> > (due to running out of ringspace in the per-ctx ringbuffer).
> >
> > The other thing is the message passing stuff, and this is what I was
> > talking about above. This has nothing to do with handling dependencies,
> > but with talking to the gpu fw. Here the intel design issue is that the=
 fw
> > only provides a single queue, and it's in-order. Which means it
> > fundamentally has the stalling issue you describe as a point against a
> > message passing design. And fundamentally we need to be able to talk to
> > the fw in the scheduler ->run_job callback.
> >
> > The proposal here for the message passing part is that since it has the
> > stalling issue already anyway, and the scheduler needs to be involved
> > anyway, it makes sense to integrated this (as an optional thing, only f=
or
> > drivers which have this kind of fw interface) into the scheduler.
> > Otherwise you just end up with two layers for no reason and more ping-p=
ong
> > delay because the ->run_job needs to kick off the subordinate driver la=
yer
> > first. Note that for this case the optional message passing support in =
the
> > drm/scheduler actually makes things better, because it allows you to cu=
t
> > out one layer.
> >
> > Of course if a driver with better fw interface uses this message passin=
g
> > support, then that's bad. Hence the big warning in the kerneldoc.
>
> Well what I wanted to say is that if you design the dependency handling
> / scheduler properly you don't need the message passing through it.
>
> For example if the GPU scheduler component uses a work item to do it's
> handling instead of a kthread you could also let the driver specify the
> work queue where this work item is executed on.
>
> When you design it like this the driver specifies the thread context of
> execution for it's job. In other words it can specify a single threaded
> firmware work queue as well.
>
> When you then have other messages which needs to be passed to the
> firmware you can also use the same single threaded workqueue for this.
>
> Drivers which have a different firmware interface would just use one of
> the system work queues instead.
>
> This approach basically decouples the GPU scheduler component from the
> message passing functionality.

Hm I guess we've been talking past each another big time, because
that's really what I thought was under discussions? Essentially the
current rfc, but implementing with some polish.

iow I agree with you (I think at least).
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
