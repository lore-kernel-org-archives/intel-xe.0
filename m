Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A63CED25D
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 09:52:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C108110E477;
	Tue, 18 Nov 2025 09:52:37 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1506710E477;
 Tue, 18 Nov 2025 09:52:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Page_Reclamation_Support_?=
 =?utf-8?q?for_Xe3p_Platforms?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Nguyen" <brian3.nguyen@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Nov 2025 09:52:37 -0000
Message-ID: <176345955708.4988.13751059982803293809@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
In-Reply-To: <20251118090552.246243-1-brian3.nguyen@intel.com>
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

Series: Page Reclamation Support for Xe3p Platforms
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
commit ffbb6692b205691569fa88ee2715c717ee46b762
Author: Brian Nguyen <brian3.nguyen@intel.com>
Date:   Tue Nov 18 17:05:52 2025 +0800

    drm/xe: Add debugfs support for page reclamation
    
    Allow for runtime modification to page reclamation feature through
    debugfs configuration. This parameter will only take effect if the
    platform supports the page reclamation feature by default.
    
    Move xe_match_desc to common header for debugfs access to read default
    device values of xe driver for current platform.
    
    Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
+ /mt/dim checkpatch 91fc6d984707c9bfd4a60550e6a85f1a991e7ec8 drm-intel
c80c36a867f4 drm/xe: Do not forward invalid TLB invalidation seqnos to upper layers
-:9: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'review:', use 'Link:' or 'Closes:' instead
#9: 
review: https://patchwork.freedesktop.org/series/156874/

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
2adb1a2c4b56 drm/xe: Reset tlb fence timeout on invalid seqno received
ff3049866943 drm/xe/xe_tlb_inval: Modify fence interface to support PPC flush
9ed5753590f2 drm/xe: Add page reclamation info to device info
76ea654c09c9 drm/xe/guc: Add page reclamation interface to GuC
07326f2e30d0 drm/xe: Create page reclaim list on unbind
-:40: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#40: 
new file mode 100644

-:85: CHECK:COMPARISON_TO_NULL: Comparison to NULL could be written "prl->entries"
#85: FILE: drivers/gpu/drm/xe/xe_page_reclaim.c:41:
+	XE_WARN_ON(prl->entries != NULL);

total: 0 errors, 1 warnings, 1 checks, 323 lines checked
fc5e7552663a drm/xe: Suballocate BO for page reclaim
b3fb1c631f7a drm/xe: Prep page reclaim in tlb inval job
ae7c87d5ae9a drm/xe: Append page reclamation action to tlb inval
d99e1cd9c590 drm/xe: Optimize flushing of L2$ by skipping unnecessary page reclaim
ffbb6692b205 drm/xe: Add debugfs support for page reclamation


