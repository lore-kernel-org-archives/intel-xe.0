Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214EDC4332F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 06:51:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4FC10E26E;
	Mon,  6 Nov 2023 06:51:38 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5CA6610E26E;
 Mon,  6 Nov 2023 06:51:37 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5B277AADDD;
 Mon,  6 Nov 2023 06:51:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Mon, 06 Nov 2023 06:51:37 -0000
Message-ID: <169925349737.20423.15441307153677909614@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231106064834.161647-1-jouni.hogander@intel.com>
In-Reply-To: <20231106064834.161647-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_f?=
 =?utf-8?q?or_Backport_i915=5Fsw=5Ffence_to_dma_fence_conversion?=
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

Series: Backport i915_sw_fence to dma fence conversion
URL   : https://patchwork.freedesktop.org/series/126003/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-xe-next' with base: ===
Base commit: fc457bcc1 Revert "FIXME: drm/i915/crtc: use irqsave for locking event_lock"
=== git am output follows ===
Applying: fixup! drm/xe/display: Implement display support
Applying: Revert "FIXME: drm/i915: fence stuff"
Applying: Revert "drm/xe/display: Append dma_buf fences to framebuffer fences"
Applying: fixup! drm/xe/display: Implement display support
Applying: drm/i915/display: Use dma_fence interfaces instead of i915_sw_fence
Applying: drm/i915/display: Use intel_bo_to_drm_bo instead of obj->base
Applying: fixup! drm/xe/display: Implement display support
Applying: fixup! FIXME: drm/i915/display: Remaining changes to make xe compile


