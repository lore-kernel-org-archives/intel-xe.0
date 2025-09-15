Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11D7CAC592
	for <intel-xe@archiver.kernel.org>; Mon, 15 Sep 2025 21:55:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D02F10E144;
	Mon, 15 Sep 2025 21:55:26 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD04A10E144;
 Mon, 15 Sep 2025 21:55:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Fdevice=5Fsysf?=
 =?utf-8?q?s=3A_add_cleanup_action_in_xe=5Fdevice=5Fsysfs=5Finit_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zongyao Bai" <zongyao.bai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Sep 2025 21:55:24 -0000
Message-ID: <175797332477.335794.14637225067158484398@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250910183233.3971054-1-zongyao.bai@intel.com>
In-Reply-To: <20250910183233.3971054-1-zongyao.bai@intel.com>
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

Series: drm/xe/xe_device_sysfs: add cleanup action in xe_device_sysfs_init (rev3)
URL   : https://patchwork.freedesktop.org/series/154116/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7e6fcc955b0ee1fe18067a613972343bf57acd40
Author: Zongyao Bai <zongyao.bai@intel.com>
Date:   Tue Sep 16 05:47:16 2025 +0800

    drm/xe/xe_device_sysfs: Remove sysfs unconditionally while clean sysfs entries
    
    xe_device_sysfs_fini() and late_bind_remove_files():
      Adjust the remove order of sysfs entries to follow LIFO.
      Remove configuration and status checking,
      call the sysfs removal unconditionally.
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Stuart Summers <stuart.summers@intel.com>
    Cc: Shuicheng Lin <shuicheng.lin@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
+ /mt/dim checkpatch 4b2a554c1553f8de414acede44c326055ae2833c drm-intel
f2405801c359 drm/xe/xe_device_sysfs: Add cleanup action in xe_device_sysfs_init
7e6fcc955b0e drm/xe/xe_device_sysfs: Remove sysfs unconditionally while clean sysfs entries
-:63: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#63: FILE: drivers/gpu/drm/xe/xe_device_sysfs.c:275:
+    late_bind_remove_files(dev);$

-:64: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#64: FILE: drivers/gpu/drm/xe/xe_device_sysfs.c:276:
+    sysfs_remove_files(&dev->kobj, auto_link_downgrade_attrs);$

-:65: WARNING:LEADING_SPACE: please, no spaces at the start of a line
#65: FILE: drivers/gpu/drm/xe/xe_device_sysfs.c:277:
+    sysfs_remove_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);$

total: 0 errors, 3 warnings, 0 checks, 45 lines checked


