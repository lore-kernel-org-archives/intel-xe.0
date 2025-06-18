Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4CDC7115A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 10:53:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B1410E802;
	Wed, 18 Jun 2025 10:53:11 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF5E710E7FB;
 Wed, 18 Jun 2025 10:53:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Init_changes_fo?=
 =?utf-8?q?r_flicker-free_boot=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Jun 2025 10:53:09 -0000
Message-ID: <175024398984.90433.7591052555865441313@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250617180132.7059-11-dev@lankhorst.se>
In-Reply-To: <20250617180132.7059-11-dev@lankhorst.se>
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

Series: drm/xe: Init changes for flicker-free boot. (rev2)
URL   : https://patchwork.freedesktop.org/series/150410/
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
commit 1facf7bc90b3d63146fb22e2891919c0142b4f10
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Tue Jun 17 20:01:42 2025 +0200

    drm/xe: Move xe_ttm_sys_mgr_init() downwards.
    
    Now that all previous allocations are gone, ensure no new allocations
    will ever be done before xe_display_init_early(), by moving the call
    that allows allocations downwards.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 55cbd02fa784e94b4f658c1e547371ac804c62a9 drm-intel
f37278d9ef40 drm/xe: Defer memirq init until needed
a5c5b3896db3 drm/xe/sriov: Move VF bootstrap and query_config to vf_guc_init
5ca72a785b4a drm/xe: Simplify GuC early initialization
-:254: WARNING:LONG_LINE_COMMENT: line length of 112 exceeds 100 columns
#254: FILE: drivers/gpu/drm/xe/xe_uc.c:44:
+	/* HuC and GSC have no early dependencies and can be completely initialized during full xe_uc_init(). */

total: 0 errors, 1 warnings, 0 checks, 220 lines checked
12a9fc098405 drm/xe: Make it possible to read instance0 MCR registers after xe_gt_mcr_init_early
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
instance 0, which fortunately means no dependencies on further initialization

total: 0 errors, 1 warnings, 0 checks, 95 lines checked
fe8ffefbe314 drm/xe: Only dump PAT when xe_hw_engines_init_early fails
6d3c90018a65 drm/xe/gt: Inline gt_fw_domain_init
545acf75ec34 drm/xe/gt: Inline all_fw_domain_init
73f6f1919a26 drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early
1facf7bc90b3 drm/xe: Move xe_ttm_sys_mgr_init() downwards.


