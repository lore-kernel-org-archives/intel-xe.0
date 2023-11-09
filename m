Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EEDC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:14:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F9910E8C5;
	Thu,  9 Nov 2023 15:14:31 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5EF0110E8C5;
 Thu,  9 Nov 2023 15:14:27 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2A948AADD6;
 Thu,  9 Nov 2023 15:14:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Date: Thu, 09 Nov 2023 15:14:27 -0000
Message-ID: <169954286713.26591.263852449720307797@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231109150759.44549-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231109150759.44549-1-maarten.lankhorst@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EPatch=5Fapplied=3A_failure_f?=
 =?utf-8?q?or_Break_up_remaining_changes_to_make_xe_compile=2E?=
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

Series: Break up remaining changes to make xe compile.
URL   : https://patchwork.freedesktop.org/series/126200/
State : failure

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: 2096aea11 fixup! drm/xe/gsc: add gsc device support
=== git am output follows ===
.git/rebase-apply/patch:20: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: drm/i915: Use drm_atomic_helper_wait_for_fences helper.
Applying: fixup! drm/xe/display: Implement display support
Applying: drm/i915/display: Revert all before remaining changes to make xe compile
Applying: drm/i915/display: Revert remaining changes to make xe compile
Applying: drm/xe: Update headers to be more compatible with i915
Applying: FIXME drm/i915/display: add_dma_resv_fences is i915 only
Applying: drm/i915/display: Use i915_gem_object_get_dma_address to get dma address
Applying: FIXME drm/i915/display: Minimal changes to fbdev to make xe work
Applying: FIXME drm/i915/display: Make intel_fb.c code compatible with xe


