Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69D5C25B78
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 06:01:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D3210F38C;
	Wed, 22 May 2024 06:01:40 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF7210F38C;
 Wed, 22 May 2024 06:01:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Fix_cursor_FB_unpinning?=
 =?utf-8?q?=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 May 2024 06:01:39 -0000
Message-ID: <171635769951.2165804.4319265936008823685@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240522053341.137592-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240522053341.137592-1-maarten.lankhorst@linux.intel.com>
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

Series: Fix cursor FB unpinning.
URL   : https://patchwork.freedesktop.org/series/133895/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 88b8aa1d47e5a9dfb7c6664eaa20c407ebe07acb
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Wed May 22 07:33:41 2024 +0200

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
+ /mt/dim checkpatch b134db8544f8d5b8a960b368afe12820c3cbe8cd drm-intel
f4835ac35aa5 drm: Add drm_vblank_work_flush_all().
-:11: WARNING:BAD_SIGN_OFF: 'Co-developed-by:' is the preferred signature form
#11: 
Co-Developed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

-:11: WARNING:BAD_SIGN_OFF: Co-developed-by and Signed-off-by: name/email do not match
#11: 
Co-Developed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

total: 0 errors, 2 warnings, 0 checks, 41 lines checked
e2d623a9a857 drm/i915: Use vblank worker to unpin old legacy cursor fb safely
88b8aa1d47e5 drm/i915: Use the same vblank worker for atomic unpin
-:107: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#107: FILE: drivers/gpu/drm/i915/display/intel_crtc.c:640:
+							 drm_crtc_accurate_vblank_count(&crtc->base) + 1,

-:110: WARNING:LONG_LINE_COMMENT: line length of 110 exceeds 100 columns
#110: FILE: drivers/gpu/drm/i915/display/intel_crtc.c:643:
+				/* Remove plane from atomic state, cleanup/free is done from vblank worker. */

total: 0 errors, 2 warnings, 0 checks, 98 lines checked


