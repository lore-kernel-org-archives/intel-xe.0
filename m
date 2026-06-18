Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD8DCD98F2
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 06:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE7910E1F5;
	Thu, 18 Jun 2026 06:52:43 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC27110E1F5;
 Thu, 18 Jun 2026 06:52:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_support_for?=
 =?utf-8?q?_GPU_health_indicator?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Jun 2026 06:52:41 -0000
Message-ID: <178176556169.92489.8253121090957802474@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260618061053.3307213-3-soham.purkait@intel.com>
In-Reply-To: <20260618061053.3307213-3-soham.purkait@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/168758/
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
commit 05dd14bdaf9726f5d554b0269a9ccc207f6ade75
Author: Soham Purkait <soham.purkait@intel.com>
Date:   Thu Jun 18 11:40:55 2026 +0530

    drm/xe/xe_ras: Add RAS GPU health indicator
    
    Add a sysfs interface that reports the current GPU health state and
    lets admin users and management tools update it but is readable by all
    users. Requests are routed through the sysctrl mailbox. The interface
    is present only on platforms that support the GPU health indicator.
    
    The interface is a single read/write file at the device level:
    
      $ cat /sys/.../device/gpu_health
      ok
    
      $ echo critical > /sys/.../device/gpu_health
    
      $ cat /sys/.../device/gpu_health
      critical
    
    v1:
     - Add enum for health status. (Andi, Rodrigo)
     - Return error number instead of error message in _show/_store. (Andi)
     - Move GPU health sysfs init error logging to xe_ras_init. (Andi)
     - Return only the current health state for sysfs read. (Andi, Rodrigo)
     - Add documentation for sysfs interface. (Andi, Rodrigo)
    
    v2:
     - Make logs and structures consistent with their counterparts. (Riana)
     - Drop unnecessary variables. (Andi, Riana)
     - Add correct KernelVersion. (Raag)
    
    v3:
     - Add missing blank line before #endif. (Badal)
    
    Signed-off-by: Soham Purkait <soham.purkait@intel.com>
    Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
    Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 8530e8b67c8dba3eb5b4c025c060a5b3b78262c6 drm-intel
05dd14bdaf97 drm/xe/xe_ras: Add RAS GPU health indicator
-:42: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#42: 
new file mode 100644

-:122: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#122: FILE: drivers/gpu/drm/xe/xe_ras.c:71:
+};
+static_assert(ARRAY_SIZE(gpu_health_states) == XE_RAS_HEALTH_STATUS_MAX);

total: 0 errors, 1 warnings, 1 checks, 366 lines checked


