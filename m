Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D854C25B75
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 01:49:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39AD510F780;
	Mon, 27 May 2024 01:49:57 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F4F10F780;
 Mon, 27 May 2024 01:49:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_OA_functionality_to_X?=
 =?utf-8?q?e_=28rev15=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 May 2024 01:49:54 -0000
Message-ID: <171677459422.2210639.5388698835652202876@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240527014333.603914-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240527014333.603914-1-ashutosh.dixit@intel.com>
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

Series: Add OA functionality to Xe (rev15)
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
commit a1db6c824226347d6ef7708549dd3dfdf09fa1c5
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Sun May 26 18:43:33 2024 -0700

    drm/xe/oa: Enable Xe2+ overrun mode
    
    Enable Xe2+ overrun mode. For Xe2+, when overrun mode is enabled, there are
    no partial reports at the end of buffer, making the OA buffer effectively a
    non-power-of-2 size circular buffer whose size, circ_size, is a multiple of
    the report size.
    
    v2: Fix implementation of xe_oa_circ_diff/xe_oa_circ_incr (Umesh)
    
    Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 573842e9ab57ccd8d6bb68ad55ed2e012e3d5d2f drm-intel
57855ae37bb6 drm/xe/perf/uapi: "Perf" layer to support multiple perf counter stream types
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:65: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#65: 
new file mode 100644

-:130: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#130: FILE: include/uapi/drm/xe_drm.h:118:
+#define DRM_IOCTL_XE_PERF			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF, struct drm_xe_perf_param)

total: 0 errors, 2 warnings, 0 checks, 139 lines checked
41ceeeb9c633 drm/xe/perf/uapi: Add perf_stream_paranoid sysctl
700084747817 drm/xe/oa/uapi: Add OA data formats
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
-:113: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#113: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 279 lines checked
49371c9625da drm/xe/oa/uapi: Initialize OA units
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 406 lines checked
669c40afead8 drm/xe/oa/uapi: Add/remove OA config perf ops
39a22a7a1983 drm/xe/oa/uapi: Define and parse OA stream properties
b35a33907a12 drm/xe/oa: OA stream initialization (OAG)
986f875888ad drm/xe/oa/uapi: Expose OA stream fd
d61b58974d15 drm/xe/oa/uapi: Read file_operation
095516e04672 drm/xe/oa: Add OAR support
0965e23fcb82 drm/xe/oa: Add OAC support
016d8fdb4530 drm/xe/oa/uapi: Query OA unit properties
c5338b2675ad drm/xe/oa/uapi: OA buffer mmap
81d3e3804895 drm/xe/oa: Add MMIO trigger support
82630c066c2d drm/xe/oa: Override GuC RC with OA on PVC
bbcc7ef42d36 drm/xe/oa: Changes to OA_TAKEN
a1db6c824226 drm/xe/oa: Enable Xe2+ overrun mode


