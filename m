Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11554CA0EEB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 10:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF4010E0CD;
	Thu, 21 Aug 2025 10:35:08 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BE110E083;
 Thu, 21 Aug 2025 10:35:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_auxccs_no_stolen_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Aug 2025 10:35:07 -0000
Message-ID: <175577250766.255682.3714780227458705956@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250820091913.18588-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250820091913.18588-1-tvrtko.ursulin@igalia.com>
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

Series: auxccs no stolen (rev2)
URL   : https://patchwork.freedesktop.org/series/153202/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
553439844b6500767ce8aef522cfe9fbb7ece541
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6f1435f46a6088518e5e3b76b0a3179d0b14b5e8
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Wed Aug 20 10:19:12 2025 +0100

    no dpt stolen
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
+ /mt/dim checkpatch 1f3c2c82c864322cfa8f79c10c00cf361c926d2f drm-intel
6ee6a4003803 drm/xe/xelpg: Flush CCS when flushing caches
b3bba9b02157 drm/xe/xelp: Quiesce memory traffic before invalidating auxccs
2e9d3cc4847b drm/xe/xelp: Support auxccs invalidation on blitter
ce18ce6c79bd drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
daa46578460d drm/xe/xelp: Wait for AuxCCS invalidation to complete
7ab0b221635b drm/xe: Export xe_emit_aux_table_inv
5ce89f4a7ddb drm/xe/xelp: Add AuxCCS invalidation to the indirect context workarounds
3ab72626c164 drm/xe: Flush GGTT writes after populating DPT
-:72: WARNING:MEMORY_BARRIER: memory barrier without comment
#72: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:115:
+	wmb();

total: 0 errors, 1 warnings, 0 checks, 66 lines checked
0f9eb75a8e90 drm/xe: Handle DPT in system memory
03b499bb1f8d drm/xe/display: Add support for AuxCCS
c88a5084b0c7 drm/xe: Force flush system memory AuxCCS framebuffers before scan out
c89fbe5e19af drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe
-:10: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")'
#10: 
done in cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if

-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
		uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)

total: 1 errors, 1 warnings, 0 checks, 12 lines checked
6f1435f46a60 no dpt stolen
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 15 lines checked


