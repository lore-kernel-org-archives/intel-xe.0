Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051C6C77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 19:32:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAD310E603;
	Wed, 24 May 2023 19:32:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FA010E603
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 19:32:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EC68C618B3;
 Wed, 24 May 2023 19:32:20 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id B9734C433EF;
 Wed, 24 May 2023 19:32:15 +0000 (UTC)
Date: Wed, 24 May 2023 15:32:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZG5mPUmQFItg/A6T@rdvivi-mobl4>
References: <20230524175701.320653-1-matthew.auld@intel.com>
 <20230524175701.320653-9-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230524175701.320653-9-matthew.auld@intel.com>
Subject: Re: [Intel-xe] [PATCH v10 9/9] drm/xe/debugfs: grab mem_access
 around forcewake
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

On Wed, May 24, 2023 at 06:57:01PM +0100, Matthew Auld wrote:
> It looks like we need keep the device awake when holding the forcewake.

or maybe around any mmio operation. But this looks good for now
to close that gap.

> 
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/279

Closes: ?

> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 7827a785b020..047341d5689a 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -70,6 +70,8 @@ static int forcewake_open(struct inode *inode, struct file *file)
>  	struct xe_gt *gt;
>  	u8 id;
>  
> +	xe_device_mem_access_get(xe);
> +
>  	for_each_gt(gt, xe, id)
>  		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  
> @@ -85,6 +87,8 @@ static int forcewake_release(struct inode *inode, struct file *file)
>  	for_each_gt(gt, xe, id)
>  		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  
> +	xe_device_mem_access_put(xe);
> +
>  	return 0;
>  }
>  
> -- 
> 2.40.1
> 
