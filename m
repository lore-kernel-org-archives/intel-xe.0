Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75940C04FF7
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:52:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3448E10E55C;
	Wed, 20 Sep 2023 19:52:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3EBD910E545;
 Wed, 20 Sep 2023 19:52:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 41CD4A00E6;
 Wed, 20 Sep 2023 19:52:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Wed, 20 Sep 2023 19:52:28 -0000
Message-ID: <169523954826.6464.4934564015774196067@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230920192940.135004-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_uA?=
 =?utf-8?q?PI_Alignment_-_take_1_v2?=
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

Series: uAPI Alignment - take 1 v2
URL   : https://patchwork.freedesktop.org/series/124000/
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
commit 0a07cf74b33cd0000061e6c37afec201aaad646b
Author: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Date:   Wed Sep 20 15:29:40 2023 -0400

    drm/xe: Extend drm_xe_vm_bind_op
    
    The bind api is extensible but for a single bind op, there
    is not a mechanism to extend. Add extensions field to
    struct drm_xe_vm_bind_op.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Francois Dugast <francois.dugast@intel.com>
    Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
    Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
    Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
+ /mt/dim checkpatch 805557401e7aaeeec5aeb1de6688853390738bee drm-intel
f5ab67a76 drm/xe: Fix array bounds check for queries
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '22504d560287', maybe rebased or not pulled?
#9: 
Fixes: 22504d560287 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
7ce445626 drm/xe: Set the correct type for xe_to_user_engine_class
ed269b61d drm/xe: Correlate engine and cpu timestamps with better accuracy
2a3c6b70c drm/xe/uapi: Separate VM_BIND's operation and flag
93937e4d5 drm/xe/vm: Remove VM_BIND_OP macro
b9a223e3a drm/xe/uapi: Remove MMIO ioctl
073384663 drm/xe: Fix xe_exec_queue_is_idle for parallel exec queues
61d04e6f5 drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE implementation
43dc46cfe drm/xe: Rename exec_queue_kill_compute to xe_vm_remove_compute_exec_queue
063aad1d0 drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
0a0fa8ce8 drm/xe/uapi: Use common drm_xe_ext_set_property extension
7e471ab66 drm/xe: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
8efa4a2fd drm/xe/uapi: Document drm_xe_query_gt
6f25632b0 drm/xe/uapi: Replace useless 'instance' per unique gt_id
eb42f001d drm/xe/uapi: Remove unused field of drm_xe_query_gt
2639537a9 drm/xe/uapi: Rename gts to gt_list
a18e97906 drm/xe/uapi: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
78d242bb2 drm/xe/uapi: Add documentation for query
-:38: WARNING:TYPO_SPELLING: 'aligment' may be misspelled - perhaps 'alignment'?
#38: FILE: include/uapi/drm/xe_drm.h:340:
+	 * Minimal memory aligment required by this device,
 	                  ^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 61 lines checked
58cc90d8d drm/xe/uapi: Crystal Reference Clock updates
0a07cf74b drm/xe: Extend drm_xe_vm_bind_op


