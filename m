Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5147CCA0EEB
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 14:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1923E10E0C3;
	Tue, 19 Aug 2025 14:29:19 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE6310E0C3;
 Tue, 19 Aug 2025 14:29:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Make_struct_xe?=
 =?utf-8?q?=5Fggtt_private=2E_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Aug 2025 14:29:18 -0000
Message-ID: <175561375811.248501.13604151500642405910@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250819101119.511705-8-dev@lankhorst.se>
In-Reply-To: <20250819101119.511705-8-dev@lankhorst.se>
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

Series: drm/xe: Make struct xe_ggtt private. (rev3)
URL   : https://patchwork.freedesktop.org/series/139778/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
553439844b6500767ce8aef522cfe9fbb7ece541
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1304e690ced266da6cd7bc7dddea67c8b968ecc5
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Tue Aug 19 12:11:24 2025 +0200

    drm/xe: Move struct xe_ggtt to xe_ggtt.c
    
    No users left outside of xe_ggtt.c, so we can make the struct private.
    
    This prevents us from accidentally touching it before init.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch deb6c5d08f8b84ea7e019b7682631c6375cc17aa drm-intel
9447e6e7b940 drm/xe: Only have a single drmm release action.
3430200a2894 drm/mm: Introduce address space shifting
1e4625ad93c0 drm/xe: Start using ggtt->start in preparation of balloon removal
-:105: CHECK:SPACING: No space is necessary after a cast
#105: FILE: drivers/gpu/drm/xe/xe_ggtt.c:281:
+		ggtt_size = (gsm_size / 8) * (u64) XE_PAGE_SIZE - ggtt_start;

total: 0 errors, 0 warnings, 1 checks, 177 lines checked
96365837692f drm/xe: Rewrite GGTT VF initialisation
-:69: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#69: FILE: drivers/gpu/drm/xe/xe_ggtt.c:288:
+			drm_err(&xe->drm, "tile%u: Invalid GGTT configuration: %#llx-%#llx\n",
+				     ggtt->tile->id, ggtt_start, ggtt_start + ggtt_size - 1);

-:291: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#291: 
deleted file mode 100644

total: 0 errors, 1 warnings, 1 checks, 240 lines checked
a091c4101ff4 drm/xe: Convert xe_fb_pin to use a callback for insertion into GGTT
-:194: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#194: FILE: drivers/gpu/drm/xe/xe_ggtt.c:493:
+static int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
 			       u32 size, u32 align, u32 mm_flags)

total: 0 errors, 0 warnings, 1 checks, 321 lines checked
1304e690ced2 drm/xe: Move struct xe_ggtt to xe_ggtt.c
-:42: ERROR:CODE_INDENT: code indent should use tabs where possible
#42: FILE: drivers/gpu/drm/xe/xe_ggtt.c:90:
+        /** @start: Start offset of GGTT */$

total: 1 errors, 0 warnings, 0 checks, 120 lines checked


