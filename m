Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE23EE0205
	for <intel-xe@archiver.kernel.org>; Tue, 30 Dec 2025 15:22:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC47210E921;
	Tue, 30 Dec 2025 15:22:57 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433D310E913;
 Tue, 30 Dec 2025 15:22:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/sysctrl=3A_Add_sys?=
 =?utf-8?q?tem_controller_component_for_Xe3p_dGPU_platforms?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 30 Dec 2025 15:22:56 -0000
Message-ID: <176710817627.121043.1647363961541003513@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251230151722.293657-3-anoop.c.vijay@intel.com>
In-Reply-To: <20251230151722.293657-3-anoop.c.vijay@intel.com>
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

Series: drm/xe/sysctrl: Add system controller component for Xe3p dGPU platforms
URL   : https://patchwork.freedesktop.org/series/159554/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99339247d1ae4378b24366da182e712bdc623311
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e3057ab1ae0402acf51382bf2cc17d6f2aec7c10
Author: Anoop Vijay <anoop.c.vijay@intel.com>
Date:   Tue Dec 30 07:17:23 2025 -0800

    drm/xe/sysctrl: Add system controller component for Xe3p dGPU platforms
    
    Add a new system controller (sysctrl) component for Intel Xe3p dGPU platforms.
    
    This component provides the foundational infrastructure for communication
    with the System Controller firmware using MKHI protocol over a mailbox interface.
    
    Key features introduced:
     - Detection and initialization of System Controller interface on Xe3p dGPU platforms
     - Mailbox communication with System Controller firmware
     - Fragmented message transfer for large command payloads
    
    This implementation establishes the base for future System Controller feature
    enablement and firmware command handling.
    
    Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
+ /mt/dim checkpatch cbb25c38097a953da8605c68dd979be9a776ec83 drm-intel
e3057ab1ae04 drm/xe/sysctrl: Add system controller component for Xe3p dGPU platforms
-:7: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#7: 
Add a new system controller (sysctrl) component for Intel Xe3p dGPU platforms.

-:36: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#36: 
new file mode 100644

-:475: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#475: FILE: drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:210:
+						  const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req_hdr,

-:742: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#742: FILE: drivers/gpu/drm/xe/xe_sysctrl_mailbox.h:33:
+#define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr)	FIELD_GET(APP_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))

-:743: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#743: FILE: drivers/gpu/drm/xe/xe_sysctrl_mailbox.h:34:
+#define XE_SYSCTRL_APP_HDR_COMMAND(hdr)		FIELD_GET(APP_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))

-:744: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#744: FILE: drivers/gpu/drm/xe/xe_sysctrl_mailbox.h:35:
+#define XE_SYSCTRL_APP_HDR_VERSION(hdr)		FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))

-:746: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#746: FILE: drivers/gpu/drm/xe/xe_sysctrl_mailbox.h:37:
+#define XE_SYSCTRL_MKHI_HDR_GROUP_ID(hdr)	FIELD_GET(MKHI_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))

-:747: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#747: FILE: drivers/gpu/drm/xe/xe_sysctrl_mailbox.h:38:
+#define XE_SYSCTRL_MKHI_HDR_COMMAND(hdr)	FIELD_GET(MKHI_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))

-:748: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#748: FILE: drivers/gpu/drm/xe/xe_sysctrl_mailbox.h:39:
+#define XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(hdr)	FIELD_GET(MKHI_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))

-:749: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#749: FILE: drivers/gpu/drm/xe/xe_sysctrl_mailbox.h:40:
+#define XE_SYSCTRL_MKHI_HDR_RESULT(hdr)		FIELD_GET(MKHI_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))

total: 0 errors, 10 warnings, 0 checks, 715 lines checked


