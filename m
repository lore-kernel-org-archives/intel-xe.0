Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7283C25B6D
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 13:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C55B10E659;
	Wed, 25 Oct 2023 13:03:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C720410E5B4
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 13:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698238994; x=1729774994;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VbFsTAIzhlIs8JWBWLbdlzVADVtB5zIBSHzsv3lPCrY=;
 b=m63UJisaz1Jv/LciLgJmX72JW+ygaGKwqdC424IAeFispI+aodDY2rlU
 8PI8u0obD+t4cR21VCLf3UE87QxkbqPD72rMCDQCyrZA4BuOMWMczDnWx
 6ASTHW7Ls02GjjXQZK5fpU+MCbmMriu0tm0E4tt6WzQVHMff9LBPIOH0h
 0PT31ZEUDtNiAgcqvolNrAvBSJv6jPwnvBlosubs+GP5z84eE4n384EQl
 86ceU6sGnmys2CodAckJBp8IgP+SXhhI+rqtjRsyuEm/q1akc3qKwOLIw
 QV5/yvDWpjhIF7I8VVG0y8ZbiECZqVfyuS2CjPZS0DB403oASNwOWUl6W Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="91285"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="91285"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 05:56:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="86745"
Received: from skofoed-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.29])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 05:55:57 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 14:55:47 +0200
Message-ID: <20231025125553.2335-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025125553.2335-1-thomas.hellstrom@linux.intel.com>
References: <20231025125553.2335-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 04/10] drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm
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

Introduce flags for struct drm_gpuvm, this required by subsequent
commits.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_gpuvm.c            |  3 +++
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  2 +-
 include/drm/drm_gpuvm.h                | 16 ++++++++++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index d4907aace831..3bb3d083b32e 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -702,6 +702,7 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_resv_object_alloc);
  * drm_gpuvm_init() - initialize a &drm_gpuvm
  * @gpuvm: pointer to the &drm_gpuvm to initialize
  * @name: the name of the GPU VA space
+ * @flags: the &drm_gpuvm_flags for this GPUVM
  * @drm: the &drm_device this VM resides in
  * @r_obj: the resv &drm_gem_object providing the GPUVM's common &dma_resv
  * @start_offset: the start offset of the GPU VA space
@@ -717,6 +718,7 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_resv_object_alloc);
  */
 void
 drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
+	       enum drm_gpuvm_flags flags,
 	       struct drm_device *drm,
 	       struct drm_gem_object *r_obj,
 	       u64 start_offset, u64 range,
@@ -727,6 +729,7 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	INIT_LIST_HEAD(&gpuvm->rb.list);
 
 	gpuvm->name = name ? name : "unknown";
+	gpuvm->flags = flags;
 	gpuvm->ops = ops;
 	gpuvm->drm = drm;
 	gpuvm->r_obj = r_obj;
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index b4e7d662961a..ed439bf4032f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1844,7 +1844,7 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 	uvmm->kernel_managed_addr = kernel_managed_addr;
 	uvmm->kernel_managed_size = kernel_managed_size;
 
-	drm_gpuvm_init(&uvmm->base, cli->name, drm, r_obj,
+	drm_gpuvm_init(&uvmm->base, cli->name, 0, drm, r_obj,
 		       NOUVEAU_VA_SPACE_START,
 		       NOUVEAU_VA_SPACE_END,
 		       kernel_managed_addr, kernel_managed_size,
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 54dc195a68ea..d3d3dd33ab7c 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -184,6 +184,16 @@ static inline bool drm_gpuva_invalidated(struct drm_gpuva *va)
 	return va->flags & DRM_GPUVA_INVALIDATED;
 }
 
+/**
+ * enum drm_gpuvm_flags - flags for struct drm_gpuvm
+ */
+enum drm_gpuvm_flags {
+	/**
+	 * @DRM_GPUVM_USERBITS: user defined bits
+	 */
+	DRM_GPUVM_USERBITS = BIT(0),
+};
+
 /**
  * struct drm_gpuvm - DRM GPU VA Manager
  *
@@ -202,6 +212,11 @@ struct drm_gpuvm {
 	 */
 	const char *name;
 
+	/**
+	 * @flags: the &drm_gpuvm_flags of this GPUVM
+	 */
+	enum drm_gpuvm_flags flags;
+
 	/**
 	 * @drm: the &drm_device this VM lives in
 	 */
@@ -252,6 +267,7 @@ struct drm_gpuvm {
 };
 
 void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
+		    enum drm_gpuvm_flags flags,
 		    struct drm_device *drm,
 		    struct drm_gem_object *r_obj,
 		    u64 start_offset, u64 range,
-- 
2.41.0

