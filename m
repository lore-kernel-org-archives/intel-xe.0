Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED98C1088E5E
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 17:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA45410E7DD;
	Thu, 19 Mar 2026 17:37:08 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF38610E7DD;
 Thu, 19 Mar 2026 17:37:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Fsysctrl=3A_Ad?=
 =?utf-8?q?d_system_controller_component_for_Xe3p_dGPU_platforms_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Mar 2026 17:37:07 -0000
Message-ID: <177394182782.375702.18269184194049562626@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260319173031.1320708-9-anoop.c.vijay@intel.com>
In-Reply-To: <20260319173031.1320708-9-anoop.c.vijay@intel.com>
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

Series: drm/xe/xe_sysctrl: Add system controller component for Xe3p dGPU platforms (rev2)
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
commit aa4a89655308504aaa0f34300099567d9a0fe191
Author: Anoop Vijay <anoop.c.vijay@intel.com>
Date:   Thu Mar 19 10:30:37 2026 -0700

    drm/xe/xe_pci: Enable System Controller support on CRI platform
    
    Enable System Controller support on CRI by setting has_sysctrl capability
    flag in device descriptor and runtime device information.
    
    This allows sysctrl subsystem and mailbox communication to be initialized
    on CRI platforms.
    
    Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
    Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch f4482de2c06e19b0c337b774e485755378990614 drm-intel
231787eb4c8b drm/xe/xe_sysctrl: Add System Controller types and device integration
-:26: WARNING:BAD_SIGN_OFF: Duplicate signature
#26: 
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

-:72: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#72: 
new file mode 100644

total: 0 errors, 2 warnings, 0 checks, 63 lines checked
befa859d82a4 drm/xe/xe_sysctrl: Add System Controller mailbox register definitions
-:17: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#17: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 36 lines checked
18ee4f5f13cf drm/xe/xe_sysctrl: Add ABI and mailbox interface headers
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 136 lines checked
861c6de55eb4 drm/xe/xe_sysctrl: Add System Controller initialization support
-:53: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#53: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 127 lines checked
612fe2cb5d72 drm/xe/xe_sysctrl: Add System Controller mailbox communication support
-:41: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#41: 
new file mode 100644

-:270: WARNING:LINE_SPACING: Missing a blank line after declarations
#270: FILE: drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:225:
+	size_t remain = sizeof(*hdr) + data_out_len;
+	u8 *buffer __free(kfree) = kzalloc(remain, GFP_KERNEL);

total: 0 errors, 2 warnings, 0 checks, 383 lines checked
aa24629a2d4a drm/xe/xe_sysctrl: Add System Controller power management support
aa4a89655308 drm/xe/xe_pci: Enable System Controller support on CRI platform


