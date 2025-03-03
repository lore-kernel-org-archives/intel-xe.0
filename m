Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D960C282C6
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 11:51:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20AD110E289;
	Mon,  3 Mar 2025 11:51:59 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFF810E1E9;
 Mon,  3 Mar 2025 11:51:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915=3A_display_reset?=
 =?utf-8?q?_cleanups_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 03 Mar 2025 11:51:58 -0000
Message-ID: <174100271805.116845.18158372841756307738@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1741001054.git.jani.nikula@intel.com>
In-Reply-To: <cover.1741001054.git.jani.nikula@intel.com>
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

Series: drm/i915: display reset cleanups (rev2)
URL   : https://patchwork.freedesktop.org/series/145394/
State : success

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
commit 2826f6617bfd1425be24d24f4e9ba79dea3a320b
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Mar 3 13:27:10 2025 +0200

    drm/i915/reset: add modeset_stuck callback to intel_display_reset_prepare()
    
    Drop the dependency on gt by providing a callback for trying to unbreak
    stuck modeset. Do intel_gt_set_wedged() via the callback.
    
    It's by no means pretty, but this is perhaps the most straightforward
    alternative.
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch ef9e58a7f9d52f558aaad0e4b02de1d77ff9ca82 drm-intel
17852cffcf13 drm/i915/display: convert display reset to struct intel_display *
a1692fc2354c drm/i915: move pending_fb_pin to struct intel_display
a7131325af16 drm/i915/reset: add intel_gt_gpu_reset_clobbers_display() helper
32be4458518f drm/i915/reset: add intel_display_reset_test()
2843080a2f66 drm/i915/reset: remove I915_RESET_MODESET flag
3b612c278fd5 drm/i915/reset: decide whether display reset is needed on gt side
34987593348d drm/i915/reset: pass test only parameter to intel_display_reset_finish()
2826f6617bfd drm/i915/reset: add modeset_stuck callback to intel_display_reset_prepare()


