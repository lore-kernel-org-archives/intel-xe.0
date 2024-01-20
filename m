Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E83CC4725D
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jan 2024 02:04:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E4C10EAEC;
	Sat, 20 Jan 2024 02:04:54 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F7C10EAEF;
 Sat, 20 Jan 2024 02:04:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_OA_functionality_to_X?=
 =?utf-8?q?e_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Date: Sat, 20 Jan 2024 02:04:52 -0000
Message-ID: <170571629287.593850.16841656305604477320@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240120020026.1261201-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240120020026.1261201-1-ashutosh.dixit@intel.com>
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

Series: Add OA functionality to Xe (rev8)
URL   : https://patchwork.freedesktop.org/series/121084/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d55eb275b96630e7492f3ef02a4e4ebf45411ba5
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Fri Jan 19 18:00:26 2024 -0800

    drm/xe/oa: Override GuC RC with OA on PVC
    
    On PVC, a w/a resets RCS/CCS before it goes into RC6. This breaks OA since
    OA does not expect engine resets during its use. Fix it by disabling RC6.
    
    Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch b239ffd479309ebbf0bd530ef632c8ef3ee78d7a drm-intel
089be28f5 drm/xe/perf/uapi: "Perf" layer to support multiple perf counter stream types
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:64: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#64: 
new file mode 100644

-:129: WARNING:LONG_LINE: line length of 113 exceeds 100 columns
#129: FILE: include/uapi/drm/xe_drm.h:118:
+#define DRM_IOCTL_XE_PERF			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF, struct drm_xe_perf_param)

total: 0 errors, 2 warnings, 0 checks, 135 lines checked
2f8216741 drm/xe/perf/uapi: Add perf_stream_paranoid sysctl
e3ed92942 drm/xe/oa/uapi: Add OA data formats
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
-:111: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#111: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 290 lines checked
065ecde94 drm/xe/oa/uapi: Initialize OA units
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:17: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#17: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 396 lines checked
83967a5a1 drm/xe/oa/uapi: Add/remove OA config perf ops
ea280dd00 drm/xe/oa/uapi: Define and parse OA stream properties
483c69024 drm/xe/oa: OA stream initialization (OAG)
240894e65 drm/xe/oa/uapi: Expose OA stream fd
69ec8bb50 drm/xe/oa/uapi: Read file_operation
2362a3283 drm/xe/oa: Disable overrun mode for Xe2+ OAG
4271f2666 drm/xe/oa: Add OAR support
bcb9e25ff drm/xe/oa: Add OAC support
191c55f0d drm/xe/oa/uapi: Query OA unit properties
a8a3b386f drm/xe/oa/uapi: OA buffer mmap
3ecf907a5 drm/xe/oa: Add MMIO trigger support
d55eb275b drm/xe/oa: Override GuC RC with OA on PVC


