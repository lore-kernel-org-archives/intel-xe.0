Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE15C77B75
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 19:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E9410E664;
	Fri,  5 May 2023 19:43:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F2810E664
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 19:43:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C63D464044;
 Fri,  5 May 2023 19:43:19 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id B65C8C4339E;
 Fri,  5 May 2023 19:43:17 +0000 (UTC)
Date: Fri, 5 May 2023 15:43:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZFVcU5VPibAp/Umi@rdvivi-mobl4>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-29-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502001727.3211096-29-matthew.brost@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 28/31] drm/xe: Allow dma-fences as
 in-syncs for compute / faulting VM
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

On Mon, May 01, 2023 at 05:17:24PM -0700, Matthew Brost wrote:
> This is allowed per the dma-fencing rules.

it would be good a word saying 'why' we are doing this.
only because we can it doesn't mean we should...

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 99f1ed87196d..1e4e4acb2c4a 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -105,6 +105,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  {
>  	struct drm_xe_sync sync_in;
>  	int err;
> +	bool signal;
>  
>  	if (copy_from_user(&sync_in, sync_user, sizeof(*sync_user)))
>  		return -EFAULT;
> @@ -113,9 +114,10 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  			 ~(SYNC_FLAGS_TYPE_MASK | DRM_XE_SYNC_SIGNAL)))
>  		return -EINVAL;
>  
> +	signal = sync_in.flags & DRM_XE_SYNC_SIGNAL;
>  	switch (sync_in.flags & SYNC_FLAGS_TYPE_MASK) {
>  	case DRM_XE_SYNC_SYNCOBJ:
> -		if (XE_IOCTL_ERR(xe, no_dma_fences))
> +		if (XE_IOCTL_ERR(xe, no_dma_fences && signal))
>  			return -ENOTSUPP;
>  
>  		if (XE_IOCTL_ERR(xe, upper_32_bits(sync_in.addr)))
> @@ -125,7 +127,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  		if (XE_IOCTL_ERR(xe, !sync->syncobj))
>  			return -ENOENT;
>  
> -		if (!(sync_in.flags & DRM_XE_SYNC_SIGNAL)) {
> +		if (!signal) {
>  			sync->fence = drm_syncobj_fence_get(sync->syncobj);
>  			if (XE_IOCTL_ERR(xe, !sync->fence))
>  				return -EINVAL;
> @@ -133,7 +135,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  		break;
>  
>  	case DRM_XE_SYNC_TIMELINE_SYNCOBJ:
> -		if (XE_IOCTL_ERR(xe, no_dma_fences))
> +		if (XE_IOCTL_ERR(xe, no_dma_fences && signal))
>  			return -ENOTSUPP;
>  
>  		if (XE_IOCTL_ERR(xe, upper_32_bits(sync_in.addr)))
> @@ -146,7 +148,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  		if (XE_IOCTL_ERR(xe, !sync->syncobj))
>  			return -ENOENT;
>  
> -		if (sync_in.flags & DRM_XE_SYNC_SIGNAL) {
> +		if (signal) {
>  			sync->chain_fence = dma_fence_chain_alloc();
>  			if (!sync->chain_fence)
>  				return -ENOMEM;
> @@ -168,7 +170,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>  		break;
>  
>  	case DRM_XE_SYNC_USER_FENCE:
> -		if (XE_IOCTL_ERR(xe, !(sync_in.flags & DRM_XE_SYNC_SIGNAL)))
> +		if (XE_IOCTL_ERR(xe, !signal))
>  			return -ENOTSUPP;
>  
>  		if (XE_IOCTL_ERR(xe, sync_in.addr & 0x7))
> -- 
> 2.34.1
> 
