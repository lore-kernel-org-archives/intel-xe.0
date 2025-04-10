Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563AFC3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 08:20:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B9F10E102;
	Thu, 10 Apr 2025 08:20:52 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC76C10E102;
 Thu, 10 Apr 2025 08:20:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_error_capture?=
 =?utf-8?q?_cleanups_and_refactor?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Apr 2025 08:20:50 -0000
Message-ID: <174427325083.54720.7555171665682216459@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <cover.1744208554.git.jani.nikula@intel.com>
In-Reply-To: <cover.1744208554.git.jani.nikula@intel.com>
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

Series: drm/i915: error capture cleanups and refactor
URL   : https://patchwork.freedesktop.org/series/147474/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4bd89c5125685bc30fe20151a1b3796605e871c5
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Apr 9 17:23:47 2025 +0300

    drm/i915: use graphics version instead of PCH split in error capture
    
    Avoid using PCH checks in core i915 code, in preparation for moving PCH
    handling to display.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch c54633598106dbdb97f3aa589587b8176009b6d8 drm-intel
7d45fd6af6d9 drm/i915: use 32-bit access for gen2 irq registers
e7b7f3ce1fb8 drm/i915: record GEN2_IER in gtier[0] for pre-ilk error capture
2e602f06db24 drm/i915: stop recording IER in error capture
ab6b461d4c05 drm/i915: use display snapshot mechanism for display irq regs
-:70: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#70: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:87:
+struct intel_display_irq_snapshot *intel_display_irq_snapshot_capture(struct intel_display *display);

-:71: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#71: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:88:
+void intel_display_irq_snapshot_print(const struct intel_display_irq_snapshot *snapshot, struct drm_printer *p);

total: 0 errors, 2 warnings, 0 checks, 131 lines checked
4bd89c512568 drm/i915: use graphics version instead of PCH split in error capture


