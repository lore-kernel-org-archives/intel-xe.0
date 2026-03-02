Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D815EA4E07
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 14:33:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1864910E516;
	Mon,  2 Mar 2026 14:33:35 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFC610E516;
 Mon,  2 Mar 2026 14:33:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/sysctrl=3A_Add_sys?=
 =?utf-8?q?tem_controller_component_for_Xe3p_dGPU_platforms_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Mar 2026 14:33:34 -0000
Message-ID: <177246201418.303983.17687132581985431773@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260302081002.3275868-8-anoop.c.vijay@intel.com>
In-Reply-To: <20260302081002.3275868-8-anoop.c.vijay@intel.com>
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

Series: drm/xe/sysctrl: Add system controller component for Xe3p dGPU platforms (rev8)
URL   : https://patchwork.freedesktop.org/series/159554/
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
commit 70ec797f446b0e0980ae552c3cd5bea0225b5b68
Author: Anoop Vijay <anoop.c.vijay@intel.com>
Date:   Mon Mar 2 00:10:08 2026 -0800

    drm/xe/pci: Enable System Controller for CRI platform
    
    Enable System Controller support for CRI platform by setting
    has_sysctrl flag in device descriptor and runtime device info.
    
    This allows the System Controller subsystem and mailbox communication
    to be initialized on CRI platform.
    
    Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
+ /mt/dim checkpatch 200559e195414731c83ff6da6b34209dbef51227 drm-intel
68a988101169 drm/xe/sysctrl: Add System Controller types and device integration
-:60: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#60: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 63 lines checked
787de8f52ba5 drm/xe/sysctrl: Add System Controller register definitions
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 36 lines checked
7611b8e12dbf drm/xe/sysctrl: Add mailbox communication headers
-:14: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#14: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 97 lines checked
878cce61c3ef drm/xe/sysctrl: Add System Controller initialization
-:52: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#52: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 127 lines checked
1921cf9440c2 drm/xe/sysctrl: Add mailbox communication implementation
-:42: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#42: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 378 lines checked
70ec797f446b drm/xe/pci: Enable System Controller for CRI platform


