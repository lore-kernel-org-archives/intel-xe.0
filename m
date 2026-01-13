Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CC1D29DE8
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 08:44:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE1710E475;
	Tue, 13 Jan 2026 08:44:06 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A6D10E473;
 Tue, 13 Jan 2026 08:44:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Privatize_struc?=
 =?utf-8?q?t_xe=5Fggtt=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Jan 2026 08:44:05 -0000
Message-ID: <176829384534.148910.17366634511692828529@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260113083702.1276449-1-dev@lankhorst.se>
In-Reply-To: <20260113083702.1276449-1-dev@lankhorst.se>
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

Series: drm/xe: Privatize struct xe_ggtt.
URL   : https://patchwork.freedesktop.org/series/160006/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
ee83616c430ce70bd254bd2774d143a5733c8666
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cfb4a50d0b36ea92586a075f674a6c89c519427b
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Tue Jan 13 09:37:01 2026 +0100

    drm/xe: Remove xe_ggtt_node_allocated
    
    With the intermediate state gone, no longer useful. Just check against
    NULL where needed.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 868ad9166fa094185c18c3343d7944ff2171f9d3 drm-intel
b758e7ed9b36 drm/xe: Make xe_ggtt_node offset relative to starting offset
-:53: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#53: FILE: drivers/gpu/drm/xe/xe_ggtt.c:583:
+			 xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + node->base.size, ERR_PTR(err)))

total: 0 errors, 1 warnings, 0 checks, 72 lines checked
aee5883e3d93 drm/xe: Rewrite GGTT VF initialisation
-:18: WARNING:BAD_SIGN_OFF: Co-developed-by: must be immediately followed by Signed-off-by:
#18: 
Co-developed-by: Matthew Brost <matthew.brost@intel.com>


-:61: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#61: FILE: drivers/gpu/drm/xe/xe_ggtt.c:357:
+			xe_tile_err(ggtt->tile, "tile%u: Invalid GGTT configuration: %#llx-%#llx\n",
+				     ggtt->tile->id, ggtt_start, ggtt_start + ggtt_size - 1);

total: 0 errors, 1 warnings, 1 checks, 570 lines checked
523fd7f71108 drm/xe: Move struct xe_ggtt to xe_ggtt.c
-:46: ERROR:CODE_INDENT: code indent should use tabs where possible
#46: FILE: drivers/gpu/drm/xe/xe_ggtt.c:112:
+        /** @start: Start offset of GGTT */$

total: 1 errors, 0 warnings, 0 checks, 142 lines checked
dea2c9c09c0d drm/xe: Make xe_ggtt_node_insert return a node
cfb4a50d0b36 drm/xe: Remove xe_ggtt_node_allocated


