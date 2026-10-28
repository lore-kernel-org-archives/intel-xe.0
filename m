Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA63606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 10:05:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6042210E5D1;
	Wed, 28 Oct 2026 10:05:48 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E8310FB22;
 Wed, 28 Oct 2026 10:05:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_CPER_logging_support_?=
 =?utf-8?q?for_CRI_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Oct 2026 10:05:47 -0000
Message-ID: <179318194747.80440.11063914531171982751@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261028095723.734387-12-badal.nilawar@intel.com>
In-Reply-To: <20261028095723.734387-12-badal.nilawar@intel.com>
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

Series: Add CPER logging support for CRI (rev6)
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
commit ba83bd0c7d5b9c5a65e21c98eaba3320ce17e731
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Wed Oct 28 15:27:34 2026 +0530

    drm/xe/xe_ras: Report correctable errors using SIGID
    
    Use xe_log_* helper to report correctable errors.
    
    Example:
            xe 0000:03:00.0: [drm] *ERROR* SIGID=203 CORRECTED
    (010200180000000100000000) [Hardware Error]: CORE_COMPUTE: error detected
    
    Assisted-by: LLM
    Reviewed-by: Raag Jadav <raag.jadav@intel.com>
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
    Cc: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch 6a182ac542350dbca9147134654c35e463aa1382 drm-intel
ed6d68ebb144 drm/xe/cper: Add CPER reporting entry point for xe_log
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 98 lines checked
5c987277bc31 drm/xe/cper: Retrieve the error counter record for CPER reporting
fb73d6fa17ba drm/xe/cper: Initialize Intel-specific CPER header
-:93: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#93: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 123 lines checked
a6d906b5f87f drm/xe/cper: Construct CPER record for hardware errors
e9e509a2313e drm/xe/cper: Log CPER records for aggregate counter retrieval
-:13: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#13: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 273 lines checked
2aff6bb1715e drm/xe/cper: Emit cper record to trace buf
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
9d27d3249520 drm/xe/xe_ras: Report device memory errors using SIGID
2691cdd8a2a5 drm/xe/xe_ras: Report core compute errors using SIGID
f87ad526ddbd drm/xe/xe_ras: Report soc internal errors using SIGID
ba83bd0c7d5b drm/xe/xe_ras: Report correctable errors using SIGID


