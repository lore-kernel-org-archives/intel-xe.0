Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846A0C83F10
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 08:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3064510E5BF;
	Thu, 31 Aug 2023 08:37:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id A56F410E5BF;
 Thu, 31 Aug 2023 08:37:23 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9DAAEAADE0;
 Thu, 31 Aug 2023 08:37:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Date: Thu, 31 Aug 2023 08:37:23 -0000
Message-ID: <169347104360.12506.7142772220701535024@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230825093904.1230143-1-jouni.hogander@intel.com>
In-Reply-To: <20230825093904.1230143-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Frontbuffer_tracking_refactoring_=28rev4=29?=
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

Series: Frontbuffer tracking refactoring (rev4)
URL   : https://patchwork.freedesktop.org/series/122899/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 72da4b45f drm/xe: Prevent return with locked vm
=== git am output follows ===
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
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: drm/i915/display: Use drm_gem_object_get/put


