Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E0310ED661
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 13:42:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECB210EEC7;
	Fri, 27 Mar 2026 13:42:11 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C3F10EEC7;
 Fri, 27 Mar 2026 13:42:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Fsysctrl=3A_Ad?=
 =?utf-8?q?d_system_controller_component_for_Xe3p_dGPU_platforms_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Mar 2026 13:42:10 -0000
Message-ID: <177461893070.406376.1531312879047538076@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260327131837.2192929-9-anoop.c.vijay@intel.com>
In-Reply-To: <20260327131837.2192929-9-anoop.c.vijay@intel.com>
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

Series: drm/xe/xe_sysctrl: Add system controller component for Xe3p dGPU platforms (rev4)
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
commit 0d49fb36a5f8d56bf59964b7338e67437975e866
Author: Anoop Vijay <anoop.c.vijay@intel.com>
Date:   Fri Mar 27 06:18:44 2026 -0700

    drm/xe/xe_pci: Enable System Controller support on CRI platform
    
    Enable System Controller support on CRI by setting has_sysctrl capability
    flag in device descriptor and runtime device information.
    
    This allows sysctrl subsystem and mailbox communication to be initialized
    on CRI platforms.
    
    Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
    Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch b0c967b64ac6322238cc1cbabd75a3be31fbb637 drm-intel
00070185bba2 drm/xe/xe_sysctrl: Add System Controller types and device integration
-:26: WARNING:BAD_SIGN_OFF: Duplicate signature
#26: 
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

-:72: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#72: 
new file mode 100644

total: 0 errors, 2 warnings, 0 checks, 63 lines checked
79397471f10b drm/xe/xe_sysctrl: Add System Controller mailbox register definitions
-:17: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#17: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 36 lines checked
1521944d6807 drm/xe/xe_sysctrl: Add ABI and mailbox interface headers
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 136 lines checked
f4fb8b600268 drm/xe/xe_sysctrl: Add System Controller initialization support
-:53: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#53: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 122 lines checked
58e3a2ec38dd drm/xe/xe_sysctrl: Add System Controller mailbox communication support
-:41: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#41: 
new file mode 100644

-:270: WARNING:LINE_SPACING: Missing a blank line after declarations
#270: FILE: drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:225:
+	size_t remain = sizeof(*hdr) + data_out_len;
+	u8 *buffer __free(kfree) = kzalloc(remain, GFP_KERNEL);

total: 0 errors, 2 warnings, 0 checks, 385 lines checked
6d2ec43c0dda drm/xe/xe_sysctrl: Add System Controller power management support
0d49fb36a5f8 drm/xe/xe_pci: Enable System Controller support on CRI platform


