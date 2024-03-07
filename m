Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AD0C54E41
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 01:03:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC4B11364A;
	Thu,  7 Mar 2024 01:02:59 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C6B11364A;
 Thu,  7 Mar 2024 01:02:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B0?=
 =?utf-8?q?1/10=5D_drm/i915/display=3A_convert_inner_wakeref_get_towards_get?=
 =?utf-8?q?=5Fif=5Fin=5Fuse?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Mar 2024 01:02:57 -0000
Message-ID: <170977337794.563887.4563701502223683581@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240307001554.162153-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240307001554.162153-1-rodrigo.vivi@intel.com>
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

Series: series starting with [01/10] drm/i915/display: convert inner wakeref get towards get_if_in_use
URL   : https://patchwork.freedesktop.org/series/130839/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
7d6fb25447372de10c7d82d450bf95e4b2e2a0ab
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fe9ef4db52717687db6289f438943815c54cd10e
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Wed Mar 6 19:15:54 2024 -0500

    drm/xe: Kill xe_device_mem_access_{get*,put}
    
    Let's simply convert all the current callers towards direct
    xe_pm_runtime access and remove this extra layer of indirection.
    
    v2: Convert all the current callers instead of a big refactor
    at once.
    
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch c9b9b8d4449209d2451127f98cdfe2b99bec3da7 drm-intel
5d8b6cf556d7 drm/i915/display: convert inner wakeref get towards get_if_in_use
a57843656f58 drm/xe: Move lockdep protection from mem_access to xe_pm_runtime
209efb548ff4 drm/xe: Convert GSC HDCP from mem_access to direct xe_pm_runtime calls
7f4933cbbf7d drm/xe: Remove useless mem_access during probe
c331526ecec7 drm/xe: Convert xe_gem_fault to use direct xe_pm_runtime calls
bee323988b62 drm/xe: Removing extra mem_access protection from runtime pm
41d56164ec80 drm/xe: Introduce xe_pm_runtime_get_noresume for inner callers
-:57: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#57: FILE: drivers/gpu/drm/xe/xe_pm.c:517:
+      bool ref;$

-:59: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#59: FILE: drivers/gpu/drm/xe/xe_pm.c:519:
+      ref = xe_pm_runtime_get_if_in_use(xe);$

-:61: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#61: FILE: drivers/gpu/drm/xe/xe_pm.c:521:
+      if (drm_WARN(&xe->drm, !ref, "Missing outer runtime PM protection\n"))$

-:61: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (6, 14)
#61: FILE: drivers/gpu/drm/xe/xe_pm.c:521:
+      if (drm_WARN(&xe->drm, !ref, "Missing outer runtime PM protection\n"))
+	      pm_runtime_get_noresume(xe->drm.dev);

total: 0 errors, 4 warnings, 0 checks, 41 lines checked
d42e64833c0b drm/xe: Convert mem_access_if_ongoing to direct xe_pm_runtime_get_if_active
64e419269fec drm/xe: Ensure all the inner access are using the _noresume variant
fe9ef4db5271 drm/xe: Kill xe_device_mem_access_{get*,put}


