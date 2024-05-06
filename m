Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DA6C10F16
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 13:02:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C63E10E7B9;
	Mon,  6 May 2024 13:02:35 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E107B10E7B9;
 Mon,  6 May 2024 13:02:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm/i915=3A_Plane_fb?=
 =?utf-8?q?_refactoring?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 May 2024 13:02:33 -0000
Message-ID: <171500055391.1939725.10211549292376561594@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240506125718.26001-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240506125718.26001-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915: Plane fb refactoring
URL   : https://patchwork.freedesktop.org/series/133232/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 5a43da669cdb drm-tip: 2024y-05m-06d-08h-26m-33s UTC integration manifest
=== git am output follows ===
Applying: drm/i915: Split gen2 vs. gen3 .max_stride()
Applying: drm/i915: Clean up skl+ plane stride limits
Applying: drm/i915: Drop 'uses_fence' parameter from intel_pin_fb_obj_dpt()
Applying: drm/i915: Extract intel_plane_needs_physical()
Applying: drm/i915: Polish types in fb calculations
Applying: drm/i915: Constify 'fb' in during pinning
Applying: drm/i915: Change intel_fbdev_fb_alloc() reuturn type
Applying: drm/i915: Cleanup fbdev fb setup
Applying: drm/i915: Rename the fb pinning functions to indicate the address space


