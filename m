Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03B8D3B7EA
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 07:41:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9EC10E48D;
	Tue,  9 Dec 2025 07:41:15 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616A310E48B;
 Tue,  9 Dec 2025 07:41:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Page_Reclamation_Support_?=
 =?utf-8?q?for_Xe3p_Platforms_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Nguyen" <brian3.nguyen@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Dec 2025 07:41:14 -0000
Message-ID: <176526607439.68390.10415302711586867301@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251209073438.2432701-12-brian3.nguyen@intel.com>
In-Reply-To: <20251209073438.2432701-12-brian3.nguyen@intel.com>
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

Series: Page Reclamation Support for Xe3p Platforms (rev3)
URL   : https://patchwork.freedesktop.org/series/157698/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8f50e69d0ce3656564bbdf8b3e213d61470d463f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2a4773e6faef874f172939a2b38bfefbffade996
Author: Brian Nguyen <brian3.nguyen@intel.com>
Date:   Tue Dec 9 15:34:49 2025 +0800

    drm/xe: Add debugfs support for page reclamation
    
    Allow for runtime modification to page reclamation feature through
    debugfs configuration. This parameter will only take effect if the
    platform supports the page reclamation feature by default.
    
    v2:
     - Minor comment tweaks. (Shuicheng)
     - Convert to kstrtobool_from_user. (Michal)
     - Only expose page reclaim file if page reclaim flag
       initially supported and with that, remove
       xe_match_desc usage. (Michal)
    
    Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 48deab361d3b570e2210875fdc8ffb29627d054f drm-intel
44c5dd67e3ea drm/xe: Do not forward invalid TLB invalidation seqnos to upper layers
d427b41a8c1f drm/xe/xe_tlb_inval: Modify fence interface to support PPC flush
2b471297befe drm/xe: Add page reclamation info to device info
60aff36b7002 drm/xe/guc: Add page reclamation interface to GuC
cd33019ac542 drm/xe: Create page reclaim list on unbind
-:64: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#64: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 370 lines checked
7e31f9097b49 drm/xe: Suballocate BO for page reclaim
e11d79776eca drm/xe: Prep page reclaim in tlb inval job
-:35: ERROR:CODE_INDENT: code indent should use tabs where possible
#35: FILE: drivers/gpu/drm/xe/xe_pt.c:2517:
+ ^I^I */$

-:35: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#35: FILE: drivers/gpu/drm/xe/xe_pt.c:2517:
+ ^I^I */$

total: 1 errors, 1 warnings, 0 checks, 85 lines checked
81fb5345daec drm/xe: Append page reclamation action to tlb inval
47afcb1491dd drm/xe: Optimize flushing of L2$ by skipping unnecessary page reclaim
2a4773e6faef drm/xe: Add debugfs support for page reclamation


