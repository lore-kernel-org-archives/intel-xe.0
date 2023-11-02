Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3EFC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  2 Nov 2023 20:10:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6AB10E107;
	Thu,  2 Nov 2023 20:10:43 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id ABF7C10E107;
 Thu,  2 Nov 2023 20:10:41 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AA719A7DFB;
 Thu,  2 Nov 2023 20:10:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommithi Sakeena" <bommithi.sakeena@intel.com>
Date: Thu, 02 Nov 2023 20:10:41 -0000
Message-ID: <169895584169.28155.4975370763901160154@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231102195102.4144-1-bommithi.sakeena@intel.com>
In-Reply-To: <20231102195102.4144-1-bommithi.sakeena@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Encapsulate_all_the_module_parameters_=28rev2=29?=
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

Series: drm/xe: Encapsulate all the module parameters (rev2)
URL   : https://patchwork.freedesktop.org/series/124995/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fc20733f3780a32fc991ffbb3d516ba8fc81a3c5
Author: Bommithi Sakeena <bommithi.sakeena@intel.com>
Date:   Thu Nov 2 19:51:02 2023 +0000

    drm/xe: Encapsulate all the module parameters
    
    Encapsulate all the module paramters in one single global struct
    variable. This also removes the extra xe_module.h from includes.
    
    v2: naming consistency as suggested by Jani and Lucas
    
    Cc: Jani Nikula <jani.nikula@linux.intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Bommithi Sakeena <bommithi.sakeena@intel.com>
+ /mt/dim checkpatch 58dfdb8dc78e5668f9891c798ec3191863c1e0d2 drm-intel
fc20733f3 drm/xe: Encapsulate all the module parameters
-:6: WARNING:TYPO_SPELLING: 'paramters' may be misspelled - perhaps 'parameters'?
#6: 
Encapsulate all the module paramters in one single global struct
                           ^^^^^^^^^

-:156: ERROR:CODE_INDENT: code indent should use tabs where possible
#156: FILE: drivers/gpu/drm/xe/xe_module.h:13:
+        bool force_execlist;$

-:156: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#156: FILE: drivers/gpu/drm/xe/xe_module.h:13:
+        bool force_execlist;$

-:157: ERROR:CODE_INDENT: code indent should use tabs where possible
#157: FILE: drivers/gpu/drm/xe/xe_module.h:14:
+        bool enable_display;$

-:157: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#157: FILE: drivers/gpu/drm/xe/xe_module.h:14:
+        bool enable_display;$

-:158: ERROR:CODE_INDENT: code indent should use tabs where possible
#158: FILE: drivers/gpu/drm/xe/xe_module.h:15:
+        u32 force_vram_bar_size;$

-:158: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#158: FILE: drivers/gpu/drm/xe/xe_module.h:15:
+        u32 force_vram_bar_size;$

-:159: ERROR:CODE_INDENT: code indent should use tabs where possible
#159: FILE: drivers/gpu/drm/xe/xe_module.h:16:
+        int guc_log_level;$

-:159: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#159: FILE: drivers/gpu/drm/xe/xe_module.h:16:
+        int guc_log_level;$

-:160: ERROR:CODE_INDENT: code indent should use tabs where possible
#160: FILE: drivers/gpu/drm/xe/xe_module.h:17:
+        char *guc_firmware_path;$

-:160: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#160: FILE: drivers/gpu/drm/xe/xe_module.h:17:
+        char *guc_firmware_path;$

-:161: ERROR:CODE_INDENT: code indent should use tabs where possible
#161: FILE: drivers/gpu/drm/xe/xe_module.h:18:
+        char *huc_firmware_path;$

-:161: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#161: FILE: drivers/gpu/drm/xe/xe_module.h:18:
+        char *huc_firmware_path;$

-:162: ERROR:CODE_INDENT: code indent should use tabs where possible
#162: FILE: drivers/gpu/drm/xe/xe_module.h:19:
+        char *force_probe;$

-:162: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#162: FILE: drivers/gpu/drm/xe/xe_module.h:19:
+        char *force_probe;$

-:164: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#164: FILE: drivers/gpu/drm/xe/xe_module.h:21:
+};
+extern struct xe_modparam xe_modparam;

total: 7 errors, 8 warnings, 1 checks, 158 lines checked


