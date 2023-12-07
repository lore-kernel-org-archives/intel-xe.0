Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA22C10F09
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 08:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FE510E825;
	Thu,  7 Dec 2023 08:17:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D06510E814
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 08:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701937028; x=1733473028;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9RF60BnvBwRBCqXZ4XCdcmF0cy70TWrDezDKG+agswI=;
 b=kd9NjCKCJ6GtJBQLvPfjVP/MPINeusQ6ZlfWJRdNc5eNI1/sWhW+9pdV
 dpiKe4CtZp+68Z7A+efTYgP/GE54wUIFmCxJLKIVjRbKoYTvMrFegejcR
 YlbMxLaCgnI5rCH3sVioZ5uD33p2KGMpXMwQsNNivNPN2W8a1Sx2fhveb
 j8MsyEoHcJhrdT5lv37PUlETDvNwnRukIljJ1p4hv3WvQjBV3vqnAr1Iu
 v8zc5jGs/vHBakqf0Ctk3u5XmdxwWGWcgy9Q5EbEghK0eLmxZlN6Ql1lB
 v2Ih2vlVcaUYXRauqDefYjk4MF5GALImzSHeK5C4mnPDJNd1wdvk0yLDg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="398079423"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="398079423"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 00:17:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="17413363"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.234])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 00:17:07 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  7 Dec 2023 09:16:43 +0100
Message-ID: <20231207081652.17431-8-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231207081652.17431-1-thomas.hellstrom@linux.intel.com>
References: <20231207081652.17431-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 08/16] drm/nouveau: separately allocate struct
 nouveau_uvmm
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

From: Danilo Krummrich <dakr@redhat.com>

Allocate struct nouveau_uvmm separately in preparation for subsequent
commits introducing reference counting for struct drm_gpuvm.

While at it, get rid of nouveau_uvmm_init() as indirection of
nouveau_uvmm_ioctl_vm_init() and perform some minor cleanups.

Reviewed-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231108001259.15123-9-dakr@redhat.com
(cherry picked from commit 266f7618e761c8a6aa89dbfe43cda1b69cdbbf14)
---
 drivers/gpu/drm/nouveau/nouveau_drm.c  |  5 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h  | 10 ++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 63 +++++++++++++-------------
 drivers/gpu/drm/nouveau/nouveau_uvmm.h |  4 --
 4 files changed, 40 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 50589f982d1a..f603eaef1560 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -190,6 +190,8 @@ nouveau_cli_work_queue(struct nouveau_cli *cli, struct dma_fence *fence,
 static void
 nouveau_cli_fini(struct nouveau_cli *cli)
 {
+	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm_locked(cli);
+
 	/* All our channels are dead now, which means all the fences they
 	 * own are signalled, and all callback functions have been called.
 	 *
@@ -199,7 +201,8 @@ nouveau_cli_fini(struct nouveau_cli *cli)
 	WARN_ON(!list_empty(&cli->worker));
 
 	usif_client_fini(cli);
-	nouveau_uvmm_fini(&cli->uvmm);
+	if (uvmm)
+		nouveau_uvmm_fini(uvmm);
 	nouveau_sched_entity_fini(&cli->sched_entity);
 	nouveau_vmm_fini(&cli->svm);
 	nouveau_vmm_fini(&cli->vmm);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index e73a233c6572..7f7051df84a6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -93,7 +93,10 @@ struct nouveau_cli {
 	struct nvif_mmu mmu;
 	struct nouveau_vmm vmm;
 	struct nouveau_vmm svm;
-	struct nouveau_uvmm uvmm;
+	struct {
+		struct nouveau_uvmm *ptr;
+		bool disabled;
+	} uvmm;
 
 	struct nouveau_sched_entity sched_entity;
 
@@ -121,10 +124,7 @@ struct nouveau_cli_work {
 static inline struct nouveau_uvmm *
 nouveau_cli_uvmm(struct nouveau_cli *cli)
 {
-	if (!cli || !cli->uvmm.vmm.cli)
-		return NULL;
-
-	return &cli->uvmm;
+	return cli ? cli->uvmm.ptr : NULL;
 }
 
 static inline struct nouveau_uvmm *
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index f765e3835306..54be12c1272f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1636,18 +1636,6 @@ nouveau_uvmm_bind_job_init(struct nouveau_uvmm_bind_job **pjob,
 	return ret;
 }
 
-int
-nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
-			   void *data,
-			   struct drm_file *file_priv)
-{
-	struct nouveau_cli *cli = nouveau_cli(file_priv);
-	struct drm_nouveau_vm_init *init = data;
-
-	return nouveau_uvmm_init(&cli->uvmm, cli, init->kernel_managed_addr,
-				 init->kernel_managed_size);
-}
-
 static int
 nouveau_uvmm_vm_bind(struct nouveau_uvmm_bind_job_args *args)
 {
@@ -1793,17 +1781,25 @@ nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo)
 }
 
 int
-nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
-		  u64 kernel_managed_addr, u64 kernel_managed_size)
+nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
+			   void *data,
+			   struct drm_file *file_priv)
 {
+	struct nouveau_uvmm *uvmm;
+	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	struct drm_device *drm = cli->drm->dev;
 	struct drm_gem_object *r_obj;
-	u64 kernel_managed_end = kernel_managed_addr + kernel_managed_size;
+	struct drm_nouveau_vm_init *init = data;
+	u64 kernel_managed_end;
 	int ret;
 
-	mutex_init(&uvmm->mutex);
-	mt_init_flags(&uvmm->region_mt, MT_FLAGS_LOCK_EXTERN);
-	mt_set_external_lock(&uvmm->region_mt, &uvmm->mutex);
+	if (check_add_overflow(init->kernel_managed_addr,
+			       init->kernel_managed_size,
+			       &kernel_managed_end))
+		return -EINVAL;
+
+	if (kernel_managed_end > NOUVEAU_VA_SPACE_END)
+		return -EINVAL;
 
 	mutex_lock(&cli->mutex);
 
@@ -1812,44 +1808,49 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 		goto out_unlock;
 	}
 
-	if (kernel_managed_end <= kernel_managed_addr) {
-		ret = -EINVAL;
-		goto out_unlock;
-	}
-
-	if (kernel_managed_end > NOUVEAU_VA_SPACE_END) {
-		ret = -EINVAL;
+	uvmm = kzalloc(sizeof(*uvmm), GFP_KERNEL);
+	if (!uvmm) {
+		ret = -ENOMEM;
 		goto out_unlock;
 	}
 
 	r_obj = drm_gpuvm_resv_object_alloc(drm);
 	if (!r_obj) {
+		kfree(uvmm);
 		ret = -ENOMEM;
 		goto out_unlock;
 	}
 
+	mutex_init(&uvmm->mutex);
+	mt_init_flags(&uvmm->region_mt, MT_FLAGS_LOCK_EXTERN);
+	mt_set_external_lock(&uvmm->region_mt, &uvmm->mutex);
+
 	drm_gpuvm_init(&uvmm->base, cli->name, 0, drm, r_obj,
 		       NOUVEAU_VA_SPACE_START,
 		       NOUVEAU_VA_SPACE_END,
-		       kernel_managed_addr, kernel_managed_size,
+		       init->kernel_managed_addr,
+		       init->kernel_managed_size,
 		       NULL);
 	/* GPUVM takes care from here on. */
 	drm_gem_object_put(r_obj);
 
 	ret = nvif_vmm_ctor(&cli->mmu, "uvmm",
 			    cli->vmm.vmm.object.oclass, RAW,
-			    kernel_managed_addr, kernel_managed_size,
-			    NULL, 0, &cli->uvmm.vmm.vmm);
+			    init->kernel_managed_addr,
+			    init->kernel_managed_size,
+			    NULL, 0, &uvmm->vmm.vmm);
 	if (ret)
 		goto out_gpuvm_fini;
 
-	cli->uvmm.vmm.cli = cli;
+	uvmm->vmm.cli = cli;
+	cli->uvmm.ptr = uvmm;
 	mutex_unlock(&cli->mutex);
 
 	return 0;
 
 out_gpuvm_fini:
 	drm_gpuvm_destroy(&uvmm->base);
+	kfree(uvmm);
 out_unlock:
 	mutex_unlock(&cli->mutex);
 	return ret;
@@ -1864,9 +1865,6 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
 	struct nouveau_sched_entity *entity = &cli->sched_entity;
 	struct drm_gpuva *va, *next;
 
-	if (!cli)
-		return;
-
 	rmb(); /* for list_empty to work without lock */
 	wait_event(entity->job.wq, list_empty(&entity->job.list.head));
 
@@ -1905,5 +1903,6 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
 	mutex_lock(&cli->mutex);
 	nouveau_vmm_fini(&uvmm->vmm);
 	drm_gpuvm_destroy(&uvmm->base);
+	kfree(uvmm);
 	mutex_unlock(&cli->mutex);
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.h b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
index 22607270fae0..f0a6d98ace4f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
@@ -12,8 +12,6 @@ struct nouveau_uvmm {
 	struct nouveau_vmm vmm;
 	struct maple_tree region_mt;
 	struct mutex mutex;
-
-	bool disabled;
 };
 
 struct nouveau_uvma_region {
@@ -78,8 +76,6 @@ struct nouveau_uvmm_bind_job_args {
 
 #define to_uvmm_bind_job(job) container_of((job), struct nouveau_uvmm_bind_job, base)
 
-int nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
-		      u64 kernel_managed_addr, u64 kernel_managed_size);
 void nouveau_uvmm_fini(struct nouveau_uvmm *uvmm);
 
 void nouveau_uvmm_bo_map_all(struct nouveau_bo *nvbov, struct nouveau_mem *mem);
-- 
2.42.0

