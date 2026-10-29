Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB495606A333
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 13:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9177A10E4BE;
	Thu, 29 Oct 2026 13:35:13 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06ABE10E4BE;
 Thu, 29 Oct 2026 13:35:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/cper=3A_Software_?=
 =?utf-8?q?=28driver-detected=29_CPER_error_reporting_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Oct 2026 13:35:12 -0000
Message-ID: <179328091201.87987.5466016104356299367@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261029132609.907017-8-mallesh.koujalagi@intel.com>
In-Reply-To: <20261029132609.907017-8-mallesh.koujalagi@intel.com>
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

Series: drm/xe/cper: Software (driver-detected) CPER error reporting (rev2)
URL   : https://patchwork.freedesktop.org/series/176576/
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
commit 216e75d8b6ccc0c0bb2b1d6a7ef952d857952c8f
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Date:   Thu Oct 29 18:56:16 2026 +0530

    drm/xe/log: Test software CPER emission parameters
    
    Add KUnit tests for software SIGIDs to verify the correct
    arguments are forwarded to the CPER emission path.
    
    Assisted-by: LLM
    Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
+ /mt/dim checkpatch e650cd4c5bd5d3b068ed7a1eb3c55cde4386b355 drm-intel
04d5ce2750cf Add CPER logging support for CRI-Do not review
-:14: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#14: 
new file mode 100644

-:966: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#966: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:28:
+	    TP_STRUCT__entry(

-:976: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#976: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:38:
+	    TP_fast_assign(

-:1001: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#1001: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:63:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                              ^

-:1001: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#1001: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:63:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                 ^

-:1001: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#1001: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:63:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                         ^

-:1001: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#1001: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:63:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                             ^

-:1001: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#1001: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:63:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                                 ^

total: 0 errors, 1 warnings, 7 checks, 910 lines checked
a82df255acca drm/xe/cper: Add software error classification definitions
7dd2837326a7 drm/xe/cper: Decouple RAS error class initialization
cad24191ab8c drm/xe/cper: Support software CPER records
b923589d9d7a drm/xe/log: Add software CPER information to KUnit output
216e75d8b6cc drm/xe/log: Test software CPER emission parameters


