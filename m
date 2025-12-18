Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EE6D6D230
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 15:11:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8131D10E9EB;
	Thu, 18 Dec 2025 15:11:34 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C629210E9EB;
 Thu, 18 Dec 2025 15:11:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_drm/i915/colorop=3A_do_n?=
 =?utf-8?q?ot_include_headers_from_headers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Dec 2025 15:11:33 -0000
Message-ID: <176607069381.101777.9298742639691856773@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251218141807.409751-1-jani.nikula@intel.com>
In-Reply-To: <20251218141807.409751-1-jani.nikula@intel.com>
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

Series: drm/i915/colorop: do not include headers from headers
URL   : https://patchwork.freedesktop.org/series/159222/
State : warning

== Summary ==

+ trap cleanup EXIT
+ KERNEL=/kernel
+ MT=/root/linux/maintainer-tools
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools /root/linux/maintainer-tools
Cloning into '/root/linux/maintainer-tools'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ make -C /root/linux/maintainer-tools
make: Entering directory '/root/linux/maintainer-tools'
cc -O2 -g -Wextra -o remap-log remap-log.c
make: Leaving directory '/root/linux/maintainer-tools'
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ /root/linux/maintainer-tools/dim sparse --fast 31985bb0a701138a06a5eb0b175b2a5c850cc4ee
Sparse version: 0.6.4 (Ubuntu: 0.6.4-4ubuntu3)
Fast mode used, each commit won't be checked separately.
-drivers/gpu/drm/i915/display/intel_colorop.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_colorop.h):
-drivers/gpu/drm/i915/display/intel_color_pipeline.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_colorop.h):
-drivers/gpu/drm/i915/display/intel_plane.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_colorop.h):
+drivers/gpu/drm/i915/display/intel_colorop.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_color_pipeline.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):
+drivers/gpu/drm/i915/display/intel_plane.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_display_trace.h):

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


