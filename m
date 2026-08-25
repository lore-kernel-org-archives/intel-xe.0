Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A59C61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 18:29:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F02E10E12B;
	Tue, 25 Aug 2026 18:29:31 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194B710E12B;
 Tue, 25 Aug 2026 18:29:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_CPER_logging_support_?=
 =?utf-8?q?for_CRI_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Aug 2026 18:29:30 -0000
Message-ID: <178768257009.84239.2157067166087795684@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
In-Reply-To: <20260825175916.1103841-13-badal.nilawar@intel.com>
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

Series: Add CPER logging support for CRI (rev2)
URL   : https://patchwork.freedesktop.org/series/169692/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2cb1cd991d2fee7e0a84b6d82c49210a8eb2f99e
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Tue Aug 25 23:29:28 2026 +0530

    drm/xe/ras: Report correctable errors using SIGID
    
    Use xe_log_* helper to report correctable errors.
    
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
    Cc: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch 15e2ba2fb6d25c03d89519aec46f8d5be3e118ad drm-intel
57eafc44f9c1 drm/xe/xe_ras: Add support to retrieve info queue data for CRI
1cc6d987513b drm/xe/xe_ras: Refactor get_counter() to return response structure
84da341781ad drm/xe/cper: Add CPER structures and trace event
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
new file mode 100644

-:260: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#260: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:21:
+TRACE_EVENT(xe_error_cper,
+	TP_PROTO(struct xe_device *xe,

-:261: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#261: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:22:
+	TP_PROTO(struct xe_device *xe,
+	    const guid_t *platform_id, const guid_t *fru_id,

-:267: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#267: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:28:
+	TP_STRUCT__entry(

-:277: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#277: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:38:
+	TP_fast_assign(

-:292: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#292: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:53:
+		__print_hex(__entry->ihdr_raw,
+		    sizeof(struct xe_cper_sec_intel_err_hdr)),

-:295: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#295: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:56:
+		__print_hex(__get_dynamic_array(cper),
+		    __entry->cper_len))

-:303: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#303: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:64:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                              ^

-:303: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#303: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:64:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                 ^

-:303: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#303: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:64:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                         ^

-:303: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#303: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:64:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                             ^

-:303: CHECK:SPACING: spaces preferred around that '/' (ctx:VxV)
#303: FILE: drivers/gpu/drm/xe/xe_trace_cper.h:64:
+#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
                                                 ^

total: 0 errors, 1 warnings, 11 checks, 268 lines checked
50f1aa0aefdb drm/xe/cper: APIs to prepare and log CPER record
-:49: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#49: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 243 lines checked
368f568b8e10 drm/xe/cper: Prepare Intel CPER error info from info queue
-:286: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#286: FILE: drivers/gpu/drm/xe/xe_ras.c:729:
+				entry->entry_length = sizeof_field(struct xe_ras_error_log, error_details);

-:290: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#290: FILE: drivers/gpu/drm/xe/xe_ras.c:733:
+				entry = (struct xe_intel_priv_event_entry *)((u8 *)entry + entry_size);

total: 0 errors, 2 warnings, 0 checks, 292 lines checked
c6639bee4921 drm/xe/cper: Log CPER records for aggregate counter retrival
7951327c0fb6 drm/xe/cper: Allow hardware error CPER reporting from xe_log
c50455a77607 drm/xe/ras: Report device memory errors using SIGID
3fd5dd02e180 drm/xe/ras: Report core compute errors using SIGID
80221b625246 drm/xe/ras: Report soc internal errors using SIGID
2cb1cd991d2f drm/xe/ras: Report correctable errors using SIGID


