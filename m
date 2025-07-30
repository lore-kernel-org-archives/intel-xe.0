Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F535C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 18:26:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D2F10E226;
	Wed, 30 Jul 2025 18:26:41 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9439810E226;
 Wed, 30 Jul 2025 18:26:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_rename_XE=5FWA_?=
 =?utf-8?q?to_XE=5FGT=5FWA?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Atwood" <matthew.s.atwood@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Jul 2025 18:26:40 -0000
Message-ID: <175390000060.199997.8918016207398582099@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250730172341.990800-1-matthew.s.atwood@intel.com>
In-Reply-To: <20250730172341.990800-1-matthew.s.atwood@intel.com>
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

Series: drm/xe: rename XE_WA to XE_GT_WA
URL   : https://patchwork.freedesktop.org/series/152301/
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
commit 760b921ea2a76d0a8b0d516997782e297692cb56
Author: Matt Atwood <matthew.s.atwood@intel.com>
Date:   Wed Jul 30 10:23:41 2025 -0700

    drm/xe: rename XE_WA to XE_GT_WA
    
    Now that there are two types of wa tables and infrastructure, be more
    concise in the naming of GT wa macros.
    
    Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
+ /mt/dim checkpatch e1805ad9a7175457902ae453ea67b76194e7d796 drm-intel
760b921ea2a7 drm/xe: rename XE_WA to XE_GT_WA
-:586: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'gt__' - possible side-effects?
#586: FILE: drivers/gpu/drm/xe/xe_wa.h:32:
+#define XE_GT_WA(gt__, id__) ({						\
 	xe_gt_assert(gt__, (gt__)->wa_active.oob_initialized);		\
 	test_bit(XE_WA_OOB_ ## id__, (gt__)->wa_active.oob);		\
 })

total: 0 errors, 0 warnings, 1 checks, 443 lines checked


