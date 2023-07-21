Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDD4EB64DA
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 00:32:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD0310E154;
	Fri, 21 Jul 2023 00:32:49 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1DA5110E154;
 Fri, 21 Jul 2023 00:32:48 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1BA5EAADE0;
 Fri, 21 Jul 2023 00:32:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Date: Fri, 21 Jul 2023 00:32:48 -0000
Message-ID: <168989956810.22548.14026386856497464154@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230721003006.3467377-1-ashutosh.dixit@intel.com>
In-Reply-To: <20230721003006.3467377-1-ashutosh.dixit@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ad?=
 =?utf-8?q?d_OA_functionality_to_Xe?=
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

Series: Add OA functionality to Xe
URL   : https://patchwork.freedesktop.org/series/121084/
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
commit 2b56bab7e6fb9bf90a8b6d50bbdb3e34468ed96a
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Thu Jul 20 17:30:06 2023 -0700

    drm/xe/oa: Implement queries
    
    Implement queries to query OA unit ID's for HW engines, OA timestamp freq
    and OA ioctl version.
    
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 9cca38d116f01ccc2589c376d1b842e3240e7584 drm-intel
7d8cb0b54 drm/xe/oa: Introduce OA uapi
-:35: WARNING:LONG_LINE: line length of 119 exceeds 100 columns
#35: FILE: include/uapi/drm/xe_drm.h:123:
+#define DRM_IOCTL_XE_OA_OPEN			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_OPEN, struct drm_xe_oa_open_param)

-:36: WARNING:LONG_LINE: line length of 121 exceeds 100 columns
#36: FILE: include/uapi/drm/xe_drm.h:124:
+#define DRM_IOCTL_XE_OA_ADD_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_ADD_CONFIG, struct drm_xe_oa_config)

-:37: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#37: FILE: include/uapi/drm/xe_drm.h:125:
+#define DRM_IOCTL_XE_OA_REMOVE_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_REMOVE_CONFIG, __u64)

total: 0 errors, 3 warnings, 0 checks, 293 lines checked
1bc2e5f13 drm/xe/oa: Add OA types
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:14: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#14: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 292 lines checked
f799bb90a drm/xe/oa: Add registers and GPU commands used by OA
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:98: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#98: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 244 lines checked
4cee7e0b4 drm/xe/oa: Module init/exit and probe/remove
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:156: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#156: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 431 lines checked
7f3ef9efe drm/xe/oa: Add/remove config ioctl's
9807c34c3 drm/xe/oa: Start implementing OA stream open ioctl
323253076 drm/xe/oa: OA stream initialization
82bf33f8d drm/xe/oa: Expose OA stream fd
0ab90771b drm/xe/oa: Read file_operation
2b56bab7e drm/xe/oa: Implement queries


