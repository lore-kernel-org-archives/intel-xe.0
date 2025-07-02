Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CB5C83F03
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 22:52:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A0210E79F;
	Wed,  2 Jul 2025 22:52:26 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963A210E79F;
 Wed,  2 Jul 2025 22:52:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_LMTT_invalidation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Jul 2025 22:52:24 -0000
Message-ID: <175149674461.129624.1869912284888671621@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250702223041.1700-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250702223041.1700-1-michal.wajdeczko@intel.com>
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

Series: LMTT invalidation
URL   : https://patchwork.freedesktop.org/series/151092/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1f0daf660bbdb9161aa970264538f224029b6c8c
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Jul 3 00:30:41 2025 +0200

    drm/xe/pf: Invalidate LMTT after completing changes
    
    Once we finish populating all leaf pages in the VF's LMTT we should
    make sure that hardware will not access any stale data. Explicitly
    force LMTT invalidation (as it was already planned in the past).
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Michał Winiarski <michal.winiarski@intel.com>
    Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch 339a9f6176f6e176caa8e631859c73b34ffb07d6 drm-intel
32fcd4eeccbe drm/xe/pf: Force GuC virtualization mode
-:17: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#17: 
 [ ] xe 0000:4d:00.0: [drm] *ERROR* GT0: FAST_REQ H2G fence 0x804e failed! e=0x30, h=0

total: 0 errors, 1 warnings, 0 checks, 52 lines checked
a295b4248dfe drm/xe/pf: Invalidate LMTT during LMEM unprovisioning
-:25: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'id__' - possible side-effects?
#25: FILE: drivers/gpu/drm/xe/xe_device.h:133:
+#define for_each_gt_on_tile(gt__, tile__, id__) \
+	for ((id__) = 0; (id__) < XE_MAX_GT_PER_TILE; (id__)++) \
+		for_each_if((gt__) = xe_tile_get_gt((tile__), (id__)))

total: 0 errors, 0 warnings, 1 checks, 140 lines checked
1f0daf660bbd drm/xe/pf: Invalidate LMTT after completing changes


