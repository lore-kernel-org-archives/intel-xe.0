Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AEDD3A67D
	for <intel-xe@archiver.kernel.org>; Wed, 30 Oct 2024 09:31:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383C310E76D;
	Wed, 30 Oct 2024 09:31:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5AAB10E76C;
 Wed, 30 Oct 2024 09:31:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_=28CI=29_drm/xe=3A_Fix_in?=
 =?utf-8?q?itial_framebuffer_handover=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Oct 2024 09:31:41 -0000
Message-ID: <173028070193.1363061.17504924043012601091@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241029150005.68440-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20241029150005.68440-1-maarten.lankhorst@linux.intel.com>
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

Series: (CI) drm/xe: Fix initial framebuffer handover. (rev2)
URL   : https://patchwork.freedesktop.org/series/140671/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 42dda3946eefb01aab6d1c1b28d7d8b860532b23
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Tue Oct 29 16:00:05 2024 +0100

    drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early
    
    Now that we added the separate step of initialising GUC in
    xe_gt_init_early, it should be ok to initialise the minimum during early
    init, and the rest after allocations are allowed.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch b79238531f1e5a4f707fdc34bb6a32325bce10c7 drm-intel
f6874ca7082e drm/xe: Remove double pageflip
60d9042119cc drm/i915/display: Use async flip when available for initial plane config
8c2804d4f650 drm/xe: Move suballocator init to after display init
4d8a4fce8ae8 drm/xe: Defer irq init until after xe_display_init_noaccel
4d45d3aabb5d drm/xe/display: Use a single early init call for display
814ead78af9a drm/xe/sriov: Move VF bootstrap and query_config to vf_guc_init
357200742b12 drm/xe: Simplify GuC early initialisation
-:316: WARNING:LONG_LINE_COMMENT: line length of 112 exceeds 100 columns
#316: FILE: drivers/gpu/drm/xe/xe_uc.c:47:
+	/* HuC and GSC have no early dependencies and can be completely initialised during full xe_uc_init(). */

total: 0 errors, 1 warnings, 0 checks, 266 lines checked
42dda3946eef drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early


