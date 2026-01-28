Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD5CD35691
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 08:48:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5AE110E28E;
	Wed, 28 Jan 2026 08:48:17 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF2010E28E;
 Wed, 28 Jan 2026 08:48:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Use_trans_push_mechanism_?=
 =?utf-8?q?to_generate_frame_change_event_=28rev11=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Jan 2026 08:48:17 -0000
Message-ID: <176959009705.199105.11877136513094699384@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260127124120.1069026-1-jouni.hogander@intel.com>
In-Reply-To: <20260127124120.1069026-1-jouni.hogander@intel.com>
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

Series: Use trans push mechanism to generate frame change event (rev11)
URL   : https://patchwork.freedesktop.org/series/139831/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 380b64bec2d6e6ca9be21755197bdf78d11e33f0
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Tue Jan 27 14:41:20 2026 +0200

    drm/i915/psr: Use TRANS_PUSH to trigger frame change event
    
    Now we have everything in place for triggering PSR "frame change" event
    using TRANS_PUSH: use TRANS_PUSH for LunarLake and onwards.
    
    v4:
      - Added call to intel_vrr_psr_frame_change_enable call
      - added setting LNL_TRANS_PUSH_PSR_PR_EN into intel_vrr_send_push
    v3: use HAS_PSR_FRAME_CHANGE macro
    v2: use AND instead of OR in intel_psr_use_trans_push
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
    Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch 23ebb43006b887363bd6653fbc4a327fd3072226 drm-intel
ddd8ea7ccb48 drm/i915/psr: Add TRANS_PUSH register bit definition for PSR
23a202bf0fd5 drm/i915/psr: Add intel_psr_use_trans_push to query if TRANS_PUSH is used
ee4810b7d3b4 drm/i915/vrr: Add helper for parsing value to be written into TRANS_PUSH
ff0bb1a80d40 drm/i915/vrr: Add helper for PSR to enable Frame Change event on trans push
-:15: WARNING:BAD_SIGN_OFF: Duplicate signature
#15: 
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

total: 0 errors, 1 warnings, 0 checks, 22 lines checked
8ad3c6eaa233 drm/i915/vrr: Prepare to Use TRANS_PUSH mechanism for PSR frame change
5ae61a6996ea drm/i915/dsb: Set DSB_SKIP_WAITS_EN chicken bit for LunarLake and onwards
451ddc47747b drm/i915/display: Wait for vblank in case of PSR is using trans push
3c4c3733b4fe drm/i915/psr: Wait for idle only after possible send push
0e789d9856cd drm/i915/psr: Do PSR exit on frontbuffer flush on LunarLake and onwards
d99b628c9c0d drm/i915/display: Add HAS_PSR_TRANS_PUSH_FRAME_CHANGE macro
380b64bec2d6 drm/i915/psr: Use TRANS_PUSH to trigger frame change event


