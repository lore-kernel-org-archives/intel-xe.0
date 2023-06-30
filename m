Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2EFEB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jun 2023 10:03:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9D210E14A;
	Fri, 30 Jun 2023 10:03:49 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6634C10E14A;
 Fri, 30 Jun 2023 10:03:47 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5CBBDA47E9;
 Fri, 30 Jun 2023 10:03:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Fri, 30 Jun 2023 10:03:47 -0000
Message-ID: <168811942737.24873.13514280498407741931@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230630100059.122881-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230630100059.122881-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_uapi_review_submission?=
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

Series: drm/xe: uapi review submission
URL   : https://patchwork.freedesktop.org/series/120052/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ba42ad11f23b9954d8904c5ee28285c74d492a93
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Fri Jun 30 12:00:59 2023 +0200

    drm/xe: uapi review submission
    
    Add a copy of xe_drm.h for uAPI review purposes only. Never commit this,
    the intention is to perform an uAPI review in this thread and if needed
    move it to Gitlab for easier discussion.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch d835d7f04101ccffa1978e3144b930bfe2af5eda drm-intel
ba42ad11f drm/xe: uapi review submission
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

-:126: WARNING:LONG_LINE: line length of 124 exceeds 100 columns
#126: FILE: include/uapi/drm/xe_drm_reviewonly.h:106:
+#define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)

-:127: WARNING:LONG_LINE: line length of 120 exceeds 100 columns
#127: FILE: include/uapi/drm/xe_drm_reviewonly.h:107:
+#define DRM_IOCTL_XE_GEM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_CREATE, struct drm_xe_gem_create)

-:128: WARNING:LONG_LINE: line length of 130 exceeds 100 columns
#128: FILE: include/uapi/drm/xe_drm_reviewonly.h:108:
+#define DRM_IOCTL_XE_GEM_MMAP_OFFSET		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_GEM_MMAP_OFFSET, struct drm_xe_gem_mmap_offset)

-:129: WARNING:LONG_LINE: line length of 118 exceeds 100 columns
#129: FILE: include/uapi/drm/xe_drm_reviewonly.h:109:
+#define DRM_IOCTL_XE_VM_CREATE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_CREATE, struct drm_xe_vm_create)

-:130: WARNING:LONG_LINE: line length of 120 exceeds 100 columns
#130: FILE: include/uapi/drm/xe_drm_reviewonly.h:110:
+#define DRM_IOCTL_XE_VM_DESTROY			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_DESTROY, struct drm_xe_vm_destroy)

-:131: WARNING:LONG_LINE: line length of 114 exceeds 100 columns
#131: FILE: include/uapi/drm/xe_drm_reviewonly.h:111:
+#define DRM_IOCTL_XE_VM_BIND			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)

-:132: WARNING:LONG_LINE: line length of 126 exceeds 100 columns
#132: FILE: include/uapi/drm/xe_drm_reviewonly.h:112:
+#define DRM_IOCTL_XE_ENGINE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_ENGINE_CREATE, struct drm_xe_engine_create)

-:133: WARNING:LONG_LINE: line length of 138 exceeds 100 columns
#133: FILE: include/uapi/drm/xe_drm_reviewonly.h:113:
+#define DRM_IOCTL_XE_ENGINE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_ENGINE_GET_PROPERTY, struct drm_xe_engine_get_property)

-:134: WARNING:LONG_LINE: line length of 128 exceeds 100 columns
#134: FILE: include/uapi/drm/xe_drm_reviewonly.h:114:
+#define DRM_IOCTL_XE_ENGINE_DESTROY		 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_ENGINE_DESTROY, struct drm_xe_engine_destroy)

-:135: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#135: FILE: include/uapi/drm/xe_drm_reviewonly.h:115:
+#define DRM_IOCTL_XE_EXEC			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)

-:136: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#136: FILE: include/uapi/drm/xe_drm_reviewonly.h:116:
+#define DRM_IOCTL_XE_MMIO			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MMIO, struct drm_xe_mmio)

-:137: WARNING:LONG_LINE: line length of 138 exceeds 100 columns
#137: FILE: include/uapi/drm/xe_drm_reviewonly.h:117:
+#define DRM_IOCTL_XE_ENGINE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_ENGINE_SET_PROPERTY, struct drm_xe_engine_set_property)

-:138: WARNING:LONG_LINE: line length of 130 exceeds 100 columns
#138: FILE: include/uapi/drm/xe_drm_reviewonly.h:118:
+#define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)

-:139: WARNING:LONG_LINE: line length of 120 exceeds 100 columns
#139: FILE: include/uapi/drm/xe_drm_reviewonly.h:119:
+#define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)

-:280: WARNING:LONG_LINE_COMMENT: line length of 103 exceeds 100 columns
#280: FILE: include/uapi/drm/xe_drm_reviewonly.h:260:
+		__u64 native_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */

-:281: WARNING:LONG_LINE_COMMENT: line length of 103 exceeds 100 columns
#281: FILE: include/uapi/drm/xe_drm_reviewonly.h:261:
+		__u64 slow_mem_regions;		/* bit mask of instances from drm_xe_query_mem_usage */

-:282: WARNING:LONG_LINE_COMMENT: line length of 103 exceeds 100 columns
#282: FILE: include/uapi/drm/xe_drm_reviewonly.h:262:
+		__u64 inaccessible_mem_regions;	/* bit mask of instances from drm_xe_query_mem_usage */

-:458: WARNING:TYPO_SPELLING: 'occured' may be misspelled - perhaps 'occurred'?
#458: FILE: include/uapi/drm/xe_drm_reviewonly.h:438:
+	/** @error: errno that occured */
 	                       ^^^^^^^

total: 0 errors, 19 warnings, 0 checks, 1009 lines checked


