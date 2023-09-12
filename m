Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53335CA0ECA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 06:50:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BA610E35B;
	Tue, 12 Sep 2023 06:50:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3987410E35B;
 Tue, 12 Sep 2023 06:50:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 37840AADF2;
 Tue, 12 Sep 2023 06:50:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Tue, 12 Sep 2023 06:50:23 -0000
Message-ID: <169450142320.31796.10089142570926379127@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230912064709.2802305-1-jouni.hogander@intel.com>
In-Reply-To: <20230912064709.2802305-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Frontbuffer_tracking_refactoring_=28rev8=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Frontbuffer tracking refactoring (rev8)
URL   : https://patchwork.freedesktop.org/series/122899/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: b4ddac861 fixup! drm/xe/display: Implement display support
=== git am output follows ===
Applying: drm/i915/display: Move releasing gem object away from fb tracking
Applying: drm/i915: Ignore set frontbuffer return value on release
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: drm/xe: Add macro to get i915 device from xe_bo
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: drm/xe: Add frontbuffer setter/getter for xe_bo
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: drm/xe: Add i915_active.h compatibility header
Applying: drm/xe/display: Include i916_active header
Applying: drm/xe: Add struct i915_active for Xe
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: drm/xe: Add empty define for i915_ggtt_clear_scanout


