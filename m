Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A720EB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 07:11:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E95C10E0C7;
	Wed, 28 Jun 2023 07:11:55 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 12A3810E0C7;
 Wed, 28 Jun 2023 07:11:53 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0FA4FAADDC;
 Wed, 28 Jun 2023 07:11:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Wed, 28 Jun 2023 07:11:53 -0000
Message-ID: <168793631306.32038.16186139536708975106@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230628071527.3579428-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230628071527.3579428-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Add_sysfs_entry_for_tile_and_relate_it_to_GTs_=28rev5?=
 =?utf-8?q?=29?=
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

Series: drm/xe: Add sysfs entry for tile and relate it to GTs (rev5)
URL   : https://patchwork.freedesktop.org/series/118927/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d2086e902d5b873976b0d3305871b5fc0597468b
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Wed Jun 28 12:45:27 2023 +0530

    drm/xe: Make usable size of VRAM readable
    
    Current size member of vram struct does not give
    complete information as what "size" contains. Does
    it contain reserved portions or not. Name it usable
    size and accordingly describe other size members as
    well.
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch abdb420db479bae28a2abd7ba2c66229b7e8cb77 drm-intel
aba494d76 drm/xe: Add sysfs entry for tile
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:83: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#83: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 144 lines checked
c344ad399 drm/xe: Add GTs under respective tile sysfs
0c73a1a8b drm/xe: Add sysfs entry to report per tile memory size
d2086e902 drm/xe: Make usable size of VRAM readable
-:36: WARNING:AVOID_BUG: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#36: FILE: drivers/gpu/drm/xe/xe_bo.c:128:
+	XE_BUG_ON(!tile->mem.vram.usable_size);

total: 0 errors, 1 warnings, 0 checks, 78 lines checked


