Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2712C282EC
	for <intel-xe@archiver.kernel.org>; Thu, 13 Mar 2025 06:19:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A55C10E063;
	Thu, 13 Mar 2025 06:19:13 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E0210E063;
 Thu, 13 Mar 2025 06:19:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Plane_Color_Pipeline?=
 =?utf-8?q?_support_for_Intel_platforms_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Mar 2025 06:19:12 -0000
Message-ID: <174184675240.27717.17286744356232339622@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250312072425.3099205-1-uma.shankar@intel.com>
In-Reply-To: <20250312072425.3099205-1-uma.shankar@intel.com>
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

Series: Plane Color Pipeline support for Intel platforms (rev3)
URL   : https://patchwork.freedesktop.org/series/141788/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 4e643702e9d1 drm-tip: 2025y-03m-13d-04h-21m-37s UTC integration manifest
=== git am output follows ===
Applying: drm: color pipeline base work
Applying: drm: Add support for 3x3 CTM
Applying: drm: Add Enhanced LUT precision structure
Applying: drm: Add Color lut range attributes
Applying: drm: Add Color ops capability property
Applying: drm: Add 1D LUT multi-segmented color op
Applying: drm: Define helper to initialize segmented 1D LUT
Applying: drm/i915: Add identifiers for intel color blocks
Applying: drm/i915: Add intel_color_op
Applying: drm/i915/color: Add helper to create intel colorop
Applying: drm/i915/color: Create a transfer function color pipeline
Applying: drm/i915/color: Add and attach COLORPIPELINE plane property
Applying: drm/i915/color: Add framework to set colorop
Applying: drm/i915/color: Add callbacks to set plane CTM
Applying: drm/i915/color: Add new color callbacks for Xelpd
Applying: drm/i915/color: Add plane CTM callback for D13 and beyond
Applying: drm/i915: Add register definitions for Plane Degamma
Applying: drm/i915/color: Add framework to program PRE/POST CSC LUT
Applying: drm/i915: Add register definitions for Plane Post CSC
Applying: drm/i915/color: Program Pre-CSC registers
Applying: drm/i915/xelpd: Program Plane Post CSC Registers
Applying: drm/i915/color: Enable Plane Color Pipelines
Applying: drm/doc/rfc: Add documentation for multi-segmented 1D LUT


