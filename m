Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EAFC4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 08:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BE310E704;
	Wed,  8 Nov 2023 08:16:26 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1812A10E704
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 08:16:23 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1699431135; bh=jHKJWZl3fXswHUqdOMPzqAYiH85ysgNp6UQTVRc26YQ=;
 h=From:To:Cc:Subject:Date:From;
 b=VFqf3KJfvfWkD92Bnb6/mQl0JFNQeubPerpUPK2fyBO88mYa6XaNDC5HPM5xJDBU4
 kgq422BAB/q32Wm3SkzfuVVg3rM3NT1t0mQwH+5G0jGQOw2dCKiToDG6YCDoioBFFp
 gYd/PvgLi1CTmAu9K/ODu/pe29c26QpYycF0vt9pjrNRgONcpOYtK2pniqt5y4IaLJ
 GoDDhakc3jE/zyoDUkhS6YV7gRVDMeDqBsFRE2Wj86stJJs9tMIP7//6a8D0B56Jsi
 wSWL5hoOEVRwcQIVSWMda/dzpq+PZbbYSOzowPCMdcfok8Vgh3t6m7WPoCyRJ/Ukay
 oGcOwFpiuCtCA==
Received: from dliberman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 3A88C9lk981606
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 8 Nov 2023 10:12:09 +0200
Received: (from dliberman@localhost)
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 3A88C8qm981605; 
 Wed, 8 Nov 2023 10:12:08 +0200
From: Dani Liberman <dliberman@habana.ai>
To: intel-xe@lists.freedesktop.org
Date: Wed,  8 Nov 2023 10:11:56 +0200
Message-Id: <20231108081156.981587-1-dliberman@habana.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3] drm/xe: use variable instead of multiple
 function calls
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

Using function calls with negative logic was a bit confusing,
positive logic is more readable.

v2:
 - Update commit message
v3:
 - Rebase

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Signed-off-by: Dani Liberman <dliberman@habana.ai>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 28e84a0bbeb0..2de6c2c05078 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -145,7 +145,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct xe_sched_job *job;
 	struct dma_fence *rebind_fence;
 	struct xe_vm *vm;
-	bool write_locked;
+	bool write_locked, vm_with_dma_fences;
 	ktime_t end = 0;
 	int err = 0;
 
@@ -196,8 +196,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 	}
 
+	vm_with_dma_fences = !xe_vm_no_dma_fences(vm);
 retry:
-	if (!xe_vm_no_dma_fences(vm) && xe_vm_userptr_check_repin(vm)) {
+	if (vm_with_dma_fences && xe_vm_userptr_check_repin(vm)) {
 		err = down_write_killable(&vm->lock);
 		write_locked = true;
 	} else {
@@ -279,7 +280,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	}
 
 	/* Wait behind munmap style rebinds */
-	if (!xe_vm_no_dma_fences(vm)) {
+	if (vm_with_dma_fences) {
 		err = drm_sched_job_add_resv_dependencies(&job->drm,
 							  &vm->resv,
 							  DMA_RESV_USAGE_KERNEL);
@@ -292,7 +293,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		goto err_put_job;
 
-	if (!xe_vm_no_dma_fences(vm)) {
+	if (vm_with_dma_fences) {
 		err = down_read_interruptible(&vm->userptr.notifier_lock);
 		if (err)
 			goto err_put_job;
@@ -307,7 +308,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	 * the job and let the DRM scheduler / backend clean up the job.
 	 */
 	xe_sched_job_arm(job);
-	if (!xe_vm_no_dma_fences(vm)) {
+	if (vm_with_dma_fences) {
 		/* Block userptr invalidations / BO eviction */
 		dma_resv_add_fence(&vm->resv,
 				   &job->drm.s_fence->finished,
@@ -330,14 +331,14 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	xe_sched_job_push(job);
 	xe_vm_reactivate_rebind(vm);
 
-	if (!err && !xe_vm_no_dma_fences(vm)) {
+	if (!err && vm_with_dma_fences) {
 		spin_lock(&xe->ttm.lru_lock);
 		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
 		spin_unlock(&xe->ttm.lru_lock);
 	}
 
 err_repin:
-	if (!xe_vm_no_dma_fences(vm))
+	if (vm_with_dma_fences)
 		up_read(&vm->userptr.notifier_lock);
 err_put_job:
 	if (err)
-- 
2.34.1

