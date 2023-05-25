Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91051C7EE23
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 01:56:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6977210E628;
	Thu, 25 May 2023 01:56:20 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59BAC10E628
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 01:56:18 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7748eb38f6aso42684639f.2
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 18:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684979777; x=1687571777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gBvtqUb7L24+ObGltk9+I9yr/49871BNQ/sCDZkpVuE=;
 b=hJ3F6lIUx5D1RaMLsQP8lVgVWCkR3n6gfon2LiiaJlDHYNOzPtpRiR4aXu3srSQJUX
 LJHx3pe6T+ffIwviiC7uOeYwzdr/GKmXVy3nOvCttuJoLCN4aHjjNwhmNMzYl3qIk2FL
 hh7x6FwT3G8hW37DJeDB70rD6oGujfDl6qsZmYAUluB8ZrerhTl/3naoUi1YvDyuHgYA
 nx3a5Q7M2fIVWpLOC7LFebrInjC5vetN1rJuyhaMwMEE/Ml7+3rV4zwhI8VwZ936Y4P3
 3I3SYAQj1xKhMgAclWRvuUAydMTIu/6CEIIPjKF8THVfgUBVuM3ecNwlFcorNtSWUMl9
 T5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684979777; x=1687571777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gBvtqUb7L24+ObGltk9+I9yr/49871BNQ/sCDZkpVuE=;
 b=erZ+GprlecWmsj4nXtABF+9B40g8PFCQTVWYLFiE4ocoWbu3EBA/VNlzcsDtv8IkyG
 fbjehfMUulsL7Kc+Nucl2gNCK3QJwvRQtH1kLzEw2uyD1IY9HWDUngavkiwaWIxwfYi2
 X0+cJ4VH7Lt2MpBOemgcOImPDaV05EfeMCWnTid+uE/ddyJnng/Yl4jB7vU6gM7IE6bZ
 zFwNeYFhieP8EdPoBP7OQy7nym0Ktq+ZPPxJmiaX4H1Zql5xnZVNvbr4ihFfQ+hcQASB
 GhBlbyH9fD12VRDWcleGZwUMevuYgz99feQl4KfrvzfTibEJ0kYyzK2Kj+f+u1QLvwkz
 PkFQ==
X-Gm-Message-State: AC+VfDw75ZB2z+ijRM7iTrVBMRwEu/LPQapPSNP+2icoQl88WCOLS+IP
 e6UeEyCHLIGrIrAobK09tlsglEg830CEw4YH
X-Google-Smtp-Source: ACHHUZ5Gs1g3zd/Xt1UU2McvDaiGFB7i8CwxD9VAi9X0nIj78mxaKpn3nSaR5t2a5hM2P+X8KIA+iA==
X-Received: by 2002:a92:d446:0:b0:331:a6ba:be68 with SMTP id
 r6-20020a92d446000000b00331a6babe68mr11572695ilm.9.1684979776848; 
 Wed, 24 May 2023 18:56:16 -0700 (PDT)
Received: from mrgency.tuatara-tone.ts.net
 ([2600:6c51:4c3f:9541:841e:5ff:fea9:3053])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a92cf12000000b0032b4808029fsm29407ilo.31.2023.05.24.18.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 18:56:16 -0700 (PDT)
From: Christopher Snowhill <kode54@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 24 May 2023 18:56:07 -0700
Message-Id: <20230525015607.2192395-3-kode54@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525015607.2192395-1-kode54@gmail.com>
References: <20230525015607.2192395-1-kode54@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] drm/xe: Validate uAPI padding and
 reserved fields
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

Padding and reserved fields are declared such that they must be
zeroed, so verify that they're all zero in the respective ioctl
functions.

Derived from original patch by mlankhorst.

v2:
	Removed extensions checks where there were none originally. (José)
	Moved extraneous parentheses to the correct places. (Lucas)

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Christopher Snowhill <kode54@gmail.com>
---
 drivers/gpu/drm/xe/xe_bo.c              |  6 ++++--
 drivers/gpu/drm/xe/xe_engine.c          | 18 ++++++++++++++----
 drivers/gpu/drm/xe/xe_exec.c            |  4 +++-
 drivers/gpu/drm/xe/xe_mmio.c            |  3 ++-
 drivers/gpu/drm/xe/xe_query.c           |  3 ++-
 drivers/gpu/drm/xe/xe_sync.c            |  4 +++-
 drivers/gpu/drm/xe/xe_vm.c              | 22 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm_madvise.c      |  4 +++-
 drivers/gpu/drm/xe/xe_wait_user_fence.c |  3 ++-
 9 files changed, 52 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c82e995df779..de713348ccc1 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1644,7 +1644,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	u32 handle;
 	int err;
 
-	if (XE_IOCTL_ERR(xe, args->extensions))
+	if (XE_IOCTL_ERR(xe, args->extensions) || XE_IOCTL_ERR(xe, args->pad) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	if (XE_IOCTL_ERR(xe, args->flags &
@@ -1714,7 +1715,8 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 	struct drm_xe_gem_mmap_offset *args = data;
 	struct drm_gem_object *gem_obj;
 
-	if (XE_IOCTL_ERR(xe, args->extensions))
+	if (XE_IOCTL_ERR(xe, args->extensions) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	if (XE_IOCTL_ERR(xe, args->flags))
diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 094ec17d3004..1a9082db8f1b 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -348,7 +348,8 @@ static int engine_user_ext_set_property(struct xe_device *xe,
 		return -EFAULT;
 
 	if (XE_IOCTL_ERR(xe, ext.property >=
-			 ARRAY_SIZE(engine_set_property_funcs)))
+			 ARRAY_SIZE(engine_set_property_funcs)) ||
+	    XE_IOCTL_ERR(xe, ext.pad))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(engine_set_property_funcs));
@@ -380,7 +381,8 @@ static int engine_user_extensions(struct xe_device *xe, struct xe_engine *e,
 	if (XE_IOCTL_ERR(xe, err))
 		return -EFAULT;
 
-	if (XE_IOCTL_ERR(xe, ext.name >=
+	if (XE_IOCTL_ERR(xe, ext.pad) ||
+	    XE_IOCTL_ERR(xe, ext.name >=
 			 ARRAY_SIZE(engine_user_extension_funcs)))
 		return -EINVAL;
 
@@ -523,7 +525,8 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 	int len;
 	int err;
 
-	if (XE_IOCTL_ERR(xe, args->flags))
+	if (XE_IOCTL_ERR(xe, args->flags) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	len = args->width * args->num_placements;
@@ -639,6 +642,9 @@ int xe_engine_get_property_ioctl(struct drm_device *dev, void *data,
 	struct drm_xe_engine_get_property *args = data;
 	struct xe_engine *e;
 
+	if (XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
+		return -EINVAL;
+
 	mutex_lock(&xef->engine.lock);
 	e = xa_load(&xef->engine.xa, args->engine_id);
 	mutex_unlock(&xef->engine.lock);
@@ -718,7 +724,8 @@ int xe_engine_destroy_ioctl(struct drm_device *dev, void *data,
 	struct drm_xe_engine_destroy *args = data;
 	struct xe_engine *e;
 
-	if (XE_IOCTL_ERR(xe, args->pad))
+	if (XE_IOCTL_ERR(xe, args->pad) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	mutex_lock(&xef->engine.lock);
@@ -748,6 +755,9 @@ int xe_engine_set_property_ioctl(struct drm_device *dev, void *data,
 	int ret;
 	u32 idx;
 
+	if (XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
+		return -EINVAL;
+
 	e = xe_engine_lookup(xef, args->engine_id);
 	if (XE_IOCTL_ERR(xe, !e))
 		return -ENOENT;
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 3db1b159586e..e44076ee2e11 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -181,7 +181,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	bool write_locked;
 	int err = 0;
 
-	if (XE_IOCTL_ERR(xe, args->extensions))
+	if (XE_IOCTL_ERR(xe, args->extensions) ||
+	    XE_IOCTL_ERR(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	engine = xe_engine_lookup(xef, args->engine_id);
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index c7fbb1cc1f64..9d583f11e290 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -407,7 +407,8 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 	bool allowed;
 	int ret = 0;
 
-	if (XE_IOCTL_ERR(xe, args->extensions))
+	if (XE_IOCTL_ERR(xe, args->extensions) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	if (XE_IOCTL_ERR(xe, args->flags & ~VALID_MMIO_FLAGS))
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index dd64ff0d2a57..b10959fde43b 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -374,7 +374,8 @@ int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct drm_xe_device_query *query = data;
 	u32 idx;
 
-	if (XE_IOCTL_ERR(xe, query->extensions != 0))
+	if (XE_IOCTL_ERR(xe, query->extensions) ||
+	    XE_IOCTL_ERR(xe, query->reserved[0] || query->reserved[1]))
 		return -EINVAL;
 
 	if (XE_IOCTL_ERR(xe, query->query > ARRAY_SIZE(xe_query_funcs)))
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 1e4e4acb2c4a..5acb37a8b2ab 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -111,7 +111,9 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		return -EFAULT;
 
 	if (XE_IOCTL_ERR(xe, sync_in.flags &
-			 ~(SYNC_FLAGS_TYPE_MASK | DRM_XE_SYNC_SIGNAL)))
+			 ~(SYNC_FLAGS_TYPE_MASK | DRM_XE_SYNC_SIGNAL)) ||
+	    XE_IOCTL_ERR(xe, sync_in.pad) ||
+	    XE_IOCTL_ERR(xe, sync_in.reserved[0] || sync_in.reserved[1]))
 		return -EINVAL;
 
 	signal = sync_in.flags & DRM_XE_SYNC_SIGNAL;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a0306526b269..ea354ffbede0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1799,7 +1799,9 @@ static int vm_user_ext_set_property(struct xe_device *xe, struct xe_vm *vm,
 		return -EFAULT;
 
 	if (XE_IOCTL_ERR(xe, ext.property >=
-			 ARRAY_SIZE(vm_set_property_funcs)))
+			 ARRAY_SIZE(vm_set_property_funcs)) ||
+	    XE_IOCTL_ERR(xe, ext.pad) ||
+	    XE_IOCTL_ERR(xe, ext.reserved[0] || ext.reserved[1]))
 		return -EINVAL;
 
 	return vm_set_property_funcs[ext.property](xe, vm, ext.value);
@@ -1827,7 +1829,8 @@ static int vm_user_extensions(struct xe_device *xe, struct xe_vm *vm,
 	if (XE_IOCTL_ERR(xe, err))
 		return -EFAULT;
 
-	if (XE_IOCTL_ERR(xe, ext.name >=
+	if (XE_IOCTL_ERR(xe, ext.pad) ||
+	    XE_IOCTL_ERR(xe, ext.name >=
 			 ARRAY_SIZE(vm_user_extension_funcs)))
 		return -EINVAL;
 
@@ -1858,6 +1861,9 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	int err;
 	u32 flags = 0;
 
+	if (XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
+		return -EINVAL;
+
 	if (XE_IOCTL_ERR(xe, args->flags & ~ALL_DRM_XE_VM_CREATE_FLAGS))
 		return -EINVAL;
 
@@ -1941,7 +1947,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 	struct drm_xe_vm_destroy *args = data;
 	struct xe_vm *vm;
 
-	if (XE_IOCTL_ERR(xe, args->pad))
+	if (XE_IOCTL_ERR(xe, args->pad) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	vm = xe_vm_lookup(xef, args->vm_id);
@@ -2891,6 +2898,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 	int i;
 
 	if (XE_IOCTL_ERR(xe, args->extensions) ||
+	    XE_IOCTL_ERR(xe, args->pad || args->pad2) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]) ||
 	    XE_IOCTL_ERR(xe, !args->num_binds) ||
 	    XE_IOCTL_ERR(xe, args->num_binds > MAX_BINDS))
 		return -EINVAL;
@@ -2923,6 +2932,13 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		u64 obj_offset = (*bind_ops)[i].obj_offset;
 		u32 region = (*bind_ops)[i].region;
 
+		if (XE_IOCTL_ERR(xe, (*bind_ops)[i].pad) ||
+		    XE_IOCTL_ERR(xe, (*bind_ops)[i].reserved[0] ||
+				     (*bind_ops)[i].reserved[1])) {
+			err = -EINVAL;
+			goto free_bind_ops;
+		}
+
 		if (i == 0) {
 			*async = !!(op & XE_VM_BIND_FLAG_ASYNC);
 		} else if (XE_IOCTL_ERR(xe, !*async) ||
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 29815852985a..0f5eef337037 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -301,7 +301,9 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
 	struct xe_vma **vmas = NULL;
 	int num_vmas = 0, err = 0, idx;
 
-	if (XE_IOCTL_ERR(xe, args->extensions))
+	if (XE_IOCTL_ERR(xe, args->extensions) ||
+	    XE_IOCTL_ERR(xe, args->pad || args->pad2) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	if (XE_IOCTL_ERR(xe, args->property > ARRAY_SIZE(madvise_funcs)))
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 15c2e5aa08d2..6c8a60c60087 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -100,7 +100,8 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 		args->flags & DRM_XE_UFENCE_WAIT_VM_ERROR;
 	unsigned long timeout = args->timeout;
 
-	if (XE_IOCTL_ERR(xe, args->extensions))
+	if (XE_IOCTL_ERR(xe, args->extensions) || XE_IOCTL_ERR(xe, args->pad) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	if (XE_IOCTL_ERR(xe, args->flags & ~VALID_FLAGS))
-- 
2.40.1

