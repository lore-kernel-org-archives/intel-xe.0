Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35542C4332F
	for <intel-xe@archiver.kernel.org>; Sun, 12 Nov 2023 14:26:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFA110E1A0;
	Sun, 12 Nov 2023 14:26:39 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A1510E1A0
 for <intel-xe@lists.freedesktop.org>; Sun, 12 Nov 2023 14:26:36 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1699799189; bh=0XKG0yBIjflumFmOLBCDa9tZSoaMuXi2jsySaHcOPOI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BvjJWtSi6kONc9X5DEe+UhvXYXJexPSWabEf1s5s8Ed9TFUvIPJPq1s70VE+qAYDa
 jKoCXvTwYfmibZynPod/YHXso0VRl14ev/o9hRQRpMPSy2R9p3EyH1W7ymsDeCTw0b
 FitelqkW/B+ZQnncfEZpgupdF70b/PN1L9wVlgP5IBdKJ64xkFvGbRcrwy4UyLgfDe
 GO0mFAqXf1mA270Ts9BlknHtdC1sGSqFRRuflNsNVdCFmTP6HIjzkEBYUfU+O6ypQN
 Y66UpikLzEdWBAIbxvEo12KMMYEQge4pfgzYs/JIuTQs9wwT3gfZnYhnStMkJ8gUlE
 /M9Fjl9wbyHgw==
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 SMTP id 3ACEQNWA1459282; Sun, 12 Nov 2023 16:26:23 +0200
Date: Sun, 12 Nov 2023 16:26:23 +0200
From: Dafna Hirschfeld <dhirschfeld@habana.ai>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <mzs355dxor42rpvddxqg2nhcgix7copwbm6ovnes44ph6xsxfx@7qzsrhh2ninc>
References: <20231107052603.124361-1-matthew.brost@intel.com>
 <20231107052603.124361-10-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20231107052603.124361-10-matthew.brost@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 09/27] drm/xe: Move drm exec loop to
 vm_bind_ioctl_ops_execute
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
>The execution of the ops list can allocate memory in TTM which can
>trigger an eviction. Lockdep is not happy if the drm exec is closed when
>this happens.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_vm.c | 46 ++++++++++++++++++--------------------
> 1 file changed, 22 insertions(+), 24 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 8dc448bf6222..485252f69ed7 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -2851,23 +2851,17 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
> 	struct xe_vma_op *op;
> 	int err;
>
>-	drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
>-	drm_exec_until_all_locked(exec) {
>-		err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base, 1);
>-		drm_exec_retry_on_contention(exec);
>-		if (err)
>-			goto out;
>+	err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base, 1);
>+	if (err)
>+		return err;
>
>-		list_for_each_entry(op, &vops->list, link) {
>-			err = op_lock(exec, vm, op);
>-			drm_exec_retry_on_contention(exec);
>-			if (err)
>-				goto out;
>-		}
>+	list_for_each_entry(op, &vops->list, link) {
>+		err = op_lock(exec, vm, op);
>+		if (err)
>+			return err;
> 	}
>
>-out:
>-	return err;
>+	return 0;
> }
>
> static struct dma_fence *ops_execute(struct xe_vm *vm,
>@@ -2900,17 +2894,21 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>
> 	lockdep_assert_held_write(&vm->lock);
>
>-	err = vm_bind_ioctl_ops_lock(&exec, vm, vops);
>-	if (err)
>-		return err;
>+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
>+	drm_exec_until_all_locked(&exec) {
>+		err = vm_bind_ioctl_ops_lock(&exec, vm, vops);
>+		drm_exec_retry_on_contention(&exec);
>+		if (err)
>+			return err;

I think here you miss drm_exec_fini
thanks,
Dafna

>
>-	fence = ops_execute(vm, vops, true);
>-	if (IS_ERR(fence)) {
>-		err = PTR_ERR(fence);
>-		/* FIXME: Killing VM rather than proper error handling */
>-		xe_vm_kill(vm, false);
>-	} else {
>-		dma_fence_put(fence);
>+		fence = ops_execute(vm, vops, true);
>+		if (IS_ERR(fence)) {
>+			err = PTR_ERR(fence);
>+			/* FIXME: Killing VM rather than proper error handling */
>+			xe_vm_kill(vm, false);
>+		} else {
>+			dma_fence_put(fence);
>+		}
> 	}
>
> 	drm_exec_fini(&exec);
>-- 
>2.34.1
>
