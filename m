Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016C1CD98F0
	for <intel-xe@archiver.kernel.org>; Sun, 21 Jun 2026 23:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2DF10E0B7;
	Sun, 21 Jun 2026 23:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gZoeN74r";
	dkim-atps=neutral
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C281D10E0B7
 for <intel-xe@lists.freedesktop.org>; Sun, 21 Jun 2026 23:21:21 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-915aa0a9293so516202385a.1
 for <intel-xe@lists.freedesktop.org>; Sun, 21 Jun 2026 16:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782084080; cv=none;
 d=google.com; s=arc-20240605;
 b=UCdMh1HgugAAEdaU7qxBKXR29YLcEPmVKqvw0xFj4Ts61CuGcIN1bMpBEQFhmKJPPk
 L8WD6lT8O9DTUuybPB0OfpqIptdq09HAJ7weUHshZwz3r/tiy/ONrDyAW9TFH0WWgvuS
 xAaNFkgHmC6ZlbEgl3T9bIkhebVcEDPaDpcXiD6P3DIF+GKg8alNmbjlEeWCh57cPUAN
 Ab/slk9Flr9riiEAr1IF7uYv2LEgMim0K3mRxE+gES+ica7yDJBSzbpnX1hDrn5ZL9L6
 MGGfdniFPZ3KR1B0hjf/WUwzBFB1RSy2K2qXFl51L4Q34GhBaLNzJEBU1tCRuUsZW3VL
 ZJEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=hxi8pAd5fXbOtgwDNhDucP856vxJgDI8S86xqAbImM4=;
 fh=QPOHx8M/5caK0wLTfLtN6Oy50iKdh17worW9dwBmovs=;
 b=TnLpuvVdoETWrGaKAiBJ633NIOBXsSWEIH2sasbR34+rxrZON8Q5nEOxqDlR56gVaR
 sD0xB42pF7Qx7SSt+0CUEMn/7rD44SvD8srKOAf/pXiIMVyjqM/X5gyslir01flwMYn8
 Mi5CJEw8yz4MdNpsTOlM5vyYy5OL/mXRpgchijMwWeuHS97/64pY5/Rg0MlAT4NLfwG1
 rfXsag1hXVaDutZDD3KSSN4gZ0fNatGS9s6wtbQz03oNSTm1hK3iFpR8axdfjj020eRS
 nRLDNAMiuyZ7rffXJW4cN29gELO7RqMduFFBzp9pruyMoRESH7/iinanyKfPmPa1+CT/
 EemA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782084080; x=1782688880; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hxi8pAd5fXbOtgwDNhDucP856vxJgDI8S86xqAbImM4=;
 b=gZoeN74rgR4YH2r/4d9OSEMUnaDsmehqyvAKy6vW5Z9CgPLNkUcLbRGljqjvXpyc6T
 NicoCOeCUr/euYuCNuG10uAdPS5ZtusMZlr/9fr5K0yKq5TLZ+DKq044iYU9oPVAcnCo
 wgIcDLhk5GCSY4yHkDlNbMGqO11XUrlH78uiMZVszZ+v65uHHc+BPIdAwRJ0uang25N1
 qbHzVvpGYAgjjYeddYaPbJlhaLMthd+AtmCZNCZ1OPpckg+5zl2ybfSvEyAWMsKAb9iu
 sfGu6zVPAovKY5PXfgl7kjpjD9PzQupxJEoj1cryadT7Zgh29LWiaWlrBB0uWSyKmyBH
 tEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782084080; x=1782688880;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hxi8pAd5fXbOtgwDNhDucP856vxJgDI8S86xqAbImM4=;
 b=QDb0BZR6PN0JAmXgT8kwFpcZbLUI/oD70FsMWJvk4bh+HCKDGjCzW7a2mBaIRbe17Z
 G3zEGuA3Ic0zwxo0ZxeKszRaQIyw33miCsHMSVLVK23OiC6kLmHSfUaeeCMVtQa6FJZU
 gb8+nClSHCkLw5DzQyEZoo5M6aKZ7QCiQ6ccnLkIlvL0GEh1Ax2KJX5RPTq+KRGR4/Vu
 pAXcNN0amshUKhw5TdLJYCvLFGySx+nLeosjFZurUXDpNJtBqgGaw4LLnFE+qffL8n5Q
 F5j9XimZkHH/9/iamFjpQ70EvZamkUs+NJbAZFUhkF469DpwULtXodrPTLY0sPpxNjBj
 jfPQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8SVnxvQkHFzlAIz05JbjOvLJfhYLKdswyS5OuOREiqENW1SgVp4lkOuHfSFjIGyN1mvvAsPlv/8Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9Vr8flC74y+sr1YzcCL9voO58HRk3rXZqPSaqLg/vAqUgffDL
 KmF7SselKaz39s28JIVEC2yLb56UUy4vZrJVz58EPmY+IIViKLGUJOXL/bQaeyIGCaOYwu+C/09
 g1EcyFmmsMyVWvmQlFe3jw/WV+f2gcb4=
X-Gm-Gg: AfdE7ckJkBmeHuhbaWMgnpgx6RwJFJFKcbfNgDyrYk+4a7uN1zAjqrOUXAxveA6SBft
 /7lGMcktOQznW+/m+qbTOd0VEaW/68ewEI7OnqWHP4lkN3Aiyq2uMtwdriKYurQ1aW0rFMtohTY
 laJCEFMpVdhG5jKEXmLSE9MWcHA3fjFnkpiYVn6B2MS3Rs+Ov5VRjUjeQod7chy0ILXr2AhQzFF
 EcVaxvGE9wK5GaMZMvaBdnkjKjCAldU+iJaKHIFW67tIOdfatHeAVtv4xKh6VQhuLXErKht3Ebw
 PPEVpAlocYc9+3UorBuUZ//TAVkctzm7t9lNnrisTzVI8ouJMfiI2ZR45gYvII7/9FZ962MQqJe
 VPtjW+KNqnZwxFg4=
X-Received: by 2002:a05:620a:4053:b0:915:5216:e5bf with SMTP id
 af79cd13be357-9208c625028mr1587487185a.22.1782084080570; Sun, 21 Jun 2026
 16:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <ajLy2brwvOZEFNNN@gsse-cloud1.jf.intel.com>
 <ajL++rKbSpYgBRw6@gsse-cloud1.jf.intel.com>
In-Reply-To: <ajL++rKbSpYgBRw6@gsse-cloud1.jf.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 22 Jun 2026 09:21:08 +1000
X-Gm-Features: AVVi8Cf985BzLxOdD7bf0TqUBm8eXlIQywh3agTZ7zRl3Lbgw2eToWnB5a8jug8
Message-ID: <CAPM=9tzO2Cg2e5BRQrvwtX08pmaq+hOvBb=BuYWQ0beLyoU5uw@mail.gmail.com>
Subject: Re: [PULL] drm-xe-next-fixes
To: Matthew Brost <matthew.brost@intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dim-tools@lists.freedesktop.org
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

On Thu, 18 Jun 2026 at 06:09, Matthew Brost <matthew.brost@intel.com> wrote=
:
>
> On Wed, Jun 17, 2026 at 12:17:45PM -0700, Matthew Brost wrote:
> > Hi Dave, Sima,
> >
> > Here are drm-xe-next-fixes for 7.2.
> >
> > Matt
> >
> > drm-xe-next-fixes-2026-06-17:
> > The following changes since commit 52d4ab1ca790a668cc8f2c27017138b1c467=
168c:
> >
>
> Rodrigo pointed out that I omitted the summary here...
>
> The changes we have are:
>
> - Set TTM beneficial order to 9 in Xe
> - Several error path cleanups
> - Fix TDR for unstarted jobs on kernel queues
> - Several TLB invalidation fixes related to suspending LR queues
> - Some small RAS fixes
> - Multi-queue suspend fix for LR queues
> - Revert inclusion of NVL_S firmware
>
> I also generated this PR using the following command, though I=E2=80=99m =
not sure it matters:
> dim pull-request drm-xe-next-fixes origin/master
>
> Rather than:
> dim pull-request drm-xe-next-fixes drm/drm-next
>
> Given these issues, please let me know if a regenerated PR would be prefe=
rred.

All good, I checked the changes and edited the commit msg to add the change=
log.

Dave.
