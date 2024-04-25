Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AC5C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 10:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC75810FE04;
	Thu, 25 Apr 2024 10:33:59 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D20D10FE04;
 Thu, 25 Apr 2024 10:33:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Unpin?=
 =?utf-8?q?_cursor_worker_in_vblank_worker_series=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Apr 2024 10:33:59 -0000
Message-ID: <171404123911.1650662.3018259488021446484@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240425102604.1704520-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240425102604.1704520-1-maarten.lankhorst@linux.intel.com>
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

Series: drm/i915/display: Unpin cursor worker in vblank worker series.
URL   : https://patchwork.freedesktop.org/series/132899/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d2b5272840dca606395a92f87af5602390f385c7
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Thu Apr 25 12:26:04 2024 +0200

    drm/i915: Use the same vblank worker for atomic unpin
    
    In case of legacy cursor update, the cursor VMA needs to be unpinned
    only after vblank. This exceeds the lifetime of the whole atomic commit.
    
    Any trick I attempted to keep the atomic commit alive didn't work, as
    drm_atomic_helper_setup_commit() force throttles on any old commit that
    wasn't cleaned up.
    
    The only option remaining is to remove the plane from the atomic commit,
    and use the same path as the legacy cursor update to clean the state
    after vblank.
    
    Changes since previous version:
    - Call the memset for plane state immediately when scheduling vblank,
      this prevents a use-after-free in cursor cleanup.
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch 67988afd596f307b6b7e849e6a246bca9a20e93d drm-intel
38a96be99c5b drm: Add drm_vblank_work_flush_all().
-:33: WARNING:WAITQUEUE_ACTIVE: waitqueue_active without comment
#33: FILE: drivers/gpu/drm/drm_vblank_work.c:249:
+			    !waitqueue_active(&vblank->work_wait_queue),

total: 0 errors, 1 warnings, 0 checks, 41 lines checked
5aaff3e18aeb drm/i915: Use vblank worker to unpin old legacy cursor fb safely
d2b5272840dc drm/i915: Use the same vblank worker for atomic unpin
-:107: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#107: FILE: drivers/gpu/drm/i915/display/intel_crtc.c:641:
+							 drm_crtc_accurate_vblank_count(&crtc->base) + 1,

-:110: WARNING:LONG_LINE_COMMENT: line length of 110 exceeds 100 columns
#110: FILE: drivers/gpu/drm/i915/display/intel_crtc.c:644:
+				/* Remove plane from atomic state, cleanup/free is done from vblank worker. */

total: 0 errors, 2 warnings, 0 checks, 98 lines checked


