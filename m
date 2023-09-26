Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD80E7E635
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 13:13:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C7610E3E1;
	Tue, 26 Sep 2023 13:13:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id C325D10E3DB;
 Tue, 26 Sep 2023 13:13:26 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C217EA00E8;
 Tue, 26 Sep 2023 13:13:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Tue, 26 Sep 2023 13:13:26 -0000
Message-ID: <169573400679.20980.9712059495001948538@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230926125540.7-1-francois.dugast@intel.com>
In-Reply-To: <20230926125540.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_uA?=
 =?utf-8?q?PI_Alignment_-_take_1_v3?=
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
commit d59f38a611abbc340a5b3bbde9b1471c3d6f53ef
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Tue Sep 26 12:55:40 2023 +0000

    drm/xe/uapi: Add _FLAG to uAPI constants usable for flags
    
    Most constants defined in xe_drm.h which can be used for flags are
    named DRM_XE_*_FLAG_*, which is helpful to identify them. Make this
    systematic and add _FLAG where it was missing.
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch fc8ec3c56efa5c15b630ddc17c89100440fe03ef drm-intel
cb15bb2d5 drm/xe: Fix array bounds check for queries
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '22504d560287', maybe rebased or not pulled?
#9: 
Fixes: 22504d560287 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
ac53f74e2 drm/xe: Set the correct type for xe_to_user_engine_class
cefcdc6e5 drm/xe: Correlate engine and cpu timestamps with better accuracy
07c2354d3 drm/xe/uapi: Separate VM_BIND's operation and flag
a3e7c95d7 drm/xe/vm: Remove VM_BIND_OP macro
f65de3dac drm/xe/uapi: Remove MMIO ioctl
9fbf6c3c5 drm/xe: Fix xe_exec_queue_is_idle for parallel exec queues
a187384b9 drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE implementation
4d868dd83 drm/xe: Rename exec_queue_kill_compute to xe_vm_remove_compute_exec_queue
8c238f901 drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
d3e147345 drm/xe/uapi: Use common drm_xe_ext_set_property extension
6f0a08ad9 drm/xe: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
7f6aba850 drm/xe/uapi: Kill DRM_XE_UFENCE_WAIT_VM_ERROR
3f291a866 drm/xe: Remove async worker and rework sync binds
2961873bd drm/xe: Fix VM bind out-sync signaling ordering
24f54cc08 drm/xe/uapi: Document drm_xe_query_gt
ca379205e drm/xe/uapi: Replace useless 'instance' per unique gt_id
7452f1dba drm/xe/uapi: Remove unused field of drm_xe_query_gt
2697244ab drm/xe/uapi: Rename gts to gt_list
b299740d9 drm/xe/uapi: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
d5409402f drm/xe/uapi: Add documentation for query
08186f954 drm/xe/uapi: Crystal Reference Clock updates
683faf5bb drm/xe: Extend drm_xe_vm_bind_op
20a107a92 drm/xe: Add uAPI to query micro-controler firmware version
-:18: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#18: 
More information: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23661

total: 0 errors, 1 warnings, 0 checks, 110 lines checked
3cb79850c drm/xe/uapi: Document DRM_XE_DEVICE_QUERY_HWCONFIG
52b8b9bd9 drm/xe/uapi: Add pad to drm_xe_engine_class_instance
9de056a38 drm/xe: Extend uAPI to query HuC micro-controler firmware version
710037287 drm/xe: Remove useless query config num_params
af9c72343 drm/xe/uapi: Add missing DRM_ prefix in uAPI constants
d59f38a61 drm/xe/uapi: Add _FLAG to uAPI constants usable for flags


