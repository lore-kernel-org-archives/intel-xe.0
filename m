Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0454CD5BCA
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:32:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9B110E295;
	Tue, 19 Sep 2023 14:32:39 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id DAA5110E295;
 Tue, 19 Sep 2023 14:32:37 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DD8EBA0003;
 Tue, 19 Sep 2023 14:32:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Tue, 19 Sep 2023 14:32:37 -0000
Message-ID: <169513395790.3668.14872538447921949295@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230919142504.91652-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_uA?=
 =?utf-8?q?PI_Alignment_-_take_1?=
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

Series: uAPI Alignment - take 1
URL   : https://patchwork.freedesktop.org/series/123917/
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
commit 8b6a9d010002d8038a360d60a5439b2d5965587d
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Tue Sep 19 10:25:04 2023 -0400

    drm/xe/uapi: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
    
    This is used for the priority of an exec queue (not an engine) and
    should be named accordingly.
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch fac2e20c785bd790c250e4f4799dfa28e44e7082 drm-intel
ae7c9074a drm/xe: Fix array bounds check for queries
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '22504d560287', maybe rebased or not pulled?
#9: 
Fixes: 22504d560287 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
41cc245da drm/xe: Set the correct type for xe_to_user_engine_class
e86853a40 drm/xe: Correlate engine and cpu timestamps with better accuracy
69b32d157 drm/xe/uapi: Separate VM_BIND's operation and flag
cb869b1e4 drm/xe/vm: Remove VM_BIND_OP macro
d8d6edbb5 drm/xe/uapi: Remove MMIO ioctl
adf673b10 drm/xe: Fix xe_exec_queue_is_idle for parallel exec queues
7429a2715 drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE implementation
9bf5c891b drm/xe: Rename exec_queue_kill_compute to xe_vm_remove_compute_exec_queue
a08f5a873 drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
54ad84ca8 drm/xe/uapi: Use common drm_xe_ext_set_property extension
80e85c142 drm/xe: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
b7dc4c373 drm/xe/uapi: Document drm_xe_query_gt
177ec8fbb drm/xe/uapi: Replace useless 'instance' per unique gt_id
6035b1742 drm/xe/uapi: Remove unused field of drm_xe_query_gt
557eac241 drm/xe/uapi: Rename gts to gt_list
8b6a9d010 drm/xe/uapi: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY


