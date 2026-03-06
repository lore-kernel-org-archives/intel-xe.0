Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E1FF513F8
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 05:33:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB4A10E35D;
	Fri,  6 Mar 2026 05:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PJl/0rVm";
	dkim-atps=neutral
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com
 [74.125.224.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D093410E35D
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 05:33:48 +0000 (UTC)
Received: by mail-yx1-f50.google.com with SMTP id
 956f58d0204a3-64ae222d978so8432307d50.1
 for <intel-xe@lists.freedesktop.org>; Thu, 05 Mar 2026 21:33:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772775228; cv=none;
 d=google.com; s=arc-20240605;
 b=MX13nmUA8nBPX6MJKF9io6iHvgxQeJE3U8f1eUHfUsXMmxLuWIxTdTNgAeWMtgTto1
 C4oZPvFQeeRuquYV/YCP6unJj3CCNsslGpx9589AYyzi5WOtjTI63+p8eKxn4bV8PoTj
 OZ01Xma4dtVgH3W6H7yX+0jnQ96ICbNTUWKEEXT2q4C6OYpkRjjRZd4HoHUjRe9bY+Ol
 gwDkVtu0BmAKfBJlKMu2vydBWn0rCbl/ZNmxePz29jyJxe20tLTFvOiCerRK4X/kZtoH
 yZadc/GmtVIRgPhJrrEZHgNFwVtIlrE5Xc8NeSlbgV1YPkZYXqJUnn8nqiCBZLa2Kmwv
 ec7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=V2UpvAUsvEfYuRtRoQDGDh0bnP4CHYXvodHKQxJ2WGM=;
 fh=K8AMDgBpjYwjVH72fPgvYFfv8E7skCo9GqIETfKq+cg=;
 b=A+Mra20Vy1GKnvBcW+ns3FocAAhw1rraqNbO4XBGi0p9kwJtLkJBnFPaBVi5S1Ckm1
 i7EiYpywm15nUau/8QW/k8pwHMwZvH2QWFm7Z0h/VZpNPgkwYRgtjLVjB6a2zTqNvSg4
 yRlGgDK3+1FGMWHqHJSM3CSsGznxyhFOlfecGNz0ydF/t9dcc3tnDTqFKthdlRtbNjMn
 eIAhIjUZHOj301uD9YdpFbepib/z4JBYWDKn95gAlQHoNerlU2h3EynIja4YRVRaUuRk
 zM8fOj+Lr8hqqG1ZWzRo3wDOVij8s5W624DQjc3wlY3NgvoirJ0p5rVBflhD82ZHRqdf
 tEHQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772775228; x=1773380028; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V2UpvAUsvEfYuRtRoQDGDh0bnP4CHYXvodHKQxJ2WGM=;
 b=PJl/0rVmHl15YOPLCI7CpJw+pEZeyLIvSYafZn3AeF25GpLzipsBYLXDhj+Oj1BqUM
 cbIYgVKsfsRw2s5UXHFM2hezIeqhiBki2qpTuHwejCdlZgAe+/OS+OBqMVqVhU9vaRfc
 OFYJGIuzkHjY92kimvo12jwYSpACpJNeIXBpX9ETCc0hXyJ9YQtF5c0a6pvauRcgt2mf
 qUx9hsrdaphyDPx+zqGa2qB6FDQxFntfKPhWSoeHdPsRqjqiDcEvb1oM0dmfnxrhirD4
 cCmJ57p7b4a1MIyKVbnwiOvw4n0uhzclAK7Mobsy59mJCkNTR9/B6A5cVRkLTPco2j6A
 9Yfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772775228; x=1773380028;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=V2UpvAUsvEfYuRtRoQDGDh0bnP4CHYXvodHKQxJ2WGM=;
 b=NOVSNkJOo1XKEJ+4/+4cKUXMrBU+xpr0UWIci3nI0EOKuY0N44nDMIBBOKrgGtww79
 ESMKCwx7ZJnVRBxJKVbn6uU/yG9D3gArS/6cXfpFrt+gs41wIxO9IQhHcLOHiApak71A
 6Cqw4YWr9SGoHJGav7Fg2woGb2WLK6Ytj7k2/y0+yz/U5qGWOA+ubtQZ1cVaKixeibB4
 +T/XUUqIEkAjOFkQXOtTnCdhPK0Yyj+Z7Vb0A3/DUJhwNubKIU2p4MJrRP8mGresJyi3
 Yczi09zsD2p3w8LWwOYMhkcwvBbDWvqIbeIHAUtqKNcpirFPeVtbgeKFHZ4EfiRRPmVF
 PtzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf0tMzdkgwEX6cdBueMIxc3uKuj7/g07dU1yZsjIPxBl2JDN/l1zyCWDgTmSSk0qsFZbHuxO/tUw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyc4tikyxNXik+gwqSaw35K41RemfY6g4jsqBAT33uI+uSWlyIi
 ThPZLkydm9Gi59lAGevjJSinSAcHh7EBl22W9L5E75gN75raRrlj8kAVcg4H6bEuG4FSNfNhPmO
 KklvFd9lsuJELayTHnWagH6zGjlqZCKw=
X-Gm-Gg: ATEYQzyCnxm0R+49v18kSdIf0LniwdJ5nywBuUr61rsg9Tc3vV8FA95iA5ShlwgUg6l
 jVU992DCl16UPi+6IW+dONoUPpoofgDQYVDYDMS/OIXB2HtQvJjC2sCwyP4cTDHQYQK/jkUGs02
 CqVT8FPl8ZePh7N/5FN4lNUJ2N/dGqrHZV69EVQPuyrMWB10J8L2zsKyc3wKHoqUv73nEkGNk5P
 GQY0pGQg4Ts1K6neBsWXuBOR12RNf15Ct9NBZNYpDxoYmMvW2WdcqXgcMlVfrQLzLrsN63S5lBM
 tES796Uz5K0h+L45tvOm2s2VeGG6lIiA6josIcqAxDUTb59f7pfqwvi3PQGHfc38+cVXJ+X9
X-Received: by 2002:a05:690e:d8b:b0:645:51f9:b4c0 with SMTP id
 956f58d0204a3-64d142c7f8emr910092d50.55.1772775227810; Thu, 05 Mar 2026
 21:33:47 -0800 (PST)
MIME-Version: 1.0
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
 <20260305102323.11b07502@fedora>
In-Reply-To: <20260305102323.11b07502@fedora>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 5 Mar 2026 21:33:36 -0800
X-Gm-Features: AaiRm50YC-9v07WzvBVfdBZY8LWjXNT9ArNxjAeeDLekJ7if8LU8pLOoMu7WurY
Message-ID: <CAPaKu7R3t0Vz3WLg0G9aAVgmWhTGQWPKc6YHsH+2cRKnUjtqow@mail.gmail.com>
Subject: Re: drm_sched run_job and scheduling latency
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 intel-xe@lists.freedesktop.org, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, open list <linux-kernel@vger.kernel.org>
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

On Thu, Mar 5, 2026 at 1:23=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Wed, 4 Mar 2026 14:51:39 -0800
> Chia-I Wu <olvaffe@gmail.com> wrote:
>
> > Hi,
> >
> > Our system compositor (surfaceflinger on android) submits gpu jobs
> > from a SCHED_FIFO thread to an RT gpu queue. However, because
> > workqueue threads are SCHED_NORMAL, the scheduling latency from submit
> > to run_job can sometimes cause frame misses. We are seeing this on
> > panthor and xe, but the issue should be common to all drm_sched users.
> >
> > Using a WQ_HIGHPRI workqueue helps, but it is still not RT (and won't
> > meet future android requirements). It seems either workqueue needs to
> > gain RT support, or drm_sched needs to support kthread_worker.
> >
> > I know drm_sched switched from kthread_worker to workqueue for better
> > scaling when xe was introduced.
>
> Actually, it went from a plain kthread with open-coded "work" support to
> workqueues. The kthread_worker+kthread_work model looks closer to what
> workqueues provide, so transitioning drivers to it shouldn't be too
> hard. The scalability issue you mentioned (one thread per GPU context
> doesn't scale) doesn't apply, because we can pretty easily share the
> same kthread_worker for all drm_gpu_scheduler instances, just like we
> can share the same workqueue for all drm_gpu_scheduler instances today.
> Luckily, it seems that no one so far has been using
> WQ_PERCPU-workqueues, so that's one less thing we need to worry about.
> The last remaining drawback with a kthread_work[er] based solution is
> the fact workqueues can adjust the number of worker threads on demand
> based on the load. If we really need this flexibility (a non static
> number of threads per-prio level per-driver), that's something we'll
> have to add support for.
Wait, I thought this was the exact scaling issue that workqueue solved
for xe and panthor? We needed to execute run_jobs for N
drm_gpu_scheduler instances, where N is in total control of the
userspace. We didn't want to serialize the executions to a single
thread.

Granted, panthor holds a lock in its run_job callback and does not
benefit from a workqueue. I don't know how xe's run_job does though.

>
> For Panthor, the way I see it, we could start with one thread per-group
> priority, and then pick the worker thread to use at drm_sched_init()
> based on the group prio. If we need something with a thread pool, then
> drm_sched will have to know about those threads, and do some load
> balancing when queueing the works...
>
> Note that someone at Collabora is working on dynamic context priority
> support, meaning we'll have to be able to change the drm_gpu_scheduler
> kthread_worker at runtime.
>
> TLDR; All of this is doable, but it's more work (for us, DRM devs) than
> asking RT prio support to be added to workqueues.

It looks like WQ_RT was last brought up in

  https://lore.kernel.org/all/aPJdrqSiuijOcaPE@slm.duckdns.org/

Maybe adding some form of bring-your-own-worker-pool support to
workqueue will be acceptable?

>
> > But if drm_sched can support either
> > workqueue or kthread_worker during drm_sched_init, drivers can
> > selectively use kthread_worker only for RT gpu queues. And because
> > drivers require CAP_SYS_NICE for RT gpu queues, this should not cause
> > scaling issues.
>
> I think, whatever we choose to go for, we probably don't want to keep
> both models around, because that's going to be a pain to maintain.
