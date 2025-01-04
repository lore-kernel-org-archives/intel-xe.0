Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21334E77197
	for <intel-xe@archiver.kernel.org>; Sat,  4 Jan 2025 17:59:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED1089DFF;
	Sat,  4 Jan 2025 17:59:41 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8659389DFF;
 Sat,  4 Jan 2025 17:59:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/cmtg=3A_Disable_?=
 =?utf-8?q?the_CMTG_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 04 Jan 2025 17:59:40 -0000
Message-ID: <173601358054.3273098.16882244064106325719@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250104172937.64015-1-gustavo.sousa@intel.com>
In-Reply-To: <20250104172937.64015-1-gustavo.sousa@intel.com>
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

Series: drm/i915/cmtg: Disable the CMTG (rev4)
URL   : https://patchwork.freedesktop.org/series/142946/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 356676bcd559a436dbda09ad954c2d3828dcea03
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Sat Jan 4 14:29:26 2025 -0300

    squash! drm/i915/cmtg: Disable the CMTG
    
    v4:
      - Do the disable sequence as part of the sanitization step after
        hardware readout instead of initial modeset commit. (Jani)
    
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 3491399dc8f0c0c3bcec5316c66e60f5f44e1f10 drm-intel
0d5837b5b2f1 drm/i915/cmtg: Disable the CMTG
-:57: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#57: 
new file mode 100644

-:175: WARNING:LONG_LINE: line length of 109 exceeds 100 columns
#175: FILE: drivers/gpu/drm/i915/display/intel_cmtg.c:114:
+		    intel_cmtg_has_cmtg_b(display) ? str_enabled_disabled(cmtg_state->cmtg_b_enable) : "n/a",

-:502: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__display' - possible side-effects?
#502: FILE: drivers/gpu/drm/i915/display/intel_display_device.h:148:
+#define HAS_CMTG(__display)		(!(__display)->platform.dg2 && DISPLAY_VER(__display) >= 13)

total: 0 errors, 2 warnings, 1 checks, 467 lines checked
356676bcd559 squash! drm/i915/cmtg: Disable the CMTG


