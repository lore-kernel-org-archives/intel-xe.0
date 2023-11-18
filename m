Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E144CC197A0
	for <intel-xe@archiver.kernel.org>; Sat, 18 Nov 2023 02:24:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD91710E0B1;
	Sat, 18 Nov 2023 02:24:16 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id BF75310E0B1;
 Sat, 18 Nov 2023 02:24:14 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id BD95DAADD8;
 Sat, 18 Nov 2023 02:24:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sujaritha Sundaresan" <sujaritha.sundaresan@intel.com>
Date: Sat, 18 Nov 2023 02:24:14 -0000
Message-ID: <170027425477.12896.15130792802774048758@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231116143043.908412-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20231116143043.908412-1-sujaritha.sundaresan@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ad?=
 =?utf-8?q?ding_new_frequency_sysfs_attributes?=
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

Series: Adding new frequency sysfs attributes
URL   : https://patchwork.freedesktop.org/series/126534/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d4240a7f38be24558a6da55db1bb8051afeec128
Author: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Date:   Thu Nov 16 20:00:43 2023 +0530

    drm/xe: Add vram frequency sysfs attributes
    
    Add vram rp0/n frequency sysfs attribuites under
    /device/../tile<n>/memory/freq/vram_rp0/n_freq
    
    Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
+ /mt/dim checkpatch cb9b702d436952ddec33b020d549c7998cace9e2 drm-intel
180ded122 drm/xe: Moving and renaming existing frequency sysfs attributes
44d6c061d drm/xe: Add memory directory for vram attributes
d9075283b drm/xe: Add throttle reasons sysfs attributes
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:56: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#56: 
new file mode 100644

-:288: ERROR:TRAILING_WHITESPACE: trailing whitespace
#288: FILE: drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c:228:
+static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg) $

-:296: ERROR:TRAILING_WHITESPACE: trailing whitespace
#296: FILE: drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c:236:
+void xe_gt_throttle_sysfs_init(struct xe_gt *gt) $

-:302: CHECK:LINE_SPACING: Please don't use multiple blank lines
#302: FILE: drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c:242:
+
+

total: 2 errors, 1 warnings, 1 checks, 306 lines checked
d4240a7f3 drm/xe: Add vram frequency sysfs attributes
-:138: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 8)
#138: FILE: drivers/gpu/drm/xe/xe_tile_sysfs.c:139:
+	if (xe->info.platform == XE_PVC) {
+	err = sysfs_create_files(kobj2, vram_freq_attrs);

total: 0 errors, 1 warnings, 0 checks, 126 lines checked


