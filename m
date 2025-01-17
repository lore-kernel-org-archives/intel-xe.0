Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B4EC02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 10:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF56810EAC8;
	Fri, 17 Jan 2025 10:35:40 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1129610EAC8;
 Fri, 17 Jan 2025 10:35:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915=3A_Provide_?=
 =?utf-8?q?more_information_on_display_faults_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Jan 2025 10:35:40 -0000
Message-ID: <173711014007.679380.10283588187642806871@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250116174758.18298-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250116174758.18298-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Provide more information on display faults (rev2)
URL   : https://patchwork.freedesktop.org/series/143626/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 48e878178132 drm-tip: 2025y-01m-17d-09h-51m-47s UTC integration manifest
=== git am output follows ===
Applying: drm/i915: Add missing else to the if ladder in missing else
Applying: drm/i915: Introduce a minimal plane error state
Applying: drm/i915: Pimp display fault reporting
Applying: drm/i915: Hook in display GTT faults for IVB/HSW
Applying: drm/i915: Hook in display GTT faults for ILK/SNB
Applying: drm/i915: Introduce i915_error_regs
Applying: drm/i915: Un-invert {i9xx,i965}_error_mask()
Applying: drm/i915: Hook up display fault interrupts for VLV/CHV


