Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BF8CE7B04
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:35:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E59410E0FF;
	Sat,  7 Sep 2024 00:35:38 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B8B10E0FF;
 Sat,  7 Sep 2024 00:35:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Don=27t_keep_st?=
 =?utf-8?q?ale_pointer_to_bo-=3Eggtt=5Fnode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 07 Sep 2024 00:35:36 -0000
Message-ID: <172566933641.955480.12674291012338952860@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240906220348.1836-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240906220348.1836-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Don't keep stale pointer to bo->ggtt_node
URL   : https://patchwork.freedesktop.org/series/138351/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1087e4ded0074100ac72b13e76a3a398090434c5
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Sat Sep 7 00:03:48 2024 +0200

    drm/xe: Don't keep stale pointer to bo->ggtt_node
    
    When we fail to map a BO in the GGTT, we release our GGTT node
    placeholder, but leave stale bo->ggtt_node pointer to it, which
    triggers an assert immediately followed by a crash, due to UAF:
    
    [ ] xe 0000:00:02.0: [drm] Assertion `bo->ggtt_node->base.size == bo->size` failed!
    [ ] WARNING: CPU: 4 PID: 126 at drivers/gpu/drm/xe/xe_ggtt.c:689 xe_ggtt_remove_bo+0x1d9/0x250 [xe]
    [ ] RIP: 0010:xe_ggtt_remove_bo+0x1d9/0x250 [xe]
    [ ] Call Trace:
    [ ]  <TASK>
    [ ]  ? __warn+0x88/0x190
    [ ]  ? xe_ggtt_remove_bo+0x1d9/0x250 [xe]
    [ ]  ? report_bug+0x1c3/0x1d0
    [ ]  ? handle_bug+0x42/0x70
    [ ]  ? exc_invalid_op+0x14/0x70
    [ ]  ? asm_exc_invalid_op+0x16/0x20
    [ ]  ? xe_ggtt_remove_bo+0x1d9/0x250 [xe]
    [ ]  ? xe_ggtt_remove_bo+0x1d9/0x250 [xe]
    [ ]  xe_ttm_bo_destroy+0x11f/0x260 [xe]
    [ ]  ? ttm_bo_release+0x31c/0x350 [ttm]
    [ ]  ? __mutex_unlock_slowpath+0x35/0x270
    [ ]  __xe_bo_create_locked+0x4a0/0x550 [xe]
    [ ]  ? mark_held_locks+0x49/0x80
    [ ]  xe_bo_create_pin_map_at+0x37/0x200 [xe]
    [ ]  xe_bo_create_pin_map+0x11/0x20 [xe]
    
    While around, for similar reason, also don't keep an error pointer
    if we fail to allocate ggtt_node placeholder.
    
    Fixes: 34e804220f69 ("drm/xe: Make xe_ggtt_node struct independent")
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 217031ad4c962ee8b1b7ac4b30323b4e2ac6d12a drm-intel
1087e4ded007 drm/xe: Don't keep stale pointer to bo->ggtt_node
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
[ ] xe 0000:00:02.0: [drm] Assertion `bo->ggtt_node->base.size == bo->size` failed!

total: 0 errors, 1 warnings, 0 checks, 21 lines checked


