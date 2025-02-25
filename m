Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9419BC021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 11:27:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EA710E63F;
	Tue, 25 Feb 2025 11:27:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1994310E63F;
 Tue, 25 Feb 2025 11:27:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915=3A_display_reset?=
 =?utf-8?q?_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 11:27:00 -0000
Message-ID: <174048282009.1947198.4471441084454810317@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1740481927.git.jani.nikula@intel.com>
In-Reply-To: <cover.1740481927.git.jani.nikula@intel.com>
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

Series: drm/i915: display reset cleanups
URL   : https://patchwork.freedesktop.org/series/145394/
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
commit 71147edf1c13715c7e535a65cc0e0a9987b89cc1
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Feb 25 13:14:22 2025 +0200

    drm/i915/reset: add modeset_stuck callback to intel_display_reset_prepare()
    
    Drop the dependency on gt by providing a callback for trying to unbreak
    stuck modeset. Do intel_gt_set_wedged() via the callback.
    
    It's by no means pretty, but this is perhaps the most straightforward
    alternative.
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch d5debc4841e604372c74ebda0bbf54bd527c3475 drm-intel
b881136839e1 drm/i915/display: convert display reset to struct intel_display *
2e35ce7f96f2 drm/i915: move pending_fb_pin to struct intel_display
eada1109bef0 drm/i915/reset: add intel_gt_gpu_reset_clobbers_display() helper
9f8aef8eb70e drm/i915/reset: add intel_display_reset_test()
64da7485c947 drm/i915/reset: add wrappers for display reset calls
40e9f254b53d drm/i915/reset: move gt related stuff out of display reset
-:74: WARNING:MEMORY_BARRIER: memory barrier without comment
#74: FILE: drivers/gpu/drm/i915/gt/intel_reset.c:1419:
+	smp_mb__after_atomic();

total: 0 errors, 1 warnings, 0 checks, 69 lines checked
4f9918a35a6b drm/i915/reset: pass test only parameter to intel_display_reset_finish()
71147edf1c13 drm/i915/reset: add modeset_stuck callback to intel_display_reset_prepare()


