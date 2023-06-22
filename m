Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D18EB64D8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 07:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907CC10E4F5;
	Thu, 22 Jun 2023 07:57:46 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 25C6410E4F4;
 Thu, 22 Jun 2023 07:57:45 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 22482A7DFF;
 Thu, 22 Jun 2023 07:57:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Thu, 22 Jun 2023 07:57:45 -0000
Message-ID: <168742066513.4870.17761161216344279321@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230622072818.3182423-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230622072818.3182423-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Add_sysfs_entry_for_tile_and_relate_it_to_GTs_=28rev4?=
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

Series: drm/xe: Add sysfs entry for tile and relate it to GTs (rev4)
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
commit 29353f13da528fc5a996492cff29a26627d9250e
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Thu Jun 22 12:58:18 2023 +0530

    drm/xe: Add sysfs entry to report per tile memory size
    
    Add sysfs entry to read per tile physical memory
    including stolen memory.
    
    V4:
      - %s/addr_range/physical_vram_size_byes, make it
        user readable name - Joonas/Aravind
      - Display in bytes - Joonas/Aravind
    V3:
      - Exclude DG1, replace sysfs_create_file/files - Aravind
    V2:
      - Use DEVICE_ATTR_RO - Aravind
      - Dont put kobj on sysfs_file_create fail - Himal
      - Skip addr_range sysfs create for non dgfx - Himal
    
    Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch bf01ddde17686463166a5006a6521f71c3df771a drm-intel
134092d93 drm/xe: Add sysfs entry for tile
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
-:81: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#81: 
new file mode 100644

-:103: WARNING:CONST_STRUCT: struct kobj_type should normally be const
#103: FILE: drivers/gpu/drm/xe/xe_tile_sysfs.c:18:
+static struct kobj_type xe_tile_sysfs_kobj_type = {

total: 0 errors, 2 warnings, 0 checks, 144 lines checked
bd1322245 drm/xe: Add GTs under respective tile sysfs
29353f13d drm/xe: Add sysfs entry to report per tile memory size


