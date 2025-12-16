Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D18D637B3
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 22:28:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5025D10E306;
	Tue, 16 Dec 2025 22:28:43 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DBF10E12C;
 Tue, 16 Dec 2025 22:28:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_AuxCCS_handling_and_rende?=
 =?utf-8?q?r_compression_modifiers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Dec 2025 22:28:42 -0000
Message-ID: <176592412216.95861.6331713405874690307@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251216153805.96056-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20251216153805.96056-1-tvrtko.ursulin@igalia.com>
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

Series: AuxCCS handling and render compression modifiers
URL   : https://patchwork.freedesktop.org/series/159112/
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
commit 80748e9099414b56817fec6c8774a3096d84c540
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Tue Dec 16 15:38:05 2025 +0000

    drm/xe/xelp: Expose AuxCCS frame buffer modifiers on Alderlake-P
    
    Now that we have implemented all the related missing bits we can enable
    the AuxCCS compressed modifiers which were disabled in
    cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe").
    
    Tested with KDE Wayland, on Lenovo Carbon X1 ADL-P:
    
            [PLANE:32:plane 1A]: type=PRI
                    uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=28
                    hw: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=yes, src=2880.000
    
    Display is working fine - no artefacts, no DMAR/PIPE faults.
    
    v2:
     * Adjust patch title. (Rodrigo)
    
    v3:
     * Complete rewrite based on the display parent interface.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    References: cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")
    Cc: Jani Nikula <jani.nikula@intel.com>
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v2
+ /mt/dim checkpatch 72428bdb20b6c86beaeddb9d69bf698d0697aa41 drm-intel
860edca517ff drm/xe: Use write-combine mapping when populating DPT
42012b3f29a0 drm/xe/xelpg: Limit AuxCCS ring buffer programming to Alderlake
-:25: WARNING:TYPO_SPELLING: 'explicity' may be misspelled - perhaps 'explicitly'?
#25: FILE: drivers/gpu/drm/xe/xe_ring_ops.c:294:
+	 * AuxCCS, and we explicity do not want to support it on MTL.
 	                  ^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 11 lines checked
7744a51c61b1 drm/xe/xelp: Quiesce memory traffic before invalidating AuxCCS
9e6c562e614f drm/xe/xelp: Wait for AuxCCS invalidation to complete
daf5227dced5 drm/xe: Export xe_emit_aux_table_inv
6c1c8eeb35f2 drm/xe/xelp: Add AuxCCS invalidation to the indirect context workarounds
-:36: WARNING:TYPO_SPELLING: 'explicity' may be misspelled - perhaps 'explicitly'?
#36: FILE: drivers/gpu/drm/xe/xe_hw_engine.h:90:
+	 * AuxCCS, and we explicity do not want to support it on MTL.
 	                  ^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 128 lines checked
f5e28a9c1bd4 drm/xe/display: Add support for AuxCCS
80748e909941 drm/xe/xelp: Expose AuxCCS frame buffer modifiers on Alderlake-P
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe").

-:12: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")'
#12: 
cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe").

total: 1 errors, 1 warnings, 0 checks, 20 lines checked


