Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AB7C79F85
	for <intel-xe@archiver.kernel.org>; Sun,  6 Sep 2026 17:16:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF46489131;
	Sun,  6 Sep 2026 17:16:06 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EFE89131;
 Sun,  6 Sep 2026 17:16:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_CPER_logging_support_?=
 =?utf-8?q?for_CRI_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 06 Sep 2026 17:16:05 -0000
Message-ID: <178871496532.127407.4554762972138140535@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
In-Reply-To: <20260906172604.2215987-14-badal.nilawar@intel.com>
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

Series: Add CPER logging support for CRI (rev3)
URL   : https://patchwork.freedesktop.org/series/169692/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5ac20c0b0e45727c00a5c0e8fcc09c55c5cbdeb4
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Sun Sep 6 22:56:17 2026 +0530

    drm/xe/cper: Emit cper record to trace buf
    
    Emit cper record to trace buf.
    
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
    Assisted-by: Copilot:claude-sonnet-4.6
+ /mt/dim checkpatch 496ff8213a2d2e1e5b1c8efe8b55e1dcdc3e3f8f drm-intel
bf79b8f3ab1a drm/xe/cper: Hardware error CPER reporting from xe_log
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 109 lines checked
141cf31d41cf drm/xe/cper: Retrieve the error counter record for CPER reporting
6685b95e2ce3 drm/xe/cper: Add Intel specific CPER structures
-:12: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#12: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 179 lines checked
bd3880851758 drm/xe/cper: Prepare CPER record
4096a2db3bbe drm/xe/xe_ras: Add support to retrieve info queue data for CRI
89d810b31219 drm/xe/cper: Prepare Intel CPER error info records
0e31637f9e43 drm/xe/cper: Log CPER records for aggregate counter retrival
f41469d09c7c drm/xe/xe_ras: Report device memory errors using SIGID
dc85559f3d5a drm/xe/xe_ras: Report core compute errors using SIGID
8943930df833 drm/xe/xe_ras: Report soc internal errors using SIGID
89b4de15bcf2 drm/xe/xe_ras: Report correctable errors using SIGID
5ac20c0b0e45 drm/xe/cper: Emit cper record to trace buf
-:48: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#48: 
new file mode 100644

-:88: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#88: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:21:
+TRACE_EVENT(xe_error_cper,
+	TP_PROTO(struct xe_device *xe,

-:89: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#89: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:22:
+	TP_PROTO(struct xe_device *xe,
+	    const guid_t *platform_id, const guid_t *fru_id,

-:95: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#95: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:28:
+	TP_STRUCT__entry(

-:105: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#105: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:38:
+	TP_fast_assign(

-:120: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#120: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:53:
+		__print_hex(__entry->ihdr_raw,
+		    sizeof(struct xe_cper_sec_intel_err_hdr)),

-:123: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#123: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:56:
+		__print_hex(__get_dynamic_array(cper),
+		    __entry->cper_len))

-:131: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#131: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:64:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                              ^

-:131: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#131: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:64:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                 ^

-:131: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#131: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:64:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                         ^

-:131: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#131: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:64:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                             ^

-:131: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#131: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:64:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                                 ^

total: 0 errors, 1 warnings, 11 checks, 100 lines checked


