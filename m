Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12C1C77B7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 18:38:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C387610E07F;
	Fri,  5 May 2023 18:38:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8692310E07F
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 18:38:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F329260DE8;
 Fri,  5 May 2023 18:38:49 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id F12D7C433EF;
 Fri,  5 May 2023 18:38:47 +0000 (UTC)
Date: Fri, 5 May 2023 14:38:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZFVNNY4cdVC8aZc5@rdvivi-mobl4>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-7-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502001727.3211096-7-matthew.brost@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 06/31] drm/xe: Ensure LR engines are not
 persistent
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 01, 2023 at 05:17:02PM -0700, Matthew Brost wrote:
> With our ref counting scheme LR engines only close properly if not
> persistent, ensure that LR engines are non-persistent.

Better to spell out long running somewhere here...

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_engine.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index d1e84d7adbd4..91600b1e8249 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -596,7 +596,9 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
>  			return -ENOENT;
>  
>  		e = xe_engine_create(xe, vm, logical_mask,
> -				     args->width, hwe, ENGINE_FLAG_PERSISTENT);
> +				     args->width, hwe,
> +				     xe_vm_no_dma_fences(vm) ? 0 :

shouldn't we use that existent function xe_engine_is_lr instead of this?

> +				     ENGINE_FLAG_PERSISTENT);
>  		xe_vm_put(vm);
>  		if (IS_ERR(e))
>  			return PTR_ERR(e);
> -- 
> 2.34.1
> 
