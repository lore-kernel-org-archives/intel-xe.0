Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E416C36010
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 07:15:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A4510EB05;
	Fri, 11 Apr 2025 07:15:24 +0000 (UTC)
Received: from 32c37dd7f93d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771B710EB0C;
 Fri, 11 Apr 2025 07:15:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_don=27t_captu?=
 =?utf-8?q?re_DERRMR_for_VLV/CHV_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Apr 2025 07:15:23 -0000
Message-ID: <174435572348.2979.11925129441086794596@32c37dd7f93d>
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

Series: drm/i915: don't capture DERRMR for VLV/CHV (rev2)
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
commit 78f26e44be3a9bd2d9228e4a43c943a5f1672593
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Apr 9 17:23:47 2025 +0300

    drm/i915: use graphics version instead of PCH split in error capture
    
    Avoid using PCH checks in core i915 code, in preparation for moving PCH
    handling to display.
    
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 07a246112fe9a02c137ac9ce2bf3647f793c889b drm-intel
fcd75e02fc25 drm/i915: use 32-bit access for gen2 irq registers
23dea1273e37 drm/i915: record GEN2_IER in gtier[0] for pre-ilk error capture
e6001d7f1bd7 drm/i915: stop recording IER in error capture
9be53a2ec51f drm/i915: use display snapshot mechanism for display irq regs
-:76: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#76: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:87:
+struct intel_display_irq_snapshot *intel_display_irq_snapshot_capture(struct intel_display *display);

-:77: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#77: FILE: drivers/gpu/drm/i915/display/intel_display_irq.h:88:
+void intel_display_irq_snapshot_print(const struct intel_display_irq_snapshot *snapshot, struct drm_printer *p);

total: 0 errors, 2 warnings, 0 checks, 132 lines checked
78f26e44be3a drm/i915: use graphics version instead of PCH split in error capture


