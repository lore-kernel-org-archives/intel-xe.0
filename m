Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C5AC4332F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 16:06:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A327310E117;
	Fri, 10 Nov 2023 16:06:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5E8A810E117;
 Fri, 10 Nov 2023 16:06:39 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5CE0FA0078;
 Fri, 10 Nov 2023 16:06:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Fri, 10 Nov 2023 16:06:39 -0000
Message-ID: <169963239937.31676.12753131249568067991@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231110154156.6-1-francois.dugast@intel.com>
In-Reply-To: <20231110154156.6-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_uA?=
 =?utf-8?q?PI_Alignment_-_Remove_unused_features?=
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

Series: uAPI Alignment - Remove unused features
URL   : https://patchwork.freedesktop.org/series/126278/
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
commit 09afb11a3dd7fe719638b6e3ea4ad0e21b9295c2
Author: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Date:   Fri Nov 10 15:41:56 2023 +0000

    drm/xe/pmu: Drop interrupt pmu event
    
    Drop interrupt event from PMU as that is not useful and not being used
    by any UMD.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
    Cc: Francois Dugast <francois.dugast@intel.com>
    Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
    Reviewed-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch b3890fb4386dcef68a96888141c4cc773f6241ce drm-intel
bc373128c drm/xe/uapi: Remove useless XE_QUERY_CONFIG_NUM_PARAM
b72cdce22 drm/xe/uapi: Remove GT_TYPE_REMOTE
264954b8c drm/xe/uapi: Kill VM_MADVISE IOCTL
-:96: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#96: 
deleted file mode 100644

-:450: WARNING:LONG_LINE: line length of 119 exceeds 100 columns
#450: FILE: include/uapi/drm/xe_drm.h:118:
+#define DRM_IOCTL_XE_VM_DESTROY			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)

-:451: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#451: FILE: include/uapi/drm/xe_drm.h:119:
+#define DRM_IOCTL_XE_VM_BIND			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)

-:452: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#452: FILE: include/uapi/drm/xe_drm.h:120:
+#define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)

-:454: WARNING:LONG_LINE: line length of 135 exceeds 100 columns
#454: FILE: include/uapi/drm/xe_drm.h:122:
+#define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)

-:455: WARNING:LONG_LINE: line length of 145 exceeds 100 columns
#455: FILE: include/uapi/drm/xe_drm.h:123:
+#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)

total: 0 errors, 6 warnings, 0 checks, 165 lines checked
ae239f106 drm/xe/uapi: Remove unused inaccessible memory region
f964ea30f drm/xe/uapi: Remove unused QUERY_CONFIG_MEM_REGION_COUNT
81550e34a drm/xe/uapi: Remove unused QUERY_CONFIG_GT_COUNT
09afb11a3 drm/xe/pmu: Drop interrupt pmu event


