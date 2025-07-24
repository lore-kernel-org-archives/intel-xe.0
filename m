Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22396C87FC5
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 20:54:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB2910E09E;
	Thu, 24 Jul 2025 20:54:50 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC2C10E07D;
 Thu, 24 Jul 2025 20:54:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_adl_css_test_run_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Jul 2025 20:54:49 -0000
Message-ID: <175339048917.187925.999370214118559573@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250724201818.81269-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250724201818.81269-1-tvrtko.ursulin@igalia.com>
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

Series: adl css test run (rev2)
URL   : https://patchwork.freedesktop.org/series/152081/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63535c743231a7497a612c53f6edbb8a7d14412d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 247798103a1afbd48fcc6f24f9f529af565434d3
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Thu Jul 24 21:18:15 2025 +0100

    drm/xe/display: Add support for AuxCCS
    
    Add support for mapping the auxiliary CCS buffer into the DPT page tables.
    
    This will allow for more power efficiency by enabling the render
    compression frame buffer modifiers such as
    I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS in a following patch.
    
    We do this by refactoring the code a bit so handling for the linear
    auxiliary frame buffer can be added in a tidy way. Also replace some
    hardcoded constants and tighten the loops a bit.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
    Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch e84ae65b0196f8c961dcc7f9149912d60bc28a68 drm-intel
fcc9f4977b97 drm/xe/xelp: Quiesce memory traffic before invalidating auxccs
ccc6e2af9d4d drm/xe/xelp: Support auxccs invalidation on blitter
442051cdb499 drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
4b8533a029dd drm/xe/xelp: Wait for AuxCCS invalidation to complete
f1c794656fcd drm/xe: Export xe_emit_aux_table_inv
1ad89fe9050a drm/xe/xelp: Add AuxCCS invalidation to the indirect context workarounds
4039863e29bc drm/xe: Flush GGTT writes after populating DPT
-:72: WARNING:MEMORY_BARRIER: memory barrier without comment
#72: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:115:
+	wmb();

total: 0 errors, 1 warnings, 0 checks, 66 lines checked
03be66683dd1 drm/xe: Handle DPT in system memory
247798103a1a drm/xe/display: Add support for AuxCCS


