Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C23FC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 09:09:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BAE110E2DC;
	Fri, 19 Apr 2024 09:09:25 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA8410E2DC;
 Fri, 19 Apr 2024 09:09:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Support_PCIe_FL?=
 =?utf-8?q?R_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aravind Iddamsetty" <aravind.iddamsetty@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Apr 2024 09:09:24 -0000
Message-ID: <171351776406.1520059.13272086185091456884@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240419085826.263743-1-aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20240419085826.263743-1-aravind.iddamsetty@linux.intel.com>
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

Series: drm/xe: Support PCIe FLR (rev4)
URL   : https://patchwork.freedesktop.org/series/131366/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3c34e4b100fe02ff713ed6971b2ccc00e00eeb5d
Author: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Date:   Fri Apr 19 14:28:26 2024 +0530

    drm/xe/FLR: Support PCIe FLR
    
    PCI subsystem provides callbacks to inform the driver about a request to
    do function level reset by user, initiated by writing to sysfs entry
    /sys/bus/pci/devices/.../reset. This will allow the driver to handle FLR
    without the need to do unbind and rebind as the driver needs to
    reinitialize the device afresh post FLR.
    
    v2:
    1. separate out gt idle and pci save/restore to a separate patch (Lucas)
    2. Fixed the warnings seen around xe_guc_submit_stop, xe_guc_puc_fini
    
    v3: declare xe_pci_err_handlers as static(Michal)
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
+ /mt/dim checkpatch 1f816172a689b95011a1c1cfe952ac6ec32d3ca3 drm-intel
2f55168112f4 drm: add devm release action
e2085978a2ae drm/xe: Save and restore PCI state
58d2c0eb3dc1 drm/xe: Extract xe_gt_idle() helper
3c34e4b100fe drm/xe/FLR: Support PCIe FLR
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:123: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#123: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 170 lines checked


