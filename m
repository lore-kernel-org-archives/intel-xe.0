Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4135DC021B8
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 18:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6B910E7A6;
	Tue, 25 Feb 2025 18:52:50 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFB410E7A6;
 Tue, 25 Feb 2025 18:52:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_struct_intel?=
 =?utf-8?q?=5Fdisplay_conversions=2C_part_2434235?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 18:52:48 -0000
Message-ID: <174050956877.2042575.1243496763722428366@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1740502116.git.jani.nikula@intel.com>
In-Reply-To: <cover.1740502116.git.jani.nikula@intel.com>
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

Series: drm/i915: struct intel_display conversions, part 2434235
URL   : https://patchwork.freedesktop.org/series/145418/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 118134fd8b7699ddf643241973aa436ef51d3cdb
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Feb 25 18:49:13 2025 +0200

    drm/i915/fdi: convert intel_fdi.[ch] to struct intel_display
    
    Going forward, struct intel_display is the main display device data
    pointer. Convert as much as possible of intel_fdi.[ch] to struct
    intel_display.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 533a24b8fa29455518aed9ac72209c834d814238 drm-intel
06d59a5904b1 drm/i915/display: remove leftover struct drm_i915_private forward declarations
56187fc5013c drm/i915/debugfs: continue display debugfs struct intel_display conversion
e58953642dcf drm/i915/tdf: convert intel_tdf.[ch] to struct intel_display
8cb0a9905ba8 drm/i915/snps: convert intel_snps_phy.[ch] to struct intel_display
a9842398be32 drm/i915/dkl: convert intel_dkl_phy.[ch] to struct intel_display
dab87e2298c1 drm/i915/drrs: convert intel_drrs.[ch] to struct intel_display
43b18b48445d drm/i915/display: convert the M/N functions to struct intel_display
a4edd2a1e88f drm/i915/dpt: convert intel_dpt.[ch] interfaces to struct intel_display
88a77d787491 drm/i915/fbc: convert intel_fbc.[ch] to struct intel_display
fb3c42ac6668 drm/i915/rps: convert intel_display_rps.[ch] to struct intel_display
a160fabf5619 drm/i915/ddi: convert intel_wait_ddi_buf_idle() to struct intel_display
118134fd8b76 drm/i915/fdi: convert intel_fdi.[ch] to struct intel_display
-:1230: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#1230: FILE: drivers/gpu/drm/i915/display/intel_modeset_verify.c:97:
+		int fdi_dotclock = intel_dotclock_calculate(intel_fdi_link_freq(display, crtc_state),

-:1298: CHECK:SPACING: No space is necessary after a cast
#1298: FILE: drivers/gpu/drm/i915/display/intel_pch_display.c:559:
+	assert_fdi_tx_enabled(display, (enum pipe) cpu_transcoder);

total: 0 errors, 1 warnings, 1 checks, 1218 lines checked


