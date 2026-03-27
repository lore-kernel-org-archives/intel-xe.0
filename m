Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A70610BA45D
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 09:19:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C0D10E342;
	Fri, 27 Mar 2026 09:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="LEKvG0mK";
	dkim-atps=neutral
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9962D10E342
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 09:19:42 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-43b98652f05so784981f8f.1
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 02:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1774603181; x=1775207981; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c2vYWUohPsts5c14vEaE9Au9ObEgy7+UMmOkW/ZgtuQ=;
 b=LEKvG0mKbFs4JkUSDCqtSYblDt5WjcvlS49DdlFLev+vGEzaaZ1HBAKo3BNQ8rqUx1
 V0pTV3H8X1PUCCbloCFph7tsxGcGqsyfTFBMHpDo9W9jhiBY6fOqjg8Fp2L5E9+m9AQl
 snkl+OlpNoNG2nHin5fsAPufsdz+zX6Iv+p+BWZ885OVyxnHf7RiGalf8Mv2kt3EgIHD
 5dsWkMTV4pDBehiyYjTqgZ7rTYNC301kdQxfZ1hKMV20XtWai3A2wmI1iWY6yX/C4pzG
 o3tcpTMpK/ttsu69jyuZzfBvuI5/oZNTRbjGvwXVH4gm0SqdFuQ1rqp4CAsrtlZ2zsKz
 Ol5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774603181; x=1775207981;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c2vYWUohPsts5c14vEaE9Au9ObEgy7+UMmOkW/ZgtuQ=;
 b=nYIihGyIW+Ltbl3IVG2Ko8+SghHo0lMb0I0j+VpB8IPB5SISP6PPHjDLuoif8ZRiVP
 yH5+x5hH0fx27BjQEIVU+MB0QmVgaWrDzangYsHs4UO++y6aoY4l/2t51rwCuP+K2J+P
 Zig2DBKlEMxlRbbjN8414Anh4DLErtvOogWTWmzAkABuDgRvRPMLEILsDNYs2w/0WHk9
 A8jtEfI7jrgU36tydPo04eWboP9kI1NdaKWXY41JksgkDvWREkaUqk3IXRk+krvDg8v2
 mFPcLaokU/JCJAlIQK0wuW1x3qpTq0FQHTLdgYbUgKPkrDZG529UmXOIq1cFwO4+ZSYe
 SW8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi5fc84OGcwP+XwYTW8yKFrfGP341laVjs5P7JHev/YfOWzeA0W1m83bGR2oFysJ+og5MPjJp0Ug==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9lyobZ3fGqC5tJ+dy5TE3krHc45eWs9NqFMET/hXQRV2lCJ1o
 9eRDzbJqYsjc7eC/M3sZRAAgMgxne2H8S8p7kB/kL6JgB8Br5th54qvaV9Zd7KubbpM=
X-Gm-Gg: ATEYQzz2QA1yYaOE3JHZucIL+Ro0sD8PlU+aSFuMUusWiK7aICu5QZNq5GhOXUywSRq
 Zuv0i5DTtqSc1nuKNX1AIGIxWO6u9KjHbiz8NrOQA5pjCm1o8oqYrO1N/XpgSe1JHCUnV0zrheB
 UGow4AAyMAnZ3RLFBYf0RM0QZZPqG5ws013YFIzdpaV1lQcFIigiGIYvhAOzvz/LxiuSuE7yrSE
 y07GR2xoL+bXuaTEXHKxbtnkYdid41Xna5tveH8d6UNyrcNubmRmoB1oGd4dH2hKG0SdXnMnr5l
 l80pyFHMJh5xayKEruyMGNBcBg6YwzKuF+U60G0SXAq2lpyZOOT/GlHMgnOO8awilTyXQMck8EU
 mnbjumqUNiE6EOIrZ8SFbjzdybOd77vWoG0LwYaw3X3gN427g96IyNGN3EZHOvBFZtSEYsTC6ZD
 wBetGTm7qciToEL0k1wt6CLjUdftqpSpAH+vlYa/Vw84d+R8Wx2hjgxFc=
X-Received: by 2002:a05:6000:26c2:b0:43b:45a0:9df8 with SMTP id
 ffacd0b85a97d-43b9ea46af1mr2429877f8f.35.1774603180996; 
 Fri, 27 Mar 2026 02:19:40 -0700 (PDT)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b91942e52sm13533531f8f.9.2026.03.27.02.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2026 02:19:40 -0700 (PDT)
Message-ID: <a10bba8a-f8dc-4387-96d3-b0af0dab2fbf@ursulin.net>
Date: Fri, 27 Mar 2026 09:19:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm_sched run_job and scheduling latency
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Chia-I Wu <olvaffe@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 intel-xe@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 open list <linux-kernel@vger.kernel.org>
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
 <bbe1f0bc-60df-4930-b9ea-ab98747ea807@ursulin.net>
 <20260305104037.281991a8@fedora>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260305104037.281991a8@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 05/03/2026 09:40, Boris Brezillon wrote:
> Hi Tvrtko,
> 
> On Thu, 5 Mar 2026 08:35:33 +0000
> Tvrtko Ursulin <tursulin@ursulin.net> wrote:
> 
>> On 04/03/2026 22:51, Chia-I Wu wrote:
>>> Hi,
>>>
>>> Our system compositor (surfaceflinger on android) submits gpu jobs
>>> from a SCHED_FIFO thread to an RT gpu queue. However, because
>>> workqueue threads are SCHED_NORMAL, the scheduling latency from submit
>>> to run_job can sometimes cause frame misses. We are seeing this on
>>> panthor and xe, but the issue should be common to all drm_sched users.
>>>
>>> Using a WQ_HIGHPRI workqueue helps, but it is still not RT (and won't
>>> meet future android requirements). It seems either workqueue needs to
>>> gain RT support, or drm_sched needs to support kthread_worker.
>>>
>>> I know drm_sched switched from kthread_worker to workqueue for better
>>
>>   From a plain kthread actually.
> 
> Oops, sorry, I hadn't seen your reply before posting mine. I basically
> said the same.
> 
>> Anyway, I suggested trying the
>> kthread_worker approach a few times in the past but never got round
>> implementing it. Not dual paths but simply replacing the workqueues with
>> kthread_workers.
>>
>> What is your thinking regarding how would the priority be configured? In
>> terms of the default and mechanism to select a higher priority
>> scheduling class.
> 
> If we follow the same model that exists today, where the
> workqueue can be passed at drm_sched_init() time, it becomes the
> driver's responsibility to create a worker of his own with the right
> prio set (using sched_setscheduler()). There's still the case where the
> worker is NULL, in which case the drm_sched code can probably create
> his own worker and leave it with the default prio, just like existed
> before the transition to workqueues.
> 
> It's a whole different story if you want to deal with worker pools and
> do some load balancing though...

I prototyped this in xe in the mean time and it is looking plausible 
that latency can be significantly reduced.

First to say that I did not go as far as worker pools because at the 
moment I don't see an use case for it. At least not for xe.

When 1:1 entity to scheduler drivers appeared kthreads were undesirable 
just because they were ending up with effectively unbound number of 
kernel threads. There was no benefit to that but only downsides. 
Workqueues were good since they manage the thread pool under the hood, 
but it is just a handy coincidence, the design still misses to express 
the optimal number of CPU threads required to feed a GPU engine. For 
example with xe, if there was a 4096 CPU machine with 4096 user contexts 
feeding to the same GPU engine, the optimal number of CPU threads to 
feed it is really more like one rather than how much wq management 
decided to run in parallel. They all end up hammering on the same lock 
to let the firmware know there is something to schedule.

For this reason in my prototype I create kthread_worker per hardware 
execution engine. (For xe even that could potentially be too much, maybe 
I should even try one kthread_worker per GuC CT.)

This creates a requirement for 1:1 drivers to not use the "worker" 
auto-create mode of the DRM scheduler so TBD if that is okay.

Anyway, onto the numbers. Well actually first onto a benchmark I hacked 
up.. I took xe_blt from IGT and modified it heavily to be more 
reasonable. What it essentially does it emits a constant stream of 
synchronous blit operations and measures the variance of the time each 
took to complete, as observed by the submitting process. In parallel it 
spawns a number of CPU hog threads to oversubscribe the system. And it 
can run the submitting thread at either normal priority, re-niced to -1, 
or at SCHED_FIFO. This is to simulate a typical compositor use case.

Now onto the numbers.

			normal	nice	FIFO
wq			100%	76%	1%
kthread_worker		100%	73%	1.2%
  └─relative to wq:	50.5%	48.5%	58.9%

Median "jitter" (variance in observed job submissions) is normalised and 
shows how changing the CPU priority changes the jitter observed by the 
submission thread. First two rows are the current wq implementation and 
the kthread_worker conversion. They show scaling as roughly similar.

Third row are the kworker_thread results normalised against wq. And that 
shows roughly twice as low jitter. So a meaningful improvement.

Then I went a step further to even better address the analysis of a 
problem done by Chia-I, solving the priority inversion problem. That is 
to loosely track CPU priorities of the currently active entities 
submitting to each scheduler (and in turn kthread_worker). This in turn 
further improved the latency numbers for the SCHED_FIFO case, albeit 
there is a strange anomaly with re-nice which I will come to later. It 
looks like this:

			normal	nice	FIFO
kworker_follow_prio	100%	277%	0.66%
  └─relative to wq:	60%	222%	37.8%

This effectively means that with a SCHED_FIFO compositor the submission 
round-trip latency could be around a third of what the current scheduler 
can do.

Now the re-nice anomaly.. This is something I am yet to investigate. 
Issue may be related to what I said the kthread_workers loosely track 
the submission thread priority. Loosely meaning if they detect negative 
nice they do not follow the exact nice level but go minium nice, while 
my test program was using the least minimum nice level (-19 vs -1). 
Perhaps that causes some strange effect in the CPU scheduler. I do not 
know yet but it is very interesting that it appears repeatable.

It is also important to view my numbers as with some margin of error. I 
have tried to remove the effect of intel_pstate, CPU turbo, and thermal 
management to a large extent, but I do not think I fully succeeded yet. 
There may be some +/- of 5% or so in the results is my gut feeling.

Also important to say is that the prototype depends on my other DRM 
scheduler series (the fair scheduler one), since I needed the nicer 
sched_rq abstraction with better tracking of active entities to 
implement priority inheritance, so I am unlikely to post it all as RFC 
since Philipp would possible get a heart attack if I did. :)

To close, I think this is interesting to check out further and could 
look at converting panthor next and then we could run more experiments.

Regards,

Tvrtko

