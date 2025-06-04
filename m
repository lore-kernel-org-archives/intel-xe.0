Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2B4C5B549
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 15:39:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6659210E0CA;
	Wed,  4 Jun 2025 15:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="B9NNkVoc";
	dkim-atps=neutral
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3021E10E0CA
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 15:39:16 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-2cca475546fso40466fac.1
 for <intel-xe@lists.freedesktop.org>; Wed, 04 Jun 2025 08:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1749051555; x=1749656355; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vb3GWhhu3ZBCZprFWhgLoxMfR20ZKec6Ip2QJZicS3o=;
 b=B9NNkVocIAf4UwprmgwflbmqrXdJD3tGqJUuNGjQKFqsdJkfQ2S4c3qGLuJi8UaBrx
 ZsgcSBsVauqbs1H5/Vlzy1QLxoMt9A9lxee1UFPkk+FgdObobciCzzRbDB+qISZTYbky
 M0fKPLd4iHv3XThLdBupGMvhGMHTuPu6f2vGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749051555; x=1749656355;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vb3GWhhu3ZBCZprFWhgLoxMfR20ZKec6Ip2QJZicS3o=;
 b=W32r/q+bU4r4LODzB8KJuSiBbxFO9juUafu//BHiRNdf5akElrAMOF/eiqYtnf6jLp
 xRjx80o2igtrdFl8GCjAI5PEJ2o7m6MjEqIDBJ3DNPdq3aC2glFKbIT9plMTpYO4dYpR
 O2ccDs12lXqFJ/+WxqSJTL6TFu4Lylqfef5Vu7glSMZLOT+5bzwLR8JYYIsoOHpuOxEh
 w98LLIOQLDhG45+C5IEjp1aR3O6yVJ3/mHdJV7Sfm6p86l4kf7gOVKHvfSxElpzL7GK9
 qQE+6IQWAgyzH3ELLQdoVYCD8L63cfZy541tW0mAeC5tpUWa5Wrso3L2gdiy6fIm4orW
 jMdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+IxPyb56UTAlW5hzoxDTOIBgJBmGwb7HEDT0bgPiFtYxuHyo8Vf5BcnCzoGVmh70TjKZz69Cn2g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvCOQ1VREIS1r3S3Qog2ZAZ3G/wPrWnvVb+VcRMUGj4WiqOdYi
 yzG/QQaDS6bqwDWJTVpez40Kc2AfQpZGSW+2oJg/N6sRiQw9LsoCYr9WXUbktFz62puvgJC8brj
 +L2qy2yA6DudrPaqK4eQw9bwpOVxd9Y6jwXQsWHxefA==
X-Gm-Gg: ASbGncvgGLhjCT/jdc6wLK/04MbmAPW5RK377xnNg8+BSyPIHKAxjhzGHJSIhyhZkaN
 bmD2TVOvQrIpxCfotqV1OUFY0SSraCIUipj4TQ+U1IGjtQYTT3OKZKey1qxjKf7yXY03x1jgt4c
 /iKMQ6nPPOEur8bGHliuV1zcDikg48cXbflHUf/GzLIuGsm0fE5PzefUEV7ObHBw==
X-Google-Smtp-Source: AGHT+IHXqkvchOjmH++z7P2gi0D2AxNxEq8Hx0aD7RnPt4/3JQUffF84QDKhI2oI2A8Zfl3vkTcR9tItEuVoREfZTdg=
X-Received: by 2002:a05:6870:e06:b0:2a3:832e:5492 with SMTP id
 586e51a60fabf-2e9bfbdf4d1mr1934318fac.25.1749051555264; Wed, 04 Jun 2025
 08:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <0e5a09490934b1332e13829c705af98026372300.camel@linux.intel.com>
 <aEBY9hLSlgNJM5GH@phenom.ffwll.local>
 <739ca984c2f60e5ddd5c06de1e435ac82ce66f57.camel@linux.intel.com>
In-Reply-To: <739ca984c2f60e5ddd5c06de1e435ac82ce66f57.camel@linux.intel.com>
From: Simona Vetter <simona.vetter@ffwll.ch>
Date: Wed, 4 Jun 2025 17:39:04 +0200
X-Gm-Features: AX0GCFuXEoS1co93a9paNnbOA5j0Mxe5qiBFwHgI0qDsdQ7BHXndYgaeVr4NIA8
Message-ID: <CAKMK7uEUSvcAA_by93-32De6UZM4sYeXgro2kZm8zmCPypRb_g@mail.gmail.com>
Subject: Re: VM madvise semantics
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
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

On Wed, 4 Jun 2025 at 17:30, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> On Wed, 2025-06-04 at 16:32 +0200, Simona Vetter wrote:
> > On Wed, Jun 04, 2025 at 02:57:50PM +0200, Thomas Hellstr=C3=B6m wrote:
> > > Hi!
> > >
> > > I'm starting an email thread to move forward the questions Himal
> > > had on
> > > the madvise semantics:
> > >
> > > 1) Whether to support an array of ops?
> > >
> > > IMO the VM_BIND implementation got very complicated due to this and
> > > the
> > > needed rollback support. Perhaps due to single op splitting turning
> > > to
> > > multiple ops it would've been hard to avoid that. Can we avoid
> > > supporting an array of ops for madvise? If so I'd vote for single
> > > op.
> >
> > Just seen this fly by and wondering why you even want rollback
> > support?
> >
> > Looking at core mm and the various m* syscalls that manipulate vma,
> > they
> > just bail out if things fail halfway through. Or at least don't make
> > any
> > guarantees, userspace gets to keep the pieces.
> >
> > And I think that's the semantics we want, because making global
> > promises
> > around rollback means we need atomicity, which means fine-grained
> > locking
> > is out. And that doesn't sound like the right way to design this
> > stuff to
> > me?
> >
> > Or is there some userspace requirement that wants rollback for some
> > strange reason?
>
> So the rollback was in the context of submitting an array of multiple
> VM_BINDs in a single IOCTL, and the nth one failed. That makes it
> troublesome for user-space to recover. And in particular in the
> situation where there was a signal delivery and the IOCTL is supposed
> to be restartable without any user-space-modification of the arguments.
>
> At that time after long discussions and looking at how, for example the
> write() syscall behaves, when -EINTR happens, no write is done and the
> syscall can be restarted from scratch. Following that we decided that
> if that multiple-bind hit an -EINTR, we'd need to roll back, and since
> we already had a rollback we'd do the same for all errors. IIRC
> blocking signals wasn't an option. But agreed this puts us in a
> situation where fine-grained locking is out with that interface, at
> least with multiple binds or ops that generate multiple sub-operations.

Hm yeah signal restarting sounds like a good reason to make this
support rollback. Or I guess, even more reasons to design the
interface so that rollback doesn't become nasty.

I guess one other option would be to make madvise strictly idempotent,
at that point you don't need to roll back for signals. It's just a bit
of duplicated work on restarting the ioctl.

> So my suggestion here is to avoid the array for madvise, also avoiding
> rollbacks if possible.

Makes sense.
-Sima

>
> /Thomas
>
>
>
> >
> > Cheers, Sima
> >
> > > 2) Purgeability. If it's not implemented yet we shouldn't merge an
> > > uapi
> > > for it, but ensure that it would at least be possible moving
> > > forward.
> > >
> > > 3) Multi-device. In the spirit of the above I guess it makes sense
> > > if
> > > UMD wants to select between VRAM and SRAM now to merge an interface
> > > that supports *only* that. When we add multi-device support we
> > > could
> > > perhaps add another op, or an extension to support agreed multi-
> > > device
> > > semantics. Even if this means rolling back to Himal's original
> > > suggestion of a preferred placement UAPI.
> > >
> > > Thoughts?
> > >
> > > Thomas
> > >
> >
>


--=20
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
