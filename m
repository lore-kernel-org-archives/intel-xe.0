Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F84CD8C8E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 05:31:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5845B10ED03;
	Mon,  8 Jun 2026 05:31:58 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3532010ED03;
 Mon,  8 Jun 2026 05:31:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_support_for?=
 =?utf-8?q?_GPU_health_indicator?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Jun 2026 05:31:57 -0000
Message-ID: <178089671721.52309.17088770171337136610@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260608052556.1744123-5-soham.purkait@intel.com>
In-Reply-To: <20260608052556.1744123-5-soham.purkait@intel.com>
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

Series: drm/xe: Add support for GPU health indicator
URL   : https://patchwork.freedesktop.org/series/168044/
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
commit a9764fad9a410ba04bb6208dcbc17e1ad5eb36b4
Author: Soham Purkait <soham.purkait@intel.com>
Date:   Mon Jun 8 10:56:00 2026 +0530

    drm/xe/xe_ras: Add RAS support for GPU health indicator
    
    GPU health indicator exposes a single sysfs interface, gpu_health,
    at the device level, allowing administrators and management tools to
    query and update the GPU health status. It is exposed as read-only for
    non admin users while write access is only provided to the admin users.
    
    The sysfs file (gpu_health) is placed at the device level and behaves as
    follows:
    
    $ cat /sys/.../device/gpu_health
    ok
    
    $ echo critical > /sys/.../device/gpu_health
    
    $ cat /sys/.../device/gpu_health
    critical
    
    V1:
     - Return error number instead of error message in _show and
       _store. (Andi)
     - Move GPU health sysfs init error logging to xe_ras_init. (Andi)
     - Return only the current health state for sysfs read. (Andi, Rodrigo)
     - Add documentation for sysfs interface. (Andi, Rodrigo)
    
    v2:
     - Make logs and structures consistent with their counterparts. (Riana)
     - Drop unnecessary variables. (Andi, Riana)
     - Add correct KernelVersion. (Raag)
    
    Signed-off-by: Soham Purkait <soham.purkait@intel.com>
    Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 0375ba98c1fdf69bc3a05ffa80591f9ffe910330 drm-intel
74f84ab6e268 From: Riana Tauro <riana.tauro@intel.com> DO NOT REVIEW. COMPILATION ONLY
-:79: WARNING:LONG_LINE_COMMENT: line length of 109 exceeds 100 columns
#79: FILE: drivers/gpu/drm/xe/xe_device_types.h:159:
+		/** @info.has_drm_ras: Device supports drm_ras (Reliability, Availability, Serviceability) */

-:662: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Riana Tauro <riana.tauro@intel.com>'

total: 1 errors, 1 warnings, 0 checks, 574 lines checked
b369456be854 drm/xe/xe_ras: Add types and commands for RAS GPU health indicator
a9764fad9a41 drm/xe/xe_ras: Add RAS support for GPU health indicator
-:38: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#38: 
new file mode 100644

-:86: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#86: FILE: drivers/gpu/drm/xe/xe_ras.c:73:
+};
+static_assert(ARRAY_SIZE(gpu_health_states) == XE_RAS_HEALTH_STATUS_MAX);

total: 0 errors, 1 warnings, 1 checks, 185 lines checked


