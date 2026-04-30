Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498FDCCFA13
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 10:51:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0657F10E159;
	Thu, 30 Apr 2026 10:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iObythE7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B92010E159
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 10:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777546316; x=1809082316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6Wt7z6SQEaV8pij4mym0hRXuiWwxlqbVOMp6ia2Chac=;
 b=iObythE7W8mlpXI3yhP04vwzmabUIk5vjaC4f7nCFTxyfD6qZnp3ACG3
 9R1Rk9B1bcbPTkI8Itqnpd0OUVlzjUFIyBtmzLY+SX+Xg0mK9wjUGvmtu
 of/KivSMdL+T6i+VsKvzpvwz9HlBCZ8+VTc+aYAgKvg7sVOAgZsW5YHia
 u9PVhsYLL2a4ynSkkaMGjJFVR/ZslfTTIWKkfxpsIdP8zx/z0+/Y78dJD
 gQBAi4/vmTvYd+qCk87O/jESwC/P8VZMXmG7FiX5iEYO/383GeHuEEZ98
 tMpwSkP7CXPInjGYZxEe2s8D/wQIxdE1ynziS+aGWSum+7bDyycZK4htO A==;
X-CSE-ConnectionGUID: bsXtqnIJSsCjehSJawBNuw==
X-CSE-MsgGUID: gyygPTnIRUqknQenEMdd+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89585864"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="89585864"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:51:56 -0700
X-CSE-ConnectionGUID: MEJqjSx3SmusA13P9jVAvQ==
X-CSE-MsgGUID: N/6HeiOkReWg9c3b6mFe2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="233518448"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.250.15])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 03:51:48 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, matthew.brost@intel.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, joonas.lahtinen@linux.intel.com,
 gustavo.sousa@intel.com, jan.maslak@intel.com,
 dominik.karol.piatkowski@intel.com, rodrigo.vivi@intel.com,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 maciej.patelczyk@intel.com, gwan-gyeong.mun@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH 01/24] drm/xe/eudebug: Introduce eudebug interface
Date: Thu, 30 Apr 2026 13:50:57 +0300
Message-ID: <20260430105121.712843-2-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
References: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
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

This patch adds the eudebug interface to the Xe driver, enabling
user-space debuggers (e.g., GDB) to track and interact with GPU resources
of a DRM client. Debuggers can inspect or modify these resources,
for example, to locate ISA/ELF sections and install breakpoints in a
shader's instruction stream.

A debugger opens a connection to the Xe driver via a DRM ioctl, specifying
the target DRM client's file descriptor. This returns an anonymous file
descriptor for the connection, which can be used to listen for resource
creation/destruction events. The same file descriptor can also be used to
receive hardware state change events and control execution flow by
interrupting EU threads on the GPU (in follow-up patches).

This patch introduces the eudebug connection and event queuing,
adding client create/destroy and VM create/destroy events as a baseline.
Additional events and hardware control for full debugger operation are
needed and will be introduced in follow-up patches.

The resource tracking components are inspired by Maciej Patelczyk's work on
resource handling for i915. Chris Wilson suggested a two-way mapping
approach, which simplifies using the resource map as definitive
bookkeeping forresources relayed to the debugger during the discovery
phase (in a follow-up patch).

v2: - Kconfig support (Matthew)
    - ptraced access control (Lucas)
    - pass expected event length to user (Zbigniew)
    - only track long running VMs
    - checkpatch (Tilak)
    - include order (Andrzej)
    - 32bit fixes (Andrzej)
    - cleaner get_task_struct
    - remove xa_array and use clients.list for tracking (Mika)

v3: - adapt to removal of clients.lock (Mika)
    - create_event cleanup (Christoph)

v4: - add proper header guards (Christoph)
    - better read_event fault handling (Christoph, Mika)
    - simplify attach (Mika)
    - connect using target file descriptors
    - avoid event->seqno after queue as it is can UAF (Mika)
    - use drmm for eudebug_fini (Maciej)
    - squash dynamic enable

v6: - drm->authenticated is overzealous for render (Mika)

v7: - struct member documentation (Mika)
    - enforce seqno mbz (Mika)

v8  - head->seqno fix (Mika)
    - resource alloc and removal cleanup (Mika)
    - s/wait_interruptible_timeout/wait_timeout (Mika)
    - use fd_install in connect (Mika)

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>

fix

dont use NOTCON  on resource add remove
---
 drivers/gpu/drm/xe/Kconfig            |   10 +
 drivers/gpu/drm/xe/Makefile           |    3 +
 drivers/gpu/drm/xe/xe_device.c        |   14 +
 drivers/gpu/drm/xe/xe_device_types.h  |   32 +
 drivers/gpu/drm/xe/xe_eudebug.c       | 1040 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.h       |   65 ++
 drivers/gpu/drm/xe/xe_eudebug_types.h |  121 +++
 drivers/gpu/drm/xe/xe_vm.c            |    7 +-
 include/uapi/drm/xe_drm.h             |   29 +
 include/uapi/drm/xe_drm_eudebug.h     |   80 ++
 10 files changed, 1400 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug.c
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug.h
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_types.h
 create mode 100644 include/uapi/drm/xe_drm_eudebug.h

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 4d7dcaff2b91..78d4673665b4 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -129,6 +129,16 @@ config DRM_XE_FORCE_PROBE
 
 	  Use "!*" to block the probe of the driver for all known devices.
 
+config DRM_XE_EUDEBUG
+	bool "Enable gdb debugger support (eudebug)"
+	depends on DRM_XE
+	default y
+	help
+	  Choose this option if you want to add support for debugger (gdb) to
+	  attach into process using Xe and debug the gpu/gpgpu programs.
+	  With debugger support, Xe will provide interface for a debugger to
+	  process to track, inspect and modify resources.
+
 menu "drm/Xe Debugging"
 depends on DRM_XE
 depends on EXPERT
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 09661f079d03..7212ceb339ab 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -156,6 +156,9 @@ xe-$(CONFIG_I2C)	+= xe_i2c.o
 xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
 xe-$(CONFIG_DRM_GPUSVM) += xe_userptr.o
 
+# debugging shaders with gdb (eudebug) support
+xe-$(CONFIG_DRM_XE_EUDEBUG) += xe_eudebug.o
+
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) += xe_hwmon.o
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4b45b617a039..4e6773cf806f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -34,6 +34,7 @@
 #include "xe_dma_buf.h"
 #include "xe_drm_client.h"
 #include "xe_drv.h"
+#include "xe_eudebug.h"
 #include "xe_exec.h"
 #include "xe_exec_queue.h"
 #include "xe_force_wake.h"
@@ -110,6 +111,11 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 	mutex_init(&xef->exec_queue.lock);
 	xa_init_flags(&xef->exec_queue.xa, XA_FLAGS_ALLOC1);
 
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+	mutex_init(&xef->eudebug.lock);
+	INIT_LIST_HEAD(&xef->eudebug.target_link);
+#endif
+
 	file->driver_priv = xef;
 	kref_init(&xef->refcount);
 
@@ -132,6 +138,9 @@ static void xe_file_destroy(struct kref *ref)
 	xa_destroy(&xef->vm.xa);
 	mutex_destroy(&xef->vm.lock);
 
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+	mutex_destroy(&xef->eudebug.lock);
+#endif
 	xe_drm_client_put(xef->client);
 	kfree(xef->process_name);
 	kfree(xef);
@@ -173,6 +182,8 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 
 	guard(xe_pm_runtime)(xe);
 
+	xe_eudebug_file_close(xef);
+
 	/*
 	 * No need for exec_queue.lock here as there is no contention for it
 	 * when FD is closing as IOCTLs presumably can't be modifying the
@@ -216,6 +227,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_VM_GET_PROPERTY, xe_vm_get_property_ioctl,
 			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_EUDEBUG_CONNECT, xe_eudebug_connect_ioctl, DRM_RENDER_ALLOW),
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
@@ -1071,6 +1083,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	xe_eudebug_init(xe);
+
 	detect_preproduction_hw(xe);
 
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 89437de3001a..733f4ab391bd 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -14,6 +14,7 @@
 
 #include "xe_devcoredump_types.h"
 #include "xe_drm_ras_types.h"
+#include "xe_eudebug_types.h"
 #include "xe_heci_gsc.h"
 #include "xe_late_bind_fw_types.h"
 #include "xe_oa_types.h"
@@ -568,6 +569,23 @@ struct xe_device {
 		spinlock_t lock;
 	} uncore;
 #endif
+
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+	/** @debugger connection list and globals for device */
+	struct {
+		/** @eudebug.session_count: session counter to track connections */
+		u64 session_count;
+
+		/** @eudebug.available: is the debugging functionality available */
+		enum xe_eudebug_state state;
+
+		/** @eudebug.targets: this is list for xe_files for each target */
+		struct list_head targets;
+
+		/** @eudebug.lock: protects state and targets */
+		struct mutex lock;
+	} eudebug;
+#endif
 };
 
 /**
@@ -629,6 +647,20 @@ struct xe_file {
 
 	/** @refcount: ref count of this xe file */
 	struct kref refcount;
+
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+	/** @eudebug: struct to hold eudebug connection specifics */
+	struct {
+		/** @eudebug.debugger: the debugger connection into this xe_file */
+		struct xe_eudebug *debugger;
+
+		/** @eudebug.lock: protecting debugger */
+		struct mutex lock;
+
+		/** @target_link: link into xe_device.eudebug.targets */
+		struct list_head target_link;
+	} eudebug;
+#endif
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
new file mode 100644
index 000000000000..02ecdbca46ff
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -0,0 +1,1040 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023-2025 Intel Corporation
+ */
+
+#include <linux/anon_inodes.h>
+#include <linux/delay.h>
+#include <linux/poll.h>
+#include <linux/uaccess.h>
+
+#include <drm/drm_managed.h>
+#include <uapi/drm/xe_drm.h>
+
+#include "xe_assert.h"
+#include "xe_device.h"
+#include "xe_eudebug.h"
+#include "xe_eudebug_types.h"
+#include "xe_macros.h"
+#include "xe_vm.h"
+
+/*
+ * If there is no detected event read by userspace, during this period, assume
+ * userspace problem and disconnect debugger to allow forward progress.
+ */
+#define XE_EUDEBUG_NO_READ_DETECTED_TIMEOUT_MS (25 * 1000)
+
+#define cast_event(T, event) container_of((event), typeof(*(T)), base)
+
+static struct drm_xe_eudebug_event *
+event_fifo_pending(struct xe_eudebug *d)
+{
+	struct drm_xe_eudebug_event *event;
+
+	if (kfifo_peek(&d->events.fifo, &event))
+		return event;
+
+	return NULL;
+}
+
+/*
+ * This is racy as we dont take the lock for read but all the
+ * callsites can handle the race so we can live without lock.
+ */
+__no_kcsan
+static unsigned int
+event_fifo_num_events_peek(const struct xe_eudebug * const d)
+{
+	return kfifo_len(&d->events.fifo);
+}
+
+static bool
+xe_eudebug_detached(struct xe_eudebug *d)
+{
+	return READ_ONCE(d->target.xef) == NULL;
+}
+
+static unsigned int
+event_fifo_has_events(struct xe_eudebug *d)
+{
+	/* Allow all waiters to proceed to check their state */
+	if (xe_eudebug_detached(d))
+		return 1;
+
+	return event_fifo_num_events_peek(d);
+}
+
+static const struct rhashtable_params rhash_res = {
+	.head_offset = offsetof(struct xe_eudebug_handle, rh_head),
+	.key_len = sizeof_field(struct xe_eudebug_handle, key),
+	.key_offset = offsetof(struct xe_eudebug_handle, key),
+	.automatic_shrinking = true,
+};
+
+static struct xe_eudebug_resource *
+resource_from_type(struct xe_eudebug *d, int t)
+{
+	return &d->target.res[t];
+}
+
+static int
+xe_eudebug_resources_init(struct xe_eudebug *d)
+{
+	int ret;
+	int i;
+
+	ret = 0;
+	for (i = 0; i < XE_EUDEBUG_RES_TYPE_COUNT; i++) {
+		struct xe_eudebug_resource *r = resource_from_type(d, i);
+
+		xa_init_flags(&r->xa, XA_FLAGS_ALLOC1);
+		ret = rhashtable_init(&r->rh, &rhash_res);
+
+		if (ret) {
+			xa_destroy(&r->xa);
+			break;
+		}
+	}
+
+	if (!ret)
+		return 0;
+
+	while (i--) {
+		struct xe_eudebug_resource *r = resource_from_type(d, i);
+
+		xa_destroy(&r->xa);
+		rhashtable_destroy(&r->rh);
+	}
+
+	return ret;
+}
+
+static void
+xe_eudebug_resources_destroy(struct xe_eudebug *d)
+{
+	unsigned long j;
+	int err;
+	int i;
+
+	mutex_lock(&d->target.lock);
+	for (i = 0; i < XE_EUDEBUG_RES_TYPE_COUNT; i++) {
+		struct xe_eudebug_resource *r = resource_from_type(d, i);
+		struct xe_eudebug_handle *h;
+
+		xa_for_each(&r->xa, j, h) {
+			struct xe_eudebug_handle *t;
+
+			err = rhashtable_remove_fast(&r->rh,
+						     &h->rh_head,
+						     rhash_res);
+			xe_eudebug_assert(d, !err);
+			t = xa_erase(&r->xa, h->id);
+			if (XE_WARN_ON(!t))
+				continue;
+
+			xe_eudebug_assert(d, t == h);
+			kfree(t);
+		}
+	}
+	mutex_unlock(&d->target.lock);
+
+	for (i = 0; i < XE_EUDEBUG_RES_TYPE_COUNT; i++) {
+		struct xe_eudebug_resource *r = resource_from_type(d, i);
+
+		rhashtable_destroy(&r->rh);
+		xe_eudebug_assert(d, xa_empty(&r->xa));
+		xa_destroy(&r->xa);
+	}
+}
+
+static void xe_eudebug_free(struct kref *ref)
+{
+	struct xe_eudebug *d = container_of(ref, typeof(*d), ref);
+	struct drm_xe_eudebug_event *event;
+
+	xe_assert(d->xe, xe_eudebug_detached(d));
+
+	while (kfifo_get(&d->events.fifo, &event))
+		kfree(event);
+
+	xe_eudebug_resources_destroy(d);
+	mutex_destroy(&d->target.lock);
+	XE_WARN_ON(d->target.xef);
+
+	xe_eudebug_assert(d, !kfifo_len(&d->events.fifo));
+
+	kfree(d);
+}
+
+static void xe_eudebug_put(struct xe_eudebug *d)
+{
+	kref_put(&d->ref, xe_eudebug_free);
+}
+
+static void remove_debugger(struct xe_file *xef)
+{
+	struct xe_eudebug *d;
+
+	if (XE_WARN_ON(!xef))
+		return;
+
+	mutex_lock(&xef->eudebug.lock);
+	d = xef->eudebug.debugger;
+	if (d)
+		xef->eudebug.debugger = NULL;
+	mutex_unlock(&xef->eudebug.lock);
+
+	if (d) {
+		struct xe_device *xe = d->xe;
+
+		mutex_lock(&xe->eudebug.lock);
+		list_del_init(&xef->eudebug.target_link);
+		mutex_unlock(&xe->eudebug.lock);
+
+		eu_dbg(d, "debugger removed");
+
+		xe_eudebug_put(d);
+	}
+}
+
+static bool xe_eudebug_detach(struct xe_device *xe,
+			      struct xe_eudebug *d,
+			      const int err)
+{
+	struct xe_file *target = NULL;
+
+	XE_WARN_ON(err > 0);
+
+	mutex_lock(&d->target.lock);
+	if (d->target.xef) {
+		target = d->target.xef;
+		d->target.err = err;
+		WRITE_ONCE(d->target.xef, NULL);
+	}
+	mutex_unlock(&d->target.lock);
+
+	if (!target)
+		return false;
+
+	eu_dbg(d, "session %lld detached with %d", d->session, err);
+
+	remove_debugger(target);
+	xe_file_put(target);
+
+	return true;
+}
+
+static int _xe_eudebug_disconnect(struct xe_eudebug *d,
+				  const int err)
+{
+	wake_up_all(&d->events.write_done);
+	wake_up_all(&d->events.read_done);
+
+	return xe_eudebug_detach(d->xe, d, err);
+}
+
+#define xe_eudebug_disconnect(_d, _err) ({ \
+	if (_xe_eudebug_disconnect((_d), (_err))) { \
+		if ((_err) == 0 || (_err) == -ETIMEDOUT) \
+			eu_dbg((_d), "Session closed (%d)", (_err));	\
+		else \
+			eu_err((_d), "Session disconnected, err = %d (%s:%d)", \
+			       (_err), __func__, __LINE__); \
+	} \
+})
+
+static struct xe_eudebug *
+xe_eudebug_get(struct xe_file *xef)
+{
+	struct xe_eudebug *d;
+
+	mutex_lock(&xef->eudebug.lock);
+	d = xef->eudebug.debugger;
+	if (d && !kref_get_unless_zero(&d->ref))
+		d = NULL;
+	mutex_unlock(&xef->eudebug.lock);
+
+	if (!d)
+		return NULL;
+
+	if (xe_eudebug_detached(d)) {
+		xe_eudebug_put(d);
+		return NULL;
+	}
+
+	return d;
+}
+
+static int xe_eudebug_queue_event(struct xe_eudebug *d,
+				  struct drm_xe_eudebug_event *event)
+{
+	const u64 wait_jiffies = msecs_to_jiffies(1000);
+	u64 last_read_detected_ts, last_head_seqno, start_ts;
+	const u64 event_seqno = event->seqno;
+
+	xe_eudebug_assert(d, event->len > sizeof(struct drm_xe_eudebug_event));
+	xe_eudebug_assert(d, event->type);
+	xe_eudebug_assert(d, event->type != DRM_XE_EUDEBUG_EVENT_READ);
+
+	start_ts = ktime_get();
+	last_read_detected_ts = start_ts;
+	last_head_seqno = 0;
+
+	do  {
+		struct drm_xe_eudebug_event *head;
+		u64 head_seqno;
+		bool was_queued;
+
+		if (xe_eudebug_detached(d))
+			break;
+
+		spin_lock(&d->events.lock);
+		head = event_fifo_pending(d);
+		if (head)
+			head_seqno = head->seqno;
+		else
+			head_seqno = 0;
+
+		was_queued = kfifo_in(&d->events.fifo, &event, 1);
+		spin_unlock(&d->events.lock);
+
+		wake_up_all(&d->events.write_done);
+
+		if (was_queued) {
+			eu_dbg(d, "queued event with seqno %lld (head %lld)\n",
+			       event_seqno, head_seqno);
+			event = NULL;
+			break;
+		}
+
+		XE_WARN_ON(!head_seqno);
+
+		/* If we detect progress, restart timeout */
+		if (last_head_seqno != head_seqno)
+			last_read_detected_ts = ktime_get();
+
+		last_head_seqno = head_seqno;
+
+		wait_event_timeout(d->events.read_done,
+				   !kfifo_is_full(&d->events.fifo) ||
+				   xe_eudebug_detached(d),
+				   wait_jiffies);
+
+	} while (ktime_ms_delta(ktime_get(), last_read_detected_ts) <
+		 XE_EUDEBUG_NO_READ_DETECTED_TIMEOUT_MS);
+
+	if (event) {
+		eu_dbg(d,
+		       "event %llu queue failed (blocked %lld ms, avail %d)",
+		       event->seqno,
+		       ktime_ms_delta(ktime_get(), start_ts),
+		       kfifo_avail(&d->events.fifo));
+
+		kfree(event);
+
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static struct xe_eudebug_handle *
+alloc_handle(const int type, const u64 key)
+{
+	struct xe_eudebug_handle *h;
+
+	h = kzalloc_obj(*h, GFP_KERNEL);
+	if (!h)
+		return NULL;
+
+	h->key = key;
+
+	return h;
+}
+
+static struct xe_eudebug_handle *
+__find_handle(struct xe_eudebug_resource *r,
+	      const u64 key)
+{
+	struct xe_eudebug_handle *h;
+
+	h = rhashtable_lookup_fast(&r->rh,
+				   &key,
+				   rhash_res);
+	return h;
+}
+
+static int _xe_eudebug_add_handle(struct xe_eudebug *d,
+				  int type,
+				  void *p,
+				  u64 *seqno,
+				  int *handle)
+{
+	const u64 key = (uintptr_t)p;
+	struct xe_eudebug_resource *r;
+	struct xe_eudebug_handle *h, *o;
+	int err;
+
+	if (XE_WARN_ON(!p))
+		return -EINVAL;
+
+	h = alloc_handle(type, key);
+	if (!h)
+		return -ENOMEM;
+
+	r = resource_from_type(d, type);
+
+	mutex_lock(&d->target.lock);
+	o = __find_handle(r, key);
+	if (o) {
+		err = -EEXIST;
+	} else {
+		err = xa_alloc(&r->xa, &h->id, h, xa_limit_31b, GFP_KERNEL);
+		if (!err) {
+			err = rhashtable_insert_fast(&r->rh,
+						     &h->rh_head,
+						     rhash_res);
+			if (err)
+				xa_erase(&r->xa, h->id);
+			else if (seqno)
+				*seqno = atomic_long_inc_return(&d->events.seqno);
+		}
+	}
+	mutex_unlock(&d->target.lock);
+
+	if (err) {
+		kfree(h);
+		XE_WARN_ON(err > 0);
+		return err;
+	}
+
+	if (handle)
+		*handle = h->id;
+
+	xe_eudebug_assert(d, h->id);
+
+	return h->id;
+}
+
+static int xe_eudebug_add_handle(struct xe_eudebug *d,
+				 int type,
+				 void *p,
+				 u64 *seqno)
+{
+	int ret;
+
+	ret = _xe_eudebug_add_handle(d, type, p, seqno, NULL);
+
+	eu_dbg(d, "handle type %d handle %p added: %d\n", type, p, ret);
+
+	return ret;
+}
+
+static int _xe_eudebug_remove_handle(struct xe_eudebug *d, int type, void *p,
+				     u64 *seqno)
+{
+	const u64 key = (uintptr_t)p;
+	struct xe_eudebug_resource *r;
+	struct xe_eudebug_handle *h, *xa_h;
+	int ret;
+
+	if (XE_WARN_ON(!key))
+		return -EINVAL;
+
+	r = resource_from_type(d, type);
+
+	mutex_lock(&d->target.lock);
+	h = __find_handle(r, key);
+	if (!h) {
+		ret = -ENOENT;
+		goto out;
+	}
+
+	xa_h = xa_load(&r->xa, h->id);
+	if (XE_WARN_ON(!xa_h || xa_h != h)) {
+		ret = -EIO;
+		goto out;
+	}
+
+	ret = rhashtable_remove_fast(&r->rh,
+				     &h->rh_head,
+				     rhash_res);
+	if (XE_WARN_ON(ret)) {
+		ret = -EIO;
+		goto out;
+	}
+
+	xa_h = xa_erase(&r->xa, h->id);
+	if (XE_WARN_ON(xa_h != h)) {
+		ret = -EIO;
+		goto out;
+	}
+
+	ret = h->id;
+	if (seqno)
+		*seqno = atomic_long_inc_return(&d->events.seqno);
+
+	kfree(h);
+out:
+	mutex_unlock(&d->target.lock);
+
+	return ret;
+}
+
+static int xe_eudebug_remove_handle(struct xe_eudebug *d, int type, void *p,
+				    u64 *seqno)
+{
+	int ret;
+
+	ret = _xe_eudebug_remove_handle(d, type, p, seqno);
+
+	eu_dbg(d, "handle type %d handle %p removed: %d\n", type, p, ret);
+
+	return ret;
+}
+
+static struct drm_xe_eudebug_event *
+xe_eudebug_create_event(struct xe_eudebug *d, u16 type, u64 seqno, u16 flags,
+			u32 len)
+{
+	const u16 known_flags =
+		DRM_XE_EUDEBUG_EVENT_CREATE |
+		DRM_XE_EUDEBUG_EVENT_DESTROY |
+		DRM_XE_EUDEBUG_EVENT_STATE_CHANGE |
+		DRM_XE_EUDEBUG_EVENT_NEED_ACK;
+	struct drm_xe_eudebug_event *event;
+
+	BUILD_BUG_ON(type > XE_EUDEBUG_MAX_EVENT_TYPE);
+
+	xe_eudebug_assert(d, type <= XE_EUDEBUG_MAX_EVENT_TYPE);
+	xe_eudebug_assert(d, !(~known_flags & flags));
+	xe_eudebug_assert(d, len > sizeof(*event));
+
+	event = kzalloc(len, GFP_KERNEL);
+	if (!event)
+		return NULL;
+
+	event->len = len;
+	event->type = type;
+	event->flags = flags;
+	event->seqno = seqno;
+
+	return event;
+}
+
+static int send_vm_event(struct xe_eudebug *d, u32 flags,
+			 const u64 vm_handle,
+			 const u64 seqno)
+{
+	struct drm_xe_eudebug_event *event;
+	struct drm_xe_eudebug_event_vm *e;
+
+	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_VM,
+					seqno, flags, sizeof(*e));
+	if (!event)
+		return -ENOMEM;
+
+	e = cast_event(e, event);
+
+	e->vm_handle = vm_handle;
+
+	return xe_eudebug_queue_event(d, event);
+}
+
+static int vm_create_event(struct xe_eudebug *d,
+			   struct xe_file *xef, struct xe_vm *vm)
+{
+	int vm_id;
+	u64 seqno;
+	int ret;
+
+	if (!xe_vm_in_lr_mode(vm))
+		return 0;
+
+	vm_id = xe_eudebug_add_handle(d, XE_EUDEBUG_RES_TYPE_VM, vm, &seqno);
+	if (vm_id < 0)
+		return vm_id;
+
+	ret = send_vm_event(d, DRM_XE_EUDEBUG_EVENT_CREATE, vm_id, seqno);
+	if (ret)
+		eu_dbg(d, "send_vm_event create error %d\n", ret);
+
+	return ret;
+}
+
+static int vm_destroy_event(struct xe_eudebug *d,
+			    struct xe_file *xef, struct xe_vm *vm)
+{
+	int vm_id;
+	u64 seqno;
+	int ret;
+
+	if (!xe_vm_in_lr_mode(vm))
+		return 0;
+
+	vm_id = xe_eudebug_remove_handle(d, XE_EUDEBUG_RES_TYPE_VM, vm, &seqno);
+	if (vm_id < 0)
+		return vm_id;
+
+	ret = send_vm_event(d, DRM_XE_EUDEBUG_EVENT_DESTROY, vm_id, seqno);
+	if (ret)
+		eu_dbg(d, "send_vm_event destroy error %d\n", ret);
+
+	return ret;
+}
+
+#define xe_eudebug_event_put(_d, _err) ({ \
+	if ((_err)) \
+		xe_eudebug_disconnect((_d), (_err)); \
+	xe_eudebug_put((_d)); \
+	})
+
+void xe_eudebug_vm_create(struct xe_file *xef, struct xe_vm *vm)
+{
+	struct xe_eudebug *d;
+
+	if (!xe_vm_in_lr_mode(vm))
+		return;
+
+	d = xe_eudebug_get(xef);
+	if (!d)
+		return;
+
+	xe_eudebug_event_put(d, vm_create_event(d, xef, vm));
+}
+
+void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm)
+{
+	struct xe_eudebug *d;
+
+	if (!xe_vm_in_lr_mode(vm))
+		return;
+
+	d = xe_eudebug_get(xef);
+	if (!d)
+		return;
+
+	xe_eudebug_event_put(d, vm_destroy_event(d, xef, vm));
+}
+
+static int add_debugger(struct xe_device *xe, struct xe_eudebug *d,
+			struct drm_file *target)
+{
+	struct xe_file *xef = target->driver_priv;
+	int ret = -EBUSY;
+
+	mutex_lock(&xef->eudebug.lock);
+	if (!xef->eudebug.debugger) {
+		d->target.xef = xe_file_get(xef);
+		d->target.pid = xef->pid;
+		kref_get(&d->ref);
+		xef->eudebug.debugger = d;
+		ret = 0;
+	}
+	mutex_unlock(&xef->eudebug.lock);
+
+	if (ret)
+		return ret;
+
+	mutex_lock(&xe->eudebug.lock);
+	XE_WARN_ON(!list_empty(&xef->eudebug.target_link));
+
+	d->session = ++xe->eudebug.session_count;
+	if (!d->session)
+		d->session = ++xe->eudebug.session_count;
+
+	list_add_tail(&xef->eudebug.target_link, &xef->xe->eudebug.targets);
+	mutex_unlock(&xe->eudebug.lock);
+
+	return 0;
+}
+
+static int
+xe_eudebug_attach(struct xe_device *xe, struct drm_file *parent_file,
+		  struct xe_eudebug *d, u64 target_pidfd)
+{
+	struct file *file __free(fput) = NULL;
+	struct drm_file *drm_file;
+	struct xe_file *target_xef;
+	int ret;
+
+	file = fget(target_pidfd);
+	if (XE_IOCTL_DBG(xe, !file))
+		return -EBADFD;
+
+	drm_file = file->private_data;
+	if (XE_IOCTL_DBG(xe, !drm_file))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, parent_file->filp->f_op != file->f_op))
+		return -EINVAL;
+
+	target_xef = drm_file->driver_priv;
+	if (XE_IOCTL_DBG(xe, !target_xef))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, xe != target_xef->xe))
+		return -EINVAL;
+
+	ret = add_debugger(xe, d, drm_file);
+	if (XE_IOCTL_DBG(xe, ret))
+		return ret;
+
+	d->xe = xe;
+
+	eu_dbg(d, "session %lld attached to %s", d->session,
+	       parent_file == drm_file ? "self" : "remote");
+
+	return 0;
+}
+
+static int xe_eudebug_release(struct inode *inode, struct file *file)
+{
+	struct xe_eudebug *d = file->private_data;
+
+	xe_eudebug_disconnect(d, 0);
+	xe_eudebug_put(d);
+
+	return 0;
+}
+
+static __poll_t xe_eudebug_poll(struct file *file, poll_table *wait)
+{
+	struct xe_eudebug * const d = file->private_data;
+	__poll_t ret = 0;
+
+	poll_wait(file, &d->events.write_done, wait);
+
+	if (xe_eudebug_detached(d)) {
+		ret |= EPOLLHUP;
+		if (d->target.err)
+			ret |= EPOLLERR;
+	}
+
+	if (event_fifo_num_events_peek(d))
+		ret |= EPOLLIN;
+
+	return ret;
+}
+
+static ssize_t xe_eudebug_read(struct file *file,
+			       char __user *buf,
+			       size_t count,
+			       loff_t *ppos)
+{
+	return -EINVAL;
+}
+
+static long xe_eudebug_read_event(struct xe_eudebug *d,
+				  const u64 arg,
+				  const bool wait)
+{
+	struct xe_device *xe = d->xe;
+	struct drm_xe_eudebug_event __user * const user_orig =
+		u64_to_user_ptr(arg);
+	struct drm_xe_eudebug_event user_event;
+	struct drm_xe_eudebug_event *pending, *event_out;
+	long ret = 0;
+
+	if (XE_IOCTL_DBG(xe, copy_from_user(&user_event, user_orig, sizeof(user_event))))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe, user_event.type != DRM_XE_EUDEBUG_EVENT_READ))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, user_event.len < sizeof(*user_orig)))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, user_event.flags))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, user_event.seqno))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, user_event.reserved))
+		return -EINVAL;
+
+	/* XXX: define wait time in connect arguments ? */
+	if (wait) {
+		ret = wait_event_interruptible_timeout(d->events.write_done,
+						       event_fifo_has_events(d),
+						       msecs_to_jiffies(5 * 1000));
+
+		if (XE_IOCTL_DBG(xe, ret < 0))
+			return ret;
+	}
+
+	if (XE_IOCTL_DBG(xe, xe_eudebug_detached(d)))
+		return -ENOTCONN;
+
+	event_out = NULL;
+	spin_lock(&d->events.lock);
+	pending = event_fifo_pending(d);
+	if (!pending)
+		ret = wait ? -ETIMEDOUT : -EAGAIN;
+	else if (user_event.len < pending->len)
+		ret = -EMSGSIZE;
+	else if (access_ok(user_orig, pending->len))
+		ret = kfifo_out(&d->events.fifo, &event_out, 1) == 1 ? 0 : -EIO;
+	else
+		ret = -EFAULT;
+
+	wake_up_all(&d->events.read_done);
+	spin_unlock(&d->events.lock);
+
+	if (!pending)
+		return ret;
+
+	if (ret == -EMSGSIZE) {
+		if (XE_IOCTL_DBG(xe, put_user(pending->len, &user_orig->len)))
+			return -EFAULT;
+
+		return -EMSGSIZE;
+	}
+
+	if (XE_IOCTL_DBG(xe, ret)) {
+		xe_eudebug_disconnect(d, (int)ret);
+		return ret;
+	}
+
+	XE_WARN_ON(pending != event_out);
+
+	if (__copy_to_user(user_orig, event_out, event_out->len)) {
+		ret = -EFAULT;
+		/* We can't rollback anymore, disconnect */
+		xe_eudebug_disconnect(d, -EFAULT);
+	}
+
+	eu_dbg(d, "event read=%ld: type=%u, flags=0x%x, seqno=%llu", ret,
+	       event_out->type, event_out->flags, event_out->seqno);
+
+	kfree(event_out);
+
+	return ret;
+}
+
+static long xe_eudebug_ioctl(struct file *file,
+			     unsigned int cmd,
+			     unsigned long arg)
+{
+	struct xe_eudebug * const d = file->private_data;
+	long ret;
+
+	switch (cmd) {
+	case DRM_XE_EUDEBUG_IOCTL_READ_EVENT:
+		ret = xe_eudebug_read_event(d, arg,
+					    !(file->f_flags & O_NONBLOCK));
+		break;
+
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static const struct file_operations fops = {
+	.owner		= THIS_MODULE,
+	.release	= xe_eudebug_release,
+	.poll		= xe_eudebug_poll,
+	.read		= xe_eudebug_read,
+	.unlocked_ioctl	= xe_eudebug_ioctl,
+};
+
+static int
+xe_eudebug_connect(struct xe_device *xe,
+		   struct drm_file *drm_file,
+		   struct drm_xe_eudebug_connect *param)
+{
+	const u64 known_open_flags = 0;
+	unsigned long f_flags = 0;
+	struct xe_eudebug *d;
+	struct file *file;
+	int fd, err;
+
+	if (XE_IOCTL_DBG(xe, param->extensions))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, !param->fd))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, param->flags & ~known_open_flags))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, param->version &&
+			 param->version != DRM_XE_EUDEBUG_VERSION))
+		return -EINVAL;
+
+	param->version = DRM_XE_EUDEBUG_VERSION;
+
+	mutex_lock(&xe->eudebug.lock);
+	err = xe_eudebug_is_enabled(xe) ? 0 : -EOPNOTSUPP;
+	mutex_unlock(&xe->eudebug.lock);
+
+	if (XE_IOCTL_DBG(xe, err))
+		return err;
+
+	d = kzalloc_obj(*d, GFP_KERNEL);
+	if (XE_IOCTL_DBG(xe, !d))
+		return -ENOMEM;
+
+	kref_init(&d->ref);
+	mutex_init(&d->target.lock);
+	init_waitqueue_head(&d->events.write_done);
+	init_waitqueue_head(&d->events.read_done);
+
+	spin_lock_init(&d->events.lock);
+	INIT_KFIFO(d->events.fifo);
+
+	err = xe_eudebug_resources_init(d);
+	if (XE_IOCTL_DBG(xe, err))
+		goto err_free;
+
+	err = xe_eudebug_attach(xe, drm_file, d, param->fd);
+	if (XE_IOCTL_DBG(xe, err))
+		goto err_free_res;
+
+	fd = get_unused_fd_flags(f_flags);
+	if (fd < 0) {
+		err = fd;
+		goto err_detach;
+	}
+
+	file = anon_inode_getfile("[xe_eudebug]", &fops, d, f_flags);
+	if (IS_ERR(file)) {
+		err = PTR_ERR(file);
+		goto err_fd;
+	}
+
+	eu_dbg(d, "connected session %lld", d->session);
+
+	fd_install(fd, file);
+
+	return fd;
+
+err_fd:
+	put_unused_fd(fd);
+err_detach:
+	xe_eudebug_detach(xe, d, err);
+err_free_res:
+	xe_eudebug_resources_destroy(d);
+err_free:
+	mutex_destroy(&d->target.lock);
+	kfree(d);
+
+	return err;
+}
+
+void xe_eudebug_file_close(struct xe_file *xef)
+{
+	remove_debugger(xef);
+}
+
+bool xe_eudebug_is_enabled(struct xe_device *xe)
+{
+	return READ_ONCE(xe->eudebug.state) == XE_EUDEBUG_ENABLED;
+}
+
+int xe_eudebug_enable(struct xe_device *xe, bool enable)
+{
+	mutex_lock(&xe->eudebug.lock);
+
+	if (xe->eudebug.state == XE_EUDEBUG_NOT_SUPPORTED) {
+		mutex_unlock(&xe->eudebug.lock);
+		return -EPERM;
+	}
+
+	if (!enable && !list_empty(&xe->eudebug.targets)) {
+		mutex_unlock(&xe->eudebug.lock);
+		return -EBUSY;
+	}
+
+	if (enable == xe_eudebug_is_enabled(xe)) {
+		mutex_unlock(&xe->eudebug.lock);
+		return 0;
+	}
+
+	xe->eudebug.state = enable ?
+		XE_EUDEBUG_ENABLED : XE_EUDEBUG_DISABLED;
+	mutex_unlock(&xe->eudebug.lock);
+
+	return 0;
+}
+
+static ssize_t enable_eudebug_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+
+	return sysfs_emit(buf, "%u\n", xe_eudebug_is_enabled(xe));
+}
+
+static ssize_t enable_eudebug_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
+	bool enable;
+	int ret;
+
+	ret = kstrtobool(buf, &enable);
+	if (ret)
+		return ret;
+
+	ret = xe_eudebug_enable(xe, enable);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(enable_eudebug);
+
+static void xe_eudebug_sysfs_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+	struct drm_device *dev = &xe->drm;
+
+	sysfs_remove_file(&dev->dev->kobj,
+			  &dev_attr_enable_eudebug.attr);
+}
+
+void xe_eudebug_init(struct xe_device *xe)
+{
+	struct drm_device *dev = &xe->drm;
+	int err;
+
+	INIT_LIST_HEAD(&xe->eudebug.targets);
+
+	xe->eudebug.state = XE_EUDEBUG_NOT_SUPPORTED;
+
+	err = drmm_mutex_init(dev, &xe->eudebug.lock);
+	if (err)
+		goto out_err;
+
+	err = sysfs_create_file(&dev->dev->kobj,
+				&dev_attr_enable_eudebug.attr);
+	if (err)
+		goto out_err;
+
+	err = devm_add_action_or_reset(dev->dev, xe_eudebug_sysfs_fini, xe);
+	if (err)
+		goto out_err;
+
+	xe->eudebug.state = XE_EUDEBUG_DISABLED;
+
+	return;
+
+out_err:
+	drm_warn(&xe->drm, "eudebug disabled, init fail: %d\n", err);
+}
+
+int xe_eudebug_connect_ioctl(struct drm_device *dev,
+			     void *data,
+			     struct drm_file *file)
+{
+	struct xe_device *xe = to_xe_device(dev);
+	struct drm_xe_eudebug_connect * const param = data;
+
+	return xe_eudebug_connect(xe, file, param);
+}
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
new file mode 100644
index 000000000000..22fbb2ff24da
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2025 Intel Corporation
+ */
+
+#ifndef _XE_EUDEBUG_H_
+#define _XE_EUDEBUG_H_
+
+#include <linux/types.h>
+
+struct drm_device;
+struct drm_file;
+struct xe_device;
+struct xe_file;
+struct xe_vm;
+
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+
+#define XE_EUDEBUG_DBG_STR "eudbg: %lld:%lu:%s (%d/%d) -> (%d): "
+#define XE_EUDEBUG_DBG_ARGS(d) (d)->session, \
+		atomic_long_read(&(d)->events.seqno), \
+		!READ_ONCE(d->target.xef) ? "disconnected" : "", \
+		current->pid, \
+		task_tgid_nr(current), \
+		READ_ONCE(d->target.xef) ? d->target.xef->pid : -1
+
+#define eu_err(d, fmt, ...) drm_err(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)
+#define eu_warn(d, fmt, ...) drm_warn(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				      XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)
+#define eu_dbg(d, fmt, ...) drm_dbg(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
+				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)
+
+#define xe_eudebug_assert(d, ...) xe_assert((d)->xe, ##__VA_ARGS__)
+
+int xe_eudebug_connect_ioctl(struct drm_device *dev,
+			     void *data,
+			     struct drm_file *file);
+
+void xe_eudebug_init(struct xe_device *xe);
+bool xe_eudebug_is_enabled(struct xe_device *xe);
+
+void xe_eudebug_file_close(struct xe_file *xef);
+
+void xe_eudebug_vm_create(struct xe_file *xef, struct xe_vm *vm);
+void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm);
+int xe_eudebug_enable(struct xe_device *xe, bool enable);
+
+#else
+
+static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
+					   void *data,
+					   struct drm_file *file) { return 0; }
+
+static inline void xe_eudebug_init(struct xe_device *xe) { }
+static inline bool xe_eudebug_is_enabled(struct xe_device *xe) { return false; }
+
+static inline void xe_eudebug_file_close(struct xe_file *xef) { }
+
+static inline void xe_eudebug_vm_create(struct xe_file *xef, struct xe_vm *vm) { }
+static inline void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm) { }
+
+#endif /* CONFIG_DRM_XE_EUDEBUG */
+
+#endif /* _XE_EUDEBUG_H_ */
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
new file mode 100644
index 000000000000..a73eb6c98b02
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -0,0 +1,121 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2025 Intel Corporation
+ */
+
+#ifndef _XE_EUDEBUG_TYPES_H_
+#define _XE_EUDEBUG_TYPES_H_
+
+#include <linux/completion.h>
+#include <linux/kfifo.h>
+#include <linux/kref.h>
+#include <linux/mutex.h>
+#include <linux/rbtree.h>
+#include <linux/rhashtable.h>
+#include <linux/wait.h>
+#include <linux/xarray.h>
+
+struct xe_device;
+struct task_struct;
+
+/**
+ * enum xe_eudebug_state - eudebug capability state
+ *
+ * @XE_EUDEBUG_NOT_SUPPORTED: eudebug feature support off
+ * @XE_EUDEBUG_DISABLED: eudebug feature supported but disabled
+ * @XE_EUDEBUG_ENABLED: eudebug enabled
+ */
+enum xe_eudebug_state {
+	XE_EUDEBUG_NOT_SUPPORTED = 0,
+	XE_EUDEBUG_DISABLED,
+	XE_EUDEBUG_ENABLED,
+};
+
+#define CONFIG_DRM_XE_DEBUGGER_EVENT_QUEUE_SIZE 64
+#define XE_EUDEBUG_MAX_EVENT_TYPE DRM_XE_EUDEBUG_EVENT_VM
+
+/**
+ * struct xe_eudebug_handle - eudebug resource handle
+ */
+struct xe_eudebug_handle {
+	/** @key: key value in rhashtable <key:id> */
+	u64 key;
+
+	/** @id: opaque handle id for xarray <id:key> */
+	int id;
+
+	/** @rh_head: rhashtable head */
+	struct rhash_head rh_head;
+};
+
+/**
+ * struct xe_eudebug_resource - Resource map for one resource
+ */
+struct xe_eudebug_resource {
+	/** @xa: xarrays for <id->key> */
+	struct xarray xa;
+
+	/** @rh: rhashtable for <key->id> */
+	struct rhashtable rh;
+};
+
+#define XE_EUDEBUG_RES_TYPE_VM		0
+#define XE_EUDEBUG_RES_TYPE_COUNT	(XE_EUDEBUG_RES_TYPE_VM + 1)
+
+/**
+ * struct xe_eudebug - Top level struct for eudebug: the connection
+ */
+struct xe_eudebug {
+	/** @ref: kref counter for this struct */
+	struct kref ref;
+
+	/** @target: debug target specifics */
+	struct {
+		/** @xef: the target xe_file that we are debugging */
+		struct xe_file *xef;
+
+		/** @pid: pid of target */
+		pid_t pid;
+
+		/** @err: error code on disconnect */
+		int err;
+
+		/** @lock: guards access to xef and err */
+		struct mutex lock;
+
+		/** @rt: resource maps for all types */
+		struct xe_eudebug_resource res[XE_EUDEBUG_RES_TYPE_COUNT];
+	} target;
+
+	/** @xe: the parent device we are serving */
+	struct xe_device *xe;
+
+	/** @res: the resource maps we track for target_task */
+	struct xe_eudebug_resources *res;
+
+	/** @session: session number for this connection (for logs) */
+	u64 session;
+
+	/** @events: kfifo queue of to-be-delivered events */
+	struct {
+		/** @lock: guards access to fifo */
+		spinlock_t lock;
+
+		/** @fifo: queue of events pending */
+		DECLARE_KFIFO(fifo,
+			      struct drm_xe_eudebug_event *,
+			      CONFIG_DRM_XE_DEBUGGER_EVENT_QUEUE_SIZE);
+
+		/** @write_done: waitqueue for signalling write to fifo */
+		wait_queue_head_t write_done;
+
+		/** @read_done: waitqueue for signalling read from fifo */
+		wait_queue_head_t read_done;
+
+		/** @event_seqno: seqno counter to stamp events for fifo */
+		atomic_long_t seqno;
+	} events;
+
+};
+
+#endif /* _XE_EUDEBUG_TYPES_H_ */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c3836f6eab35..456ee3bc4073 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -26,6 +26,7 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_drm_client.h"
+#include "xe_eudebug.h"
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_migrate.h"
@@ -2104,6 +2105,8 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 
 	args->vm_id = id;
 
+	xe_eudebug_vm_create(xef, vm);
+
 	return 0;
 
 err_close_and_put:
@@ -2135,8 +2138,10 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 		xa_erase(&xef->vm.xa, args->vm_id);
 	mutex_unlock(&xef->vm.lock);
 
-	if (!err)
+	if (!err) {
+		xe_eudebug_vm_destroy(xef, vm);
 		xe_vm_close_and_put(vm);
+	}
 
 	return err;
 }
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 48e9f1fdb78d..acacd9e7e1e0 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -110,6 +110,7 @@ extern "C" {
 #define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS	0x0d
 #define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0e
 #define DRM_XE_VM_GET_PROPERTY		0x0f
+#define DRM_XE_EUDEBUG_CONNECT		0x10
 
 /* Must be kept compact -- no holes */
 
@@ -129,6 +130,7 @@ extern "C" {
 #define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct drm_xe_vm_query_mem_range_attr)
 #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
 #define DRM_IOCTL_XE_VM_GET_PROPERTY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)
+#define DRM_IOCTL_XE_EUDEBUG_CONNECT		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EUDEBUG_CONNECT, struct drm_xe_eudebug_connect)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -2609,6 +2611,33 @@ enum drm_xe_ras_error_component {
 	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL] = "soc-internal"		\
 }
 
+/*
+ * struct drm_xe_eudebug_connect - Input of &DRM_IOCTL_XE_EUDEBUG_CONNECT
+ *
+ * This structure is used to connect to an eudebug interface of target drm file.
+ */
+struct drm_xe_eudebug_connect {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	/** @fd: Debug target DRM client fd */
+	__u64 fd;
+
+	/** @flags: Flags (MBZ) */
+	__u32 flags;
+
+	/**
+	 * @version: Current ABI (ioctl / events) version.
+	 *
+	 * If zero, current version supported in return.
+	 * If non zero, the version requested.
+	 */
+	__u32 version;
+#define DRM_XE_EUDEBUG_VERSION 1
+};
+
+#include "xe_drm_eudebug.h"
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
new file mode 100644
index 000000000000..cdb4e4af4879
--- /dev/null
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -0,0 +1,80 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _UAPI_XE_DRM_EUDEBUG_H_
+#define _UAPI_XE_DRM_EUDEBUG_H_
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+#define DRM_XE_EUDEBUG_IOCTL_READ_EVENT		_IO('j', 0x0)
+
+/**
+ * struct drm_xe_eudebug_event - Base type of event delivered by xe_eudebug.
+ *
+ * Base event for xe_eudebug interface.
+ *
+ * For receiving events :c:member:`drm_xe_eudebug_event.type` has to
+ * be DRM_XE_EUDEBUG_EVENT_READ. On return, this is set to the type
+ * of event received. :c:member:`drm_xe_eudebug_event.len` has to be
+ * set to maximum size that can be received. On return, len will be set
+ * to the event size. If the pending event was larger than this size,
+ * -EMSGSIZE is returned instead of 0 and the caller should retry with a larger
+ * allocated receive length.
+ *
+ * :c:member:`drm_xe_eudebug_event.seqno` can be used to form a timeline
+ * as event delivery order does not guarantee event creation
+ * order. Must be set to zero.
+ *
+ * :c:member:`drm_xe_eudebug_event.flags` will indicate if a resource was
+ * created, destroyed, or if its state changed. Must be set to zero.
+ *
+ * If DRM_XE_EUDEBUG_EVENT_NEED_ACK is set, xe_eudebug
+ * will hold the said resource until it is acked by userspace
+ * using the acking ioctl with the seqno of the said event.
+ */
+struct drm_xe_eudebug_event {
+	/** @len: Length */
+	__u32 len;
+
+	/** @type: Type */
+	__u16 type;
+#define DRM_XE_EUDEBUG_EVENT_NONE		0
+#define DRM_XE_EUDEBUG_EVENT_READ		1
+#define DRM_XE_EUDEBUG_EVENT_VM			2
+
+	/** @flags: Flags */
+	__u16 flags;
+#define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
+#define DRM_XE_EUDEBUG_EVENT_DESTROY		(1 << 1)
+#define DRM_XE_EUDEBUG_EVENT_STATE_CHANGE	(1 << 2)
+#define DRM_XE_EUDEBUG_EVENT_NEED_ACK		(1 << 3)
+
+	/** @seqno: Sequence number to form a timeline */
+	__u64 seqno;
+
+	/** @reserved: Reserved field, must be zero. */
+	__u64 reserved;
+};
+
+/**
+ * struct drm_xe_eudebug_event_vm - VM event
+ *
+ * VM event is delivered when vm is created or destroyed.
+ */
+struct drm_xe_eudebug_event_vm {
+	/** @base: base event */
+	struct drm_xe_eudebug_event base;
+
+	/** @vm_handle: unique handle for vm */
+	__u64 vm_handle;
+};
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* _UAPI_XE_DRM_EUDEBUG_H_ */
-- 
2.43.0

