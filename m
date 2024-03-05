Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB4BC54798
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 06:15:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF89E112880;
	Tue,  5 Mar 2024 06:15:00 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78947112880;
 Tue,  5 Mar 2024 06:14:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_OA_functionality_to_X?=
 =?utf-8?q?e_=28rev11=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Mar 2024 06:14:59 -0000
Message-ID: <170961929948.503981.17616006604456953811@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240305053300.2406240-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240305053300.2406240-1-ashutosh.dixit@intel.com>
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

Series: Add OA functionality to Xe (rev11)
URL   : https://patchwork.freedesktop.org/series/121084/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
4dc7d0cc630cdd9ac56065b1a22afc329345a519
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7c351ad16956d599964ec698ef7413ea6843b0aa
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Mon Mar 4 21:33:00 2024 -0800

    drm/xe/oa: Override GuC RC with OA on PVC
    
    On PVC, a w/a resets RCS/CCS before it goes into RC6. This breaks OA since
    OA does not expect engine resets during its use. Fix it by disabling RC6.
    
    Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch e90b5046fce6ed727427eec0d52e4f9626609ed0 drm-intel
22d0baf12033 drm/xe/perf/uapi: "Perf" layer to support multiple perf counter stream types
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
0a92c73b4036 drm/xe/perf/uapi: Add perf_stream_paranoid sysctl
f5dc8fee3764 drm/xe/oa/uapi: Add OA data formats
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
66f7d07d267b drm/xe/oa/uapi: Initialize OA units
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:17: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#17: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 400 lines checked
238deeb19369 drm/xe/oa/uapi: Add/remove OA config perf ops
aa6ee27d27d5 drm/xe/oa/uapi: Define and parse OA stream properties
dcbb9710cc00 drm/xe/oa: OA stream initialization (OAG)
4f869105768c drm/xe/oa/uapi: Expose OA stream fd
e8dccfb47ac5 drm/xe/oa/uapi: Read file_operation
dc6802b2d5c6 drm/xe/oa: Disable overrun mode for Xe2+ OAG
6d0ee13eeb8a drm/xe/oa: Add OAR support
003f791d9285 drm/xe/oa: Add OAC support
8017438eb0e3 drm/xe/oa/uapi: Query OA unit properties
c25adc179842 drm/xe/oa/uapi: OA buffer mmap
18b2b95cc2a1 drm/xe/oa: Add MMIO trigger support
7c351ad16956 drm/xe/oa: Override GuC RC with OA on PVC


