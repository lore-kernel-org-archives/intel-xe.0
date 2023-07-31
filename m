Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AE6C001DE
	for <intel-xe@archiver.kernel.org>; Mon, 31 Jul 2023 07:26:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3195A10E1B4;
	Mon, 31 Jul 2023 07:26:51 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC2910E1B4;
 Mon, 31 Jul 2023 07:26:49 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id ECA5E6600864;
 Mon, 31 Jul 2023 08:26:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690788408;
 bh=Dl0D4otBmCPm0beV9BP4LbGNhdrng4k1uCVDAzbYi1g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=c6Vi0O4DqwvzxWERDfTrKI/oG9A+ef604d707689jOlswgDGcqBpC68fo4ezPP/SX
 jbJv4+0tUbEVoGs+rkP5utWuyGvE54Rlbt9caisfGJFF3qkwpus6lQflXlZRSVljmy
 9PLPrmypdL0q1XRMasMrJXxCDOyfXtjaSprtMx5t3ksFV+bee4v2YoZgpWkxQZS4/T
 37162DHzh1WtBpifHYAcT96O4yHAZHPRSjwEaJbH2Y/rZ9K94w2z9k+k25h4Qah+aE
 FccvWmj4yJkAYY8P1YBB/R9dhQ4NCsfFOItP8BdLBToeZqJ2dticpmUvHWM6zbQDfd
 SoGHur9Pu1V7w==
Date: Mon, 31 Jul 2023 09:26:45 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20230731092645.4faf7048@collabora.com>
In-Reply-To: <ZMcHy4I/KNyZ2Q8k@DUT025-TGLU.fm.intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-7-matthew.brost@intel.com>
 <de3c70a2-1831-be00-0df3-4b8d6c593373@amd.com>
 <ZMcHy4I/KNyZ2Q8k@DUT025-TGLU.fm.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [RFC PATCH 06/10] drm/sched: Submit job before
 starting TDR
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
Cc: robdclark@chromium.org, Sarah Walker <sarah.walker@imgtec.com>,
 airlied@linux.ie, lina@asahilina.net, Frank Binns <Frank.Binns@imgtec.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Luben Tuikov <luben.tuikov@amd.com>, Donald Robson <Donald.Robson@imgtec.com>,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

+the PVR devs

On Mon, 31 Jul 2023 01:00:59 +0000
Matthew Brost <matthew.brost@intel.com> wrote:

> On Thu, May 04, 2023 at 01:23:05AM -0400, Luben Tuikov wrote:
> > On 2023-04-03 20:22, Matthew Brost wrote:  
> > > If the TDR is set to a value, it can fire before a job is submitted in
> > > drm_sched_main. The job should be always be submitted before the TDR
> > > fires, fix this ordering.
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/scheduler/sched_main.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > index 6ae710017024..4eac02d212c1 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -1150,10 +1150,10 @@ static void drm_sched_main(struct work_struct *w)
> > >  		s_fence = sched_job->s_fence;
> > >  
> > >  		atomic_inc(&sched->hw_rq_count);
> > > -		drm_sched_job_begin(sched_job);
> > >  
> > >  		trace_drm_run_job(sched_job, entity);
> > >  		fence = sched->ops->run_job(sched_job);
> > > +		drm_sched_job_begin(sched_job);
> > >  		complete_all(&entity->entity_idle);
> > >  		drm_sched_fence_scheduled(s_fence);
> > >    
> > 
> > Not sure if this is correct. In drm_sched_job_begin() we add the job to the "pending_list"
> > (meaning it is pending execution in the hardware) and we also start a timeout timer. Both
> > of those should be started before the job is given to the hardware.
> >   
> 
> The correct solution is probably add to pending list before run_job()
> and kick TDR after run_job().

This would make the PVR driver simpler too. Right now, the driver
iterates over the pending job list to signal jobs done_fences, but
there's a race between the interrupt handler (that's iterating over
this list to signal fences) and the drm_sched logic (that's inserting
the job in the pending_list after run_job() returns). The race is taken
care of with an addition field that's pointing to the last submitted
job [1], but if we can get rid of that logic, that's for the best.

[1]https://gitlab.freedesktop.org/frankbinns/powervr/-/blob/powervr-next/drivers/gpu/drm/imagination/pvr_queue.h#L119
