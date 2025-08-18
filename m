Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE72CA0ED1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 16:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E07A10E49E;
	Mon, 18 Aug 2025 16:07:36 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B63210E49D;
 Mon, 18 Aug 2025 16:07:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_auxccs_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 18 Aug 2025 16:07:35 -0000
Message-ID: <175553325510.243874.18373902898820748411@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250818140653.86787-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250818140653.86787-1-tvrtko.ursulin@igalia.com>
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

Series: auxccs test
URL   : https://patchwork.freedesktop.org/series/153065/
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
commit 0c5d5d91698ab5e770229200eaa98bd782ac8547
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Mon Aug 18 15:06:50 2025 +0100

    clflush all
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
+ /mt/dim checkpatch 912c10fafebf45522f7f56e33a020284e83c27ab drm-intel
f83676614e42 drm/xe/xelpg: Flush CCS when flushing caches
ac9530a78318 drm/xe/xelp: Quiesce memory traffic before invalidating auxccs
0424efdc09f6 drm/xe/xelp: Support auxccs invalidation on blitter
f903550b6fee drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
9aaa2968e268 drm/xe/xelp: Wait for AuxCCS invalidation to complete
b1c69906d516 drm/xe: Export xe_emit_aux_table_inv
792784c9b4e1 drm/xe/xelp: Add AuxCCS invalidation to the indirect context workarounds
33c208cd25c5 drm/xe: Flush GGTT writes after populating DPT
-:72: WARNING:MEMORY_BARRIER: memory barrier without comment
#72: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:115:
+	wmb();

total: 0 errors, 1 warnings, 0 checks, 66 lines checked
747278176743 drm/xe: Handle DPT in system memory
458a71ab5aa4 drm/xe/display: Add support for AuxCCS
2c0b82958a3f drm/xe: Force flush system memory AuxCCS data before scan out
-:58: WARNING:MEMORY_BARRIER: memory barrier without comment
#58: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:399:
+		mb();

-:61: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#61: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:402:
+			uint8_t *page_virtual;

-:69: WARNING:MEMORY_BARRIER: memory barrier without comment
#69: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:410:
+		mb();

total: 0 errors, 2 warnings, 1 checks, 103 lines checked
15fc71b4f7fd drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe
-:10: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")'
#10: 
done in cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if

-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
		uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)

total: 1 errors, 1 warnings, 0 checks, 12 lines checked
f3a52d0cb436 no dpt stolen
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
0c5d5d91698a clflush all
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


