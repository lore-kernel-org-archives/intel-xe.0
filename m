Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A2BE7E635
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 13:12:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9881110E3DB;
	Tue, 26 Sep 2023 13:12:49 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7010210E3DB;
 Tue, 26 Sep 2023 13:12:47 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6EEDAA00E8;
 Tue, 26 Sep 2023 13:12:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Tue, 26 Sep 2023 13:12:47 -0000
Message-ID: <169573396744.20980.9815312312586689850@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230926125540.7-1-francois.dugast@intel.com>
In-Reply-To: <20230926125540.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_uAPI_Alignment_-_take_1_v3?=
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
Reply-To: intel-xe@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: uAPI Alignment - take 1 v3
URL   : https://patchwork.freedesktop.org/series/124271/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: fc8ec3c56 drm/xe: Add Wa_18028616096
=== git am output follows ===
Applying: drm/xe: Fix array bounds check for queries
Applying: drm/xe: Set the correct type for xe_to_user_engine_class
Applying: drm/xe: Correlate engine and cpu timestamps with better accuracy
Applying: drm/xe/uapi: Separate VM_BIND's operation and flag
Applying: drm/xe/vm: Remove VM_BIND_OP macro
Applying: drm/xe/uapi: Remove MMIO ioctl
Applying: drm/xe: Fix xe_exec_queue_is_idle for parallel exec queues
Applying: drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE implementation
Applying: drm/xe: Rename exec_queue_kill_compute to xe_vm_remove_compute_exec_queue
Applying: drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
Applying: drm/xe/uapi: Use common drm_xe_ext_set_property extension
Applying: drm/xe: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
Applying: drm/xe/uapi: Kill DRM_XE_UFENCE_WAIT_VM_ERROR
Applying: drm/xe: Remove async worker and rework sync binds
Applying: drm/xe: Fix VM bind out-sync signaling ordering
Applying: drm/xe/uapi: Document drm_xe_query_gt
Applying: drm/xe/uapi: Replace useless 'instance' per unique gt_id
Applying: drm/xe/uapi: Remove unused field of drm_xe_query_gt
Applying: drm/xe/uapi: Rename gts to gt_list
Applying: drm/xe/uapi: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
Applying: drm/xe/uapi: Add documentation for query
Applying: drm/xe/uapi: Crystal Reference Clock updates
Applying: drm/xe: Extend drm_xe_vm_bind_op
Applying: drm/xe: Add uAPI to query micro-controler firmware version
Applying: drm/xe/uapi: Document DRM_XE_DEVICE_QUERY_HWCONFIG
Applying: drm/xe/uapi: Add pad to drm_xe_engine_class_instance
Applying: drm/xe: Extend uAPI to query HuC micro-controler firmware version
Applying: drm/xe: Remove useless query config num_params
Applying: drm/xe/uapi: Add missing DRM_ prefix in uAPI constants
Applying: drm/xe/uapi: Add _FLAG to uAPI constants usable for flags


