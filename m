Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B869BF30928
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 09:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7215F10EBDF;
	Thu,  5 Mar 2026 09:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="IPW7FywE";
	dkim-atps=neutral
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45BB10EBDD;
 Thu,  5 Mar 2026 09:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1772703643;
 bh=AG3zi0GqfQdIiR3lqgjiGFYrK5n2iknfqkOzwnEorc4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IPW7FywEHHj134be+ZncMhwq3jWRdDZBXKAetxFa8DutX4qE1Lbc/OOQFGuOZKehS
 l2JK25QRo3UPYCSyUqwy67MJYzlBtoI3p/qgjqNwBKS6bUJTdDPMYpOXrjJEdfKs/k
 yNDBd5iimBv/Z9WI1+E/9zvicHYr9A1bL20AWHKE+3lCQRr9/+UIfxJdRdK6zALEBb
 TAL1qaOs/xC+hrfZQChIjINS3pxrexR1pp0/JEoUWDdVr2ab4tyh7iPfsQ0SNQrf52
 QhW993v0k7eDFBsoePbDBwbXt5YSnq2PhWsjDuCrtBwe3ywAVIc/ASWYM80NSTTSI9
 fWwimI9vA+FBQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AA31517E0D04;
 Thu,  5 Mar 2026 10:40:42 +0100 (CET)
Date: Thu, 5 Mar 2026 10:40:37 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Chia-I Wu <olvaffe@gmail.com>, ML dri-devel
 <dri-devel@lists.freedesktop.org>, intel-xe@lists.freedesktop.org, Steven
 Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthew Brost
 <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, Philipp
 Stanner <phasta@kernel.org>, Christian =?UTF-8?B?S8O2bmln?=
 <ckoenig.leichtzumerken@gmail.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: drm_sched run_job and scheduling latency
Message-ID: <20260305104037.281991a8@fedora>
In-Reply-To: <bbe1f0bc-60df-4930-b9ea-ab98747ea807@ursulin.net>
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
 <bbe1f0bc-60df-4930-b9ea-ab98747ea807@ursulin.net>
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

Hi Tvrtko,

On Thu, 5 Mar 2026 08:35:33 +0000
Tvrtko Ursulin <tursulin@ursulin.net> wrote:

> On 04/03/2026 22:51, Chia-I Wu wrote:
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
> 
>  From a plain kthread actually.

Oops, sorry, I hadn't seen your reply before posting mine. I basically
said the same.

> Anyway, I suggested trying the 
> kthread_worker approach a few times in the past but never got round 
> implementing it. Not dual paths but simply replacing the workqueues with 
> kthread_workers.
> 
> What is your thinking regarding how would the priority be configured? In 
> terms of the default and mechanism to select a higher priority 
> scheduling class.

If we follow the same model that exists today, where the
workqueue can be passed at drm_sched_init() time, it becomes the
driver's responsibility to create a worker of his own with the right
prio set (using sched_setscheduler()). There's still the case where the
worker is NULL, in which case the drm_sched code can probably create
his own worker and leave it with the default prio, just like existed
before the transition to workqueues.

It's a whole different story if you want to deal with worker pools and
do some load balancing though...

Regards,

Boris
