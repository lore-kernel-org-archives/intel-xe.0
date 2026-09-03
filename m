Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89254C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:00:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B8710E2B5;
	Thu,  3 Sep 2026 15:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f0vMB5Ku";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A41D10E2B5
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 15:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788447612; x=1819983612;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pl1sLPHbfnZUgh0TnU8UmNkZUkos7PgIeQJjrVwudyo=;
 b=f0vMB5Ku/qESAZ8UoE6oMbpfyeeHRnUn/gX0QnECpNZSB8dXXUC5ytVD
 cFVyXhMUmwe/7+OX8BLwt4F7bSGv6UfFLQyAyhzsbSo4j+aztSB/CyVO5
 lg50lA9FjhSgalp5fS4gj3e43S7skuHs3VJUsLGcvmTzKzR2E9Hfm/25q
 bZuH7LEZhkOvRCTmr/CEjiezsgsg2XixwihwwzloRWyu3dZpTzByFCqL3
 TLmA9qql3qXrDqSN7sjOi11DdVIhKG6YModCQKoYsxGPQYQbKy+xgEsP/
 M9R/7xr+Sfpq0a7lkaW2Ddl1cUbxLBmZ/s+BtbTZFr4dHxM4oWhI9L7aU A==;
X-CSE-ConnectionGUID: 8K/m+dwERgiDjCtOYuBEng==
X-CSE-MsgGUID: rA3qxOe3Rja3L/fitwR58g==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="76486595"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="76486595"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:00:11 -0700
X-CSE-ConnectionGUID: OUthY4QQRAeAdBajL6RF+w==
X-CSE-MsgGUID: gUtINchPSfixlZ06o7S0+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="268440331"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.246.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:00:04 -0700
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
Subject: [PATCH v10 01/27] drm/xe/eudebug: Introduce eudebug interface
Date: Thu,  3 Sep 2026 17:59:25 +0300
Message-ID: <20260903145952.848051-2-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
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

Add the eudebug interface to the Xe driver, enabling
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

Introduce the eudebug connection and event queuing,
adding VM create/destroy events as a baseline. Additional events and
hardware control for full debugger operation are needed and will be
introduced in follow-up patches.

The resource tracking components are inspired by Maciej Patelczyk's work on
resource handling for i915. Chris Wilson suggested a two-way mapping
approach, which simplifies using the resource map as definitive
bookkeeping for resources relayed to the debugger during the discovery
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
    - avoid event->seqno after queue as it can UAF (Mika)
    - use drmm for eudebug_fini (Maciej)
    - squash dynamic enable

v6: - drm->authenticated is overzealous for render (Mika)

v7: - struct member documentation (Mika)
    - enforce seqno mbz (Mika)

v8: - head->seqno fix (Mika)
    - resource alloc and removal cleanup (Mika)
    - s/wait_interruptible_timeout/wait_timeout (Mika)
    - use fd_install in connect (Mika)

v9: - fix xef vs debugger race (Sashiko)
    - assign d->xe early (Sashiko)
    - simplify locking (Mika)
    - fix pending->len outside lock (Sashiko)
    - remove version from connect to address fd_install leak (Sashiko)
    - create vm by id to avoid use after free (Sashiko)
    - use xe_eudebug_detach on connection error path (Sashiko)
    - don't sleep on kzalloc as we can disconnect (Sashiko)
    - check if enabled on connection (Sashiko)
    - preallocated event fifo for lockless allocs (Sashiko, Mika)

v10:
    - wakeup after detach, take account of occupied (Sashiko)
    - GFP_ACCOUNT for fifo (Sashiko)
    - set O_CLOEXEC on connection fd (Sashiko)
    - docstrings (Maciej)
    - use guard and __kfree (Mika)
    - init_early (Maciej)
    - remove unused struct members
    - no need to send destroy if vm was not announced (Claude)
    - avoid dereference of xef on eu_print (Claude)
    - don't silently truncate target fd (Claude)
    - preallocate resource handles
    - zero as target fd (Claude)
    - hold drm_device (Claude)

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-eudebug |   21 +
 Documentation/gpu/driver-uapi.rst             |    2 +
 MAINTAINERS                                   |    2 +
 drivers/gpu/drm/xe/Kconfig                    |   10 +
 drivers/gpu/drm/xe/Makefile                   |    3 +
 drivers/gpu/drm/xe/xe_device.c                |   12 +
 drivers/gpu/drm/xe/xe_device_types.h          |   30 +
 drivers/gpu/drm/xe/xe_eudebug.c               | 1068 +++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.h               |   71 ++
 drivers/gpu/drm/xe/xe_eudebug_types.h         |  131 ++
 drivers/gpu/drm/xe/xe_vm.c                    |   15 +-
 include/uapi/drm/xe_drm.h                     |   23 +
 include/uapi/drm/xe_drm_eudebug.h             |  101 ++
 13 files changed, 1487 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-eudebug
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug.c
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug.h
 create mode 100644 drivers/gpu/drm/xe/xe_eudebug_types.h
 create mode 100644 include/uapi/drm/xe_drm_eudebug.h

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-eudebug b/Documentation/ABI/testing/sysfs-driver-intel-xe-eudebug
new file mode 100644
index 000000000000..fa8620001508
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-eudebug
@@ -0,0 +1,21 @@
+What:		/sys/bus/pci/drivers/xe/.../enable_eudebug
+Date:		August 2026
+KernelVersion:	6.20
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RW. Controls whether the EU debugger interface is armed for
+		this device.
+
+		Reads back 1 when the interface is enabled and 0 when it is
+		not. Writing a boolean value ("0"/"1", "n"/"y", "off"/"on")
+		enables or disables it. The interface starts out disabled.
+
+		While disabled, DRM_IOCTL_XE_EUDEBUG_CONNECT fails with
+		-EOPNOTSUPP.
+
+		Writing 0 while any debugger connection is still attached
+		fails with -EBUSY.
+
+		This attribute is only present when the driver is built with
+		CONFIG_DRM_XE_EUDEBUG and the interface was set up at probe
+		time. If probe could not set it up, the attribute is absent
+		and the connect ioctl fails with -EOPNOTSUPP.
diff --git a/Documentation/gpu/driver-uapi.rst b/Documentation/gpu/driver-uapi.rst
index 627fc68c7a21..1fbcac949da9 100644
--- a/Documentation/gpu/driver-uapi.rst
+++ b/Documentation/gpu/driver-uapi.rst
@@ -30,6 +30,8 @@ drm/xe uAPI
 
 .. kernel-doc:: include/uapi/drm/xe_drm.h
 
+.. kernel-doc:: include/uapi/drm/xe_drm_eudebug.h
+
 drm/asahi uAPI
 ================
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 6f2a3b56e57d..d20581fd0b75 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13127,11 +13127,13 @@ Q:	http://patchwork.freedesktop.org/project/intel-xe/
 B:	https://gitlab.freedesktop.org/drm/xe/kernel/-/issues
 C:	irc://irc.oftc.net/xe
 T:	git https://gitlab.freedesktop.org/drm/xe/kernel.git
+F:	Documentation/ABI/testing/sysfs-driver-intel-xe-eudebug
 F:	Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
 F:	Documentation/gpu/xe/
 F:	drivers/gpu/drm/xe/
 F:	include/drm/intel/
 F:	include/uapi/drm/xe_drm.h
+F:	include/uapi/drm/xe_drm_eudebug.h
 
 INTEL ELKHART LAKE PSE I/O DRIVER
 M:	Raag Jadav <raag.jadav@intel.com>
diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 4d7dcaff2b91..e202448c4583 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -129,6 +129,16 @@ config DRM_XE_FORCE_PROBE
 
 	  Use "!*" to block the probe of the driver for all known devices.
 
+config DRM_XE_EUDEBUG
+	bool "Enable gdb debugger support (eudebug)"
+	depends on DRM_XE
+	default y
+	help
+	  Choose this option if you want to add support for a debugger (gdb)
+	  to attach to a process using Xe and debug its gpu/gpgpu programs.
+	  With debugger support, Xe provides an interface for a debugger to
+	  track, inspect and modify the resources of that process.
+
 menu "drm/Xe Debugging"
 depends on DRM_XE
 depends on EXPERT
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 67b8b5477639..0631f659e304 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -160,6 +160,9 @@ xe-$(CONFIG_I2C)	+= xe_i2c.o \
 xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
 xe-$(CONFIG_DRM_GPUSVM) += xe_userptr.o
 
+# debugging shaders with gdb (eudebug) support
+xe-$(CONFIG_DRM_XE_EUDEBUG) += xe_eudebug.o
+
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) += xe_hwmon.o
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8583b2e9ecf4..12c84b7c7758 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -33,6 +33,7 @@
 #include "xe_dma_buf.h"
 #include "xe_drm_client.h"
 #include "xe_drv.h"
+#include "xe_eudebug.h"
 #include "xe_exec.h"
 #include "xe_exec_queue.h"
 #include "xe_force_wake.h"
@@ -111,6 +112,10 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 	mutex_init(&xef->exec_queue.lock);
 	xa_init_flags(&xef->exec_queue.xa, XA_FLAGS_ALLOC1);
 
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+	INIT_LIST_HEAD(&xef->eudebug.target_link);
+#endif
+
 	file->driver_priv = xef;
 	kref_init(&xef->refcount);
 
@@ -174,6 +179,8 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 
 	guard(xe_pm_runtime)(xe);
 
+	xe_eudebug_file_close(xef);
+
 	/*
 	 * No need for exec_queue.lock here as there is no contention for it
 	 * when FD is closing as IOCTLs presumably can't be modifying the
@@ -217,6 +224,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(XE_VM_GET_PROPERTY, xe_vm_get_property_ioctl,
 			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(XE_EUDEBUG_CONNECT, xe_eudebug_connect_ioctl, DRM_RENDER_ALLOW),
 };
 
 static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
@@ -1117,6 +1125,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	xe_eudebug_init_early(xe);
+
 	err = drm_dev_register(&xe->drm, 0);
 	if (err)
 		return err;
@@ -1154,6 +1164,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	xe_eudebug_init(xe);
+
 	detect_preproduction_hw(xe);
 
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 180d450a6deb..f5a5ff4d8873 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -14,6 +14,7 @@
 
 #include "xe_devcoredump_types.h"
 #include "xe_drm_ras_types.h"
+#include "xe_eudebug_types.h"
 #include "xe_heci_gsc.h"
 #include "xe_late_bind_fw_types.h"
 #include "xe_oa_types.h"
@@ -601,6 +602,23 @@ struct xe_device {
 	atomic_t g2g_test_count;
 #endif
 
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+	/** @eudebug: debugger connection list and globals for device */
+	struct {
+		/** @eudebug.session_count: session counter to track connections */
+		u64 session_count;
+
+		/** @eudebug.cap_state: eudebug capability state */
+		enum xe_eudebug_cap_state cap_state;
+
+		/** @eudebug.targets: this is list for xe_files for each target */
+		struct list_head targets;
+
+		/** @eudebug.lock: protects state and targets */
+		struct mutex lock;
+	} eudebug;
+#endif
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
@@ -615,6 +633,7 @@ struct xe_device {
 		spinlock_t lock;
 	} uncore;
 #endif
+
 };
 
 /**
@@ -676,6 +695,17 @@ struct xe_file {
 
 	/** @refcount: ref count of this xe file */
 	struct kref refcount;
+
+#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
+	/** @eudebug: struct to hold eudebug connection specifics */
+	struct {
+		/** @eudebug.debugger: the debugger connection into this xe_file */
+		struct xe_eudebug *debugger;
+
+		/** @eudebug.target_link: link into xe_device.eudebug.targets */
+		struct list_head target_link;
+	} eudebug;
+#endif
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
new file mode 100644
index 000000000000..9fe073f60680
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -0,0 +1,1068 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023-2025 Intel Corporation
+ */
+
+#include <linux/anon_inodes.h>
+#include <linux/cleanup.h>
+#include <linux/delay.h>
+#include <linux/poll.h>
+#include <linux/uaccess.h>
+
+#include <drm/drm_drv.h>
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
+#define cast_event(T, event) container_of((event), typeof(*(T)), base)
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
+		mutex_init(&r->lock);
+		xa_init_flags(&r->xa, XA_FLAGS_ALLOC1);
+		ret = rhashtable_init(&r->rh, &rhash_res);
+
+		if (ret) {
+			xa_destroy(&r->xa);
+			mutex_destroy(&r->lock);
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
+		mutex_destroy(&r->lock);
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
+	for (i = 0; i < XE_EUDEBUG_RES_TYPE_COUNT; i++) {
+		struct xe_eudebug_resource *r = resource_from_type(d, i);
+		struct xe_eudebug_handle *h;
+
+		mutex_lock(&r->lock);
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
+		mutex_unlock(&r->lock);
+	}
+
+	for (i = 0; i < XE_EUDEBUG_RES_TYPE_COUNT; i++) {
+		struct xe_eudebug_resource *r = resource_from_type(d, i);
+
+		rhashtable_destroy(&r->rh);
+		xe_eudebug_assert(d, xa_empty(&r->xa));
+		xa_destroy(&r->xa);
+		mutex_destroy(&r->lock);
+	}
+}
+
+static bool xe_eudebug_detached(struct xe_eudebug *d)
+{
+	return !READ_ONCE(d->target.xef);
+}
+
+static void xe_eudebug_free(struct kref *ref)
+{
+	struct xe_eudebug *d = container_of(ref, typeof(*d), ref);
+
+	xe_assert(d->xe, xe_eudebug_detached(d));
+
+	xe_eudebug_resources_destroy(d);
+	XE_WARN_ON(d->target.xef);
+
+	kvfree(d->events.fifo_buf);
+	kvfree(d->events.staging);
+	kvfree(d->events.pending);
+	kfree(d);
+}
+
+static void xe_eudebug_put(struct xe_eudebug *d)
+{
+	kref_put(&d->ref, xe_eudebug_free);
+}
+
+static bool xe_eudebug_detach(struct xe_eudebug *d,
+			      const int err)
+{
+	struct xe_file *target = NULL;
+
+	XE_WARN_ON(err > 0);
+
+	mutex_lock(&d->xe->eudebug.lock);
+	if (d->target.xef) {
+		target = d->target.xef;
+		WRITE_ONCE(d->target.err, err);
+		WRITE_ONCE(d->target.xef, NULL);
+
+		XE_WARN_ON(target->eudebug.debugger != d);
+		target->eudebug.debugger = NULL;
+
+		list_del_init(&target->eudebug.target_link);
+
+		eu_dbg(d, "session %lld detached with %d", d->session, err);
+	}
+	mutex_unlock(&d->xe->eudebug.lock);
+
+	wake_up_all(&d->events.write_done);
+
+	if (target) {
+		xe_eudebug_put(d);
+		xe_file_put(target);
+	}
+
+	return !!target;
+}
+
+#define xe_eudebug_disconnect(_d, _err) ({ \
+	struct xe_eudebug *__disc_d = (_d); \
+	int __disc_err = (_err); \
+	if (xe_eudebug_detach(__disc_d, __disc_err)) { \
+		if (__disc_err == 0 || __disc_err == -ETIMEDOUT) \
+			eu_dbg(__disc_d, "Session closed (%d)", __disc_err); \
+		else \
+			eu_err(__disc_d, "Session disconnected, err = %d (%s:%d)", \
+			       __disc_err, __func__, __LINE__); \
+	} \
+})
+
+static int event_fifo_pending(struct xe_eudebug *d,
+			      struct drm_xe_eudebug_event **pending)
+{
+	struct drm_xe_eudebug_event *e = d->events.pending;
+	unsigned int len, copied;
+
+	lockdep_assert_held(&d->events.lock);
+
+	*pending = NULL;
+
+	if (xe_eudebug_detached(d))
+		return -ENOTCONN;
+
+	if (d->events.pending_occupied) {
+		*pending = e;
+		return 0;
+	}
+
+	if (kfifo_out_peek(&d->events.fifo, e, sizeof(*e)) < sizeof(*e))
+		return -ENOENT;
+
+	len = e->len;
+	if (len <= sizeof(*e) || len > DRM_XE_EUDEBUG_EVENT_MAX_SIZE) {
+		eu_dbg(d, "bad event len %u", len);
+		return -EIO;
+	}
+
+	copied = kfifo_out(&d->events.fifo, e, len);
+	if (copied != len) {
+		eu_dbg(d, "fifo inconsistency");
+		return -EIO;
+	}
+
+	d->events.pending_occupied = true;
+	*pending = e;
+
+	return 0;
+}
+
+static struct xe_eudebug *
+xe_eudebug_get(struct xe_file *xef)
+{
+	struct xe_device *xe = xef->xe;
+	struct xe_eudebug *d;
+
+	if (READ_ONCE(xe->eudebug.cap_state) == XE_EUDEBUG_CAP_NOT_SUPPORTED)
+		return NULL;
+
+	mutex_lock(&xe->eudebug.lock);
+	d = xef->eudebug.debugger;
+	if (d && !kref_get_unless_zero(&d->ref))
+		d = NULL;
+	mutex_unlock(&xe->eudebug.lock);
+
+	if (d && xe_eudebug_detached(d)) {
+		xe_eudebug_put(d);
+		d = NULL;
+	}
+
+	return d;
+}
+
+static int xe_eudebug_queue_event(struct xe_eudebug *d,
+				  struct drm_xe_eudebug_event *event)
+{
+	unsigned int copied;
+
+	lockdep_assert_held(&d->events.lock);
+
+	xe_eudebug_assert(d, event->len > sizeof(struct drm_xe_eudebug_event));
+	xe_eudebug_assert(d, event->type);
+	xe_eudebug_assert(d, event->type != DRM_XE_EUDEBUG_EVENT_READ);
+	xe_eudebug_assert(d, event->len <= DRM_XE_EUDEBUG_EVENT_MAX_SIZE);
+	xe_eudebug_assert(d, event == d->events.staging);
+
+	if (xe_eudebug_detached(d))
+		return -ENOTCONN;
+
+	if (kfifo_avail(&d->events.fifo) < event->len)
+		return -ENOSPC;
+
+	copied = kfifo_in(&d->events.fifo, event, event->len);
+	if (XE_WARN_ON(copied != event->len))
+		return -EIO;
+
+	wake_up_all(&d->events.write_done);
+
+	return 0;
+}
+
+static struct xe_eudebug_handle *
+alloc_handle(const u64 key)
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
+				  u64 *seqno)
+{
+	const u64 key = (uintptr_t)p;
+	struct xe_eudebug_resource *r;
+	struct xe_eudebug_handle *h, *o;
+	int id, err;
+
+	if (XE_WARN_ON(!p))
+		return -EINVAL;
+
+	h = alloc_handle(key);
+	if (!h)
+		return -ENOMEM;
+
+	r = resource_from_type(d, type);
+
+	/*
+	 * Reserve the id, and the nodes backing it, before taking the lock.
+	 * A reserved entry reads back as NULL, so nothing can observe the id
+	 * until we store the handle below, and that store is guaranteed to
+	 * find the slot already there and so never has to allocate.
+	 */
+	err = xa_alloc(&r->xa, &h->id, XA_ZERO_ENTRY, xa_limit_31b, GFP_KERNEL);
+	if (err) {
+		kfree(h);
+		return err;
+	}
+
+	mutex_lock(&r->lock);
+	o = __find_handle(r, key);
+	if (o) {
+		err = -EEXIST;
+	} else {
+		err = rhashtable_insert_fast(&r->rh,
+					     &h->rh_head,
+					     rhash_res);
+		if (!err) {
+			xa_store(&r->xa, h->id, h, GFP_ATOMIC);
+			if (seqno)
+				*seqno = atomic_long_inc_return(&d->events.seqno);
+		}
+	}
+	id = h->id;
+	mutex_unlock(&r->lock);
+
+	if (err) {
+		xa_erase(&r->xa, id);
+		kfree(h);
+		XE_WARN_ON(err > 0);
+		return err;
+	}
+
+	xe_eudebug_assert(d, id);
+
+	return id;
+}
+
+static int xe_eudebug_add_handle(struct xe_eudebug *d,
+				 int type,
+				 void *p,
+				 u64 *seqno)
+{
+	int ret;
+
+	ret = _xe_eudebug_add_handle(d, type, p, seqno);
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
+	guard(mutex)(&r->lock);
+	h = __find_handle(r, key);
+	if (!h)
+		return -ENOENT;
+
+	xa_h = xa_load(&r->xa, h->id);
+	if (XE_WARN_ON(!xa_h || xa_h != h))
+		return -EIO;
+
+	ret = rhashtable_remove_fast(&r->rh,
+				     &h->rh_head,
+				     rhash_res);
+	if (XE_WARN_ON(ret))
+		return -EIO;
+
+	xa_h = xa_erase(&r->xa, h->id);
+	if (XE_WARN_ON(xa_h != h))
+		return -EIO;
+
+	ret = h->id;
+	if (seqno)
+		*seqno = atomic_long_inc_return(&d->events.seqno);
+
+	kfree(h);
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
+xe_eudebug_prepare_event(struct xe_eudebug *d, u16 type, u64 seqno, u16 flags,
+			 u32 len)
+{
+	const u16 known_flags =
+		DRM_XE_EUDEBUG_EVENT_CREATE |
+		DRM_XE_EUDEBUG_EVENT_DESTROY |
+		DRM_XE_EUDEBUG_EVENT_STATE_CHANGE |
+		DRM_XE_EUDEBUG_EVENT_NEED_ACK;
+	struct drm_xe_eudebug_event *event = d->events.staging;
+
+	lockdep_assert_held(&d->events.lock);
+
+	xe_eudebug_assert(d, type <= XE_EUDEBUG_MAX_EVENT_TYPE);
+	xe_eudebug_assert(d, !(~known_flags & flags));
+	xe_eudebug_assert(d, len > sizeof(*event));
+	xe_eudebug_assert(d, len <= DRM_XE_EUDEBUG_EVENT_MAX_SIZE);
+
+	memset(event, 0, len);
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
+	int err;
+
+	scoped_guard(spinlock, &d->events.lock) {
+		event = xe_eudebug_prepare_event(d, DRM_XE_EUDEBUG_EVENT_VM,
+						 seqno, flags, sizeof(*e));
+		e = cast_event(e, event);
+		e->vm_handle = vm_handle;
+
+		err = xe_eudebug_queue_event(d, event);
+	}
+
+	if (err)
+		xe_eudebug_disconnect(d, err);
+
+	return err;
+}
+
+static int vm_create_event(struct xe_eudebug *d, struct xe_vm *vm)
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
+static int vm_destroy_event(struct xe_eudebug *d, struct xe_vm *vm)
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
+void xe_eudebug_vm_create(struct xe_file *xef, struct xe_vm *vm)
+{
+	struct xe_eudebug *d;
+	int err;
+
+	if (!xe_vm_in_lr_mode(vm))
+		return;
+
+	d = xe_eudebug_get(xef);
+	if (!d)
+		return;
+
+	err = vm_create_event(d, vm);
+	if (err)
+		xe_eudebug_disconnect(d, err);
+
+	xe_eudebug_put(d);
+}
+
+void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm)
+{
+	struct xe_eudebug *d;
+	int err;
+
+	if (!xe_vm_in_lr_mode(vm))
+		return;
+
+	d = xe_eudebug_get(xef);
+	if (!d)
+		return;
+
+	/*
+	 * A vm we never handed out to the debugger needs no destroy event.
+	 * Only a genuine bookkeeping inconsistency should drop the session.
+	 */
+	err = vm_destroy_event(d, vm);
+	if (err && err != -ENOENT)
+		xe_eudebug_disconnect(d, err);
+
+	xe_eudebug_put(d);
+}
+
+static int add_debugger(struct xe_device *xe, struct xe_eudebug *d,
+			struct drm_file *target)
+{
+	struct xe_file *xef = target->driver_priv;
+
+	guard(mutex)(&xe->eudebug.lock);
+
+	if (!xe_eudebug_is_enabled(xe))
+		return -EOPNOTSUPP;
+
+	if (xef->eudebug.debugger)
+		return -EBUSY;
+
+	d->target.xef = xe_file_get(xef);
+	d->target.pid = xef->pid;
+	kref_get(&d->ref);
+	xef->eudebug.debugger = d;
+
+	XE_WARN_ON(!list_empty(&xef->eudebug.target_link));
+
+	do {
+		d->session = ++xe->eudebug.session_count;
+	} while (!d->session);
+
+	list_add_tail(&xef->eudebug.target_link, &xef->xe->eudebug.targets);
+
+	return 0;
+}
+
+static int
+xe_eudebug_attach(struct xe_device *xe, struct drm_file *parent_file,
+		  struct xe_eudebug *d, u64 target_fd)
+{
+	struct file *file __free(fput) = NULL;
+	struct drm_file *drm_file;
+	struct xe_file *target_xef;
+	int ret;
+
+	if (XE_IOCTL_DBG(xe, target_fd > INT_MAX))
+		return -EBADFD;
+
+	file = fget(target_fd);
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
+	eu_dbg(d, "session %lld attached to %s", d->session,
+	       parent_file == drm_file ? "self" : "remote");
+
+	return 0;
+}
+
+static int xe_eudebug_release(struct inode *inode, struct file *file)
+{
+	struct xe_eudebug *d = file->private_data;
+	struct drm_device *drm = &d->xe->drm;
+
+	xe_eudebug_disconnect(d, 0);
+	xe_eudebug_put(d);
+
+	drm_dev_put(drm);
+
+	return 0;
+}
+
+/*
+ * This is racy as we dont take the lock for read but all the
+ * callsites can handle the race so we can live without lock.
+ */
+__no_kcsan
+static unsigned int
+event_fifo_len(const struct xe_eudebug * const d)
+{
+	return kfifo_len(&d->events.fifo);
+}
+
+static unsigned int
+event_fifo_has_events(struct xe_eudebug *d)
+{
+	/* Allow all waiters to proceed to check their state */
+	if (xe_eudebug_detached(d))
+		return 1;
+
+	if (READ_ONCE(d->events.pending_occupied))
+		return 1;
+
+	return event_fifo_len(d) >
+		sizeof(struct drm_xe_eudebug_event);
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
+		if (READ_ONCE(d->target.err))
+			ret |= EPOLLERR;
+	}
+
+	if (event_fifo_has_events(d))
+		ret |= EPOLLIN;
+
+	return ret;
+}
+
+static void xe_eudebug_reader_clear(struct xe_eudebug *d)
+{
+	if (!d)
+		return;
+
+	clear_bit_unlock(XE_EUDEBUG_READER_ACTIVE, &d->flags);
+}
+
+DEFINE_FREE(reader_active, struct xe_eudebug *, xe_eudebug_reader_clear(_T))
+
+static long xe_eudebug_read_event(struct xe_eudebug *d,
+				  const u64 arg,
+				  const bool wait)
+{
+	struct xe_device *xe = d->xe;
+	struct drm_xe_eudebug_event __user * const user_orig =
+		u64_to_user_ptr(arg);
+	struct xe_eudebug *reader __free(reader_active) = NULL;
+	struct drm_xe_eudebug_event *event_out __free(kvfree) = NULL;
+	struct drm_xe_eudebug_event user_event;
+	struct drm_xe_eudebug_event *pending;
+	long ret = 0;
+	int pending_len = 0;
+	int fifo_ret;
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
+	if (XE_IOCTL_DBG(xe, xe_eudebug_detached(d)))
+		return -ENOTCONN;
+
+	if (test_and_set_bit_lock(XE_EUDEBUG_READER_ACTIVE, &d->flags))
+		return -EBUSY;
+
+	reader = d;
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
+	/*
+	 * Bounce buffer for the copy out, so that the event can be released
+	 * from under events.lock before faulting on the user pointer. An event
+	 * larger than what the caller asked for is answered with -EMSGSIZE, so
+	 * user_event.len is an upper bound for what we will ever copy.
+	 */
+	event_out = kvzalloc(min_t(u32, user_event.len,
+				   DRM_XE_EUDEBUG_EVENT_MAX_SIZE), GFP_KERNEL);
+	if (!event_out)
+		return -ENOMEM;
+
+	spin_lock(&d->events.lock);
+	fifo_ret = event_fifo_pending(d, &pending);
+	if (fifo_ret == 0) {
+		if (user_event.len < pending->len) {
+			pending_len = pending->len;
+			ret = -EMSGSIZE;
+		} else if (!access_ok(user_orig, pending->len)) {
+			ret = -EFAULT;
+		} else {
+			memcpy(event_out, pending, pending->len);
+			ret = 0;
+		}
+	} else if (fifo_ret == -ENOENT) {
+		ret = wait ? -ETIMEDOUT : -EAGAIN;
+	} else {
+		ret = fifo_ret;		/* -ENOTCONN or -EIO */
+	}
+	spin_unlock(&d->events.lock);
+
+	/* disconnect can sleep, so do it only after dropping the spinlock */
+	if (fifo_ret == -EIO)
+		xe_eudebug_disconnect(d, -EIO);
+
+	if (ret == -EMSGSIZE) {
+		if (XE_IOCTL_DBG(xe, put_user(pending_len, &user_orig->len)))
+			ret = -EFAULT;
+	}
+
+	if (!ret && __copy_to_user(user_orig, event_out, event_out->len))
+		ret = -EFAULT;
+
+	if (!ret) {
+		spin_lock(&d->events.lock);
+		d->events.pending_occupied = false;
+		spin_unlock(&d->events.lock);
+	}
+	eu_dbg(d, "event read=%ld: type=%u, flags=0x%x, seqno=%llu", ret,
+	       event_out->type, event_out->flags, event_out->seqno);
+
+	return ret;
+}
+
+/**
+ * xe_eudebug_ioctl - Issue a command to eudebug interface
+ *
+ * @file : eudebug file (returned from connect)
+ * @cmd : cmd
+ * @arg : arguments depending on cmd
+ *
+ * Issue a eudebug command
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
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
+	.unlocked_ioctl	= xe_eudebug_ioctl,
+	.compat_ioctl   = xe_eudebug_ioctl,
+};
+
+static int
+xe_eudebug_connect(struct xe_device *xe,
+		   struct drm_file *drm_file,
+		   struct drm_xe_eudebug_connect *param)
+{
+	const u64 known_open_flags = 0;
+	struct xe_eudebug *d;
+	struct file *file;
+	int fd, err;
+
+	if (XE_IOCTL_DBG(xe, param->extensions))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, param->flags & ~known_open_flags))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, param->reserved))
+		return -EINVAL;
+
+	if (!xe_eudebug_is_enabled(xe))
+		return -EOPNOTSUPP;
+
+	d = kzalloc_obj(*d, GFP_KERNEL);
+	if (XE_IOCTL_DBG(xe, !d))
+		return -ENOMEM;
+
+	d->xe = xe;
+
+	kref_init(&d->ref);
+	init_waitqueue_head(&d->events.write_done);
+
+	spin_lock_init(&d->events.lock);
+
+	err = xe_eudebug_resources_init(d);
+	if (XE_IOCTL_DBG(xe, err)) {
+		kfree(d);
+		return err;
+	}
+
+	d->events.pending = kvzalloc(DRM_XE_EUDEBUG_EVENT_MAX_SIZE,
+				     GFP_KERNEL | __GFP_ACCOUNT);
+	if (!d->events.pending) {
+		err = -ENOMEM;
+		goto err_put;
+	}
+
+	d->events.staging = kvzalloc(DRM_XE_EUDEBUG_EVENT_MAX_SIZE,
+				     GFP_KERNEL | __GFP_ACCOUNT);
+	if (!d->events.staging) {
+		err = -ENOMEM;
+		goto err_put;
+	}
+
+	d->events.fifo_buf = kvmalloc(XE_EUDEBUG_FIFO_SIZE,
+				      GFP_KERNEL | __GFP_ACCOUNT);
+	if (!d->events.fifo_buf) {
+		err = -ENOMEM;
+		goto err_put;
+	}
+
+	err = kfifo_init(&d->events.fifo, d->events.fifo_buf, XE_EUDEBUG_FIFO_SIZE);
+	if (XE_IOCTL_DBG(xe, err))
+		goto err_put;
+
+	err = xe_eudebug_attach(xe, drm_file, d, param->fd);
+	if (XE_IOCTL_DBG(xe, err))
+		goto err_put;
+
+	fd = get_unused_fd_flags(O_CLOEXEC);
+	if (fd < 0) {
+		err = fd;
+		goto err_detach;
+	}
+
+	file = anon_inode_getfile("[xe_eudebug]", &fops, d, 0);
+	if (IS_ERR(file)) {
+		err = PTR_ERR(file);
+		goto err_fd;
+	}
+
+	eu_dbg(d, "connected session %lld", d->session);
+
+	drm_dev_get(&xe->drm);
+
+	fd_install(fd, file);
+
+	return fd;
+
+err_fd:
+	put_unused_fd(fd);
+err_detach:
+	xe_eudebug_detach(d, err);
+err_put:
+	xe_eudebug_put(d);
+
+	return err;
+}
+
+void xe_eudebug_file_close(struct xe_file *xef)
+{
+	struct xe_eudebug *d;
+
+	d = xe_eudebug_get(xef);
+	if (d) {
+		xe_eudebug_detach(d, 0);
+		xe_eudebug_put(d);
+	}
+}
+
+bool xe_eudebug_is_enabled(struct xe_device *xe)
+{
+	return READ_ONCE(xe->eudebug.cap_state) == XE_EUDEBUG_CAP_ENABLED;
+}
+
+int xe_eudebug_enable(struct xe_device *xe, bool enable)
+{
+	guard(mutex)(&xe->eudebug.lock);
+
+	if (xe->eudebug.cap_state == XE_EUDEBUG_CAP_NOT_SUPPORTED)
+		return -EPERM;
+
+	if (!enable && !list_empty(&xe->eudebug.targets))
+		return -EBUSY;
+
+	if (enable == xe_eudebug_is_enabled(xe))
+		return 0;
+
+	WRITE_ONCE(xe->eudebug.cap_state, enable ?
+		   XE_EUDEBUG_CAP_ENABLED : XE_EUDEBUG_CAP_DISABLED);
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
+void xe_eudebug_init_early(struct xe_device *xe)
+{
+	struct drm_device *dev = &xe->drm;
+	int err;
+
+	INIT_LIST_HEAD(&xe->eudebug.targets);
+	WRITE_ONCE(xe->eudebug.cap_state, XE_EUDEBUG_CAP_NOT_SUPPORTED);
+
+	err = drmm_mutex_init(dev, &xe->eudebug.lock);
+	if (err)
+		drm_warn(&xe->drm, "eudebug disabled, early init fail: %d\n", err);
+	else
+		WRITE_ONCE(xe->eudebug.cap_state, XE_EUDEBUG_CAP_DISABLED);
+}
+
+void xe_eudebug_init(struct xe_device *xe)
+{
+	struct drm_device *dev = &xe->drm;
+	int err;
+
+	/* early init failed */
+	if (xe->eudebug.cap_state == XE_EUDEBUG_CAP_NOT_SUPPORTED)
+		return;
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
+	WRITE_ONCE(xe->eudebug.cap_state, XE_EUDEBUG_CAP_DISABLED);
+
+	return;
+
+out_err:
+	drm_warn(&xe->drm, "eudebug disabled, init fail: %d\n", err);
+
+	WRITE_ONCE(xe->eudebug.cap_state, XE_EUDEBUG_CAP_NOT_SUPPORTED);
+}
+
+/**
+ * xe_eudebug_connect_ioctl - Connect to eudebug interface
+ * @dev : DRM device
+ * @data : ioctl data, (struct drm_xe_eudebug_connect)
+ * @file : DRM file
+ *
+ * Connect to the eudebug interface.
+ *
+ * Return: eudebug filedesriptor on success, negative error code on failure.
+ *
+ */
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
index 000000000000..a314cfa26a68
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -0,0 +1,71 @@
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
+#define XE_EUDEBUG_DBG_STR  "eudbg: %lld:%lu:%s (%d/%d) -> (%d): "
+
+#define __eu_print(d, func, fmt, ...) \
+	do { \
+		struct xe_eudebug *__pd = (d); \
+		func(&__pd->xe->drm, XE_EUDEBUG_DBG_STR fmt, \
+		     __pd->session, \
+		     atomic_long_read(&__pd->events.seqno), \
+		     (!READ_ONCE(__pd->target.xef) ? "disconnected" : ""), \
+		     current->pid, \
+		     task_tgid_nr(current), \
+		     __pd->target.pid, \
+		     ##__VA_ARGS__); \
+	} while (0)
+
+#define eu_err(d, fmt, ...)   __eu_print(d, drm_err, fmt, ##__VA_ARGS__)
+#define eu_warn(d, fmt, ...)  __eu_print(d, drm_warn, fmt, ##__VA_ARGS__)
+#define eu_dbg(d, fmt, ...)   __eu_print(d, drm_dbg, fmt, ##__VA_ARGS__)
+
+#define xe_eudebug_assert(d, ...) xe_assert((d)->xe, ##__VA_ARGS__)
+
+int xe_eudebug_connect_ioctl(struct drm_device *dev,
+			     void *data,
+			     struct drm_file *file);
+
+void xe_eudebug_init(struct xe_device *xe);
+void xe_eudebug_init_early(struct xe_device *xe);
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
+					   struct drm_file *file) { return -EOPNOTSUPP; }
+
+static inline void xe_eudebug_init(struct xe_device *xe) { }
+static inline void xe_eudebug_init_early(struct xe_device *xe) { }
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
index 000000000000..46d78f4f8061
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -0,0 +1,131 @@
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
+#include <linux/sizes.h>
+#include <linux/wait.h>
+#include <linux/xarray.h>
+
+#include <uapi/drm/xe_drm_eudebug.h>
+
+struct xe_device;
+
+/**
+ * enum xe_eudebug_cap_state - eudebug capability state
+ *
+ * @XE_EUDEBUG_CAP_NOT_SUPPORTED: eudebug feature support off
+ * @XE_EUDEBUG_CAP_DISABLED: eudebug feature supported but disabled
+ * @XE_EUDEBUG_CAP_ENABLED: eudebug enabled
+ */
+enum xe_eudebug_cap_state {
+	XE_EUDEBUG_CAP_NOT_SUPPORTED = 0,
+	XE_EUDEBUG_CAP_DISABLED,
+	XE_EUDEBUG_CAP_ENABLED,
+};
+
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
+	/** @lock: protects xa and rh consistency */
+	struct mutex lock;
+
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
+		/** @target.xef: the target xe_file that we are debugging
+		 *  Protected by xe->eudebug.lock.
+		 */
+		struct xe_file *xef;
+
+		/** @target.pid: pid of target */
+		pid_t pid;
+
+		/** @target.err: error code on disconnect */
+		int err;
+
+		/** @target.res: resource maps for all types */
+		struct xe_eudebug_resource res[XE_EUDEBUG_RES_TYPE_COUNT];
+	} target;
+
+	/** @xe: the parent device we are serving */
+	struct xe_device *xe;
+
+	/** @session: session number for this connection (for logs) */
+	u64 session;
+
+	/** @flags: state flags */
+	unsigned long flags;
+#define XE_EUDEBUG_READER_ACTIVE 0
+
+	/** @events: kfifo queue of to-be-delivered events */
+	struct {
+		/** @events.lock: guards access to fifo, pending and staging */
+		spinlock_t lock;
+
+#define DRM_XE_EUDEBUG_EVENT_MAX_SIZE SZ_64K
+		/** @events.pending: pending event bounce buffer, preallocated */
+		struct drm_xe_eudebug_event *pending;
+		bool pending_occupied;
+
+		/** @events.staging: write side staging buffer, preallocated */
+		struct drm_xe_eudebug_event *staging;
+
+		/** @events.fifo: queue of events pending */
+		struct kfifo fifo;
+
+		/** @events.fifo_buf: memory for the fifo */
+		void *fifo_buf;
+#define XE_EUDEBUG_FIFO_SIZE SZ_16M
+
+		/** @events.write_done: waitqueue for signalling write to fifo */
+		wait_queue_head_t write_done;
+
+		/** @events.seqno: seqno counter to stamp events for fifo */
+		atomic_long_t seqno;
+	} events;
+};
+
+#endif /* _XE_EUDEBUG_TYPES_H_ */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 19b3d0be7928..cf7a3c7c51e5 100644
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
@@ -2162,10 +2163,18 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	args->reserved[0] = xe_bo_main_addr(vm->pt_root[0]->bo, XE_PAGE_SIZE);
 #endif
 
+	/*
+	 * Announce to the debugger before the id is published, as from that
+	 * point on a concurrent destroy can race us to the resource map.
+	 */
+	xe_eudebug_vm_create(xef, vm);
+
 	/* user id alloc must always be last in ioctl to prevent UAF */
 	err = xa_alloc(&xef->vm.xa, &id, vm, xa_limit_32b, GFP_KERNEL);
-	if (err)
+	if (err) {
+		xe_eudebug_vm_destroy(xef, vm);
 		goto err_close_and_put;
+	}
 
 	args->vm_id = id;
 
@@ -2200,8 +2209,10 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
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
index 509202a7b13e..03cb1181c169 100644
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
+#define DRM_IOCTL_XE_EUDEBUG_CONNECT		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EUDEBUG_CONNECT, struct drm_xe_eudebug_connect)
 
 /**
  * DOC: Xe IOCTL Extensions
@@ -2618,6 +2620,27 @@ enum drm_xe_ras_error_component {
 	[DRM_XE_RAS_ERR_COMP_FABRIC] = "fabric",			\
 }
 
+/**
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
+	/** @flags: Flags, MBZ */
+	__u64 flags;
+
+	/** @reserved: MBZ */
+	__u64 reserved;
+};
+
+#include "xe_drm_eudebug.h"
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
new file mode 100644
index 000000000000..d33b8b371aae
--- /dev/null
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -0,0 +1,101 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _UAPI_XE_DRM_EUDEBUG_H_
+#define _UAPI_XE_DRM_EUDEBUG_H_
+
+#include "drm.h"
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+/**
+ * DOC: DRM_XE_EUDEBUG_IOCTL_READ_EVENT
+ *
+ * Receive one event from the connection returned by
+ * &DRM_IOCTL_XE_EUDEBUG_CONNECT. The argument is a pointer to a
+ * &struct drm_xe_eudebug_event filled in as described there.
+ *
+ * A connection opened without O_NONBLOCK waits up to five seconds for an
+ * event to arrive. Only one reader at a time is allowed on a connection.
+ *
+ * Return: 0 on success. Negative error code on failure:
+ *
+ * - -EMSGSIZE if the pending event is larger than the supplied len. len is
+ *   updated with the size needed and the event stays queued.
+ * - -ETIMEDOUT if the blocking wait expired with no event.
+ * - -EAGAIN if O_NONBLOCK was set and no event was queued.
+ * - -EBUSY if another thread is already reading on this connection.
+ * - -ENOTCONN if the debug target is gone and the queue has been drained.
+ */
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
2.53.0

