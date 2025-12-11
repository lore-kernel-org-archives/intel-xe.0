Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A56BD41D50
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 15:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D453C10E7DD;
	Thu, 11 Dec 2025 15:18:14 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D117D10E097;
 Thu, 11 Dec 2025 15:18:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_auxccs_dpt_wc_no_stolen_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Dec 2025 15:18:13 -0000
Message-ID: <176546629384.77465.7528735659330145868@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251211091712.19151-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20251211091712.19151-1-tvrtko.ursulin@igalia.com>
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

Series: auxccs dpt wc no stolen (rev3)
URL   : https://patchwork.freedesktop.org/series/158764/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8f50e69d0ce3656564bbdf8b3e213d61470d463f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 55c76554982c75ab9506276d0a86069cbf00448e
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Thu Dec 11 10:17:12 2025 +0100

    drm/xe: Do not use stolen memory for DPT on IGFX and AuxCCS
    
    With DPT in stolen memory there are occasional pipe crc IGT failures in
    tests such as kms_flip_tiling. Allocate a normal system memory object
    instead.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch f8da8e7cee8489b7d7d92d34adf1bd8be14cf527 drm-intel
8627b8323bc8 drm/xe: Fix ggtt fb alignment
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#13: 
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
be31ecc6a474 drm/xe/xelpg: Limit AuxCCS ring buffer programming to Alderlake
-:25: WARNING:TYPO_SPELLING: 'explicity' may be misspelled - perhaps 'explicitly'?
#25: FILE: drivers/gpu/drm/xe/xe_ring_ops.c:292:
+	 * AuxCCS, and we explicity do not want to support it on MTL.
 	                  ^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 11 lines checked
80eb41a6cea4 drm/xe/xelp: Quiesce memory traffic before invalidating AuxCCS
570b305e4778 drm/xe/xelp: Wait for AuxCCS invalidation to complete
27f8d1534524 drm/xe: Export xe_emit_aux_table_inv
badaeb5fadf2 drm/xe/xelp: Add AuxCCS invalidation to the indirect context workarounds
-:36: WARNING:TYPO_SPELLING: 'explicity' may be misspelled - perhaps 'explicitly'?
#36: FILE: drivers/gpu/drm/xe/xe_hw_engine.h:90:
+	 * AuxCCS, and we explicity do not want to support it on MTL.
 	                  ^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 128 lines checked
e7204bf3aebd drm/xe/display: Add support for AuxCCS
b530ae4e5bcc drm/xe/xelp: Expose AuxCCS frame buffer modifiers on Alderlake-P
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe").

-:12: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")'
#12: 
cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe").

total: 1 errors, 1 warnings, 0 checks, 19 lines checked
10c52b50e32d use wc for dpt
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 18 lines checked
55c76554982c drm/xe: Do not use stolen memory for DPT on IGFX and AuxCCS


