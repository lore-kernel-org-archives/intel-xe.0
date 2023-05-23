Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59B2C7EE23
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 13:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF3510E440;
	Tue, 23 May 2023 13:04:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A69310E43F
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 13:04:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EC6856321B;
 Tue, 23 May 2023 13:04:14 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 1383CC433EF;
 Tue, 23 May 2023 13:04:12 +0000 (UTC)
Date: Tue, 23 May 2023 09:04:08 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZGy5yFMJdo511ljs@rdvivi-mobl4>
References: <20230523094727.162266-1-matthew.auld@intel.com>
 <20230523094727.162266-6-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230523094727.162266-6-matthew.auld@intel.com>
Subject: Re: [Intel-xe] [PATCH v9 6/8] drm/xe/ct: drop mem_access_get from
 g2h_worker_func()
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 23, 2023 at 10:47:25AM +0100, Matthew Auld wrote:
> In the next patch we track the current task executing the runtime_pm
> callbacks, if any, in order to prevent the runtime_pm code waiting for
> itself and deadlocking when called from the callbacks. However with
> g2h_worker_func() we are processing g2h packets from a workqueue when
> receiving an interrupt. The runtime callbacks needs to talk to the GuC
> and so rely on this, however since these are processed from a workqueue
> the current task will be different and when calling something like
> mem_access_get() we deadlock. Callers should 

> in theory

should we at least add an assert?

> already be
> holding an access.ref when talking to the GuC (CT communication looks to
> be disabled when suspending the GT).
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 7a8c9d6a03f3..6e0d2d06b7f5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1081,7 +1081,6 @@ static void g2h_worker_func(struct work_struct *w)
>  	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, g2h_worker);
>  	int ret;
>  
> -	xe_device_mem_access_get(ct_to_xe(ct));
>  	do {
>  		mutex_lock(&ct->lock);
>  		ret = dequeue_one_g2h(ct);
> @@ -1095,7 +1094,6 @@ static void g2h_worker_func(struct work_struct *w)
>  			kick_reset(ct);
>  		}
>  	} while (ret == 1);
> -	xe_device_mem_access_put(ct_to_xe(ct));
>  }
>  
>  static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
> -- 
> 2.40.1
> 
