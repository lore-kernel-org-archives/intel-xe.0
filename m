Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF953606A319
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 04:24:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFAE10E4C5;
	Fri, 23 Oct 2026 04:24:44 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E436F10E4C5;
 Fri, 23 Oct 2026 04:24:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_CPER_logging_support_?=
 =?utf-8?q?for_CRI_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Oct 2026 04:24:43 -0000
Message-ID: <179272948392.59729.13489451727112944075@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261023043422.681260-15-badal.nilawar@intel.com>
In-Reply-To: <20261023043422.681260-15-badal.nilawar@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: Add CPER logging support for CRI (rev5)
URL   : https://patchwork.freedesktop.org/series/169692/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8fc148746b056924861ffa8fb544607761544555
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Fri Oct 23 10:04:35 2026 +0530

    drm/xe/cper: Prepare Intel CPER info records
    
    Prepare xe_cper_intel_info records from RAS info queue data. Depending
    on the error class type, detail or aggregate, one or more info records
    may be generated and embedded in the CPER record.
    
    Assisted-by: LLM
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 55c6bb0b4d006ee415abe9f048014f7bcc90ae6f drm-intel
a08e56366500 drm/xe/cper: Add CPER reporting entry point for xe_log
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 99 lines checked
a467793412c0 drm/xe/cper: Retrieve the error counter record for CPER reporting
dbb96b6ea55f drm/xe/cper: Initialize Intel-specific section header
-:95: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#95: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 127 lines checked
87c8b6f7828b drm/xe/cper: Construct CPER record for hardware errors
a443be8b82e9 drm/xe/cper: Log CPER records for aggregate counter retrieval
-:13: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#13: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 266 lines checked
f90c838af9a7 drm/xe/cper: Emit cper record to trace buf
-:69: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#69: 
new file mode 100644

-:116: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#116: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:28:
+	    TP_STRUCT__entry(

-:126: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#126: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:38:
+	    TP_fast_assign(

-:151: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#151: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:63:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                              ^

-:151: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#151: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:63:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                 ^

-:151: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#151: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:63:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                         ^

-:151: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#151: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:63:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                             ^

-:151: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#151: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:63:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                                 ^

total: 0 errors, 1 warnings, 7 checks, 116 lines checked
a61f5eedf180 drm/xe/xe_ras: Report device memory errors using SIGID
fde5658527cb drm/xe/xe_ras: Report core compute errors using SIGID
b1849d585a94 drm/xe/xe_ras: Report soc internal errors using SIGID
6fe21ac0d813 drm/xe/xe_ras: Report correctable errors using SIGID
581f6201f446 drm/xe/xe_ras: Report unknown errors using SIGID
7c1ffae6c25d drm/xe/xe_ras: Add support to retrieve info queue data
8fc148746b05 drm/xe/cper: Prepare Intel CPER info records


