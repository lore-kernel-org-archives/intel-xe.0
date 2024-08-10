Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D084C3DA4A
	for <intel-xe@archiver.kernel.org>; Sat, 10 Aug 2024 00:00:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FD210EA3E;
	Sat, 10 Aug 2024 00:00:41 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C0A10EA3E;
 Sat, 10 Aug 2024 00:00:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_driver_load_error_inj?=
 =?utf-8?q?ection?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 10 Aug 2024 00:00:40 -0000
Message-ID: <172324804059.558587.81172583621402049@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240809224424.3212551-1-matthew.brost@intel.com>
In-Reply-To: <20240809224424.3212551-1-matthew.brost@intel.com>
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

Series: Add driver load error injection
URL   : https://patchwork.freedesktop.org/series/137111/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
dc547930fbb1350eaf6bde84653b9ac973a411db
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 13f0e5b8a2b844deb914dce290a098d4a15b6cfa
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Aug 9 15:44:24 2024 -0700

    drm/xe: Add driver load error injection
    
    Port over i915 driver load error injection.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 99ad64bdf35cabb4af86749665508067895eb1d6 drm-intel
13f0e5b8a2b8 drm/xe: Add driver load error injection
-:56: ERROR:CODE_INDENT: code indent should use tabs where possible
#56: FILE: drivers/gpu/drm/xe/xe_device.c:1015:
+        if (xe->inject_driver_load_error >= xe_modparam.inject_driver_load_error)$

-:56: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#56: FILE: drivers/gpu/drm/xe/xe_device.c:1015:
+        if (xe->inject_driver_load_error >= xe_modparam.inject_driver_load_error)$

-:57: ERROR:CODE_INDENT: code indent should use tabs where possible
#57: FILE: drivers/gpu/drm/xe/xe_device.c:1016:
+                return 0;$

-:57: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#57: FILE: drivers/gpu/drm/xe/xe_device.c:1016:
+                return 0;$

-:59: ERROR:CODE_INDENT: code indent should use tabs where possible
#59: FILE: drivers/gpu/drm/xe/xe_device.c:1018:
+        if (++xe->inject_driver_load_error < xe_modparam.inject_driver_load_error)$

-:59: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#59: FILE: drivers/gpu/drm/xe/xe_device.c:1018:
+        if (++xe->inject_driver_load_error < xe_modparam.inject_driver_load_error)$

-:60: ERROR:CODE_INDENT: code indent should use tabs where possible
#60: FILE: drivers/gpu/drm/xe/xe_device.c:1019:
+                return 0;$

-:60: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#60: FILE: drivers/gpu/drm/xe/xe_device.c:1019:
+                return 0;$

-:62: ERROR:CODE_INDENT: code indent should use tabs where possible
#62: FILE: drivers/gpu/drm/xe/xe_device.c:1021:
+        drm_info(&xe->drm, "Injecting failure %d at checkpoint %u [%s:%d]\n",$

-:62: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#62: FILE: drivers/gpu/drm/xe/xe_device.c:1021:
+        drm_info(&xe->drm, "Injecting failure %d at checkpoint %u [%s:%d]\n",$

-:63: ERROR:CODE_INDENT: code indent should use tabs where possible
#63: FILE: drivers/gpu/drm/xe/xe_device.c:1022:
+                 err, xe->inject_driver_load_error, func, line);$

-:63: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#63: FILE: drivers/gpu/drm/xe/xe_device.c:1022:
+                 err, xe->inject_driver_load_error, func, line);$

-:65: ERROR:CODE_INDENT: code indent should use tabs where possible
#65: FILE: drivers/gpu/drm/xe/xe_device.c:1024:
+        xe_modparam.inject_driver_load_error = 0;$

-:65: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#65: FILE: drivers/gpu/drm/xe/xe_device.c:1024:
+        xe_modparam.inject_driver_load_error = 0;$

-:66: ERROR:CODE_INDENT: code indent should use tabs where possible
#66: FILE: drivers/gpu/drm/xe/xe_device.c:1025:
+        return err;$

-:66: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#66: FILE: drivers/gpu/drm/xe/xe_device.c:1025:
+        return err;$

-:68: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#68: FILE: drivers/gpu/drm/xe/xe_device.c:1027:
+
+}

-:258: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#258: FILE: drivers/gpu/drm/xe/xe_module.c:57:
+module_param_named_unsafe(inject_driver_load_error, xe_modparam.inject_driver_load_error, int, 0600);

total: 8 errors, 9 warnings, 1 checks, 314 lines checked


