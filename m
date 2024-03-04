Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003C9C5478C
	for <intel-xe@archiver.kernel.org>; Mon,  4 Mar 2024 18:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B449911245F;
	Mon,  4 Mar 2024 18:28:01 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B875D11245F;
 Mon,  4 Mar 2024 18:28:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/9=5D_drm/xe=3A_Remove_useless_mem=5Faccess_during_probe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 04 Mar 2024 18:28:00 -0000
Message-ID: <170957688075.503981.15125388200402041760@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240304182154.42611-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240304182154.42611-1-rodrigo.vivi@intel.com>
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

Series: series starting with [1/9] drm/xe: Remove useless mem_access during probe
URL   : https://patchwork.freedesktop.org/series/130687/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
4dc7d0cc630cdd9ac56065b1a22afc329345a519
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 374acf809654a20a84a72789d2bf02adb92ae181
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Mon Mar 4 13:21:54 2024 -0500

    drm/xe: Kill xe_device_mem_access_{get*,put}
    
    Let's simply convert all the current callers towards direct
    xe_pm_runtime access and remove this extra layer of indirection.
    
    v2: Convert all the current callers instead of a big refactor
    at once.
    
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch e8bc216572501440efb20e112bb5aa60599f1863 drm-intel
46c25999420b drm/xe: Remove useless mem_access during probe
e45295651aa2 drm/xe: Convert xe_gem_fault to use direct xe_pm_runtime calls
68f58363f70b drm/xe: Move lockdep protection from mem_access to xe_pm_runtime
db44a16825c3 drm/xe: Move xe_irq runtime suspend and resume out of lockdep
-:41: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#41: 
sufficient to protect any race and there's no counter part to get deadlocked

total: 0 errors, 1 warnings, 0 checks, 26 lines checked
c46c8630842c drm/xe: Removing useless mem_access protection from runtime pm
80700c6de3c7 drm/xe: Introduce xe_pm_runtime_get_noresume for inner callers
-:56: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#56: FILE: drivers/gpu/drm/xe/xe_pm.c:520:
+      bool ref;$

-:58: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#58: FILE: drivers/gpu/drm/xe/xe_pm.c:522:
+      ref = xe_pm_runtime_get_if_in_use(xe);$

-:60: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#60: FILE: drivers/gpu/drm/xe/xe_pm.c:524:
+      if (drm_WARN(&xe->drm, !ref, "Missing outer runtime PM protection\n"))$

-:60: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (6, 14)
#60: FILE: drivers/gpu/drm/xe/xe_pm.c:524:
+      if (drm_WARN(&xe->drm, !ref, "Missing outer runtime PM protection\n"))
+	      pm_runtime_get_noresume(xe->drm.dev);

total: 0 errors, 4 warnings, 0 checks, 41 lines checked
3371c5ffb687 drm/xe: Convert mem_access_if_ongoing to direct xe_pm_runtime_get_if_active
e1b132591f5f drm/xe: Ensure all the inner access are using the _noresume variant
374acf809654 drm/xe: Kill xe_device_mem_access_{get*,put}


