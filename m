Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD885D111BD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 23:52:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FE810E69F;
	Wed, 26 Nov 2025 23:52:47 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02DF10E69F;
 Wed, 26 Nov 2025 23:52:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Page_Reclamation_Support_?=
 =?utf-8?q?for_Xe3p_Platforms_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Nguyen" <brian3.nguyen@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Nov 2025 23:52:46 -0000
Message-ID: <176420116678.30433.10388291689200647199@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
In-Reply-To: <20251126230201.3782788-13-brian3.nguyen@intel.com>
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

Series: Page Reclamation Support for Xe3p Platforms (rev2)
URL   : https://patchwork.freedesktop.org/series/157698/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 564fb1e7bfacf493cc57eb3aee9df1d1194597bd
Author: Brian Nguyen <brian3.nguyen@intel.com>
Date:   Thu Nov 27 07:02:12 2025 +0800

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
    Cc: Shuicheng Lin <shuicheng.lin@intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch e7a767430515c3a6e8aee91c2a68cba8b06fe884 drm-intel
185c78ff59db drm/xe: Do not forward invalid TLB invalidation seqnos to upper layers
-:9: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'review:', use 'Link:' or 'Closes:' instead
#9: 
review: https://patchwork.freedesktop.org/series/156874/

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
77b733648b55 drm/xe: Reset tlb fence timeout on invalid seqno received
64cb7255c2a2 drm/xe/xe_tlb_inval: Modify fence interface to support PPC flush
6071cc4cbea5 drm/xe: Add page reclamation info to device info
1231b1317300 drm/xe/guc: Add page reclamation interface to GuC
6d88e728b768 drm/xe: Create page reclaim list on unbind
-:59: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#59: 
new file mode 100644

-:272: CHECK:BRACES: Unbalanced braces around else statement
#272: FILE: drivers/gpu/drm/xe/xe_pt.c:1620:
+	else {

total: 0 errors, 1 warnings, 1 checks, 360 lines checked
54eeca15e88f drm/xe: Suballocate BO for page reclaim
82227ca52b82 drm/xe: Prep page reclaim in tlb inval job
4a1e3caffb25 drm/xe: Append page reclamation action to tlb inval
c50321a54a05 drm/xe: Optimize flushing of L2$ by skipping unnecessary page reclaim
564fb1e7bfac drm/xe: Add debugfs support for page reclamation


