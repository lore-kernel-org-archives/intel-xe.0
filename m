Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D16D59F5C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 23:38:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A634B10E979;
	Fri, 12 Dec 2025 23:38:00 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185C510E132;
 Fri, 12 Dec 2025 23:38:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Page_Reclamation_Support_?=
 =?utf-8?q?for_Xe3p_Platforms_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Nguyen" <brian3.nguyen@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Dec 2025 23:38:00 -0000
Message-ID: <176558268007.82816.3424486560374855848@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251212213225.3564537-12-brian3.nguyen@intel.com>
In-Reply-To: <20251212213225.3564537-12-brian3.nguyen@intel.com>
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

Series: Page Reclamation Support for Xe3p Platforms (rev7)
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
commit c35c31ddd604e0f59282c121ad0d09bc248f25da
Author: Brian Nguyen <brian3.nguyen@intel.com>
Date:   Sat Dec 13 05:32:36 2025 +0800

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
+ /mt/dim checkpatch 54801dbae9da83dcad253f7fbe0e09864bfc028f drm-intel
4cb3478f6a0a drm/xe: Do not forward invalid TLB invalidation seqnos to upper layers
4d31bf0aa58b drm/xe/xe_tlb_inval: Modify fence interface to support PPC flush
b8e55a12612a drm/xe: Add page reclamation info to device info
d4dc8ada60db drm/xe/guc: Add page reclamation interface to GuC
a77f3062b28c drm/xe: Create page reclaim list on unbind
-:74: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#74: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 391 lines checked
3847fd6c19ae drm/xe: Suballocate BO for page reclaim
75b2086c4b19 drm/xe: Prep page reclaim in tlb inval job
06e7d618619c drm/xe: Append page reclamation action to tlb inval
e3ae3d542de5 drm/xe: Optimize flushing of L2$ by skipping unnecessary page reclaim
c35c31ddd604 drm/xe: Add debugfs support for page reclamation


