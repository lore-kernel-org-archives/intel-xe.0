Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A1FFF885A
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 15:43:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1107310E3E3;
	Mon,  4 May 2026 15:43:16 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F39210E3C5;
 Mon,  4 May 2026 15:43:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_gpu/buddy=3A_Per-order_fr?=
 =?utf-8?q?ee_and_used_block_scoreboards?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 04 May 2026 15:43:14 -0000
Message-ID: <177790939425.35772.8135583948756758799@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260504135343.1797869-1-francois.dugast@intel.com>
In-Reply-To: <20260504135343.1797869-1-francois.dugast@intel.com>
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

Series: gpu/buddy: Per-order free and used block scoreboards
URL   : https://patchwork.freedesktop.org/series/165914/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c8c12e558adaef7a4d125d83b6e1f8824bc13b82
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9f4f941cfd0d7c0a98dd0713cff5d28597dc1440
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Mon May 4 15:52:42 2026 +0200

    gpu/buddy: Track per-order used blocks with a scoreboard
    
    Extend the scoreboard approach from the previous commit to used blocks,
    so drm_buddy_print() can report per-order allocation pressure in O(1).
    
    Unlike free blocks, an allocated block can leave the allocated state
    through mark_free() (normal free and gpu_buddy_block_trim()) or be
    consumed directly by gpu_block_free() during coalescing. Both sites are
    guarded by gpu_buddy_block_is_allocated() and paired with the increment
    in mark_allocated().
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Assisted-by: GitHub Copilot:claude-sonnet-4.6
+ /mt/dim checkpatch e798c5cca30e83c5793aa3d6f22456e39eeb219c drm-intel
57294be1773b gpu/buddy: Track per-order free blocks with a scoreboard
-:22: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#22: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 0 errors, 1 warnings, 0 checks, 132 lines checked
9f4f941cfd0d gpu/buddy: Track per-order used blocks with a scoreboard
-:16: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#16: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

total: 0 errors, 1 warnings, 0 checks, 108 lines checked


