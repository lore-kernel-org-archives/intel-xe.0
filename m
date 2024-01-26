Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F45BC47DDF
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 15:41:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD80C10FBA0;
	Fri, 26 Jan 2024 15:41:32 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E1310FBA0;
 Fri, 26 Jan 2024 15:41:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_L3_bank_and?=
 =?utf-8?q?_node_masks_to_topology_query?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Fri, 26 Jan 2024 15:41:31 -0000
Message-ID: <170628369109.745726.13964999138211782741@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240126153840.7-1-francois.dugast@intel.com>
In-Reply-To: <20240126153840.7-1-francois.dugast@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Add L3 bank and node masks to topology query
URL   : https://patchwork.freedesktop.org/series/129201/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2d919ac662b2798c053d68d1cc16b758c61b55ca
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cdee506c59434a26fe2f621a90fe7398e3e2450c
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Fri Jan 26 15:38:40 2024 +0000

    drm/xe: Add L3 bank and node masks to topology query
    
    Expose the masks of L3 banks and of L3 nodes to user space. L3 count is not
    sufficient because in some configuration not all banks are enabled, so user
    space needs to know which ones.
    
    Bspec: 52545, 52546, 62482
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Cc: Robert Krzemien <robert.krzemien@intel.com>
+ /mt/dim checkpatch 6aa961ab469df8db84bee01a55606a91a6ae5d67 drm-intel
cdee506c5 drm/xe: Add L3 bank and node masks to topology query
-:11: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'dd08ebf6c352', maybe rebased or not pulled?
#11: 
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

-:115: WARNING:NEW_TYPEDEFS: do not add new typedefs
#115: FILE: drivers/gpu/drm/xe/xe_gt_types.h:34:
+typedef unsigned long xe_l3_bank_mask_t[BITS_TO_LONGS(32 * XE_MAX_L3_BANK_FUSE_REGS)];

-:116: WARNING:NEW_TYPEDEFS: do not add new typedefs
#116: FILE: drivers/gpu/drm/xe/xe_gt_types.h:35:
+typedef unsigned long xe_l3_node_mask_t[BITS_TO_LONGS(32 * XE_MAX_L3_NODE_FUSE_REGS)];

total: 0 errors, 3 warnings, 0 checks, 140 lines checked


