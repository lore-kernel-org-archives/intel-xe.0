Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C475C79FAD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:42:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C958C10F10D;
	Wed,  9 Sep 2026 12:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RfBZBtzX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD54D10F115
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788957732; x=1820493732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q8OW2qW16j5BjcPyljZIOsk95LBOOzTgbsNTafDE0xE=;
 b=RfBZBtzXcjOLt0LH11EMMzKJxa+amXc7sgyYfTFwn67ccnOnhQEobdmw
 v9LnRCGxpXhRFQlVVlsNq5vGCJlE/9HdJzIP/9brpq632l9+/OEDVEd+h
 q7WweDwkSn7o0jIzqLN4lcdGfccsueFW0YZd5gUJynzqqS91mRKm4iFOT
 M8FBgFy5Ys+ut0fqmw9s0+1C+hXWGh/oDmy3ql25/oF6cKJqxzePxlcRM
 Sx4Vp6Pm+6DlFh9COmfgfoCzjfXXYqzgFJivIzm2Ug6yzF6N5NB6wq5Im
 qPIjixtVOlA3mzNm3w1eYWQH6YwIVFbLxNC++KVwVj3Jfx1fG4b0BIs7u Q==;
X-CSE-ConnectionGUID: 7mCyugdERXij7nwTaAmz1w==
X-CSE-MsgGUID: YckWMG4fSvGtyoP+beG6+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99715565"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="99715565"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:42:11 -0700
X-CSE-ConnectionGUID: neRf1m73QZ+gcSJeOnamhg==
X-CSE-MsgGUID: Caf5XHc/SxGmK81Wvs/6jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296246650"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 05:42:10 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC v2 14/21] drm/xe/uapi: Add access counter parameter extension
 for exec queue
Date: Wed,  9 Sep 2026 18:15:08 +0530
Message-ID: <20260909124457.1610890-37-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
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

Introduce DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM extension to allow
userspace to configure access counter notifications per exec queue.

The extension provides:
- trigger: Access counter trigger threshold
- notify: Access counter notify threshold
- granularity: Access counter granularity level

These parameters control hardware access counter behavior for memory
access pattern tracking and optimization hints. Userspace can configure
different thresholds per exec queue based on workload characteristics.

UAPI changes:
- Add drm_xe_exec_queue_set_acc_param structure
- Add DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM extension ID

KMD changes:
- Add exec_queue_user_ext_set_acc_param() handler
- Store parameters in xe_exec_queue.acc structure
- Register handler in extension function table

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       |  33 ++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   9 ++
 include/uapi/drm/xe_drm.h                | 195 +++++++++++++++++++++++
 3 files changed, 237 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index e63559a2f582..9773b27ad2a0 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1153,6 +1153,38 @@ static int exec_queue_user_ext_check_final(struct xe_exec_queue *q, u64 properti
 	return 0;
 }
 
+static int exec_queue_user_ext_set_acc_param(struct xe_device *xe,
+					     struct xe_exec_queue *q,
+					     u64 extension, u64 *properties)
+{
+	u64 __user *address = u64_to_user_ptr(extension);
+	struct drm_xe_exec_queue_set_acc_param ext;
+	int err;
+
+	if (!xe->info.has_access_counter)
+		return -EINVAL;
+
+	err = copy_from_user(&ext, address, sizeof(ext));
+	if (XE_IOCTL_DBG(xe, err))
+		return -EFAULT;
+
+	if (XE_IOCTL_DBG(xe, ext.pad1 || ext.pad2))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, ext.granularity > DRM_XE_ACCESS_COUNTER_GRANULARITY_64M))
+		return -EINVAL;
+
+	if (XE_IOCTL_DBG(xe, ext.notify > ext.trigger))
+		return -EINVAL;
+
+	/* Store access counter parameters in exec queue */
+	q->acc.trigger = ext.trigger;
+	q->acc.notify = ext.notify;
+	q->acc.granularity = ext.granularity;
+
+	return 0;
+}
+
 static int exec_queue_user_ext_set_property(struct xe_device *xe,
 					    struct xe_exec_queue *q,
 					    u64 extension, u64 *properties)
@@ -1199,6 +1231,7 @@ typedef int (*xe_exec_queue_user_extension_fn)(struct xe_device *xe,
 
 static const xe_exec_queue_user_extension_fn exec_queue_user_extension_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY] = exec_queue_user_ext_set_property,
+	[DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM] = exec_queue_user_ext_set_acc_param,
 };
 
 #define MAX_USER_EXTENSIONS	16
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 836f88fc0faa..c5777689eead 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -265,6 +265,15 @@ struct xe_exec_queue {
 
 	/** @replay_state: GPU hang replay state */
 	void *replay_state;
+	/** @acc: Access counter parameters */
+	struct {
+		/** @acc.trigger: Access counter trigger threshold */
+		u16 trigger;
+		/** @acc.notify: Access counter notify threshold */
+		u16 notify;
+		/** @acc.granularity: Access counter granularity */
+		u8 granularity;
+	} acc;
 
 	/** @ops: submission backend exec queue operations */
 	const struct xe_exec_queue_ops *ops;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 578f0c1eb43e..c68e88d4d490 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1432,6 +1432,7 @@ struct drm_xe_vm_get_property {
  */
 struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
+#define DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM		1
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
@@ -1472,6 +1473,200 @@ struct drm_xe_exec_queue_create {
 	__u64 reserved[2];
 };
 
+/**
+ * enum drm_xe_access_counter_granularity - VA window size for access counter notifications
+ *
+ * Selects the size of the virtual address region that the hardware groups
+ * together when counting memory accesses and reporting notifications.  A
+ * larger granularity means the hardware reports a coarser region but
+ * generates fewer notifications; a smaller granularity is more precise but
+ * may produce more events under a scattered access pattern.
+ */
+enum drm_xe_access_counter_granularity {
+	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_128K: 128K granularity */
+	DRM_XE_ACCESS_COUNTER_GRANULARITY_128K,
+	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_2M: 2M granularity */
+	DRM_XE_ACCESS_COUNTER_GRANULARITY_2M,
+	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_16M: 16M granularity */
+	DRM_XE_ACCESS_COUNTER_GRANULARITY_16M,
+	/** @DRM_XE_ACCESS_COUNTER_GRANULARITY_64M: 64M granularity */
+	DRM_XE_ACCESS_COUNTER_GRANULARITY_64M,
+};
+
+/**
+ * struct drm_xe_exec_queue_set_acc_param - Access counter parameters extension
+ *
+ * **What are access counters?**
+ *
+ * Access counters are a hardware mechanism that tracks how frequently the GPU
+ * accesses memory regions over time.  When a virtual address (VA) window
+ * accumulates enough accesses, the hardware notifies the kernel driver, which
+ * can then take advisory action — typically migrating the hot memory region
+ * from system RAM to device-local VRAM so future GPU accesses avoid costly
+ * PCIe transfers.
+ *
+ * Access counter notifications are purely **advisory and transparent** to
+ * userspace.  Workloads execute identically with or without them; the only
+ * observable effect is potentially improved performance if the kernel succeeds
+ * in migrating memory closer to the GPU.
+ *
+ * **Enabling access counters on an exec queue**
+ *
+ * Access counters are configured at exec queue creation time by attaching a
+ * &drm_xe_exec_queue_set_acc_param extension to &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
+ * via %DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM.  Once set, the parameters
+ * are baked into the engine's Logical Ring Context (LRC) registers
+ * (%CTX_ACC_CTR_THOLD and %CTX_ASID) and remain active for the lifetime of
+ * the exec queue.  There is no separate ioctl to change or remove the
+ * parameters after creation; destroy and recreate the exec queue instead.
+ *
+ * The only behavioural change visible to userspace is that workloads submitted
+ * to this exec queue may run with slightly different memory locality over time
+ * as the kernel responds to hotness hints.
+ *
+ * **Typical usage pattern**
+ *
+ * .. code-block:: c
+ *
+ *     // Step 1: build the extension
+ *     struct drm_xe_exec_queue_set_acc_param acc = {
+ *         .base.name     = DRM_XE_EXEC_QUEUE_EXTENSION_SET_ACC_PARAM,
+ *         .trigger       = 100,  // report trigger notification at 100 accesses
+ *         .notify        = 20,   // notify on LRU de-alloc if >= 20 accesses
+ *         .granularity   = DRM_XE_ACCESS_COUNTER_GRANULARITY_2M,
+ *     };
+ *
+ *     // Step 2: chain it onto exec queue creation
+ *     struct drm_xe_exec_queue_create eq = {
+ *         .extensions    = (uintptr_t)&acc,
+ *         .vm_id         = vm_id,
+ *         .width         = 1,
+ *         .num_placements = 1,
+ *         .instances     = (uintptr_t)&instance,
+ *     };
+ *     ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &eq);
+ *
+ *     // Step 3: submit work as normal — AC tracking is automatic
+ *     ioctl(fd, DRM_IOCTL_XE_EXEC, &exec);
+ *
+ * **How @trigger works**
+ *
+ * The hardware maintains a finite pool of counters, each tracking accesses to
+ * one @granularity-aligned VA window.  When the accumulated access count for
+ * a counter reaches @trigger, the hardware immediately reports it to the
+ * driver as an **access counter trigger notification**.  This is the primary,
+ * high-priority path: the region is identified as hot and the driver acts on
+ * it promptly (e.g., migrating memory to VRAM).
+ *
+ * **How @notify works**
+ *
+ * Because the hardware counter pool is finite, a counter may be de-allocated
+ * under capacity pressure using an LRU policy before its count ever reaches
+ * @trigger.  At de-allocation time, the hardware compares the current count
+ * of the de-allocated counter against @notify.  If count >= @notify,
+ * the hardware reports it as an **access counter notify notification**.
+ * The driver treats notify notifications with lower priority than trigger
+ * notifications — they indicate moderate interest and are serviced
+ * opportunistically.  If count < @notify, the de-allocation is silent.
+ *
+ * Both @trigger and @notify are absolute access counts (16-bit unsigned).
+ *
+ * Example (hardware counter pool under pressure)::
+ *
+ *     CTR 10 is being de-allocated (LRU).  It was tracking a VA window with
+ *     notify=0x14 (20), trigger=0x64 (100).
+ *
+ *     CTR 10 count == 0x0A (10): count < notify → silent de-allocation.
+ *     CTR 10 count == 0x1E (30): count >= notify → NOTIFY reported to driver.
+ *
+ * Setting @notify > @trigger is meaningless: the counter is de-allocated
+ * (via trigger notification or LRU) before its count can ever reach @notify.
+ * Always set @notify <= @trigger.
+ *
+ * **Do notifications reach userspace?**
+ *
+ * No.  Notifications are handled entirely inside the kernel driver.  The
+ * driver emits kernel trace events (``trace_xe_vma_acc`` via ftrace) that are
+ * visible through the standard Linux tracing infrastructure, but no signal,
+ * udev event, or file descriptor event is delivered to the process.
+ *
+ * **What if access counters are not supported?**
+ *
+ * Attaching this extension on hardware that does not support access counters
+ * (i.e., when ``xe.info.has_access_counter`` is zero) causes
+ * %DRM_IOCTL_XE_EXEC_QUEUE_CREATE to return ``-EINVAL``.  Applications should
+ * either verify hardware capability using %DRM_IOCTL_XE_DEVICE_QUERY before
+ * using this extension, or be prepared to handle ``-EINVAL`` and fall back to
+ * creating the exec queue without the extension.
+ *
+ * **Reset and removal**
+ *
+ * Access counter parameters cannot be removed or changed after the exec queue
+ * is created.  During a GT reset the kernel squashes any in-flight access
+ * counter notifications for that GT (pending work items are discarded), but
+ * the LRC register values are not cleared — they are restored by the GuC
+ * context save/restore mechanism when the engine recovers.
+ */
+struct drm_xe_exec_queue_set_acc_param {
+	/** @base: base user extension */
+	struct drm_xe_user_extension base;
+
+	/**
+	 * @trigger: Active count threshold for trigger notifications.
+	 *
+	 * When the hardware counter for a @granularity-aligned VA window
+	 * reaches this value, the hardware immediately reports an access
+	 * counter **trigger** notification to the driver.  Trigger
+	 * notifications are high priority — the region is confirmed hot.
+	 * Absolute count, 16-bit unsigned (e.g. 0x64 = 100 accesses).
+	 */
+	__u16 trigger;
+
+	/**
+	 * @notify: De-allocation count threshold for notify notifications.
+	 *
+	 * When a counter is de-allocated from the finite hardware pool under
+	 * LRU pressure, the hardware compares its accumulated count against
+	 * this value.  If count >= @notify, an access counter **notify**
+	 * notification is reported to the driver (lower priority than trigger).
+	 * If count < @notify, the de-allocation is silent.
+	 * Absolute count, 16-bit unsigned (e.g. 0x14 = 20 accesses).
+	 *
+	 * Must be <= @trigger.  A counter is de-allocated once it either fires
+	 * a trigger notification or is de-allocated by LRU; in either case its
+	 * count never exceeds @trigger, so a @notify value larger than @trigger
+	 * can never be satisfied.
+	 */
+	__u16 notify;
+
+	/**
+	 * @granularity: VA window size, one of &enum drm_xe_access_counter_granularity.
+	 *
+	 * Determines the alignment and size of the virtual address regions
+	 * that the hardware tracks and reports.  Each notification covers one
+	 * aligned window of this size.  Possible values:
+	 *
+	 * - %DRM_XE_ACCESS_COUNTER_GRANULARITY_128K: 128 KiB windows.
+	 *   Finest granularity; best for workloads with small, scattered hot
+	 *   allocations where precise locality matters.
+	 * - %DRM_XE_ACCESS_COUNTER_GRANULARITY_2M: 2 MiB windows.
+	 *   Matches the typical huge-page size; good general-purpose choice.
+	 * - %DRM_XE_ACCESS_COUNTER_GRANULARITY_16M: 16 MiB windows.
+	 *   Coarser tracking; suitable for large buffer workloads where
+	 *   per-allocation granularity is sufficient.
+	 * - %DRM_XE_ACCESS_COUNTER_GRANULARITY_64M: 64 MiB windows.
+	 *   Coarsest granularity; fewest notifications, lowest overhead,
+	 *   best for very large contiguous allocations.
+	 */
+	__u8 granularity;
+
+	/** @pad1: MBZ */
+	__u8 pad1;
+
+	/** @pad2: MBZ */
+	__u16 pad2;
+};
+
 /**
  * struct drm_xe_exec_queue_destroy - Input of &DRM_IOCTL_XE_EXEC_QUEUE_DESTROY
  */
-- 
2.43.0

