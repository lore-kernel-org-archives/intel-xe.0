Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88168C54E4A
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 13:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F33C10FA0B;
	Fri,  8 Mar 2024 13:50:54 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DC710FA0B;
 Fri,  8 Mar 2024 13:50:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm=3A_fix_headers?=
 =?utf-8?q?=2C_add_header_test_facility?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Mar 2024 13:50:53 -0000
Message-ID: <170990585340.621641.7139218477200910026@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1709898638.git.jani.nikula@intel.com>
In-Reply-To: <cover.1709898638.git.jani.nikula@intel.com>
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

Series: drm: fix headers, add header test facility
URL   : https://patchwork.freedesktop.org/series/130916/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 024301d28b0b drm-tip: 2024y-03m-08d-10h-19m-05s UTC integration manifest
=== git am output follows ===
Applying: drm: add missing header guards to drm_crtc_internal.h
Applying: drm: add missing header guards to drm_crtc_helper_internal.h
Applying: drm/encoder: improve drm_encoder_slave.h kernel-doc
Applying: drm/i2c: silence ch7006.h and sil164.h kernel-doc warnings
Applying: drm/i915: fix i915_gsc_proxy_mei_interface.h kernel-doc
Applying: drm/i915/hdcp: fix i915_hdcp_interface.h kernel-doc warnings
Applying: drm/i915/pxp: fix i915_pxp_tee_interface.h kernel-doc warnings
Applying: m68k: pgtable: Add missing #include <asm/page.h>
Applying: drm/ttm: fix ttm_bo.h kernel-doc warnings
Applying: drm/ttm: make ttm_caching.h self-contained
Applying: drm/ttm: fix ttm_execbuf_util.h kernel-doc warnings
Applying: drm/ttm: fix ttm_kmap_iter.h kernel-doc warnings
Applying: drm/ttm: make ttm_pool.h self-contained
Applying: drm/dp_mst: avoid includes in drm_dp_mst_topology_internal.h
Applying: drm: avoid includes in drm_crtc_helper_internal.h
Applying: drm: ensure drm headers are self-contained and pass kernel-doc


