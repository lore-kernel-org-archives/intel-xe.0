Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD97D105F7AF
	for <intel-xe@archiver.kernel.org>; Fri, 13 Mar 2026 14:38:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7D410E46A;
	Fri, 13 Mar 2026 14:38:44 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A480710E0B0;
 Fri, 13 Mar 2026 14:38:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Fsysctrl=3A_Ad?=
 =?utf-8?q?d_system_controller_component_for_Xe3p_dGPU_platforms?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Mar 2026 14:38:43 -0000
Message-ID: <177341272365.356420.8307020187386362310@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260313143303.2441609-9-anoop.c.vijay@intel.com>
In-Reply-To: <20260313143303.2441609-9-anoop.c.vijay@intel.com>
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

Series: drm/xe/xe_sysctrl: Add system controller component for Xe3p dGPU platforms
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
commit 8b2a1a6d337bf721314d9950f1b01d26b65c927e
Author: Anoop Vijay <anoop.c.vijay@intel.com>
Date:   Fri Mar 13 07:33:10 2026 -0700

    drm/xe/xe_pci: Enable System Controller support on CRI platform
    
    Enable System Controller support on CRI by setting has_sysctrl capability
    flag in device descriptor and runtime device information.
    
    This allows sysctrl subsystem and mailbox communication to be initialized
    on CRI platforms.
    
    Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
    Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
+ /mt/dim checkpatch 45618ec6cfed86e72cf6c2325c8f947bfbe7c132 drm-intel
348ae3a1a97d drm/xe/xe_sysctrl: Add System Controller types and device integration
-:70: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#70: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 63 lines checked
53ab782ba332 drm/xe/xe_sysctrl: Add System Controller mailbox register definitions
-:17: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#17: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 36 lines checked
def37cdc4cad drm/xe/xe_sysctrl: Add ABI and mailbox interface headers
-:15: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#15: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 115 lines checked
a02b909cf607 drm/xe/xe_sysctrl: Add System Controller initialization support
-:53: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#53: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 127 lines checked
5bc505a2e6e7 drm/xe/xe_sysctrl: Add System Controller mailbox communication support
-:41: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#41: 
new file mode 100644

-:270: WARNING:LINE_SPACING: Missing a blank line after declarations
#270: FILE: drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:225:
+	size_t remain = sizeof(*hdr) + data_out_len;
+	u8 *buffer __free(kfree) = kzalloc(remain, GFP_KERNEL);

total: 0 errors, 2 warnings, 0 checks, 383 lines checked
2ed63278a4ab drm/xe/xe_sysctrl: Add System Controller power management support
8b2a1a6d337b drm/xe/xe_pci: Enable System Controller support on CRI platform


