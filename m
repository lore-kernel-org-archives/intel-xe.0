Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1476FCA17B
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 18:56:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3932610E591;
	Mon,  9 Mar 2026 18:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="ups+boPH";
	dkim-atps=neutral
X-Greylist: delayed 537 seconds by postgrey-1.36 at gabe;
 Thu, 05 Mar 2026 08:47:24 UTC
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B892510EB9A
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 08:47:24 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fRNGm4XrCz9vHN;
 Thu,  5 Mar 2026 09:38:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1772699904; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RDdj3abi2vMGKdWjSOIxxSAL5D4KNz7XiIk0sO3UJ0o=;
 b=ups+boPHjHQ2P/4dIdpcVSQmrelz+aRL8XaXz56odHOk3J90+6cRU43ZLLgg/8CYdfMIF0
 pqUeaCBY20QTEjUrTz58i73NfHxtVzzULWeU9baBhT9GJrxvVq03vMDOHVzitEXgEUXTX4
 M+6pEFG8yShRUs6OOYev9l+pLYooZT1/9/hlghkbJFv6vqUQPzzZBNTNHbhL20SmSXcdc6
 T8AM3m1cEJr4XeeirK1OwLaipkKSu1XHvaYkHyNjTwgxNer7ll68N1XUv0UhwpGXdBDtKw
 f3V6D4lue/OlFJDd7qeCT/b8tm63qWcfuZ695qO0iZjJ4pqLaapRa7Zd+J2Dmw==
Message-ID: <fa4a9c55792b0e79d94faa82085b693aa7feb989.camel@mailbox.org>
Subject: Re: drm_sched run_job and scheduling latency
From: Philipp Stanner <phasta@mailbox.org>
To: Boris Brezillon <boris.brezillon@collabora.com>, Matthew Brost
 <matthew.brost@intel.com>
Cc: Chia-I Wu <olvaffe@gmail.com>, ML dri-devel
 <dri-devel@lists.freedesktop.org>, intel-xe@lists.freedesktop.org, Steven
 Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Danilo
 Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Thomas
 =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>,  open list <linux-kernel@vger.kernel.org>,
 tj@kernel.org
Date: Thu, 05 Mar 2026 09:38:16 +0100
In-Reply-To: <20260305092711.20069ca1@fedora>
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
 <aajkqXZDGUFPlq1o@lstrano-desk.jf.intel.com>
 <20260305092711.20069ca1@fedora>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 88a6adfc76d4be2c1c4
X-MBO-RS-META: y1d3c39qqy3z9obp43rittpxs8bgscsg
X-Mailman-Approved-At: Mon, 09 Mar 2026 18:55:56 +0000
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
Reply-To: phasta@kernel.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 2026-03-05 at 09:27 +0100, Boris Brezillon wrote:
> Hi Matthew,
>=20
> On Wed, 4 Mar 2026 18:04:25 -0800
> Matthew Brost <matthew.brost@intel.com> wrote:
>=20
> > On Wed, Mar 04, 2026 at 02:51:39PM -0800, Chia-I Wu wrote:
> > > Hi,
> > >=20
> > > Our system compositor (surfaceflinger on android) submits gpu jobs
> > > from a SCHED_FIFO thread to an RT gpu queue. However, because
> > > workqueue threads are SCHED_NORMAL, the scheduling latency from submi=
t
> > > to run_job can sometimes cause frame misses. We are seeing this on
> > > panthor and xe, but the issue should be common to all drm_sched users=
.
> > > =C2=A0=20
> >=20
> > I'm going to assume that since this is a compositor, you do not pass
> > input dependencies to the page-flip job. Is that correct?
> >=20
> > If so, I believe we could fairly easily build an opt-in DRM sched path
> > that directly calls run_job in the exec IOCTL context (I assume this is
> > SCHED_FIFO) if the job has no dependencies.
>=20
> I guess by ::run_job() you mean something slightly more involved that
> checks if:
>=20
> - other jobs are pending
> - enough credits (AKA ringbuf space) is available
> - and probably other stuff I forgot about
>=20
> >=20
> > This would likely break some of Xe=E2=80=99s submission-backend assumpt=
ions
> > around mutual exclusion and ordering based on the workqueue, but that
> > seems workable. I don=E2=80=99t know how the Panthor code is structured=
 or
> > whether they have similar issues.
>=20
> Honestly, I'm not thrilled by this fast-path/call-run_job-directly idea
> you're describing. There's just so many things we can forget that would
> lead to races/ordering issues that will end up being hard to trigger and
> debug.
>=20

+1

I'm not thrilled either. More like the opposite of thrilled actually.

Even if we could get that to work. This is more of a maintainability
issue.

The scheduler is full of insane performance hacks for this or that
driver. Lockless accesses, a special lockless queue only used by that
one party in the kernel (a lockless queue which is nowadays, after N
reworks, being used with a lock. Ah well).

In the past discussions Danilo and I made it clear that more major
features in _new_ patch series aimed at getting merged into drm/sched
must be preceded by cleanup work to address some of the scheduler's
major problems.

That's especially true if it's features aimed at performance buffs.



P.
