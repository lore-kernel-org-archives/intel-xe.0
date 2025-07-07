Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8195AC83F07
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 15:18:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE4E10E4CB;
	Mon,  7 Jul 2025 15:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="QjnM7Rvm";
	dkim-atps=neutral
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9D810E4CA
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 15:18:28 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3a522224582so1265008f8f.3
 for <intel-xe@lists.freedesktop.org>; Mon, 07 Jul 2025 08:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1751901507; x=1752506307; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a6CC1cvUAsk8N7isqx6HALT3NrV0r67uwhMiDy5SbZQ=;
 b=QjnM7Rvm6Oo2E8WH/4iHJie15ZWdIJG9zXzshwq98dScxsw/hD1FOtc7z5BtzoIG26
 T27WP8xAnT83DiXASpBqGrWzqBC3grc4DfHHlcDi6MuOZFW2edAKjKbmmhU9jIeEy51V
 EW2qOMrv7ijiWAyP3EXWQqVEYWULYD6r1lmfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751901507; x=1752506307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a6CC1cvUAsk8N7isqx6HALT3NrV0r67uwhMiDy5SbZQ=;
 b=hIR/gvgVm6g017iPw6QpnewIniNi3PGp1/4+NjPpf5jE41tEqwNyE779gmB4vLXHCQ
 GQpLXEiy8RZQzQzT3+zZetQmKowpkAghIK5NJdK2ShMlzK/bcR93My/38cJfWPwOTb9A
 uo4D9H5t0LZNr18AMG8DltvvCTU9R01fHF5JJ8JQiqOGv7+46+KevSka1kNNTQp8wCSW
 bVDHBMfYA+j9gskN5Ys8AZJCChStoQ0UOaFBEQbqdTV/qoO+CTwhToI2MyyOHTjxFHGR
 RfIOm5zdcN/nkWSM8IWknvtRG6utEOTigUjVXLIojgLCLAWJKh81g49/A50UoOpfB9Ss
 Xzhg==
X-Gm-Message-State: AOJu0YwUUPv9lyMR8NcjJmJHFefmOo5mhipGHHSEf1w6Fay187uaLRf5
 I5A7Rzj6ZtdVLX0/elGjsdZNylfEnwlihgKf27BPWE80wFdWqE3nZmDGMLlPY/GGxTw=
X-Gm-Gg: ASbGncuwvlkXgf2le87Pw6cRZAKmgFDT1YPWW2g1X8HJfVwMbaZgB98iJTdpgeIUUEd
 4OuVIWMIN1D6U1jGH16a/nQXKWTIRduIr5sKFOKFJCsgzpky1V8thtKyQVJre5CMN6Zr4tXX/W0
 GUBm0RNHPzHi3pOm2zmsIkUMOKEO2zibwwSXn91OT5Plf4qZu63/U7LHV48PjcQuzA3NDP7Hlib
 /n6tWOOk0bEbkcrs8wMIyanK75xa2zM/xTKn7PWnlnz4T5qnslojUJ2v1wJfyE1vGL5CeZUgUxg
 iJgqyfQrYmJ8vJq3x5xwFcK4YUxtBVwqlv3EneS/WA1PswDjg1hCXVRaEj5+SpijYbhmYR5gw0p
 c3sMsrkaU
X-Google-Smtp-Source: AGHT+IE1hrQ7ioK++cpM3hGypspA/hPhNJKSpa4wQM0tRAz+AQxBfs6swIe4874tnKWPX4+F9Kw+Tw==
X-Received: by 2002:a5d:5f81:0:b0:3a8:3105:1d49 with SMTP id
 ffacd0b85a97d-3b49aa80b6bmr7411887f8f.45.1751901507016; 
 Mon, 07 Jul 2025 08:18:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b46d4c8619sm10369057f8f.0.2025.07.07.08.18.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 08:18:26 -0700 (PDT)
From: Simona Vetter <simona.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Xe Development <intel-xe@lists.freedesktop.org>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Simona Vetter <simona.vetter@intel.com>
Subject: [PATCH 2/2] drm/panthor: Fix UAF in panthor_gem_create_with_handle()
 debugfs code
Date: Mon,  7 Jul 2025 17:18:14 +0200
Message-ID: <20250707151814.603897-2-simona.vetter@ffwll.ch>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707151814.603897-1-simona.vetter@ffwll.ch>
References: <20250707151814.603897-1-simona.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

The object is potentially already gone after the drm_gem_object_put().
In general the object should be fully constructed before calling
drm_gem_handle_create(), except the debugfs tracking uses a separate
lock and list and separate flag to denotate whether the object is
actually initilized.

Since I'm touching this all anyway simplify this by only adding the
object to the debugfs when it's ready for that, which allows us to
delete that separate flag. panthor_gem_debugfs_bo_rm() already checks
whether we've actually been added to the list or this is some error
path cleanup.

v2: Fix build issues for !CONFIG_DEBUGFS (Adrián)

Fixes: a3707f53eb3f ("drm/panthor: show device-wide list of DRM GEM objects over DebugFS")
Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Simona Vetter <simona.vetter@intel.com>
Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
---
 drivers/gpu/drm/panthor/panthor_gem.c | 34 ++++++++++++++-------------
 drivers/gpu/drm/panthor/panthor_gem.h |  3 ---
 2 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 7c00fd77758b..8232f91f3bf7 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -16,10 +16,14 @@
 #include "panthor_mmu.h"
 
 #ifdef CONFIG_DEBUG_FS
-static void panthor_gem_debugfs_bo_add(struct panthor_device *ptdev,
-				       struct panthor_gem_object *bo)
+static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo)
 {
 	INIT_LIST_HEAD(&bo->debugfs.node);
+}
+static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
+{
+	struct panthor_device *ptdev = container_of(bo->base.base.dev,
+						    struct panthor_device, base);
 
 	bo->debugfs.creator.tgid = current->group_leader->pid;
 	get_task_comm(bo->debugfs.creator.process_name, current->group_leader);
@@ -44,14 +48,13 @@ static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
 
 static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags)
 {
-	bo->debugfs.flags = usage_flags | PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
+	bo->debugfs.flags = usage_flags;
+	panthor_gem_debugfs_bo_add(bo);
 }
 #else
-static void panthor_gem_debugfs_bo_add(struct panthor_device *ptdev,
-				       struct panthor_gem_object *bo)
-{}
 static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo) {}
 static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {}
+static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo) {}
 #endif
 
 static void panthor_gem_free_object(struct drm_gem_object *obj)
@@ -246,7 +249,7 @@ struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t
 	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
 	mutex_init(&obj->label.lock);
 
-	panthor_gem_debugfs_bo_add(ptdev, obj);
+	panthor_gem_debugfs_bo_init(obj);
 
 	return &obj->base.base;
 }
@@ -285,6 +288,12 @@ panthor_gem_create_with_handle(struct drm_file *file,
 		bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
 	}
 
+	/*
+	 * No explicit flags are needed in the call below, since the
+	 * function internally sets the INITIALIZED bit for us.
+	 */
+	panthor_gem_debugfs_set_usage_flags(bo, 0);
+
 	/*
 	 * Allocate an id of idr table where the obj is registered
 	 * and handle has the id what user can see.
@@ -296,12 +305,6 @@ panthor_gem_create_with_handle(struct drm_file *file,
 	/* drop reference from allocate - handle holds it now. */
 	drm_gem_object_put(&shmem->base);
 
-	/*
-	 * No explicit flags are needed in the call below, since the
-	 * function internally sets the INITIALIZED bit for us.
-	 */
-	panthor_gem_debugfs_set_usage_flags(bo, 0);
-
 	return ret;
 }
 
@@ -387,7 +390,7 @@ static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
 	unsigned int refcount = kref_read(&bo->base.base.refcount);
 	char creator_info[32] = {};
 	size_t resident_size;
-	u32 gem_usage_flags = bo->debugfs.flags & (u32)~PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
+	u32 gem_usage_flags = bo->debugfs.flags;
 	u32 gem_state_flags = 0;
 
 	/* Skip BOs being destroyed. */
@@ -436,8 +439,7 @@ void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
 
 	scoped_guard(mutex, &ptdev->gems.lock) {
 		list_for_each_entry(bo, &ptdev->gems.node, debugfs.node) {
-			if (bo->debugfs.flags & PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED)
-				panthor_gem_debugfs_bo_print(bo, m, &totals);
+			panthor_gem_debugfs_bo_print(bo, m, &totals);
 		}
 	}
 
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 4dd732dcd59f..8fc7215e9b90 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -35,9 +35,6 @@ enum panthor_debugfs_gem_usage_flags {
 
 	/** @PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED: BO is mapped on the FW VM. */
 	PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED = BIT(PANTHOR_DEBUGFS_GEM_USAGE_FW_MAPPED_BIT),
-
-	/** @PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED: BO is ready for DebugFS display. */
-	PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED = BIT(31),
 };
 
 /**
-- 
2.49.0

