Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C6C1093181
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 07:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1AE210E4EA;
	Fri, 20 Mar 2026 07:30:56 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE51710E4EA;
 Fri, 20 Mar 2026 07:30:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/fwctl=3A_Add_FWCTL?=
 =?utf-8?q?_interface_for_Xe_firmware_management?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Mar 2026 07:30:55 -0000
Message-ID: <177399185589.378568.17916447918560606874@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260320072528.1780651-7-anoop.c.vijay@intel.com>
In-Reply-To: <20260320072528.1780651-7-anoop.c.vijay@intel.com>
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

Series: drm/xe/fwctl: Add FWCTL interface for Xe firmware management
URL   : https://patchwork.freedesktop.org/series/163562/
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
commit 0de8a0183acdae2a4fcc342aa06e0ffcad371d43
Author: Anoop Vijay <anoop.c.vijay@intel.com>
Date:   Fri Mar 20 00:25:33 2026 -0700

    drm/xe/fwctl: Add System Controller FWCTL RPC handler
    
    Add FWCTL RPC handler for Xe System Controller firmware.
    
    Implement xe_fw_ops to route FWCTL RPCs to System Controller mailbox,
    allowing userspace to issue System Controller commands via FWCTL.
    
    Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
+ /mt/dim checkpatch 4ae9f18564e78a5447be68aa1e9232a4f2c37b5a drm-intel
f29bc788568e drm/xe/xe_sysctrl: Add System Controller support
-:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
new file mode 100644

-:665: WARNING:LINE_SPACING: Missing a blank line after declarations
#665: FILE: drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:225:
+	size_t remain = sizeof(*hdr) + data_out_len;
+	u8 *buffer __free(kfree) = kzalloc(remain, GFP_KERNEL);

total: 0 errors, 2 warnings, 0 checks, 835 lines checked
99bd9fd8b0de drm/xe/fwctl: Add uAPI definitions for Xe FWCTL support
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 45 lines checked
a6805c1eec93 drm/xe/fwctl: Add Xe FWCTL type definitions
-:17: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#17: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 52 lines checked
445dc0bc1e24 drm/xe/fwctl: Add Xe FWCTL infrastructure support
-:93: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#93: 
new file mode 100644

-:167: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (0, 0)
#167: FILE: drivers/gpu/drm/xe/xe_fwctl.c:70:
+DEFINE_FREE(xe_fwctl, struct xe_fwctl *, if (_T) fwctl_put(&_T->fwctl))
[...]
+static const struct xe_fw_ops *fw_ops_table[XE_FW_MAX] = {

total: 0 errors, 2 warnings, 0 checks, 276 lines checked
0de8a0183acd drm/xe/fwctl: Add System Controller FWCTL RPC handler
-:100: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#100: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 287 lines checked


