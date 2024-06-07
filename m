Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E423C27C55
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 21:38:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B44010ED27;
	Fri,  7 Jun 2024 21:38:04 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED6A10ED1C;
 Fri,  7 Jun 2024 21:38:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_OA_functionality_to_X?=
 =?utf-8?q?e_=28rev16=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Jun 2024 21:38:03 -0000
Message-ID: <171779628371.28455.16683999274742913074@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240607204322.1966831-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240607204322.1966831-1-ashutosh.dixit@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Add OA functionality to Xe (rev16)
URL   : https://patchwork.freedesktop.org/series/121084/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0f67916d4695a008ee3b45c8bd3cea069ca040dd
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Fri Jun 7 13:43:22 2024 -0700

    drm/xe/oa: Enable Xe2+ overrun mode
    
    Enable Xe2+ overrun mode. For Xe2+, when overrun mode is enabled, there are
    no partial reports at the end of buffer, making the OA buffer effectively a
    non-power-of-2 size circular buffer whose size, circ_size, is a multiple of
    the report size.
    
    v2: Fix implementation of xe_oa_circ_diff/xe_oa_circ_incr (Umesh)
    
    Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 2bea08bd31298d60d416b2a6ed346bb53dd28037 drm-intel
09a4e8699b3b drm/xe/perf/uapi: "Perf" layer to support multiple perf counter stream types
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:69: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#69: 
new file mode 100644

-:134: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#134: FILE: include/uapi/drm/xe_drm.h:118:
+#define DRM_IOCTL_XE_PERF			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF, struct drm_xe_perf_param)

total: 0 errors, 2 warnings, 0 checks, 139 lines checked
3a6cc3660b8c drm/xe/perf/uapi: Add perf_stream_paranoid sysctl
ea2241e06c26 drm/xe/oa/uapi: Add OA data formats
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:116: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#116: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 278 lines checked
a36c4df24b83 drm/xe/oa/uapi: Initialize OA units
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:20: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#20: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 406 lines checked
84f1d60e4087 drm/xe/oa/uapi: Add/remove OA config perf ops
-:40: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#40: FILE: drivers/gpu/drm/xe/xe_device.c:713:
 {
+

total: 0 errors, 0 warnings, 1 checks, 562 lines checked
c052425b670b drm/xe/oa/uapi: Define and parse OA stream properties
cd30ab1ca07a drm/xe/oa: OA stream initialization (OAG)
3bd9f5722a61 drm/xe/oa/uapi: Expose OA stream fd
be4fefca5ec1 drm/xe/oa/uapi: Read file_operation
bdbc369923aa drm/xe/oa: Add OAR support
654501029867 drm/xe/oa: Add OAC support
8b7952b197f0 drm/xe/oa/uapi: Query OA unit properties
2d35d48c7dd4 drm/xe/oa/uapi: OA buffer mmap
01f7421a4915 drm/xe/oa: Add MMIO trigger support
f29daebd2329 drm/xe/oa: Override GuC RC with OA on PVC
6c50116b54c3 drm/xe/oa: Changes to OA_TAKEN
0f67916d4695 drm/xe/oa: Enable Xe2+ overrun mode


