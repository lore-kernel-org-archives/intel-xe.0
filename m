Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B0CC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 16:43:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D46210E918;
	Thu,  7 Dec 2023 16:43:00 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 54E1E10E918;
 Thu,  7 Dec 2023 16:42:58 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 51F89A7DFF;
 Thu,  7 Dec 2023 16:42:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_uAPI_Alignment_-_Document?=
 =?utf-8?q?ation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Thu, 07 Dec 2023 16:42:58 -0000
Message-ID: <170196737833.28721.14745446895363819501@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231207135009.7-1-francois.dugast@intel.com>
In-Reply-To: <20231207135009.7-1-francois.dugast@intel.com>
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

Series: uAPI Alignment - Documentation
URL   : https://patchwork.freedesktop.org/series/127495/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1dbf9b3df2d0e6a7812842d5032f936f693dd8cf
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Thu Dec 7 13:50:09 2023 +0000

    drm/xe/uapi: Move DRM_XE_ACC_GRANULARITY_* where they are used
    
    Bring those defines close to the context where they can be used. Also
    apply indentation as it is done for other subsets of defines.
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 1e3a512be7213903196b0e372d2ca5cd2c273c78 drm-intel
a1dceb851 drm/xe/uapi: Add a comment to each struct
c15b14134 drm/xe/uapi: Add missing documentation for struct members
29df7fce8 drm/xe/uapi: Document use of size in drm_xe_device_query
658b63faa drm/xe/uapi: Document drm_xe_query_config keys
fb9b3b04c drm/xe/uapi: Document DRM_XE_DEVICE_QUERY_HWCONFIG
0208ba0d4 drm/xe/uapi: Make constant comments visible in kernel doc
73a5e46a6 drm/xe/uapi: Replace BO with GEM in documentation
aa15bd949 drm/xe/uapi: Order sections
-:77: WARNING:LONG_LINE: line length of 124 exceeds 100 columns
#77: FILE: include/uapi/drm/xe_drm.h:48:
+#define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)

-:78: WARNING:LONG_LINE: line length of 120 exceeds 100 columns
#78: FILE: include/uapi/drm/xe_drm.h:49:
+#define DRM_IOCTL_XE_GEM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_CREATE, struct drm_xe_gem_create)

-:79: WARNING:LONG_LINE: line length of 130 exceeds 100 columns
#79: FILE: include/uapi/drm/xe_drm.h:50:
+#define DRM_IOCTL_XE_GEM_MMAP_OFFSET		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_MMAP_OFFSET, struct drm_xe_gem_mmap_offset)

-:80: WARNING:LONG_LINE: line length of 118 exceeds 100 columns
#80: FILE: include/uapi/drm/xe_drm.h:51:
+#define DRM_IOCTL_XE_VM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_CREATE, struct drm_xe_vm_create)

-:81: WARNING:LONG_LINE: line length of 119 exceeds 100 columns
#81: FILE: include/uapi/drm/xe_drm.h:52:
+#define DRM_IOCTL_XE_VM_DESTROY			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)

-:82: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#82: FILE: include/uapi/drm/xe_drm.h:53:
+#define DRM_IOCTL_XE_VM_BIND			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)

-:83: WARNING:LONG_LINE: line length of 134 exceeds 100 columns
#83: FILE: include/uapi/drm/xe_drm.h:54:
+#define DRM_IOCTL_XE_EXEC_QUEUE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_CREATE, struct drm_xe_exec_queue_create)

-:84: WARNING:LONG_LINE: line length of 135 exceeds 100 columns
#84: FILE: include/uapi/drm/xe_drm.h:55:
+#define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)

-:85: WARNING:LONG_LINE: line length of 145 exceeds 100 columns
#85: FILE: include/uapi/drm/xe_drm.h:56:
+#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)

-:86: WARNING:LONG_LINE: line length of 146 exceeds 100 columns
#86: FILE: include/uapi/drm/xe_drm.h:57:
+#define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)

-:87: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#87: FILE: include/uapi/drm/xe_drm.h:58:
+#define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)

-:88: WARNING:LONG_LINE: line length of 130 exceeds 100 columns
#88: FILE: include/uapi/drm/xe_drm.h:59:
+#define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)

total: 0 errors, 12 warnings, 0 checks, 310 lines checked
4994b56f0 drm/xe/uapi: More uAPI documentation additions and cosmetic updates
1d1ae8547 drm/xe/uapi: Document the memory_region bitmask
897daf31b drm/xe/uapi: Add block diagram of a device
-:41: WARNING:LONG_LINE_COMMENT: line length of 209 exceeds 100 columns
#41: FILE: include/uapi/drm/xe_drm.h:36:
+ *   ┌──────────────────────────────────────────────────────────────────┐

-:42: WARNING:LONG_LINE_COMMENT: line length of 203 exceeds 100 columns
#42: FILE: include/uapi/drm/xe_drm.h:37:
+ *   │ ┌──────────────────────────────────────────────────┐ ┌─────────┐ │

-:43: WARNING:LONG_LINE_COMMENT: line length of 163 exceeds 100 columns
#43: FILE: include/uapi/drm/xe_drm.h:38:
+ *   │ │        ┌───────────────────────┐   ┌─────┐       │ │ ┌─────┐ │ │

-:44: WARNING:LONG_LINE_COMMENT: line length of 103 exceeds 100 columns
#44: FILE: include/uapi/drm/xe_drm.h:39:
+ *   │ │        │         VRAM0         ├───┤ ... │       │ │ │VRAM1│ │ │

-:45: WARNING:LONG_LINE_COMMENT: line length of 157 exceeds 100 columns
#45: FILE: include/uapi/drm/xe_drm.h:40:
+ *   │ │        └───────────┬───────────┘   └─GT1─┘       │ │ └──┬──┘ │ │

-:46: WARNING:LONG_LINE_COMMENT: line length of 195 exceeds 100 columns
#46: FILE: include/uapi/drm/xe_drm.h:41:
+ *   │ │ ┌──────────────────┴───────────────────────────┐ │ │ ┌──┴──┐ │ │

-:47: WARNING:LONG_LINE_COMMENT: line length of 177 exceeds 100 columns
#47: FILE: include/uapi/drm/xe_drm.h:42:
+ *   │ │ │ ┌─────────────────────┐  ┌─────────────────┐ │ │ │ │     │ │ │

-:48: WARNING:LONG_LINE_COMMENT: line length of 161 exceeds 100 columns
#48: FILE: include/uapi/drm/xe_drm.h:43:
+ *   │ │ │ │ ┌──┐ ┌──┐ ┌──┐ ┌──┐ │  │ ┌─────┐ ┌─────┐ │ │ │ │ │     │ │ │

-:49: WARNING:LONG_LINE_COMMENT: line length of 125 exceeds 100 columns
#49: FILE: include/uapi/drm/xe_drm.h:44:
+ *   │ │ │ │ │EU│ │EU│ │EU│ │EU│ │  │ │RCS0 │ │BCS0 │ │ │ │ │ │     │ │ │

-:50: WARNING:LONG_LINE_COMMENT: line length of 161 exceeds 100 columns
#50: FILE: include/uapi/drm/xe_drm.h:45:
+ *   │ │ │ │ └──┘ └──┘ └──┘ └──┘ │  │ └─────┘ └─────┘ │ │ │ │ │     │ │ │

-:51: WARNING:LONG_LINE_COMMENT: line length of 161 exceeds 100 columns
#51: FILE: include/uapi/drm/xe_drm.h:46:
+ *   │ │ │ │ ┌──┐ ┌──┐ ┌──┐ ┌──┐ │  │ ┌─────┐ ┌─────┐ │ │ │ │ │     │ │ │

-:52: WARNING:LONG_LINE_COMMENT: line length of 125 exceeds 100 columns
#52: FILE: include/uapi/drm/xe_drm.h:47:
+ *   │ │ │ │ │EU│ │EU│ │EU│ │EU│ │  │ │VCS0 │ │VCS1 │ │ │ │ │ │     │ │ │

-:53: WARNING:LONG_LINE_COMMENT: line length of 161 exceeds 100 columns
#53: FILE: include/uapi/drm/xe_drm.h:48:
+ *   │ │ │ │ └──┘ └──┘ └──┘ └──┘ │  │ └─────┘ └─────┘ │ │ │ │ │     │ │ │

-:54: WARNING:LONG_LINE_COMMENT: line length of 161 exceeds 100 columns
#54: FILE: include/uapi/drm/xe_drm.h:49:
+ *   │ │ │ │ ┌──┐ ┌──┐ ┌──┐ ┌──┐ │  │ ┌─────┐ ┌─────┐ │ │ │ │ │     │ │ │

-:55: WARNING:LONG_LINE_COMMENT: line length of 125 exceeds 100 columns
#55: FILE: include/uapi/drm/xe_drm.h:50:
+ *   │ │ │ │ │EU│ │EU│ │EU│ │EU│ │  │ │VECS0│ │VECS1│ │ │ │ │ │ ... │ │ │

-:56: WARNING:LONG_LINE_COMMENT: line length of 161 exceeds 100 columns
#56: FILE: include/uapi/drm/xe_drm.h:51:
+ *   │ │ │ │ └──┘ └──┘ └──┘ └──┘ │  │ └─────┘ └─────┘ │ │ │ │ │     │ │ │

-:57: WARNING:LONG_LINE_COMMENT: line length of 161 exceeds 100 columns
#57: FILE: include/uapi/drm/xe_drm.h:52:
+ *   │ │ │ │ ┌──┐ ┌──┐ ┌──┐ ┌──┐ │  │ ┌─────┐ ┌─────┐ │ │ │ │ │     │ │ │

-:58: WARNING:LONG_LINE_COMMENT: line length of 125 exceeds 100 columns
#58: FILE: include/uapi/drm/xe_drm.h:53:
+ *   │ │ │ │ │EU│ │EU│ │EU│ │EU│ │  │ │CCS0 │ │CCS1 │ │ │ │ │ │     │ │ │

-:59: WARNING:LONG_LINE_COMMENT: line length of 161 exceeds 100 columns
#59: FILE: include/uapi/drm/xe_drm.h:54:
+ *   │ │ │ │ └──┘ └──┘ └──┘ └──┘ │  │ └─────┘ └─────┘ │ │ │ │ │     │ │ │

-:60: WARNING:LONG_LINE_COMMENT: line length of 165 exceeds 100 columns
#60: FILE: include/uapi/drm/xe_drm.h:55:
+ *   │ │ │ └─────────DSS─────────┘  │ ┌─────┐ ┌─────┐ │ │ │ │ │     │ │ │

-:61: WARNING:LONG_LINE_COMMENT: line length of 105 exceeds 100 columns
#61: FILE: include/uapi/drm/xe_drm.h:56:
+ *   │ │ │                          │ │CCS2 │ │CCS3 │ │ │ │ │ │     │ │ │

-:62: WARNING:LONG_LINE_COMMENT: line length of 167 exceeds 100 columns
#62: FILE: include/uapi/drm/xe_drm.h:57:
+ *   │ │ │ ┌─────┐ ┌─────┐ ┌─────┐  │ └─────┘ └─────┘ │ │ │ │ │     │ │ │

-:63: WARNING:LONG_LINE_COMMENT: line length of 109 exceeds 100 columns
#63: FILE: include/uapi/drm/xe_drm.h:58:
+ *   │ │ │ │ ... │ │ ... │ │ ... │  │                 │ │ │ │ │     │ │ │

-:64: WARNING:LONG_LINE_COMMENT: line length of 141 exceeds 100 columns
#64: FILE: include/uapi/drm/xe_drm.h:59:
+ *   │ │ │ └─DSS─┘ └─DSS─┘ └─DSS─┘  └─────Engines─────┘ │ │ │ │     │ │ │

-:65: WARNING:LONG_LINE_COMMENT: line length of 183 exceeds 100 columns
#65: FILE: include/uapi/drm/xe_drm.h:60:
+ *   │ │ └───────────────────────────GT0────────────────┘ │ │ └─GT2─┘ │ │

-:66: WARNING:LONG_LINE_COMMENT: line length of 181 exceeds 100 columns
#66: FILE: include/uapi/drm/xe_drm.h:61:
+ *   │ └────────────────────────────Tile0─────────────────┘ └─ Tile1──┘ │

-:67: WARNING:LONG_LINE_COMMENT: line length of 195 exceeds 100 columns
#67: FILE: include/uapi/drm/xe_drm.h:62:
+ *   └─────────────────────────────Device0───────┬──────────────────────┘

-:69: WARNING:LONG_LINE_COMMENT: line length of 136 exceeds 100 columns
#69: FILE: include/uapi/drm/xe_drm.h:64:
+ *                        ───────────────────────┴────────── PCI bus

total: 0 errors, 28 warnings, 0 checks, 45 lines checked
108f6ab10 drm/xe/uapi: Add examples of user space code
03b908af4 drm/xe/uapi: Move CPU_CACHING defines before doc
1dbf9b3df drm/xe/uapi: Move DRM_XE_ACC_GRANULARITY_* where they are used


