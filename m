Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F46C77B73
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 14:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC6710E340;
	Mon, 22 May 2023 14:42:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FE010E340
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 14:42:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3642761FC7;
 Mon, 22 May 2023 14:42:20 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 10128C433EF;
 Mon, 22 May 2023 14:42:17 +0000 (UTC)
Date: Mon, 22 May 2023 10:42:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZGt/R1u4ax6wbR6X@rdvivi-mobl4>
References: <20230522130501.60977-1-matthew.auld@intel.com>
 <20230522130501.60977-4-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522130501.60977-4-matthew.auld@intel.com>
Subject: Re: [Intel-xe] [PATCH v6 4/6] drm/xe/ggtt: prime ggtt->lock against
 FS_RECLAIM
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

On Mon, May 22, 2023 at 02:04:59PM +0100, Matthew Auld wrote:
> Increase the sensitivity of the ggtt->lock by priming it against
> FS_RECLAIM, such that allocating memory while holding will result in
> lockdep splats.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

oh, I could swear that I had giving the rv-b after your explanation
on the previous series. Sorry for missing that.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index f986e8218820..e25eb70d44f6 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -90,6 +90,16 @@ static void ggtt_fini_noalloc(struct drm_device *drm, void *arg)
>  	xe_bo_unpin_map_no_vm(ggtt->scratch);
>  }
>  
> +static void primelockdep(struct xe_ggtt *ggtt)
> +{
> +	if (!IS_ENABLED(CONFIG_LOCKDEP))
> +		return;
> +
> +	fs_reclaim_acquire(GFP_KERNEL);
> +	might_lock(&ggtt->lock);
> +	fs_reclaim_release(GFP_KERNEL);
> +}
> +
>  int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -132,6 +142,7 @@ int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
>  	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
>  		    ggtt->size - xe_wopcm_size(xe));
>  	mutex_init(&ggtt->lock);
> +	primelockdep(ggtt);
>  
>  	return drmm_add_action_or_reset(&xe->drm, ggtt_fini_noalloc, ggtt);
>  }
> -- 
> 2.40.1
> 
