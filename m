Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E4D606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 23:33:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580AB10E82C;
	Tue, 24 Nov 2026 23:33:10 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B47210E82C;
 Tue, 24 Nov 2026 23:33:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Expose_retired_?=
 =?utf-8?q?VRAM_pages_via_drm-ras_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aravind Iddamsetty" <aravind.iddamsetty@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Nov 2026 23:33:09 -0000
Message-ID: <179556318937.81344.11884851578171850948@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261124203833.3618507-4-rodrigo.vivi@intel.com>
In-Reply-To: <20261124203833.3618507-4-rodrigo.vivi@intel.com>
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

Series: drm/xe: Expose retired VRAM pages via drm-ras (rev4)
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
commit 85e407813a7cfb4ef0522a84b71dd2e76a4d234d
Author: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Date:   Tue Nov 24 15:38:36 2026 -0500

    drm/xe: Expose retired VRAM pages via drm-ras
    
    Retired VRAM pages are only visible through the vram_bad_pages debugfs
    file today. Register a drm-ras retired-pages node so userspace gets
    them, and the maximum number of pages that can be retired, through a
    stable interface.
    
    The page lists are walked under the VRAM manager lock, and a generation
    counter on each manager lets drm-ras flag dumps that raced with a page
    being added, retired or failing its reservation.
    
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
    
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Cc: Riana Tauro <riana.tauro@intel.com>
    Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 59b46a8902d6416190f72ddc25ba74881639af3a drm-intel
bd7883acc75f drm/ras: Add retired-pages node type
-:512: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#512: FILE: drivers/gpu/drm/drm_ras_nl.c:63:
+static const struct nla_policy drm_ras_get_retired_pages_nl_policy[DRM_RAS_A_RETIRED_PAGE_ATTRS_NODE_ID + 1] = {

-:517: WARNING:LONG_LINE: line length of 117 exceeds 100 columns
#517: FILE: drivers/gpu/drm/drm_ras_nl.c:68:
+static const struct nla_policy drm_ras_get_retired_pages_info_nl_policy[DRM_RAS_A_RETIRED_PAGE_ATTRS_NODE_ID + 1] = {

total: 0 errors, 2 warnings, 0 checks, 596 lines checked
85e407813a7c drm/xe: Expose retired VRAM pages via drm-ras


