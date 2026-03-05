Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7070EEF8FE4
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 09:23:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EB810E232;
	Thu,  5 Mar 2026 09:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qm+fiCR9";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAC910E232;
 Thu,  5 Mar 2026 09:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1772702608;
 bh=Ki1zVcYJ+mzYJDk+kei7X/o0OMDo+DvaNn5OepBl0Rs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qm+fiCR99LRkewwr6iIpIzgdRQ8YnxeAFtnwrxL7r/Sma4xtfUfo39yhh+PCTwWLZ
 dmqqG7rywTXyeL/Pe3TRwuA3e239cJMRX0CqWSNTXianAV6hETPfNomWIYF4piJtr2
 KX2WAuMaAJO/UDeaGFlsAUIyVsouHOii4VkLdy1cFR+YBvVZJogtWmGUU/XSVkvNGC
 ATuhv8JqzpzRGsO/acLjaF2RCKtzJxOvhH7kk7TDM58LvB0c5GZbwSzVy9m4CWUgOZ
 lnr8azdsiyEEPpAviR7SJQBzOI24m3VS6e6wpKNVL1TkxiuS1iXvfPfnlw4IUZX2tz
 yjyyCpNEdwvUA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 92C1B17E0D98;
 Thu,  5 Mar 2026 10:23:27 +0100 (CET)
Date: Thu, 5 Mar 2026 10:23:23 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 intel-xe@lists.freedesktop.org, Steven Price <steven.price@arm.com>, Liviu
 Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>, Thomas
 =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, open list <linux-kernel@vger.kernel.org>
Subject: Re: drm_sched run_job and scheduling latency
Message-ID: <20260305102323.11b07502@fedora>
In-Reply-To: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 4 Mar 2026 14:51:39 -0800
Chia-I Wu <olvaffe@gmail.com> wrote:

> Hi,
> 
> Our system compositor (surfaceflinger on android) submits gpu jobs
> from a SCHED_FIFO thread to an RT gpu queue. However, because
> workqueue threads are SCHED_NORMAL, the scheduling latency from submit
> to run_job can sometimes cause frame misses. We are seeing this on
> panthor and xe, but the issue should be common to all drm_sched users.
> 
> Using a WQ_HIGHPRI workqueue helps, but it is still not RT (and won't
> meet future android requirements). It seems either workqueue needs to
> gain RT support, or drm_sched needs to support kthread_worker.
> 
> I know drm_sched switched from kthread_worker to workqueue for better
> scaling when xe was introduced.

Actually, it went from a plain kthread with open-coded "work" support to
workqueues. The kthread_worker+kthread_work model looks closer to what
workqueues provide, so transitioning drivers to it shouldn't be too
hard. The scalability issue you mentioned (one thread per GPU context
doesn't scale) doesn't apply, because we can pretty easily share the
same kthread_worker for all drm_gpu_scheduler instances, just like we
can share the same workqueue for all drm_gpu_scheduler instances today.
Luckily, it seems that no one so far has been using
WQ_PERCPU-workqueues, so that's one less thing we need to worry about.
The last remaining drawback with a kthread_work[er] based solution is
the fact workqueues can adjust the number of worker threads on demand
based on the load. If we really need this flexibility (a non static
number of threads per-prio level per-driver), that's something we'll
have to add support for.

For Panthor, the way I see it, we could start with one thread per-group
priority, and then pick the worker thread to use at drm_sched_init()
based on the group prio. If we need something with a thread pool, then
drm_sched will have to know about those threads, and do some load
balancing when queueing the works...

Note that someone at Collabora is working on dynamic context priority
support, meaning we'll have to be able to change the drm_gpu_scheduler
kthread_worker at runtime.

TLDR; All of this is doable, but it's more work (for us, DRM devs) than
asking RT prio support to be added to workqueues.

> But if drm_sched can support either
> workqueue or kthread_worker during drm_sched_init, drivers can
> selectively use kthread_worker only for RT gpu queues. And because
> drivers require CAP_SYS_NICE for RT gpu queues, this should not cause
> scaling issues.

I think, whatever we choose to go for, we probably don't want to keep
both models around, because that's going to be a pain to maintain.
