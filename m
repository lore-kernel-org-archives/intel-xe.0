Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F9CC4829E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 17:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C7A10EA18;
	Thu, 15 Feb 2024 17:55:13 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489CA10EA18;
 Thu, 15 Feb 2024 17:55:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/6=5D_drm/tests/drm=5Fbuddy=3A_fix_32b_build?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Feb 2024 17:55:12 -0000
Message-ID: <170801971228.925.4732925969973989413@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240215174431.285069-7-matthew.auld@intel.com>
In-Reply-To: <20240215174431.285069-7-matthew.auld@intel.com>
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

Series: series starting with [1/6] drm/tests/drm_buddy: fix 32b build
URL   : https://patchwork.freedesktop.org/series/129959/
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
commit 6c9220b2126e607c1db7fb421beedef489a1e3ed
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Thu Feb 15 17:44:37 2024 +0000

    drm/xe/stolen: ignore first page for FBC
    
    Seems like we can potentially hit underruns if the CFB offset is within
    the first page of stolen. Just like i915 skip the first page.
    
    BSpec: 50214
    Reported-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch 6d3abf8f7f55420cf53e9ed344872c459ecfd0ed drm-intel
dcf6e94b2 drm/tests/drm_buddy: fix 32b build
-:13: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'a64056bb5a32', maybe rebased or not pulled?
#13: 
Fixes: a64056bb5a32 ("drm/tests/drm_buddy: add alloc_contiguous test")

-:14: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#14: 
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>

total: 0 errors, 2 warnings, 0 checks, 58 lines checked
ced6d65ea drm/buddy: fix range bias
-:17: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'afea229fe102', maybe rebased or not pulled?
#17: 
Fixes: afea229fe102 ("drm: improve drm_buddy_alloc function")

total: 0 errors, 1 warnings, 0 checks, 22 lines checked
f3a83c419 drm/buddy: check range allocation matches alignment
25157ea52 drm/tests/drm_buddy: add alloc_range_bias test
-:33: WARNING:LINE_SPACING: Missing a blank line after declarations
#33: FILE: drivers/gpu/drm/tests/drm_buddy_test.c:27:
+	u32 mm_size, ps, bias_size, bias_start, bias_end, bias_rem;
+	DRM_RND_STATE(prng, random_seed);

-:41: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#41: FILE: drivers/gpu/drm/tests/drm_buddy_test.c:35:
+	mm_size = (SZ_8M-1) & ~(ps-1); /* Multiple roots */
 	                ^

-:41: CHECK:SPACING: spaces preferred around that '-' (ctx:VxV)
#41: FILE: drivers/gpu/drm/tests/drm_buddy_test.c:35:
+	mm_size = (SZ_8M-1) & ~(ps-1); /* Multiple roots */
 	                          ^

-:102: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#102: FILE: drivers/gpu/drm/tests/drm_buddy_test.c:96:
+				      bias_start + ps, bias_end - ps, bias_size >> 1, bias_size >> 1);

-:212: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#212: FILE: drivers/gpu/drm/tests/drm_buddy_test.c:206:
+				bias_end += round_up(prandom_u32_state(&prng) % (mm_size - bias_end), ps);

total: 0 errors, 3 warnings, 2 checks, 246 lines checked
8a21ade8c drm/xe/stolen: lower the default alignment
6c9220b21 drm/xe/stolen: ignore first page for FBC
-:10: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#10: 
Reported-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>

total: 0 errors, 1 warnings, 0 checks, 9 lines checked


