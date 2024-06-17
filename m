Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A91C27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 22:42:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3576910E506;
	Mon, 17 Jun 2024 22:42:52 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D15610E506;
 Mon, 17 Jun 2024 22:42:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_OA_functionality_to_X?=
 =?utf-8?q?e_=28rev18=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 17 Jun 2024 22:42:51 -0000
Message-ID: <171866417111.99140.17958866918827844766@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240617223651.3220399-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240617223651.3220399-1-ashutosh.dixit@intel.com>
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

Series: Add OA functionality to Xe (rev18)
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
commit 7ef80d815b7c21004158f6786447eaf55fb95620
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Mon Jun 17 15:36:51 2024 -0700

    drm/xe/oa: Enable Xe2+ overrun mode
    
    Enable Xe2+ overrun mode. For Xe2+, when overrun mode is enabled, there are
    no partial reports at the end of buffer, making the OA buffer effectively a
    non-power-of-2 size circular buffer whose size, circ_size, is a multiple of
    the report size.
    
    v2: Fix implementation of xe_oa_circ_diff/xe_oa_circ_incr (Umesh)
    
    Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 7f26b37f8cb73f5cf2251d7fff5b55240e04f153 drm-intel
3b4f594ae35a drm/xe/perf/uapi: "Perf" layer to support multiple perf counter stream types
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:71: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#71: 
new file mode 100644

-:155: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#155: FILE: include/uapi/drm/xe_drm.h:119:
+#define DRM_IOCTL_XE_PERF			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF, struct drm_xe_perf_param)

total: 0 errors, 2 warnings, 0 checks, 159 lines checked
b6978a78c811 drm/xe/perf/uapi: Add perf_stream_paranoid sysctl
f46005053745 drm/xe/oa/uapi: Add OA data formats
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
-:98: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#98: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 290 lines checked
9bfee685c862 drm/xe/oa/uapi: Initialize OA units
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:21: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#21: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 403 lines checked
3971981b1dc3 drm/xe/oa/uapi: Add/remove OA config perf ops
258bca64dc5c drm/xe/oa/uapi: Define and parse OA stream properties
4a256e04f049 drm/xe/oa: OA stream initialization (OAG)
58ecd13fce0b drm/xe/oa/uapi: Expose OA stream fd
f922ade1f857 drm/xe/oa/uapi: Read file_operation
1e3dd45656d7 drm/xe/oa: Add OAR support
9e260ba4566a drm/xe/oa: Add OAC support
5390284fc10a drm/xe/oa/uapi: Query OA unit properties
54182e8d0477 drm/xe/oa/uapi: OA buffer mmap
84e26f67f6e6 drm/xe/oa: Add MMIO trigger support
65857bcce23e drm/xe/oa: Override GuC RC with OA on PVC
5035bea0852b drm/xe/oa: Changes to OA_TAKEN
7ef80d815b7c drm/xe/oa: Enable Xe2+ overrun mode


