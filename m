Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C79606A31F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 18:27:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACB010E044;
	Fri, 27 Nov 2026 18:27:34 +0000 (UTC)
Received: from 8b00d9f022d5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E6310E044;
 Fri, 27 Nov 2026 18:27:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Expose_retired_?=
 =?utf-8?q?VRAM_pages_via_drm-ras_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aravind Iddamsetty" <aravind.iddamsetty@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Nov 2026 18:27:32 -0000
Message-ID: <179580405242.2085.8355777064759224944@8b00d9f022d5>
X-Patchwork-Hint: ignore
References: <20261127181750.806528-5-rodrigo.vivi@intel.com>
In-Reply-To: <20261127181750.806528-5-rodrigo.vivi@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/xe: Expose retired VRAM pages via drm-ras (rev6)
URL   : https://patchwork.freedesktop.org/series/173066/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8af6f44e24df8a185a68965ea0e0068b0ba57438
Author: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Date:   Fri Nov 27 13:17:54 2026 -0500

    drm/xe: Expose retired VRAM pages via drm-ras
    
    Retired VRAM pages are only visible through the vram_bad_pages debugfs
    file today. Register a drm-ras retired-pages node so userspace gets
    them, and the maximum number of pages that can be retired, through a
    stable interface.
    
    The snapshot of the dump is taken in one pass over the page lists of
    each VRAM manager, under its lock.
    
    v3 (Rodrigo+LLM):
     - Use the drm-ras retired-pages node type, which replaces the nested
       retired-resources layout (Jakub).
     - Walk the lists under mgr->lock instead of RCU, which they are not
       protected by, and stop reading the buddy blocks (Sashiko).
     - Add a generation counter for interrupted dumps.
     - Keep the vram_bad_pages debugfs file for now.
     - Remove deprecated Assisted-by tag.
    
    v4 (Rodrigo+LLM):
     - Register the node at the end of xe_ras_init(), once the retired page
       lists are fetched. That point is only reached with a system
       controller, which replaces the XE_CRESCENTISLAND check and keeps the
       node off VFs (local Sashiko).
     - Report the list generation also when no page is left (local Sashiko).
    
    v6 (Rodrigo+LLM):
     - Add the pages to the drm-ras snapshot in one pass over the page
       lists, instead of a walk per page, and drop the generation counter
       (Riana).
     - Do not read the pages of an unplugged device (Riana).
     - Return -EINVAL when firmware reports no max pages (Riana).
     - Do not register the node when page offlining is disabled, and do not
       fail probe if the registration fails (Riana).
    
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Riana Tauro <riana.tauro@intel.com>
    Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 49d98d4e9c54dfb3650d39a80c2cd95e0a9f1b61 drm-intel
87005c9a31e3 drm/ras: Check the node type in node lookups
9d5dba896a28 drm/ras: Add retired-pages node type
-:511: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#511: FILE: drivers/gpu/drm/drm_ras_nl.c:63:
+static const struct nla_policy drm_ras_get_retired_pages_nl_policy[DRM_RAS_A_RETIRED_PAGE_ATTRS_NODE_ID + 1] = {

-:516: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#516: FILE: drivers/gpu/drm/drm_ras_nl.c:68:
+static const struct nla_policy drm_ras_get_retired_pages_info_nl_policy[DRM_RAS_A_RETIRED_PAGE_ATTRS_NODE_ID + 1] = {

total: 0 errors, 2 warnings, 0 checks, 626 lines checked
8af6f44e24df drm/xe: Expose retired VRAM pages via drm-ras


