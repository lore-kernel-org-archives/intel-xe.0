Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7425FC87FCF
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 21:48:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3805610E010;
	Thu,  7 Aug 2025 21:48:08 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0488010E010;
 Thu,  7 Aug 2025 21:48:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/2=5D_drm/xe=3A_rename_XE=5FWA_to_XE=5FGT=5FWA?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Aug 2025 21:48:07 -0000
Message-ID: <175460328701.220879.1638467086794495017@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250807214224.32728-1-matthew.s.atwood@intel.com>
In-Reply-To: <20250807214224.32728-1-matthew.s.atwood@intel.com>
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

Series: series starting with [v2,1/2] drm/xe: rename XE_WA to XE_GT_WA
URL   : https://patchwork.freedesktop.org/series/152650/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c298eac5978c38dcc62a70c0d73c91765e7cc296
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d55fd2e7735c7a5f7fbd7a0c75f7e113360ea61f
Author: Matt Atwood <matthew.s.atwood@intel.com>
Date:   Thu Aug 7 14:42:24 2025 -0700

    drm/xe: Update function names for GT specific workarounds
    
    Now that there distinctly different OOB functions, update the names to
    reflect the IPs they interact with.
    
    Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
+ /mt/dim checkpatch 76741379fba333222be8a15bebf1e659eb84088a drm-intel
24f06721f764 drm/xe: rename XE_WA to XE_GT_WA
-:584: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gt__' - possible side-effects?
#584: FILE: drivers/gpu/drm/xe/xe_wa.h:32:
+#define XE_GT_WA(gt__, id__) ({						\
 	xe_gt_assert(gt__, (gt__)->wa_active.oob_initialized);		\
 	test_bit(XE_WA_OOB_ ## id__, (gt__)->wa_active.oob);		\
 })

total: 0 errors, 0 warnings, 1 checks, 439 lines checked
d55fd2e7735c drm/xe: Update function names for GT specific workarounds


