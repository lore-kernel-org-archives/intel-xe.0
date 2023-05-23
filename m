Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E19C77B75
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 13:07:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB5910E43A;
	Tue, 23 May 2023 13:07:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664F110E09B
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 13:07:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B81B6631F5;
 Tue, 23 May 2023 13:07:24 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 83D1DC433EF;
 Tue, 23 May 2023 13:07:22 +0000 (UTC)
Date: Tue, 23 May 2023 09:07:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZGy6hq9YtcOqsCga@rdvivi-mobl4>
References: <20230523094727.162266-1-matthew.auld@intel.com>
 <20230523094727.162266-4-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523094727.162266-4-matthew.auld@intel.com>
Subject: Re: [Intel-xe] [PATCH v9 4/8] drm/xe: tweak lock ordering for
 freq_lock
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

On Tue, May 23, 2023 at 10:47:23AM +0100, Matthew Auld wrote:
> Lockdep spits out:
> 
> Possible unsafe locking scenario:
>    CPU0				CPU1
>    ----				----
>    lock(&xe->mem_access.lock);
> 				lock(&pc->freq_lock);
> 				lock(&xe->mem_access.lock);
>    lock(&pc->freq_lock);
> 
> It looks like we already mostly take care to ensure that the mem_access
> ref is taken outside of taking freq_lock, since that is also grabbed
> from the runtime_pm callbacks, except for a couple of spots in
> xe_guc_pc and guc_ct_send_recv(). But tt looks like all the callers are
> already holding the mem_access.ref, so just switch over to use
> guc_ct_send_locked().
> 
> v2:
>  - There are few more cases it seems.

should we do this to all the ct_send? and kill this function in favor
of the locked one?

or how we can be sure that we are done with all the cases?

> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 4 +++-
>  drivers/gpu/drm/xe/xe_guc_pc.c | 8 ++++++--
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 9dc906f2651a..7a8c9d6a03f3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -689,7 +689,9 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  retry:
>  	g2h_fence_init(&g2h_fence, response_buffer);
>  retry_same_fence:
> -	ret = guc_ct_send(ct, action, len, 0, 0, &g2h_fence);
> +	mutex_lock(&ct->lock);
> +	ret = guc_ct_send_locked(ct, action, len, 0, 0, &g2h_fence);
> +	mutex_unlock(&ct->lock);
>  	if (unlikely(ret == -ENOMEM)) {
>  		void *ptr;
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index e799faa1c6b8..3b56e57d29af 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -225,7 +225,9 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
>  	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
>  		return -EAGAIN;
>  
> -	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> +	mutex_lock(&ct->lock);
> +	ret = xe_guc_ct_send_locked(ct, action, ARRAY_SIZE(action), 0, 0);
> +	mutex_unlock(&ct->lock);
>  	if (ret)
>  		drm_err(&pc_to_xe(pc)->drm, "GuC PC set param failed: %pe",
>  			ERR_PTR(ret));
> @@ -242,7 +244,9 @@ static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
>  	};
>  	int ret;
>  
> -	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> +	mutex_lock(&ct->lock);
> +	ret = xe_guc_ct_send_locked(ct, action, ARRAY_SIZE(action), 0, 0);
> +	mutex_unlock(&ct->lock);
>  	if (ret)
>  		drm_err(&pc_to_xe(pc)->drm, "GuC RC enable failed: %pe",
>  			ERR_PTR(ret));
> -- 
> 2.40.1
> 
