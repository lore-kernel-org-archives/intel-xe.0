Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F263AC77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 12:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92E210E487;
	Wed, 10 May 2023 12:16:23 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A389110E484;
 Wed, 10 May 2023 12:16:21 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9D5A8AADDD;
 Wed, 10 May 2023 12:16:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Wed, 10 May 2023 12:16:21 -0000
Message-ID: <168372098162.7575.6755660459100704664@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230510121152.736148-1-jouni.hogander@intel.com>
In-Reply-To: <20230510121152.736148-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Xe_frontbuffer_tracking_=28rev2=29?=
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

Series: Xe frontbuffer tracking (rev2)
URL   : https://patchwork.freedesktop.org/series/117372/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: fa603f7d5 drm/xe: fix tlb_invalidation_seqno_past()
=== git am output follows ===
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: Revert "drm/i915/display: Neuter frontbuffer tracking harder"
Applying: Revert "drm/i915: Remove gem and overlay frontbuffer tracking"
Applying: fixup! drm/i915/display: Remaining changes to make xe compile
Applying: fixup! drm/xe/display: Implement display support
Applying: drm/i915: Add macros to get i915 device from i915_gem_object
Applying: drm/xe: Add macro to get i915 device from xe_bo
Applying: drm/i915: Add getter for i915_gem_object->frontbuffer
Applying: drm/xe: Add frontbuffer setter/getter for xe_bo
Applying: drm/i915/display: Remove i915_gem_object_types.h from intel_frontbuffer.h
Applying: drm/xe: Add intel_bo_flush_if_display define for Xe
Applying: drm/i915: Add intel_bo_flush_if_display define for i915
Applying: drm/xe: Add struct i915_active for Xe
Applying: drm/xe: Add i915_active.h compatibility header
Applying: drm/xe/display: Include i916_active header
Applying: drm/i915: Add function to clear scanout flag for vmas
Applying: drm/xe: Add empty define for i915_ggtt_clear_scanout
Applying: drm/i915/display: Use i915_ggtt_clear_scanout
Applying: drm/i915/display: Use drm_gem_object_get/put
Applying: drm/xe/display: Use frontbuffer tracking for Xe as well
Applying: drm/i915: Add new frontbuffer tracking interface to queue flush
Applying: drm/i915: Handle dma fences in dirtyfb callback
Applying: drm/xe/display: Use custom dirtyfb for Xe as well


