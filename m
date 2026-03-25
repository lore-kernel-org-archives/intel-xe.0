Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0156106B506
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 12:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7304910E842;
	Wed, 25 Mar 2026 12:06:03 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF9710E842;
 Wed, 25 Mar 2026 12:06:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Fsysctrl=3A_Ad?=
 =?utf-8?q?d_system_controller_component_for_Xe3p_dGPU_platforms_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Mar 2026 12:06:02 -0000
Message-ID: <177444036249.396080.4428510907377804417@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260325120030.510480-9-anoop.c.vijay@intel.com>
In-Reply-To: <20260325120030.510480-9-anoop.c.vijay@intel.com>
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

Series: drm/xe/xe_sysctrl: Add system controller component for Xe3p dGPU platforms (rev3)
URL   : https://patchwork.freedesktop.org/series/163196/
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
commit 477f89770f00d26826705c0fc6128b7083d77f77
Author: Anoop Vijay <anoop.c.vijay@intel.com>
Date:   Wed Mar 25 05:00:34 2026 -0700

    drm/xe/xe_pci: Enable System Controller support on CRI platform
    
    Enable System Controller support on CRI by setting has_sysctrl capability
    flag in device descriptor and runtime device information.
    
    This allows sysctrl subsystem and mailbox communication to be initialized
    on CRI platforms.
    
    Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
    Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch 1fda996928180768f2704b8f8c816f10da433131 drm-intel
82be482d7b8d drm/xe/xe_sysctrl: Add System Controller types and device integration
-:26: WARNING:BAD_SIGN_OFF: Duplicate signature
#26: 
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

-:72: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#72: 
new file mode 100644

total: 0 errors, 2 warnings, 0 checks, 63 lines checked
12dbc5c20b74 drm/xe/xe_sysctrl: Add System Controller mailbox register definitions
-:17: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#17: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 36 lines checked
2583baca401c drm/xe/xe_sysctrl: Add ABI and mailbox interface headers
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 136 lines checked
aca505ae2b72 drm/xe/xe_sysctrl: Add System Controller initialization support
-:53: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#53: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 127 lines checked
cb23ce907e3a drm/xe/xe_sysctrl: Add System Controller mailbox communication support
-:41: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#41: 
new file mode 100644

-:270: WARNING:LINE_SPACING: Missing a blank line after declarations
#270: FILE: drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:225:
+	size_t remain = sizeof(*hdr) + data_out_len;
+	u8 *buffer __free(kfree) = kzalloc(remain, GFP_KERNEL);

total: 0 errors, 2 warnings, 0 checks, 383 lines checked
c72ae386d08a drm/xe/xe_sysctrl: Add System Controller power management support
477f89770f00 drm/xe/xe_pci: Enable System Controller support on CRI platform


