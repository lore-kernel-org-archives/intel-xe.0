Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60540FDEE2F
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 17:52:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162B210E341;
	Thu, 23 Apr 2026 17:52:54 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053E510E372;
 Thu, 23 Apr 2026 17:52:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_support_for?=
 =?utf-8?q?_GPU_health_indicator?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Apr 2026 17:52:53 -0000
Message-ID: <177696677301.2765.6797465974830859008@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260423173925.699486-1-soham.purkait@intel.com>
In-Reply-To: <20260423173925.699486-1-soham.purkait@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/165378/
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
commit ff1507e8976895a1688ab1f49b2bfc0fa3782b39
Author: Soham Purkait <soham.purkait@intel.com>
Date:   Thu Apr 23 23:09:25 2026 +0530

    drm/xe/xe_ras: Add RAS support for GPU health indicator
    
    GPU health indicator exposes a single sysfs interface, gpu_health,
    at the device level, allowing administrators and management tools to
    query the GPU health status. The interface permits both read and write
    operations on PF and native functions, while on VFs it is exposed as
    read-only.
    
    The sysfs file (gpu_health) is placed at the device level and behaves as
    follows:
    
    $ cat /sys/.../device/gpu_health
    ok
    
    $ echo critical > /sys/.../device/gpu_health
    
    $ cat /sys/.../device/gpu_health
    critical
    
    V2:
     - Return error number instead of error message in _show and
       _store. (Andi)
     - Remove redundant VF check in _store callback. (Andi)
     - Move GPU health sysfs init error logging to xe_ras_init. (Andi)
     - Return only the current health state for sysfs read. (Andi, Rodrigo)
     - Add documentation for sysfs interface. (Andi, Rodrigo)
    
    Signed-off-by: Soham Purkait <soham.purkait@intel.com>
+ /mt/dim checkpatch ecb61ba4a1f619b6944f4d0741b4d8a0910f460c drm-intel
97583930f1c3 drm/xe/xe_ras: Add types and commands for RAS GPU health indicator
-:30: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#30: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 104 lines checked
ff1507e89768 drm/xe/xe_ras: Add RAS support for GPU health indicator
-:34: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#34: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 270 lines checked


