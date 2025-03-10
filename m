Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23581C282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 22:57:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD07110E4E8;
	Mon, 10 Mar 2025 22:57:28 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2A810E43B;
 Mon, 10 Mar 2025 22:57:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_GT_initializati?=
 =?utf-8?q?on_rework=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Mar 2025 22:57:27 -0000
Message-ID: <174164744777.16215.9929157729749424036@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250310200653.89731-1-dev@lankhorst.se>
In-Reply-To: <20250310200653.89731-1-dev@lankhorst.se>
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

Series: drm/xe: GT initialization rework.
URL   : https://patchwork.freedesktop.org/series/146106/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a056a6e40747a9af6e8e642b7aad73b1db6a927d
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Mon Mar 10 21:06:53 2025 +0100

    drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early
    
    Now that we added the separate step of initialising GUC in
    xe_gt_init_early, it should be ok to initialise the minimum during early
    init, and the rest after allocations are allowed.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 9afa34d65af6f42d982c4c154121b4762e70a70a drm-intel
5db82e04abc7 drm/xe: Defer memirq init until needed
eb2cbd1f128e drm/xe/sriov: Move VF bootstrap and query_config to vf_guc_init
e0dd47df2a63 drm/xe: Simplify GuC early initialization
-:314: WARNING:LONG_LINE_COMMENT: line length of 112 exceeds 100 columns
#314: FILE: drivers/gpu/drm/xe/xe_uc.c:44:
+	/* HuC and GSC have no early dependencies and can be completely initialized during full xe_uc_init(). */

total: 0 errors, 1 warnings, 0 checks, 262 lines checked
0662e5e09f1f drm/xe: Make it possible to read instance0 MCR registers after xe_gt_mcr_init_early
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
instance 0, which fortunately means no dependencies on further initialization

total: 0 errors, 1 warnings, 0 checks, 95 lines checked
e1130fc0a684 drm/xe: Only dump PAT when xe_hw_engines_init_early fails
8e4ffdd30d82 drm/xe/gt: Inline gt_fw_domain_init
461ed200a1cb drm/xe/gt: Inline all_fw_domain_init
a056a6e40747 drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early


