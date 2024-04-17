Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B02C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 09:01:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4F91132FB;
	Wed, 17 Apr 2024 09:01:23 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB136113305;
 Wed, 17 Apr 2024 09:01:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Support_PCIe_FL?=
 =?utf-8?q?R_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aravind Iddamsetty" <aravind.iddamsetty@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Apr 2024 09:01:21 -0000
Message-ID: <171334448196.1464511.8491442561285497195@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240417084145.242480-1-aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20240417084145.242480-1-aravind.iddamsetty@linux.intel.com>
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

Series: drm/xe: Support PCIe FLR (rev3)
URL   : https://patchwork.freedesktop.org/series/131366/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fae1e565f2e5fbb878df0dbfb24f3f7fc481a38f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cb5ebf0d0eb6508345ac9d2ca8ea9b3168f5ae1f
Author: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Date:   Wed Apr 17 14:11:45 2024 +0530

    drm/xe/FLR: Support PCIe FLR
    
    PCI subsystem provides callbacks to inform the driver about a request to
    do function level reset by user, initiated by writing to sysfs entry
    /sys/bus/pci/devices/.../reset. This will allow the driver to handle FLR
    without the need to do unbind and rebind as the driver needs to
    reinitialize the device afresh post FLR.
    
    v2:
    1. separate out gt idle and pci save/restore to a separate patch (Lucas)
    2. Fixed the warnings seen around xe_guc_submit_stop, xe_guc_puc_fini
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
+ /mt/dim checkpatch c577180c5a61220ef8db9a4a3cd4de66bf58eed4 drm-intel
473e65a4a0e1 drm: add devm release action
010400a45f18 drm/xe: Save and restore PCI state
afe7bcaf7423 drm/xe: Extract xe_gt_idle() helper
cb5ebf0d0eb6 drm/xe/FLR: Support PCIe FLR
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:120: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#120: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 175 lines checked


