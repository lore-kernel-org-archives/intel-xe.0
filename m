Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5758CCA6012
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 10:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02EA210E544;
	Fri,  9 Oct 2026 10:54:08 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD48610E5E4;
 Fri,  9 Oct 2026 10:54:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_CPER_logging_support_?=
 =?utf-8?q?for_CRI_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Oct 2026 10:54:06 -0000
Message-ID: <179154324670.2763.14206339814439987294@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
In-Reply-To: <20261009104602.1075405-14-badal.nilawar@intel.com>
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

Series: Add CPER logging support for CRI (rev4)
URL   : https://patchwork.freedesktop.org/series/169692/
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
commit be9d02e26570df0fe7473d41fd7963fa71737f22
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Fri Oct 9 16:16:15 2026 +0530

    drm/xe/xe_ras: Report correctable errors using SIGID
    
    Use xe_log_* helper to report correctable errors.
    
    Assisted-by: Copilot:Claude-Opus-5.5
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
    Cc: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch 3bd4f625aafdf70814dbf075de96e224355c9f1e drm-intel
5663ce929103 drm/xe/cper: Add CPER reporting entry point for xe_log
-:32: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#32: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 102 lines checked
d0f12a32ce41 drm/xe/cper: Retrieve the error counter record for CPER reporting
cbcf11412d7c drm/xe/cper: Initialize Intel-specific error section header
-:86: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#86: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 138 lines checked
09e074473c25 drm/xe/cper: Construct CPER record for hardware errors
11904ebb7f37 drm/xe/xe_ras: Add support to retrieve info queue data for CRI
d046214a5a48 drm/xe/cper: Prepare Intel CPER error info records
dd6a5cb0551e drm/xe/cper: Log CPER records for aggregate counter retrieval
-:13: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#13: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 274 lines checked
5f85699f13df drm/xe/cper: Emit cper record to trace buf
-:51: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#51: 
new file mode 100644

-:91: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#91: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:21:
+TRACE_EVENT(xe_error_cper,
+	TP_PROTO(struct xe_device *xe,

-:92: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#92: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:22:
+	TP_PROTO(struct xe_device *xe,
+	    const guid_t *platform_id, const guid_t *fru_id,

-:98: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#98: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:28:
+	TP_STRUCT__entry(

-:108: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#108: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:38:
+	TP_fast_assign(

-:123: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#123: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:53:
+		__print_hex(__entry->ihdr_raw,
+		    sizeof(struct xe_cper_sec_intel_err_hdr)),

-:126: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#126: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:56:
+		__print_hex(__get_dynamic_array(cper),
+		    __entry->cper_len))

-:134: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#134: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:64:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                              ^

-:134: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#134: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:64:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                 ^

-:134: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#134: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:64:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                         ^

-:134: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#134: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:64:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                             ^

-:134: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#134: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:64:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                                 ^

total: 0 errors, 1 warnings, 11 checks, 100 lines checked
3c8ecb566740 drm/xe/xe_ras: Report device memory errors using SIGID
6067cb1a946c drm/xe/xe_ras: Report core compute errors using SIGID
18e5eebfeb22 drm/xe/xe_ras: Report soc internal errors using SIGID
be9d02e26570 drm/xe/xe_ras: Report correctable errors using SIGID


