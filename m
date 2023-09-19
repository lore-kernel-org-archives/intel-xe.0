Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DA1CE79A9
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 16:19:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E550C10E143;
	Tue, 19 Sep 2023 16:19:55 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6774C10E143;
 Tue, 19 Sep 2023 16:19:54 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 65665AADF3;
 Tue, 19 Sep 2023 16:19:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Date: Tue, 19 Sep 2023 16:19:54 -0000
Message-ID: <169514039441.3668.1421741246808193971@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
In-Reply-To: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ad?=
 =?utf-8?q?d_OA_functionality_to_Xe_=28rev6=29?=
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

Series: Add OA functionality to Xe (rev6)
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
commit 91586655208548314519f3e7cb8aa67226ed179c
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Tue Sep 19 09:10:49 2023 -0700

    drm/xe/uapi: Convert OA property key/value pairs to a struct
    
    Change OA uapi to take a param struct rather than property key value
    pairs. A param struct is simpler and param structs can be extenended in the
    future using xe_user_extension so there seems to be no reason to use
    property key value pairs.
    
    Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch fac2e20c785bd790c250e4f4799dfa28e44e7082 drm-intel
d26d60548 drm/xe/uapi: Introduce OA (observability architecture) uapi
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
a75037184 drm/xe/oa: Add OA types
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:17: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#17: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 295 lines checked
e003a1a12 drm/xe/oa: Add registers and GPU commands used by OA
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:74: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#74: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 219 lines checked
fb603a692 drm/xe/oa: Module init/exit and probe/remove
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

total: 0 errors, 1 warnings, 0 checks, 430 lines checked
07959d2ac drm/xe/oa: Add/remove config ioctl's
9d835612f drm/xe/oa: Start implementing OA stream open ioctl
16aba32a9 drm/xe/oa: OA stream initialization
779cd1d01 drm/xe/oa: Expose OA stream fd
724ef3c8a drm/xe/oa: Read file_operation
28086b4b9 drm/xe/oa: Implement queries
b725b4c7e drm/xe/oa: Override GuC RC with OA on PVC
091754c18 drm/xe/uapi: "Perf" layer to support multiple perf counter stream types
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
608a27016 drm/xe/uapi: Multiplex PERF ops through a single PERF ioctl
-:124: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#124: FILE: include/uapi/drm/xe_drm.h:131:
+#define DRM_IOCTL_XE_PERF			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF, struct drm_xe_perf_param)

total: 0 errors, 1 warnings, 0 checks, 112 lines checked
ac80af02e drm/xe/uapi: Simplify OA configs in uapi
53b7fa776 drm/xe/uapi: Remove OA format names from OA uapi
0904e0bef drm/xe/oa: Make xe_oa_timestamp_frequency per gt
fd2e16bcb drm/xe/oa: Remove filtering reports on context id
8516dd55c drm/xe/uapi: More OA uapi fixes/additions
5a9b1d54b drm/xe/uapi: Drop OA_IOCTL_VERSION
28114c1e1 drm/xe/uapi: Use OA unit id to identify OA unit
915866552 drm/xe/uapi: Convert OA property key/value pairs to a struct


