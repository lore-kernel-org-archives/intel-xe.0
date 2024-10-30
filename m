Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA31D5CC96
	for <intel-xe@archiver.kernel.org>; Wed, 30 Oct 2024 11:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7264F10E786;
	Wed, 30 Oct 2024 11:33:36 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC90B10E786;
 Wed, 30 Oct 2024 11:33:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_=28CI=29_drm/xe=3A_Fix_in?=
 =?utf-8?q?itial_framebuffer_handover=2E_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Oct 2024 11:33:34 -0000
Message-ID: <173028801483.1363580.6382180204875687471@2413ebb6fbb6>
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

Series: (CI) drm/xe: Fix initial framebuffer handover. (rev3)
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
commit 8c6276bf545980ace1161281f0c2b2948f78d152
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Tue Oct 29 16:00:05 2024 +0100

    drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early
    
    Now that we added the separate step of initialising GUC in
    xe_gt_init_early, it should be ok to initialise the minimum during early
    init, and the rest after allocations are allowed.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch dc3552b1791e1f3bbeab6abbe964d99178b34241 drm-intel
2a3078315ee4 drm/xe: Remove double pageflip
148fdc3898ec drm/i915/display: Use async flip when available for initial plane config
f9cec740fa99 drm/xe: Move suballocator init to after display init
845ca9d010a5 drm/xe: Defer irq init until after xe_display_init_noaccel
28a8f22d23fa drm/xe/display: Use a single early init call for display
a115ae08a0f7 drm/xe/sriov: Move VF bootstrap and query_config to vf_guc_init
405370e94cdf drm/xe: Simplify GuC early initialisation
-:329: WARNING:LONG_LINE_COMMENT: line length of 112 exceeds 100 columns
#329: FILE: drivers/gpu/drm/xe/xe_uc.c:47:
+	/* HuC and GSC have no early dependencies and can be completely initialised during full xe_uc_init(). */

total: 0 errors, 1 warnings, 0 checks, 274 lines checked
8c6276bf5459 drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early


