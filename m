Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA5AD12663
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 08:37:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C408410E534;
	Tue,  5 Nov 2024 08:37:10 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B2610E229;
 Tue,  5 Nov 2024 08:37:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_use_hw_support_for_m?=
 =?utf-8?q?in/interim_ddb_allocation_for_async_flip?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Nov 2024 08:37:09 -0000
Message-ID: <173079582941.1410847.12043945790745655039@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241105071600.235338-1-vinod.govindapillai@intel.com>
In-Reply-To: <20241105071600.235338-1-vinod.govindapillai@intel.com>
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

Series: use hw support for min/interim ddb allocation for async flip
URL   : https://patchwork.freedesktop.org/series/140927/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 2af747587f44 drm-tip: 2024y-11m-05d-07h-30m-30s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/display: update intel_enabled_dbuf_slices_mask to use intel_display
Applying: drm/i9i5/display: use intel_display in intel_de_read calls of skl_watermark.c
Applying: drm/i915/display: update use_minimal_wm0_only to use intel_display
Applying: drm/i915/display: update use_min_ddb to use intel_display
Applying: drm/i915/display: update skl_plane_wm_equals to use intel_display
Applying: drm/i915/display: update to plane_wm register access function
Applying: drm/i915/xe3: Use hw support for min/interim ddb allocations for async flip
Applying: drm/i915/debugfs: add dbuf alloc status as part of i915_ddb_info


