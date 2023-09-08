Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39B0EE57C1
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 04:27:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E60B10E85F;
	Fri,  8 Sep 2023 04:27:10 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A56D910E85F;
 Fri,  8 Sep 2023 04:27:08 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A2709AADDC;
 Fri,  8 Sep 2023 04:27:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Date: Fri, 08 Sep 2023 04:27:08 -0000
Message-ID: <169414722866.14898.2542453387983251763@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
In-Reply-To: <20230908042348.1592535-1-ashutosh.dixit@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ad?=
 =?utf-8?q?d_OA_functionality_to_Xe_=28rev5=29?=
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

Series: Add OA functionality to Xe (rev5)
URL   : https://patchwork.freedesktop.org/series/121084/
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
commit 0f7103571a0598f681112637fc21caddb2a80591
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Thu Sep 7 21:23:48 2023 -0700

    drm/xe/oa: Remove filtering reports on context id
    
    At present XE OA code does not obtain context id's from GuC. Even if these
    context id's were available it is not clear if included reports for
    userspace should be filtered on context id's. Till these issues are
    resolved remove filtering reports based on context id's.
    
    Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 758f01ec2a6774fda1e8f8075d31f42b81783caf drm-intel
e83cb40b1 drm/xe/oa: Introduce OA (observability architecture) uapi
-:38: WARNING:LONG_LINE: line length of 119 exceeds 100 columns
#38: FILE: include/uapi/drm/xe_drm.h:133:
+#define DRM_IOCTL_XE_OA_OPEN			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_OPEN, struct drm_xe_oa_open_param)

-:39: WARNING:LONG_LINE: line length of 121 exceeds 100 columns
#39: FILE: include/uapi/drm/xe_drm.h:134:
+#define DRM_IOCTL_XE_OA_ADD_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_ADD_CONFIG, struct drm_xe_oa_config)

-:40: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#40: FILE: include/uapi/drm/xe_drm.h:135:
+#define DRM_IOCTL_XE_OA_REMOVE_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OA_REMOVE_CONFIG, __u64)

total: 0 errors, 3 warnings, 0 checks, 291 lines checked
5cac956ec drm/xe/oa: Add OA types
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:17: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#17: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 295 lines checked
e076446b0 drm/xe/oa: Add registers and GPU commands used by OA
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:74: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#74: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 219 lines checked
7aca78b27 drm/xe/oa: Module init/exit and probe/remove
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
812620616 drm/xe/oa: Add/remove config ioctl's
4ed5ef4c7 drm/xe/oa: Start implementing OA stream open ioctl
a08dfe997 drm/xe/oa: OA stream initialization
ba7d8be50 drm/xe/oa: Expose OA stream fd
720477b25 drm/xe/oa: Read file_operation
29107a2b2 drm/xe/oa: Implement queries
f24133378 drm/xe/oa: Override GuC RC with OA on PVC
e0853fcf9 drm/xe/perf: "Perf" layer to support multiple perf counter stream types
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:181: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#181: 
new file mode 100644

-:286: WARNING:LONG_LINE: line length of 118 exceeds 100 columns
#286: FILE: include/uapi/drm/xe_drm.h:133:
+#define DRM_IOCTL_XE_PERF_OPEN			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF_OPEN, struct drm_xe_perf_param)

-:287: WARNING:LONG_LINE: line length of 124 exceeds 100 columns
#287: FILE: include/uapi/drm/xe_drm.h:134:
+#define DRM_IOCTL_XE_PERF_ADD_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF_ADD_CONFIG, struct drm_xe_perf_param)

-:288: WARNING:LONG_LINE: line length of 127 exceeds 100 columns
#288: FILE: include/uapi/drm/xe_drm.h:135:
+#define DRM_IOCTL_XE_PERF_REMOVE_CONFIG		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF_REMOVE_CONFIG, struct drm_xe_perf_param)

total: 0 errors, 4 warnings, 0 checks, 289 lines checked
210d63ca1 drm/xe/oa: Multiplex PERF ops through a single PERF ioctl
-:124: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#124: FILE: include/uapi/drm/xe_drm.h:131:
+#define DRM_IOCTL_XE_PERF			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF, struct drm_xe_perf_param)

total: 0 errors, 1 warnings, 0 checks, 112 lines checked
ffc2c6e67 drm/xe/oa: Simplify OA configs in uapi
99e9e4892 drm/xe/oa: Remove OA format names from OA uapi
a1b9e76d8 drm/xe/oa: Make xe_oa_timestamp_frequency per gt
0f7103571 drm/xe/oa: Remove filtering reports on context id


