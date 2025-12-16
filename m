Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB408D5E147
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 13:12:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D73610E96B;
	Tue, 16 Dec 2025 13:12:07 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D8E10E957;
 Tue, 16 Dec 2025 13:12:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echecksparse=3A_warning_for_drm/i915/pll=3A_Verify_p?=
 =?utf-8?q?ll_dividers_and_remove_redundant_=2Eclock_member?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Dec 2025 13:12:07 -0000
Message-ID: <176589072700.93938.16121673913423471164@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251216083759.383163-1-mika.kahola@intel.com>
In-Reply-To: <20251216083759.383163-1-mika.kahola@intel.com>
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

Series: drm/i915/pll: Verify pll dividers and remove redundant .clock member
URL   : https://patchwork.freedesktop.org/series/159089/
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
+ /root/linux/maintainer-tools/dim sparse --fast 4bae139bb961fd9df698b3bf15bf39f9bf9800a1
Sparse version: 0.6.4 (Ubuntu: 0.6.4-4ubuntu3)
Fast mode used, each commit won't be checked separately.
-
+drivers/gpu/drm/i915/display/i9xx_wm.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_display_trace.h):
-drivers/gpu/drm/i915/display/skl_prefill.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):drivers/gpu/drm/i915/display/i9xx_wm.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h, drivers/gpu/drm/i915/display/intel_display_trace.h):
+drivers/gpu/drm/i915/display/skl_prefill.c: note: in included file (through drivers/gpu/drm/i915/display/intel_display_types.h):

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


