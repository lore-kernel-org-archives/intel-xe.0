Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F73C072A2
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 06:48:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553A610E5B5;
	Wed, 22 Nov 2023 06:48:59 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id BF9FD10E5A1;
 Wed, 22 Nov 2023 06:48:57 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id BB354AADD7;
 Wed, 22 Nov 2023 06:48:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Date: Wed, 22 Nov 2023 06:48:57 -0000
Message-ID: <170063573776.4727.12442568340307191031@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231121140502.9793-1-dev@lankhorst.se>
In-Reply-To: <20231121140502.9793-1-dev@lankhorst.se>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/4=5D_drm=3A_Add_drm=5Fvblank=5Fwork=5Ff?=
 =?utf-8?b?bHVzaF9hbGwoKS4=?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [1/4] drm: Add drm_vblank_work_flush_all().
URL   : https://patchwork.freedesktop.org/series/126715/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 73c18e311b46f8aface54668cd3d31b21bdc5bc1
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Tue Nov 21 15:05:02 2023 +0100

    drm/i915: Use the same vblank worker for atomic unpin
    
    In case of legacy cursor update, the cursor VMA needs to be unpinned
    only after vblank. This exceeds the lifetime of the whole atomic commit.
    
    Any trick I attempted to keep the atomic commit alive didn't work, as
    drm_atomic_helper_setup_commit() force throttles on any old commit that
    wasn't cleaned up.
    
    The only option remaining is to remove the plane from the atomic commit,
    and use the same path as the legacy cursor update to clean the state
    after vblank.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch 89e2bb1e155242dd9aa46bc90e563e71c5f498b0 drm-intel
cc92fb9ce drm: Add drm_vblank_work_flush_all().
-:33: WARNING:WAITQUEUE_ACTIVE: waitqueue_active without comment
#33: FILE: drivers/gpu/drm/drm_vblank_work.c:246:
+			    waitqueue_active(&vblank->work_wait_queue),

total: 0 errors, 1 warnings, 0 checks, 41 lines checked
5a0f83592 drm/xe/display: Cache pinned ggtt_vma's.
3d029049f drm/i915: Use vblank worker to unpin old legacy cursor fb safely
73c18e311 drm/i915: Use the same vblank worker for atomic unpin
-:46: WARNING:TYPO_SPELLING: 'succesful' may be misspelled - perhaps 'successful'?
#46: FILE: drivers/gpu/drm/i915/display/intel_atomic_plane.c:1168:
+	 * This branch can only ever be called after plane update is succesful,
 	                                                             ^^^^^^^^^

-:127: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#127: FILE: drivers/gpu/drm/i915/display/intel_crtc.c:746:
+							 drm_crtc_accurate_vblank_count(&crtc->base) + 1,

total: 0 errors, 2 warnings, 0 checks, 118 lines checked


