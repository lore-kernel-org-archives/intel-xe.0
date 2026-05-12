Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C455ECD4F21
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 12:33:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7190210E0E5;
	Tue, 12 May 2026 12:33:31 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852B610EA7C;
 Tue, 12 May 2026 12:33:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_gpu/buddy=3A_Per-order_fr?=
 =?utf-8?q?ee_and_used_block_scoreboards_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 12 May 2026 12:33:30 -0000
Message-ID: <177858921053.61707.1253629425710817490@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260511164217.150237-1-francois.dugast@intel.com>
In-Reply-To: <20260511164217.150237-1-francois.dugast@intel.com>
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

Series: gpu/buddy: Per-order free and used block scoreboards (rev3)
URL   : https://patchwork.freedesktop.org/series/165914/
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
commit 1644f68e601283ea1dfcd47029099f2dcd89e3ae
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Mon May 11 18:41:06 2026 +0200

    gpu/buddy: Track per-order used blocks with a scoreboard
    
    Extend the scoreboard approach from the previous commit to used blocks,
    so drm_buddy_print() can report per-order allocation pressure in O(1).
    
    Unlike free blocks, an allocated block can leave the allocated state
    through mark_free() (normal free and gpu_buddy_block_trim()) or be
    consumed directly by gpu_block_free() during coalescing. Both sites are
    guarded by gpu_buddy_block_is_allocated() and paired with the increment
    in mark_allocated().
    
    v2:
    - Update after fix for use-after-free in split_block() call sites
    - Change goto label to out_free_used_scoreboard for clarity
    - Make drm_buddy_print() and gpu_buddy_print() symmetric for used and
      free
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Assisted-by: GitHub Copilot:claude-sonnet-4.6
+ /mt/dim checkpatch b83102e9c06357b09f2cfbe944269786cb6985c4 drm-intel
e1e022f337b4 gpu/buddy: Fix use-after-free in split_block() call sites
-:24: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#24: 
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>

-:26: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#26: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 0 errors, 2 warnings, 0 checks, 44 lines checked
d8c958ca521a gpu/buddy: Track per-order free blocks with a scoreboard
-:25: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#25: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 0 errors, 1 warnings, 0 checks, 160 lines checked
1644f68e6012 gpu/buddy: Track per-order used blocks with a scoreboard
-:22: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#22: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 0 errors, 1 warnings, 0 checks, 129 lines checked


