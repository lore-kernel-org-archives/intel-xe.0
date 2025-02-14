Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D65C021A4
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 20:49:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF2410E0B4;
	Fri, 14 Feb 2025 20:49:00 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C2310E0B4;
 Fri, 14 Feb 2025 20:48:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Fdrm=5Fclient?=
 =?utf-8?q?=3A_Add_per_drm_client_reset_stats?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Feb 2025 20:48:59 -0000
Message-ID: <173956613955.2160965.15491512074186774145@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250214203757.27895-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250214203757.27895-1-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_drm_client: Add per drm client reset stats
URL   : https://patchwork.freedesktop.org/series/144903/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b1bf10a2e15726d0afdad2cad092cf9e02431a41
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Fri Feb 14 20:37:57 2025 +0000

    drm/xe/xe_drm_client: Add per drm client reset stats
    
    Add a counter to xe_drm_client that tracks the number of times the
    engine has been reset since the drm client was created.
    
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch cbd747025a1ef985e1ebfa040aa0da4a5d77aacd drm-intel
881cf1b1ae2f drm/xe/xe_exec_queue: Add ID param to exec queue struct
8d21ec5d6743 drm/xe/xe_gt_pagefault: Migrate pagefault struct to header
72b4ac2ff067 FIXME: drm/xe/xe_drm_client: Add per drm client pagefault info
-:39: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#39: FILE: drivers/gpu/drm/xe/xe_drm_client.c:74:
+ * ^I- Exec queue ban list -$

-:41: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#41: FILE: drivers/gpu/drm/xe/xe_drm_client.c:76:
+ * ^I^IExec queue 1 banned:$

-:42: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#42: FILE: drivers/gpu/drm/xe/xe_drm_client.c:77:
+ * ^I^I^IAssociated pagefault:$

-:43: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#43: FILE: drivers/gpu/drm/xe/xe_drm_client.c:78:
+ * ^I^I^IASID: 9$

-:44: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#44: FILE: drivers/gpu/drm/xe/xe_drm_client.c:79:
+ * ^I^I^IVFID: 0$

-:45: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#45: FILE: drivers/gpu/drm/xe/xe_drm_client.c:80:
+ * ^I^I^IPDATA: 0x0450$

-:46: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#46: FILE: drivers/gpu/drm/xe/xe_drm_client.c:81:
+ * ^I^I^IFaulted Address: 0x000001fff86a9000$

-:47: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#47: FILE: drivers/gpu/drm/xe/xe_drm_client.c:82:
+ * ^I^I^IFaultType: NOT_PRESENT$

-:48: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#48: FILE: drivers/gpu/drm/xe/xe_drm_client.c:83:
+ * ^I^I^IAccessType: ACCESS_TYPE_WRITE$

-:49: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#49: FILE: drivers/gpu/drm/xe/xe_drm_client.c:84:
+ * ^I^I^IFaultLevel: 0$

-:50: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#50: FILE: drivers/gpu/drm/xe/xe_drm_client.c:85:
+ * ^I^I^IEngineClass: 1 vcs$

-:51: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#51: FILE: drivers/gpu/drm/xe/xe_drm_client.c:86:
+ * ^I^I^IEngineInstance: 0$

-:52: ERROR:TRAILING_WHITESPACE: trailing whitespace
#52: FILE: drivers/gpu/drm/xe/xe_drm_client.c:87:
+ *^I^I$

-:87: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*b)...) over kzalloc(sizeof(struct blame)...)
#87: FILE: drivers/gpu/drm/xe/xe_drm_client.c:202:
+	b = kzalloc(sizeof(struct blame), GFP_KERNEL);

-:102: WARNING:LINE_SPACING: Missing a blank line after declarations
#102: FILE: drivers/gpu/drm/xe/xe_drm_client.c:217:
+		struct blame *rem = list_first_entry(&client->blame_list, struct blame, list);
+		free_blame(rem);

-:113: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*pf)...) over kzalloc(sizeof(struct pagefault)...)
#113: FILE: drivers/gpu/drm/xe/xe_drm_client.c:228:
+		pf = kzalloc(sizeof(struct pagefault), GFP_KERNEL);

-:134: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#134: FILE: drivers/gpu/drm/xe/xe_drm_client.c:249:
+
+}

-:176: WARNING:LINE_SPACING: Missing a blank line after declarations
#176: FILE: drivers/gpu/drm/xe/xe_drm_client.c:500:
+		struct pagefault *pf = b->pf;
+		drm_printf(p, "\n\tExec queue %u banned:\n", b->exec_queue_id);

-:306: WARNING:NEEDLESS_IF: kfree(NULL) is safe and this check is probably not required
#306: FILE: drivers/gpu/drm/xe/xe_gt_pagefault.c:342:
+		if (hwe->pf.info)
+			kfree(hwe->pf.info);

-:307: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*hwe->pf.info)...) over kzalloc(sizeof(struct pagefault)...)
#307: FILE: drivers/gpu/drm/xe/xe_gt_pagefault.c:343:
+		hwe->pf.info = kzalloc(sizeof(struct pagefault), GFP_KERNEL);

-:377: WARNING:NEEDLESS_IF: kfree(NULL) is safe and this check is probably not required
#377: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:2003:
+	if (hwe->pf.info) {
+		kfree(hwe->pf.info);

-:378: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*hwe->pf.info)...) over kzalloc(sizeof(struct pagefault)...)
#378: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:2004:
+		hwe->pf.info = kzalloc(sizeof(struct pagefault), GFP_KERNEL);

total: 1 errors, 16 warnings, 5 checks, 360 lines checked
b1bf10a2e157 drm/xe/xe_drm_client: Add per drm client reset stats


