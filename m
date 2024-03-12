Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D13C54E58
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 04:06:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581851126B2;
	Tue, 12 Mar 2024 04:06:13 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3D41126B2;
 Tue, 12 Mar 2024 04:06:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_OA_functionality_to_X?=
 =?utf-8?q?e_=28rev12=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 12 Mar 2024 04:06:11 -0000
Message-ID: <171021637157.685601.1215710612091873344@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240312033914.2747740-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240312033914.2747740-1-ashutosh.dixit@intel.com>
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

Series: Add OA functionality to Xe (rev12)
URL   : https://patchwork.freedesktop.org/series/121084/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9bb2a8a17457065eb398a81e8fd9aec2b519fd6
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8b96d163e1ff8c2017d45f931859a90071c39889
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Mon Mar 11 20:59:18 2024 -0700

    drm/xe/oa: Enable Xe2+ overrun mode
    
    Enable Xe2+ overrun mode. For Xe2+, when overrun mode is enabled, there are
    no partial reports at the end of buffer, making the OA buffer effectively a
    non-power-of-2 size circular buffer whose size, circ_size, is a multiple of
    the report size.
    
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 61fa386186cb302cf26e29aef76d5b1a6ffe57ad drm-intel
1a30b93ca39f drm/xe/perf/uapi: "Perf" layer to support multiple perf counter stream types
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
7f618427a7b2 drm/xe/perf/uapi: Add perf_stream_paranoid sysctl
c5481b251cd4 drm/xe/oa/uapi: Add OA data formats
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
-:112: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#112: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 276 lines checked
7334915a7bd2 drm/xe/oa/uapi: Initialize OA units
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:17: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#17: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 400 lines checked
6be03abd9a1e drm/xe/oa/uapi: Add/remove OA config perf ops
5c49fc07ef49 drm/xe/oa/uapi: Define and parse OA stream properties
4a6b8b87e92a drm/xe/oa: OA stream initialization (OAG)
8c9ee9c01f2d drm/xe/oa/uapi: Expose OA stream fd
d3b1e4315099 drm/xe/oa/uapi: Read file_operation
f0f76553d222 drm/xe/oa: Add OAR support
d9d72ee0c990 drm/xe/oa: Add OAC support
fa63436325f7 drm/xe/oa/uapi: Query OA unit properties
4d02dd7f8308 drm/xe/oa/uapi: OA buffer mmap
e39bfd59afc1 drm/xe/oa: Add MMIO trigger support
da4623bd874f drm/xe/oa: Override GuC RC with OA on PVC
781bc555d886 drm/xe/oa: Changes to OA_TAKEN
8b96d163e1ff drm/xe/oa: Enable Xe2+ overrun mode


