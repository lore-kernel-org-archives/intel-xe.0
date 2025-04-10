Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82005C3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 12:54:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F6810E00F;
	Thu, 10 Apr 2025 12:54:26 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3ECF10E99D;
 Thu, 10 Apr 2025 12:54:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/vf=3A_Post-migrati?=
 =?utf-8?q?on_recovery_of_GGTT_nodes_and_CTB_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Apr 2025 12:54:13 -0000
Message-ID: <174428965366.56642.849663400415392027@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250409211340.3046931-1-tomasz.lis@intel.com>
In-Reply-To: <20250409211340.3046931-1-tomasz.lis@intel.com>
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

Series: drm/xe/vf: Post-migration recovery of GGTT nodes and CTB (rev7)
URL   : https://patchwork.freedesktop.org/series/141439/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c1a1f4763a24d572aa64229c6615424586cee8a0
Author: Tomasz Lis <tomasz.lis@intel.com>
Date:   Wed Apr 9 23:13:40 2025 +0200

    drm/xe/vf: Fixup CTB send buffer messages after migration
    
    During post-migration recovery of a VF, it is necessary to update
    GGTT references included in messages which are going to be sent
    to GuC. GuC will start consuming messages after VF KMD will inform
    it about fixups being done; before that, the VF KMD is expected
    to update any H2G messages which are already in send buffer but
    were not consumed by GuC.
    
    Only a small subset of messages allowed for VFs have GGTT references
    in them. This patch adds the functionality to parse the CTB send
    ring buffer and shift addresses contained within.
    
    While fixing the CTB content, ct->lock is not taken. This means
    the only barrier taken remains GGTT address lock - which is ok,
    because only requests with GGTT addresses matter, but it also means
    tail changes can happen during the CTB fixups execution (which may
    be ignored as any new messages will not have anything to fix).
    
    The GGTT address locking will be introduced in a future series.
    
    v2: removed storing shift as that's now done in VMA nodes patch;
      macros to inlines; warns to asserts; log messages fixes (Michal)
    v3: removed inline keywords, enums for offsets in CTB messages,
      less error messages, if return unused then made functs void (Michal)
    v4: update the cached head before starting fixups
    v5: removed/updated comments, wrapped lines, converted assert into
      error, enums for offsets to separate patch, reused xe_map_rd
    v6: define xe_map_*_array() macros, support CTB wrap which divides
      a message, updated comments, moved one function to an earlier patch
    v7: renamed few functions, wider use on previously introduced helper,
      separate cases in parsing messges, documented a static funct
    
    Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 85a6d35810c7e3b3db9a8c5191f12846f68620e9 drm-intel
1c44ee9b9941 drm/xe/vf: Divide GGTT ballooning into allocation and insertion
-:32: WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#32: FILE: drivers/gpu/drm/xe/xe_ggtt.c:1:
+/// SPDX-License-Identifier: MIT

-:213: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#213: FILE: drivers/gpu/drm/xe/xe_gt_sriov_vf.c:619:
+		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[0], start, end);

-:225: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#225: FILE: drivers/gpu/drm/xe/xe_gt_sriov_vf.c:627:
+		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[1], start, end);

total: 0 errors, 3 warnings, 0 checks, 273 lines checked
303a14d5716a drm/xe/vf: Shifting GGTT area post migration
e09a8cc8addc drm/xe/guc: Introduce enum with offsets for context register H2Gs
c1a1f4763a24 drm/xe/vf: Fixup CTB send buffer messages after migration
-:84: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#84: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1655:
+static void ct_fixup_ggtt_in_message(struct xe_guc_ct *ct,
+					   struct iosys_map *cmds, u32 head,

-:135: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#135: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1706:
+static int ct_fixup_ggtt_in_buffer(struct xe_guc_ct *ct, struct guc_ctb *h2g,
+					 s64 shift, u32 *mhead, s32 avail)

-:212: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#212: FILE: drivers/gpu/drm/xe/xe_guc_ct.c:1783:
+	xe_gt_err(gt, "Corrupted H2G descriptor head=%u tail=%u size=%u, fixups not applied\n",
+		 head, tail, size);

total: 0 errors, 0 warnings, 3 checks, 235 lines checked


