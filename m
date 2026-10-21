Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30F5606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 16:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69EEF10E30F;
	Wed, 21 Oct 2026 16:31:40 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B60110E30F;
 Wed, 21 Oct 2026 16:31:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/cper=3A_Software_?=
 =?utf-8?q?=28driver-detected=29_CPER_error_reporting?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Oct 2026 16:31:38 -0000
Message-ID: <179260029830.53146.17167564985056104069@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261021162508.265700-7-mallesh.koujalagi@intel.com>
In-Reply-To: <20261021162508.265700-7-mallesh.koujalagi@intel.com>
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

Series: drm/xe/cper: Software (driver-detected) CPER error reporting
URL   : https://patchwork.freedesktop.org/series/176576/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ea06e3b7c1da8c5f12a066e6f845ef3ac14b8fed
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Date:   Wed Oct 21 21:55:13 2026 +0530

    drm/xe/log: Add software CPER KUnit test
    
    Add test_sw_cper() to validate software CPER logging.
    
    Verify that xe_log_emit() forwards severity, SIGID, component,
    and error data correctly, and ensure the SIGID stays in the
    software range.
    
    Print the generated error class to simplify debugging and
    record inspection.
    
    Assisted-by: LLM
    Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
+ /mt/dim checkpatch ebd1c72d97840a55564c37670affe5c28dca6ad2 drm-intel
dff6934c7988 Add CPER logging support for CRI-Do not review
-:14: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#14: 
new file mode 100644

-:1496: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#1496: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:21:
+TRACE_EVENT(xe_error_cper,
+	TP_PROTO(struct xe_device *xe,

-:1503: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#1503: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:28:
+	TP_STRUCT__entry(

-:1513: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#1513: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:38:
+	TP_fast_assign(

-:1538: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#1538: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:63:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                              ^

-:1538: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#1538: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:63:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                 ^

-:1538: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#1538: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:63:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                         ^

-:1538: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#1538: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:63:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                             ^

-:1538: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#1538: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:63:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                                 ^

total: 0 errors, 1 warnings, 8 checks, 1438 lines checked
4906d53cc9eb drm/xe/cper: Add driver error classification definitions
8cc396bab1c1 drm/xe/cper: Let caller initialize error_class
a1e2e669a46e drm/xe/cper: Add CPER support for software errors
ea06e3b7c1da drm/xe/log: Add software CPER KUnit test


