Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D29E81DEC
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 12:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C086D10E4DD;
	Fri,  6 Oct 2023 12:14:50 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id AEFAA10E4DD;
 Fri,  6 Oct 2023 12:14:48 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AD68FAADF1;
 Fri,  6 Oct 2023 12:14:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Fri, 06 Oct 2023 12:14:48 -0000
Message-ID: <169659448870.6468.12816133363172607685@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231006095943.7-1-francois.dugast@intel.com>
In-Reply-To: <20231006095943.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_uA?=
 =?utf-8?q?PI_Alignment_-_take_1_v5?=
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

Series: uAPI Alignment - take 1 v5
URL   : https://patchwork.freedesktop.org/series/124710/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5181e5bb1b47eafa97c8018c85f90336f126787f
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Fri Oct 6 09:59:43 2023 +0000

    drm/xe/uapi: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
    
    This is used for the priority of an exec queue (not an engine) and
    should be named accordingly.
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch b3daf7f07d6accbe43feafcadeb0b0498063761e drm-intel
39d4e81e7 drm/xe: Fix array bounds check for queries
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '22504d560287', maybe rebased or not pulled?
#9: 
Fixes: 22504d560287 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
a90b52b97 drm/xe: Set the correct type for xe_to_user_engine_class
4e07b69e3 drm/xe: Correlate engine and cpu timestamps with better accuracy
-:126: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#126: FILE: drivers/gpu/drm/xe/xe_query.c:108:
+query_engine_cycles(struct xe_device *xe,
+		struct drm_xe_device_query *query)

total: 0 errors, 0 warnings, 1 checks, 300 lines checked
3f1392b3b drm/xe/uapi: Separate VM_BIND's operation and flag
9d6796407 drm/xe/vm: Remove VM_BIND_OP macro
1e877ed3b drm/xe/uapi: Remove MMIO ioctl
65298a023 drm/xe: Fix xe_exec_queue_is_idle for parallel exec queues
c84f7fd48 drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE implementation
3b64f4cb9 drm/xe: Rename exec_queue_kill_compute to xe_vm_remove_compute_exec_queue
b140f6967 drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
dd66953fb drm/xe/uapi: Use common drm_xe_ext_set_property extension
54185d9d9 drm/xe: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
e503b6c67 drm/xe/uapi: Kill DRM_XE_UFENCE_WAIT_VM_ERROR
616e7bfb7 drm/xe: Remove async worker and rework sync binds
8ac9b4f52 drm/xe: Fix VM bind out-sync signaling ordering
0b8b3cf3e drm/xe/uapi: Document drm_xe_query_gt
ca1c0f7ea drm/xe/uapi: Replace useless 'instance' per unique gt_id
973f49c12 drm/xe/uapi: Remove unused field of drm_xe_query_gt
089b560d5 drm/xe/uapi: Rename gts to gt_list
5181e5bb1 drm/xe/uapi: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY


