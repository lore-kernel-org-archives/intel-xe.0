Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86403CCD185
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 13:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4201710E2A0;
	Fri, 10 Oct 2025 13:30:40 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4752110E2A0;
 Fri, 10 Oct 2025 13:30:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Make_struct_xe?=
 =?utf-8?q?=5Fggtt_private=2E_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 Oct 2025 13:30:39 -0000
Message-ID: <176010303928.293.5877257333970826763@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251010120655.1046007-8-dev@lankhorst.se>
In-Reply-To: <20251010120655.1046007-8-dev@lankhorst.se>
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

Series: drm/xe: Make struct xe_ggtt private. (rev5)
URL   : https://patchwork.freedesktop.org/series/139778/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1850f6effb36c31302e152dacd8252c2050dc4ee
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Fri Oct 10 14:07:02 2025 +0200

    drm/xe: Move struct xe_ggtt to xe_ggtt.c
    
    No users left outside of xe_ggtt.c, so we can make the struct private.
    
    This prevents us from accidentally touching it before init.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch a83c7590b57a56cfc1f4d9e1c07948643c9ed165 drm-intel
e27845de8524 drm/xe: Only have a single drmm release action.
95e869203dea drm/mm: Introduce address space shifting
9cdd53ebdb6f drm/xe: Start using ggtt->start in preparation of balloon removal
-:90: CHECK:SPACING: No space is necessary after a cast
#90: FILE: drivers/gpu/drm/xe/xe_ggtt.c:289:
+		ggtt_size = (gsm_size / 8) * (u64) XE_PAGE_SIZE - ggtt_start;

total: 0 errors, 0 warnings, 1 checks, 167 lines checked
a5dcf60799fa drm/xe: Rewrite GGTT VF initialisation
-:73: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#73: FILE: drivers/gpu/drm/xe/xe_ggtt.c:296:
+			xe_tile_err(ggtt->tile, "tile%u: Invalid GGTT configuration: %#llx-%#llx\n",
+				     ggtt->tile->id, ggtt_start, ggtt_start + ggtt_size - 1);

total: 0 errors, 0 warnings, 1 checks, 556 lines checked
2009f28d4a50 drm/xe: Convert xe_fb_pin to use a callback for insertion into GGTT
-:195: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#195: FILE: drivers/gpu/drm/xe/xe_ggtt.c:505:
+static int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
 			       u32 size, u32 align, u32 mm_flags)

total: 0 errors, 0 warnings, 1 checks, 321 lines checked
1850f6effb36 drm/xe: Move struct xe_ggtt to xe_ggtt.c
-:43: ERROR:CODE_INDENT: code indent should use tabs where possible
#43: FILE: drivers/gpu/drm/xe/xe_ggtt.c:91:
+        /** @start: Start offset of GGTT */$

total: 1 errors, 0 warnings, 0 checks, 120 lines checked


