Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EE5C48BF8
	for <intel-xe@archiver.kernel.org>; Mon, 19 Feb 2024 17:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D903110E270;
	Mon, 19 Feb 2024 17:00:16 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7805910E118;
 Mon, 19 Feb 2024 17:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?2=2C1/3=5D_drm/buddy=3A_fix_range_bias_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 Feb 2024 17:00:15 -0000
Message-ID: <170836201548.89494.13299486225892628569@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240219121851.25774-4-matthew.auld@intel.com>
In-Reply-To: <20240219121851.25774-4-matthew.auld@intel.com>
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

Series: series starting with [v2,1/3] drm/buddy: fix range bias (rev2)
URL   : https://patchwork.freedesktop.org/series/130074/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d8b99215b1f26f7b44e799497e3f89c6466cf1e2
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Mon Feb 19 12:18:54 2024 +0000

    drm/tests/drm_buddy: add alloc_range_bias test
    
    Sanity check range bias with DRM_BUDDY_RANGE_ALLOCATION.
    
    v2:
      - Be consistent with u32 here.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
    Cc: Christian König <christian.koenig@amd.com>
    Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
+ /mt/dim checkpatch f12bce6493b6443870b55f36b1462d65e450d29d drm-intel
ff2363b071bb drm/buddy: fix range bias
2e4438836576 drm/buddy: check range allocation matches alignment
d8b99215b1f2 drm/tests/drm_buddy: add alloc_range_bias test
-:37: WARNING:LINE_SPACING: Missing a blank line after declarations
#37: FILE: drivers/gpu/drm/tests/drm_buddy_test.c:27:
+	u32 mm_size, ps, bias_size, bias_start, bias_end, bias_rem;
+	DRM_RND_STATE(prng, random_seed);

-:45: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#45: FILE: drivers/gpu/drm/tests/drm_buddy_test.c:35:
+	mm_size = (SZ_8M-1) & ~(ps-1); /* Multiple roots */
 	                ^

-:45: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#45: FILE: drivers/gpu/drm/tests/drm_buddy_test.c:35:
+	mm_size = (SZ_8M-1) & ~(ps-1); /* Multiple roots */
 	                          ^

-:106: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#106: FILE: drivers/gpu/drm/tests/drm_buddy_test.c:96:
+				      bias_start + ps, bias_end - ps, bias_size >> 1, bias_size >> 1);

-:216: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#216: FILE: drivers/gpu/drm/tests/drm_buddy_test.c:206:
+				bias_end += round_up(prandom_u32_state(&prng) % (mm_size - bias_end), ps);

total: 0 errors, 3 warnings, 2 checks, 246 lines checked


