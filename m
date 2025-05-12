Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134D8C3ABCD
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 11:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0F110E183;
	Mon, 12 May 2025 11:46:04 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C4010E183;
 Mon, 12 May 2025 11:46:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/vf=3A_Post-migrati?=
 =?utf-8?q?on_recovery_of_GGTT_nodes_and_CTB?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 May 2025 11:46:03 -0000
Message-ID: <174705036365.68960.7472486333967006474@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512114018.361843-1-tomasz.lis@intel.com>
In-Reply-To: <20250512114018.361843-1-tomasz.lis@intel.com>
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

Series: drm/xe/vf: Post-migration recovery of GGTT nodes and CTB
URL   : https://patchwork.freedesktop.org/series/148875/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f9aa2b7e069ff771fda446e3a8c203e4515c2d70
Author: Tomasz Lis <tomasz.lis@intel.com>
Date:   Mon May 12 13:40:18 2025 +0200

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
    v8: Introduced more helpers, fixed coding style mistakes
    v9: Move xe_map*() functs to macros, add asserts, add debug print
    v10: Errors in place of some asserts, style fixes
    v11: Fixed invalid conditionals, added debug-only local pointer
    v12: Removed redundant __maybe_unused
    
    Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 821d4254ecd4bf2182c3871c6612202470a6340f drm-intel
76fb5db30ce9 drm/xe/vf: Divide GGTT ballooning into allocation and insertion
74a00d5921a9 drm/xe/vf: Shifting GGTT area post migration
a828643e7cae drm/xe/guc: Introduce enum with offsets for context register H2Gs
f9aa2b7e069f drm/xe/vf: Fixup CTB send buffer messages after migration


