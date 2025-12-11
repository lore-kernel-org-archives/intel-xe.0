Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8E0D3E78F
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 05:50:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E493110E0D6;
	Thu, 11 Dec 2025 05:50:01 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5489810E0D6;
 Thu, 11 Dec 2025 05:50:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Page_Reclamation_Support_?=
 =?utf-8?q?for_Xe3p_Platforms_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Nguyen" <brian3.nguyen@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Dec 2025 05:50:00 -0000
Message-ID: <176543220033.75954.9882349323344688605@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251210014517.3184135-12-brian3.nguyen@intel.com>
In-Reply-To: <20251210014517.3184135-12-brian3.nguyen@intel.com>
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

Series: Page Reclamation Support for Xe3p Platforms (rev6)
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
commit d4cb4d9a2f705d421a448a8029bbd722ee34345d
Author: Brian Nguyen <brian3.nguyen@intel.com>
Date:   Wed Dec 10 09:45:28 2025 +0800

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
+ /mt/dim checkpatch 3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b drm-intel
57717484771c drm/xe: Do not forward invalid TLB invalidation seqnos to upper layers
02f792639caf drm/xe/xe_tlb_inval: Modify fence interface to support PPC flush
454b1176fa94 drm/xe: Add page reclamation info to device info
154443b2c366 drm/xe/guc: Add page reclamation interface to GuC
9cfe9c3d8afd drm/xe: Create page reclaim list on unbind
-:75: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#75: 
new file mode 100644

-:202: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "!prl->entries"
#202: FILE: drivers/gpu/drm/xe/xe_page_reclaim.h:52:
+	return prl->entries == NULL && prl->num_entries == 0;

-:287: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#287: FILE: drivers/gpu/drm/xe/xe_pt.c:1593:
+static int generate_reclaim_entry(struct xe_tile *tile,
+				   struct xe_page_reclaim_list *prl,

total: 0 errors, 1 warnings, 2 checks, 391 lines checked
281f1dd4ef2b drm/xe: Suballocate BO for page reclaim
875b1ccecd72 drm/xe: Prep page reclaim in tlb inval job
3662f1de45a8 drm/xe: Append page reclamation action to tlb inval
325cb5168fd5 drm/xe: Optimize flushing of L2$ by skipping unnecessary page reclaim
d4cb4d9a2f70 drm/xe: Add debugfs support for page reclamation


