Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E585C4167D
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 11:07:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F5310E711;
	Wed,  8 Nov 2023 11:07:12 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0626110E711
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 11:07:08 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1699440941; bh=DEGT8IQ2upnsopU4T9e1tfoa7I1eSxTItfsi9mCeAq8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gfRPKZSDrZZuSlsP9ZeklByKzkrve4j3a2IuxbftOVqaP8HfLskwN/N9ekPB6gzgy
 15LlOYWKLQyQ37Jadh+3gAf8MubjR9YZ8Zmt7ObN6L3E4jglDo3B/XkndmnJhTBNJG
 3cSowKZGiMhGu1al623Q0643rb1ZKvu4JyIoTs0JB/Wxv/fFNkd2BOeGeRALbK9xD7
 KtO+hcXZhv35Lj/UD7L3KzFf5a408+BxCn8UPMOJWbQgmWHcDCz1z/Tdd7gKlMR/GA
 RM7R2DVDs7SKCDbwZXBV2tk34kgHxbkG0Oz3dlrgy+1K4y0LBbDu4Jxg7Ds5S0uPC9
 v2aG2ZEIS3RzQ==
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 SMTP id 3A8AtZEH1202037; Wed, 8 Nov 2023 12:55:35 +0200
Date: Wed, 8 Nov 2023 12:55:35 +0200
From: Dafna Hirschfeld <dhirschfeld@habana.ai>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <lsvqioo7quhjuhgxigl4f4oqti7wshxdgciwivyygm2zrd2q2p@cyyuidovinuo>
References: <20231107052603.124361-1-matthew.brost@intel.com>
 <20231107052603.124361-2-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20231107052603.124361-2-matthew.brost@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 01/27] drm/xe: Allow num_binds == 0 in VM
 bind IOCTL
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

On 06.11.2023 21:25, Matthew Brost wrote:
>The idea being out-syncs can signal indicating all previous operations
>on the bind queue are complete. An example use case of this would be
>support for implementing vkQueueWaitForIdle easily.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_vm.c | 30 ++++++++++++++++++------------
> 1 file changed, 18 insertions(+), 12 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index d26c90f0d702..403444ff3856 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -2850,7 +2850,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> 	int i;
>
> 	if (XE_IOCTL_DBG(xe, args->extensions) ||
>-	    XE_IOCTL_DBG(xe, !args->num_binds) ||
> 	    XE_IOCTL_DBG(xe, args->num_binds > MAX_BINDS))
> 		return -EINVAL;
>
>@@ -2977,7 +2976,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> 			goto put_exec_queue;
> 		}
>
>-		if (XE_IOCTL_DBG(xe, async !=
>+		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
> 				 !!(q->flags & EXEC_QUEUE_FLAG_VM_ASYNC))) {
> 			err = -EINVAL;
> 			goto put_exec_queue;
>@@ -2991,7 +2990,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> 	}
>
> 	if (!args->exec_queue_id) {
>-		if (XE_IOCTL_DBG(xe, async !=
>+		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
> 				 !!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT))) {
> 			err = -EINVAL;
> 			goto put_vm;
>@@ -3028,16 +3027,18 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> 		}
> 	}
>
>-	bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);
>-	if (!bos) {
>-		err = -ENOMEM;
>-		goto release_vm_lock;
>-	}
>+	if (args->num_binds) {
>+		bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);
>+		if (!bos) {
>+			err = -ENOMEM;
>+			goto release_vm_lock;
>+		}
>
>-	ops = kzalloc(sizeof(*ops) * args->num_binds, GFP_KERNEL);
>-	if (!ops) {
>-		err = -ENOMEM;
>-		goto release_vm_lock;
>+		ops = kzalloc(sizeof(*ops) * args->num_binds, GFP_KERNEL);
>+		if (!ops) {
>+			err = -ENOMEM;
>+			goto release_vm_lock;
>+		}
> 	}
>
> 	for (i = 0; i < args->num_binds; ++i) {
>@@ -3092,6 +3093,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> 			goto free_syncs;
> 	}
>
>+	if (!args->num_binds) {
>+		err = -ENODATA;
>+		goto free_syncs;
if args->num_binds = 0 is valid, then it might be confusing to indicate it with err = -ENODATA,
Also , it is invalid if both args->num_binds and args->num_syncs are 0 right? if so maybe
add XE_IOCTL_DBG for that,

Thanks,
Dafna

>+	}
>+
> 	for (i = 0; i < args->num_binds; ++i) {
> 		u64 range = bind_ops[i].range;
> 		u64 addr = bind_ops[i].addr;
>-- 
>2.34.1
>
