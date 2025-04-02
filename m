Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C92C28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 08:39:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F2510E6E8;
	Wed,  2 Apr 2025 08:39:56 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A8510E6E8;
 Wed,  2 Apr 2025 08:39:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_DPLL_framework_redes?=
 =?utf-8?q?ign_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Apr 2025 08:39:55 -0000
Message-ID: <174358319507.26330.8206773605591872558@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250402083204.1523470-1-suraj.kandpal@intel.com>
In-Reply-To: <20250402083204.1523470-1-suraj.kandpal@intel.com>
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

Series: DPLL framework redesign (rev2)
URL   : https://patchwork.freedesktop.org/series/145380/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: f0fd77956987 drm-tip: 2025y-04m-02d-05h-39m-01s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/dpll: Rename intel_shared_dpll_state
Applying: drm/i915/dpll: Rename macro for_each_shared_dpll
Applying: drm/i915/dpll: Rename intel_shared_dpll_funcs
Applying: drm/i915/dpll: Rename intel_shared_dpll
Applying: drm/i915/dpll: Move away from using shared dpll
Applying: drm/i915/dpll: Rename crtc_get_shared_dpll
Applying: drm/i915/dpll: Change argument for enable hook in intel_global_dpll_funcs
Applying: drm/i915/drm: Rename disable hook in intel_dpll_global_func
Applying: drm/i915/dpll: Introduce new hook in intel_dpll_global_func
Applying: drm/i915/dpll: Add intel_encoder argument to get_hw_state hook
Applying: drm/i915/dpll: Change arguments for get_freq hook
Applying: drm/i915/dpll: Rename intel_[enable/disable]_global_dpll
Applying: drm/i915/dpll: Rename intel_unreference_dpll_global_crtc
Applying: drm/i915/dpll: Rename intel_<release/reserve>_dpll_globals
Applying: drm/i915/dpll: Rename intel_compute_dpll_globals
Applying: drm/i915/dpll: Rename intel_update_active_dpll


