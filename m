Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DEEE81A3C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 16:08:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2640510E3B3;
	Mon, 16 Feb 2026 16:08:45 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFE710E3B2;
 Mon, 16 Feb 2026 16:08:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/sysctrl=3A_Add_Sys?=
 =?utf-8?q?tem_Controller_debugfs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Feb 2026 16:08:43 -0000
Message-ID: <177125812362.256995.11277451274693903089@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260216145232.3942399-6-anoop.c.vijay@intel.com>
In-Reply-To: <20260216145232.3942399-6-anoop.c.vijay@intel.com>
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

Series: drm/xe/sysctrl: Add System Controller debugfs (rev2)
URL   : https://patchwork.freedesktop.org/series/161655/
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
commit 1fcb3d288b8293923039ba09bdf33618426e660b
Author: Anoop Vijay <anoop.c.vijay@intel.com>
Date:   Mon Feb 16 06:52:36 2026 -0800

    drm/xe/sysctrl: Add RAS error injection interface
    
    Add debugfs interface for RAS error injection testing.
    This allows validation of error detection and recovery paths.
    
    Command details:
    - Group ID: 0x02 (Diag group)
    - Command ID: 0xFC (error injection)
    - Usage: echo "0x01 0x02 0x03" > /sys/kernel/debug/dri/0/sc/ras_error_inject
             cat /sys/kernel/debug/dri/0/sc/ras_error_inject
    
    Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
+ /mt/dim checkpatch 483cf2d774a08fdf83f0e4c7a6ab671a53656d3c drm-intel
51869c979b0b drm/xe/sysctrl: Add System Controller support
-:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 699 lines checked
39800214f50d drm/xe/sysctrl: Add sysctrl debugfs infrastructure
-:53: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#53: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 133 lines checked
48ef0afa9e89 drm/xe/sysctrl: Add loopback test debugfs interface
-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
         echo "0x11 0x22 0x33 0x44" > /sys/kernel/debug/dri/0/sc/loopback_inv

total: 0 errors, 1 warnings, 0 checks, 343 lines checked
1fcb3d288b82 drm/xe/sysctrl: Add RAS error injection interface
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
- Usage: echo "0x01 0x02 0x03" > /sys/kernel/debug/dri/0/sc/ras_error_inject

total: 0 errors, 1 warnings, 0 checks, 99 lines checked


