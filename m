Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD5DC77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 00:32:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC6510E10A;
	Fri, 26 May 2023 00:32:35 +0000 (UTC)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119D610E00F
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 00:32:30 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-64d41d8bc63so315321b3a.0
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 17:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685061150; x=1687653150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=74v/BK/1AWXL8A+joVuX91AS8ljC8A9RxqmkIexlntQ=;
 b=DOSSFMP+PWgNMr0SE5R3JkSheKCcUrlIuG7SNS4esNv9zkGxvonS1XyR/55YdmI7NX
 8xb97Qf8eqZiqges4b7ru0XLjtZ41c338ncHXwyia4t3DPxWGcTO6UQRlYqO++xQafIC
 3gTXEDdOR8KbzKUWWUTT98YJjxf1re7YLuxXg0NQ9YE0dvjr6C4dpyEsPBFBs8Y85QYB
 ItCdLd9JFNlXP0hSzMmWV6/zfCGtk55NX5v9DovYam/k6CWM50dkHqf02iw//5KFM4WA
 CXovzE82KU/xfQl0x3u5z4hCtbv5cAIPISRowUAHHGI6C464NuJAPe2o4J/loEUXlxiR
 H1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685061150; x=1687653150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=74v/BK/1AWXL8A+joVuX91AS8ljC8A9RxqmkIexlntQ=;
 b=CXFZ8Kfjqu3/+GUnbqAzD7f/g1LVB6ZMRdHa5h7i54CUdAMS7CoeUxUeigZ3tihhOe
 4H05eQTPiM5OV67VJT8ZiQrlCI3R/ce8pknKfKwncfIPbDsGaTIWkeDY2T4+g3XhB2EE
 DOFWEBUB563Bzdq9S8UgMrDfa0+46Jx2hw0orXpSwdIoe8aY3SaXXKMR7l2VA5NBBbVG
 haeg3Ki5hjxZ3lns0GxbHNPtJtB5L2PNkUo8wVNQ23kyRO1+luHUSSU0StDQw4Wab45L
 DyDjnDoz7uKhM6CpcgeBb6l+ZZNppUINvEn5do4oFAo8T+/iowTwA1sxxL8iSaVLoQvm
 2AGQ==
X-Gm-Message-State: AC+VfDwaV+1lBN9vcw8BxIvHgfBnxo9cEFD1HQVP2oSlJ01Z0xyCfSFd
 bsCViVrPnLnaqwM4/Xmi4Z53rcyYDkoRVqnL
X-Google-Smtp-Source: ACHHUZ63ouOqt0EONsCVh6K+KS9BSTi8Y/SBUjWvAszLh2wKxc7Tv/ff6vbjOTWtxouFTV1syvexow==
X-Received: by 2002:a05:6a21:3293:b0:10b:ecde:291f with SMTP id
 yt19-20020a056a21329300b0010becde291fmr18291002pzb.57.1685061150091; 
 Thu, 25 May 2023 17:32:30 -0700 (PDT)
Received: from mrgency.tuatara-tone.ts.net
 ([2600:6c51:4c3f:9541:841e:5ff:fea9:3053])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a62ed0f000000b00634b91326a9sm1710156pfh.143.2023.05.25.17.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 17:32:29 -0700 (PDT)
From: Christopher Snowhill <kode54@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 17:32:21 -0700
Message-Id: <20230526003221.3874899-3-kode54@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526003221.3874899-1-kode54@gmail.com>
References: <20230526003221.3874899-1-kode54@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 2/2] drm/xe: Validate uAPI padding and
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
Cc: Ryan Houdek <sonicadvance1@gmail.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Padding and reserved fields are declared such that they must be
zeroed, so verify that they're all zero in the respective ioctl
functions.

v3:
	Rebased original mlankhorst patch
	Changed one padding member to avoid changing num_batch_buffer size
v2:
	Removed extensions check where there was none originally. (José)
	Moved extraneous parentheses to the correct places. (Lucas)

Suggested-by: Ryan Houdek <sonicadvance1@gmail.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Christopher Snowhill <kode54@gmail.com>
---
 drivers/gpu/drm/xe/xe_bo.c              |  6 ++++--
 drivers/gpu/drm/xe/xe_engine.c          | 18 ++++++++++++++----
 drivers/gpu/drm/xe/xe_exec.c            |  4 +++-
 drivers/gpu/drm/xe/xe_mmio.c            |  3 ++-
 drivers/gpu/drm/xe/xe_query.c           |  3 ++-
 drivers/gpu/drm/xe/xe_sync.c            |  4 +++-
 drivers/gpu/drm/xe/xe_vm.c              | 21 ++++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm_madvise.c      |  3 ++-
 drivers/gpu/drm/xe/xe_wait_user_fence.c |  3 ++-
 9 files changed, 50 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 21c5aca424dd..0db9c05097d0 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1646,7 +1646,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	u32 handle;
 	int err;
 
-	if (XE_IOCTL_ERR(xe, args->extensions))
+	if (XE_IOCTL_ERR(xe, args->extensions) || XE_IOCTL_ERR(xe, args->pad) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	if (XE_IOCTL_ERR(xe, args->flags &
@@ -1716,7 +1717,8 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
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
index 4c270a07136e..87dd417e3f08 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -404,7 +404,8 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
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
index 4d9c8de8b348..93a146bc639a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1801,7 +1801,9 @@ static int vm_user_ext_set_property(struct xe_device *xe, struct xe_vm *vm,
 		return -EFAULT;
 
 	if (XE_IOCTL_ERR(xe, ext.property >=
-			 ARRAY_SIZE(vm_set_property_funcs)))
+			 ARRAY_SIZE(vm_set_property_funcs)) ||
+	    XE_IOCTL_ERR(xe, ext.pad) ||
+	    XE_IOCTL_ERR(xe, ext.reserved[0] || ext.reserved[1]))
 		return -EINVAL;
 
 	return vm_set_property_funcs[ext.property](xe, vm, ext.value);
@@ -1829,7 +1831,8 @@ static int vm_user_extensions(struct xe_device *xe, struct xe_vm *vm,
 	if (XE_IOCTL_ERR(xe, err))
 		return -EFAULT;
 
-	if (XE_IOCTL_ERR(xe, ext.name >=
+	if (XE_IOCTL_ERR(xe, ext.pad) ||
+	    XE_IOCTL_ERR(xe, ext.name >=
 			 ARRAY_SIZE(vm_user_extension_funcs)))
 		return -EINVAL;
 
@@ -1860,6 +1863,9 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	int err;
 	u32 flags = 0;
 
+	if (XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
+		return -EINVAL;
+
 	if (XE_IOCTL_ERR(xe, args->flags & ~ALL_DRM_XE_VM_CREATE_FLAGS))
 		return -EINVAL;
 
@@ -1943,7 +1949,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 	struct drm_xe_vm_destroy *args = data;
 	struct xe_vm *vm;
 
-	if (XE_IOCTL_ERR(xe, args->pad))
+	if (XE_IOCTL_ERR(xe, args->pad) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	vm = xe_vm_lookup(xef, args->vm_id);
@@ -2893,6 +2900,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 	int i;
 
 	if (XE_IOCTL_ERR(xe, args->extensions) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]) ||
 	    XE_IOCTL_ERR(xe, !args->num_binds) ||
 	    XE_IOCTL_ERR(xe, args->num_binds > MAX_BINDS))
 		return -EINVAL;
@@ -2925,6 +2933,13 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
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
index 29815852985a..c7e3ae7203d7 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -301,7 +301,8 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
 	struct xe_vma **vmas = NULL;
 	int num_vmas = 0, err = 0, idx;
 
-	if (XE_IOCTL_ERR(xe, args->extensions))
+	if (XE_IOCTL_ERR(xe, args->extensions) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	if (XE_IOCTL_ERR(xe, args->property > ARRAY_SIZE(madvise_funcs)))
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 15c2e5aa08d2..eef989647bb0 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -100,7 +100,8 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 		args->flags & DRM_XE_UFENCE_WAIT_VM_ERROR;
 	unsigned long timeout = args->timeout;
 
-	if (XE_IOCTL_ERR(xe, args->extensions))
+	if (XE_IOCTL_ERR(xe, args->extensions) ||
+	    XE_IOCTL_ERR(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
 	if (XE_IOCTL_ERR(xe, args->flags & ~VALID_FLAGS))
-- 
2.40.1

