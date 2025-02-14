Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0794AC02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 15:09:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE64110E497;
	Fri, 14 Feb 2025 15:09:32 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F5A10E497;
 Fri, 14 Feb 2025 15:09:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915/ddi=3A_Fix/?=
 =?utf-8?q?simplify_port_enabling/disabling_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Feb 2025 15:09:31 -0000
Message-ID: <173954577167.2070439.2732012709466454643@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250214142001.552916-1-imre.deak@intel.com>
In-Reply-To: <20250214142001.552916-1-imre.deak@intel.com>
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

Series: drm/i915/ddi: Fix/simplify port enabling/disabling (rev2)
URL   : https://patchwork.freedesktop.org/series/144121/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 57457d93f156 drm-tip: 2025y-02m-14d-07h-22m-04s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/dsi: Use TRANS_DDI_FUNC_CTL's own port width macro
Applying: drm/i915/ddi: Fix HDMI port width programming in DDI_BUF_CTL
Applying: drm/i915/ddi: Make all the PORT_WIDTH macros work the same way
Applying: drm/i915/ddi: Set missing TC DP PHY lane stagger delay in DDI_BUF_CTL
Applying: drm/i915/ddi: Simplify the port enabling via DDI_BUF_CTL
Applying: drm/i915/ddi: Simplify the port disabling via DDI_BUF_CTL
Applying: drm/i915/ddi: Simplify waiting for a port to get active/idle via DDI_BUF_CTL
Applying: drm/i915/ddi: Move platform checks within mtl_ddi_enable/disable_d2d_link()
Applying: drm/i915/ddi: Unify the platform specific functions disabling a port
Applying: drm/i915/ddi: Add a helper to enable a port
Applying: drm/i915/ddi: Sanitize DDI_BUF_CTL register definitions


