Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50826C0219D
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 12:08:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C8110E3BC;
	Thu, 13 Feb 2025 12:08:39 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E6210E3BC;
 Thu, 13 Feb 2025 12:08:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_for_drm/i915=3A_Add_drm?=
 =?utf-8?q?=5Fpanic_support_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jocelyn Falempe" <jfalempe@redhat.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Feb 2025 12:08:37 -0000
Message-ID: <173944851761.1655975.15012021861164915699@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250213112620.1923927-1-jfalempe@redhat.com>
In-Reply-To: <20250213112620.1923927-1-jfalempe@redhat.com>
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

Series: drm/i915: Add drm_panic support (rev4)
URL   : https://patchwork.freedesktop.org/series/141937/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: dbf65862427b drm-tip: 2025y-02m-13d-08h-54m-47s UTC integration manifest
=== git am output follows ===
error: patch failed: drivers/gpu/drm/i915/display/intel_fb_pin.h:25
error: drivers/gpu/drm/i915/display/intel_fb_pin.h: patch does not apply
error: patch failed: drivers/gpu/drm/i915/display/intel_fbdev.c:695
error: drivers/gpu/drm/i915/display/intel_fbdev.c: patch does not apply
error: patch failed: drivers/gpu/drm/i915/display/intel_fbdev.h:12
error: drivers/gpu/drm/i915/display/intel_fbdev.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Applying: drm/i915/fbdev: Add intel_fbdev_get_map()
Patch failed at 0001 drm/i915/fbdev: Add intel_fbdev_get_map()
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


