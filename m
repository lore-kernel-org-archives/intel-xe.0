Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DACD41C39
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 13:48:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61AC10E813;
	Thu, 11 Dec 2025 13:48:42 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDBF10E802;
 Thu, 11 Dec 2025 13:48:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_auxccs_wc_dpt_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Dec 2025 13:48:41 -0000
Message-ID: <176546092111.77220.15966735270793803097@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251211091530.19031-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20251211091530.19031-1-tvrtko.ursulin@igalia.com>
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

Series: auxccs wc dpt (rev4)
URL   : https://patchwork.freedesktop.org/series/158763/
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
commit 3e54ff400128a149c9218ca9be9ecfab6975251e
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Thu Dec 11 10:15:30 2025 +0100

    use wc for dpt
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
+ /mt/dim checkpatch c6ed6720baf0914824cb33b5f003ea3a0b0786da drm-intel
8b9b96c48f3b drm/xe: Fix ggtt fb alignment
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#13: 
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
4506bdc810f5 drm/xe/xelpg: Limit AuxCCS ring buffer programming to Alderlake
-:25: WARNING:TYPO_SPELLING: 'explicity' may be misspelled - perhaps 'explicitly'?
#25: FILE: drivers/gpu/drm/xe/xe_ring_ops.c:292:
+	 * AuxCCS, and we explicity do not want to support it on MTL.
 	                  ^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 11 lines checked
63282251c227 drm/xe/xelp: Quiesce memory traffic before invalidating AuxCCS
e4d421b5c5ab drm/xe/xelp: Wait for AuxCCS invalidation to complete
f9c61906a7cd drm/xe: Export xe_emit_aux_table_inv
12407b9bba0e drm/xe/xelp: Add AuxCCS invalidation to the indirect context workarounds
-:36: WARNING:TYPO_SPELLING: 'explicity' may be misspelled - perhaps 'explicitly'?
#36: FILE: drivers/gpu/drm/xe/xe_hw_engine.h:90:
+	 * AuxCCS, and we explicity do not want to support it on MTL.
 	                  ^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 128 lines checked
bd33efecface drm/xe/display: Add support for AuxCCS
3f049e9e9b33 drm/xe/xelp: Expose AuxCCS frame buffer modifiers on Alderlake-P
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe").

-:12: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")'
#12: 
cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe").

total: 1 errors, 1 warnings, 0 checks, 19 lines checked
3e54ff400128 use wc for dpt
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 18 lines checked


