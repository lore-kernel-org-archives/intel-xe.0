Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DE2C54E49
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 08:39:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9423410E546;
	Thu,  7 Mar 2024 08:39:35 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F5710E546;
 Thu,  7 Mar 2024 08:39:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm=3A_add_missing_h?=
 =?utf-8?q?eader_guards_to_drm=5Fcrtc=5Finternal=2Eh_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Mar 2024 08:39:34 -0000
Message-ID: <170980077437.580282.10565255273735445732@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1709749576.git.jani.nikula@intel.com>
In-Reply-To: <cover.1709749576.git.jani.nikula@intel.com>
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

Series: drm: add missing header guards to drm_crtc_internal.h (rev2)
URL   : https://patchwork.freedesktop.org/series/130823/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 2e45ab4961e3 drm-tip: 2024y-03m-07d-08h-28m-14s UTC integration manifest
=== git am output follows ===
Applying: drm/crtc: make drm_crtc_internal.h self-contained
Applying: drm: add missing header guards to drm_internal.h
Applying: drm/kunit: fix drm_kunit_helpers.h kernel-doc
Applying: drm/amdgpu: make amd_asic_type.h self-contained
Applying: drm: bridge: samsung-dsim: make samsung-dsim.h self-contained
Applying: drm/dp_mst: fix drm_dp_mst_helper.h kernel-doc
Applying: drm/crc: make drm_debugfs_crc.h self-contained and fix kernel-doc
Applying: drm/encoder: silence drm_encoder_slave.h kernel-doc
Applying: drm: fix drm_format_helper.h kernel-doc warnings
Applying: drm/lease: make drm_lease.h self-contained
Applying: drm: fix drm_gem_vram_helper.h kernel-doc
Applying: drm/of: make drm_of.h self-contained
Applying: drm/i2c: silence ch7006.h and sil164.h kernel-doc warnings
Applying: drm/suballoc: fix drm_suballoc.h kernel-doc
Applying: drm/i915: fix i915_gsc_proxy_mei_interface.h kernel-doc
Applying: drm/i915/hdcp: fix i915_hdcp_interface.h kernel-doc warnings
Applying: drm/i915/pxp: fix i915_pxp_tee_interface.h kernel-doc warnings
Applying: drm/ttm: fix ttm_bo.h kernel-doc warnings
Applying: drm/ttm: make ttm_caching.h self-contained
Applying: drm/ttm: fix ttm_execbuf_util.h kernel-doc warnings
Applying: drm/ttm: fix ttm_kmap_iter.h kernel-doc warnings
Applying: drm: ensure drm headers are self-contained and pass kernel-doc


