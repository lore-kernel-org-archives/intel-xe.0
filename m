Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498EF108B8ED
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 10:33:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2A610EAC8;
	Fri, 20 Mar 2026 10:33:52 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BECB10EAC8;
 Fri, 20 Mar 2026 10:33:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_get-error-counter_sup?=
 =?utf-8?q?port_for_CRI?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Mar 2026 10:33:50 -0000
Message-ID: <177400283055.379016.14165182121823378725@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260320102607.1017511-1-riana.tauro@intel.com>
In-Reply-To: <20260320102607.1017511-1-riana.tauro@intel.com>
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

Series: Add get-error-counter support for CRI
URL   : https://patchwork.freedesktop.org/series/163576/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 68f67adb8ef89098921fbc4faf08894fbcf0f122
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Fri Mar 20 15:56:00 2026 +0530

    drm/xe/xe_ras: Add support to query error counter for CRI
    
    Add support to query error counter for all errors.
    
    When userspace queries a DRM RAS error counter, fetch the
    latest value from system controller.
    
    Integrate this with XE DRM RAS.
    
    Example : query the counters using ynl
    
    List all supported errors
    
    $ sudo ynl --family drm_ras  --dump get-error-counter \
      --json '{"node-id":1}'
     [{"error-id": 1, "error-name": "core-compute",  "error-value": 0},
      {"error-id": 2, "error-name": "soc-internal",  "error-value": 0},
      {"error-id": 3, "error-name": "device-memory", "error-value": 0},
      {"error-id": 4, "error-name": "pcie",          "error-value": 0},
      {"error-id": 5, "error-name": "fabric",        "error-value": 0},]
    
    Query single error counter
    
    $ sudo ynl --family drm_ras  --do get-error-counter --json \
      '{"node-id":1, "error-id":1}'
    {'error-id': 1, 'error-name': 'core-compute', 'error-value': 20}
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 7535044a2418d22b59be0eb64af0353971f16bd8 drm-intel
e8bb56c93c25 drm/xe/xe_sysctrl: Add System controller patch
-:27: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#27: 
new file mode 100644

-:668: WARNING:LINE_SPACING: Missing a blank line after declarations
#668: FILE: drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:225:
+	size_t remain = sizeof(*hdr) + data_out_len;
+	u8 *buffer __free(kfree) = kzalloc(remain, GFP_KERNEL);

total: 0 errors, 2 warnings, 0 checks, 835 lines checked
ce613758b0ce drm/xe/uapi: Add additional error components to XE DRM RAS
54fab64feef7 drm/xe/ras: Add flag for Xe RAS
-:21: WARNING:LONG_LINE_COMMENT: line length of 101 exceeds 100 columns
#21: FILE: drivers/gpu/drm/xe/xe_device_types.h:194:
+		/** @info.has_ras: Device supports RAS (Reliability, Availability, Serviceability) */

total: 0 errors, 1 warnings, 0 checks, 44 lines checked
7171e58ddb2b drm/xe/xe_ras: Add structures and commands for get counter
-:31: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#31: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 166 lines checked
68f67adb8ef8 drm/xe/xe_ras: Add support to query error counter for CRI
-:103: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#103: 
new file mode 100644

-:150: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#150: FILE: drivers/gpu/drm/xe/xe_ras.c:43:
+};
+static_assert(ARRAY_SIZE(drm_to_xe_ras_component) == DRM_XE_RAS_ERR_COMP_MAX);

total: 0 errors, 1 warnings, 1 checks, 185 lines checked


