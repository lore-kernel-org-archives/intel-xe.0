Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82373CAC5B0
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 22:10:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F8210E9BE;
	Thu, 25 Sep 2025 22:10:55 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7955B10E9BE;
 Thu, 25 Sep 2025 22:10:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pf=3A_Refactor_PF_?=
 =?utf-8?q?debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Sep 2025 22:10:53 -0000
Message-ID: <175883825348.368461.29586514227156661@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250925220425.196860-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250925220425.196860-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/pf: Refactor PF debugfs
URL   : https://patchwork.freedesktop.org/series/155064/
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
commit 17aa2987f7105826b7dbc5d2af0ab6ec18a5b668
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Sep 26 00:04:23 2025 +0200

    drm/xe/pf: Make GGTT/LMEM debugfs files per-tile
    
    Due to initial design of the Xe debugfs, the GGTT and LMEM files
    were defined on the primary GT, instead of being per-tile.
    
    While PF provisioning code is now still maintaining GGTT and LMEM
    also on the per primary-GT level, this will be refactored soon,
    but we can fix debugfs layout now, as part of the new SR-IOV tree.
    
    For backward compatibility we will provide some symlinks that can
    be removed once our tools will be fully converted.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 927b4d44359a2e2b1782f80bb5302950d8a7cb6d drm-intel
e123ce396804 drm/xe/pf: Promote PF debugfs function to its own file
-:115: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#115: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 107 lines checked
1b8194dd240d drm/xe/pf: Create separate debugfs tree for SR-IOV files
879423278532 drm/xe/pf: Populate SR-IOV debugfs tree with tiles
-:81: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#81: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 166 lines checked
cd1cdaa7ba06 drm/xe/pf: Move SR-IOV GT debugfs files to new tree
4ed2fa24afcc drm/xe/debugfs: Promote xe_tile_debugfs_simple_show
17aa2987f710 drm/xe/pf: Make GGTT/LMEM debugfs files per-tile


