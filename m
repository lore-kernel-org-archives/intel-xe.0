Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE7BC77B7A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 10:08:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CFC10E4B3;
	Wed,  7 Jun 2023 10:08:02 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id AF56C10E4BE;
 Wed,  7 Jun 2023 10:08:00 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AC594AADD2;
 Wed,  7 Jun 2023 10:08:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Wed, 07 Jun 2023 10:08:00 -0000
Message-ID: <168613248070.21185.6119162506454295936@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230607101103.2127088-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230607101103.2127088-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Add_sysfs_entry_for_tile_and_relate_it_to_GTs_=28rev2?=
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

Series: drm/xe: Add sysfs entry for tile and relate it to GTs (rev2)
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
commit edc4e6274b1ac969d6282e0c4859c3a7916b9df9
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Wed Jun 7 15:41:03 2023 +0530

    drm/xe: Add sysfs entry to report per tile memory size
    
    Add sysfs entry to read per tile physical memory
    including stolen memory.
    
    V2:
      - Use DEVICE_ATTR_RO - Aravind
      - Dont put kobj on sysfs_file_create fail - Himal
      - Skip addr_range sysfs create for non dgfx - Himal
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 0f657f7b7f8886953ec1d946965a90fd286a6591 drm-intel
643b1e753 drm/xe: Add sysfs entry for tile
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
-:76: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#76: 
new file mode 100644

-:100: WARNING:CONST_STRUCT: struct kobj_type should normally be const
#100: FILE: drivers/gpu/drm/xe/xe_tile_sysfs.c:20:
+static struct kobj_type xe_tile_sysfs_kobj_type = {

-:121: WARNING:OOM_MESSAGE: Possible unnecessary 'out of memory' message
#121: FILE: drivers/gpu/drm/xe/xe_tile_sysfs.c:41:
+	if (!kg) {
+		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);

total: 0 errors, 3 warnings, 0 checks, 150 lines checked
2e486c0a6 drm/xe: Add GTs under respective tile sysfs
edc4e6274 drm/xe: Add sysfs entry to report per tile memory size


