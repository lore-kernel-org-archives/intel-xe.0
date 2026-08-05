Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A2BC55174
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 06:59:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D47C10E1A4;
	Wed,  5 Aug 2026 06:59:16 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C4410ED37;
 Wed,  5 Aug 2026 06:59:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/tests/gpu=5Fbuddy=3A_?=
 =?utf-8?q?fix_interleaving_in_buffer_clearance_test_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Aug 2026 06:59:14 -0000
Message-ID: <178591315472.20166.14494092580725738002@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260803065656.2960810-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20260803065656.2960810-1-Arunpravin.PaneerSelvam@amd.com>
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

Series: drm/tests/gpu_buddy: fix interleaving in buffer clearance test (rev3)
URL   : https://patchwork.freedesktop.org/series/170880/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 480d09dbc00089a146e933a5ee249b8274f5cb3a
Author: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Date:   Mon Aug 3 12:26:56 2026 +0530

    drm/tests/gpu_buddy: fix interleaving in buffer clearance test
    
    The resume clearance test skipped every other allocation, expecting an
    interleaved clear/dirty layout. But the buddy allocator hands out blocks
    contiguously, so this just allocated half the pages in one chunk and never
    exercised gpu_buddy_reset_clear()'s force-merge of opposite-state buddies.
    Allocate all pages into two lists instead and free one cleared, one dirty,
    to build a truly interleaved pattern.
    
    v2: Use for loops instead of do-while for the allocation loops (Jani Nikula)
    
    Fixes: e3335ccbf4da ("drm/tests/gpu_buddy: add a new test case for buffer clearance during resume")
    Reported-by: Sashiko-bot <sashiko-bot@kernel.org>
    Closes: https://sashiko.dev/#/patchset/20260721114236.507578-1-Arunpravin.PaneerSelvam@amd.com?part=1
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Christian König <christian.koenig@amd.com>
    Assisted-by: GitHub_Copilot:claude-opus-4.8
    Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
+ /mt/dim checkpatch c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23 drm-intel
480d09dbc000 drm/tests/gpu_buddy: fix interleaving in buffer clearance test
-:17: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#17: 
v2: Use for loops instead of do-while for the allocation loops (Jani Nikula)

total: 0 errors, 1 warnings, 0 checks, 75 lines checked


