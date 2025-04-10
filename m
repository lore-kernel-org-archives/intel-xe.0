Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB90C369A9
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 18:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF9210E388;
	Thu, 10 Apr 2025 18:46:12 +0000 (UTC)
Received: from 32c37dd7f93d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2AF410E388;
 Thu, 10 Apr 2025 18:46:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm=3A_Eliminate_red?=
 =?utf-8?q?undant_drm=5Fformat=5Finfo_lookups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Apr 2025 18:46:10 -0000
Message-ID: <174431077072.366.5759584519445696705@32c37dd7f93d>
X-Patchwork-Hint: ignore
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
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

Series: drm: Eliminate redundant drm_format_info lookups
URL   : https://patchwork.freedesktop.org/series/147542/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: c56353870b17 drm-tip: 2025y-04m-10d-17h-46m-08s UTC integration manifest
=== git am output follows ===
Applying: drm: Pass pixel_format+modifier to .get_format_info()
Applying: drm: Pass pixel_format+modifier directly to drm_get_format_info()
Applying: drm: Look up the format info earlier
Applying: drm: Pass the format info to .fb_create()
Applying: drm: Allow the caller to pass in the format info to drm_helper_mode_fill_fb_struct()
Applying: drm/malidp: Pass along the format info from .fb_create() malidp_verify_afbc_framebuffer_size()
Applying: drm/gem: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
Applying: drm/gem/afbc: Eliminate redundant drm_get_format_info()
Applying: drm/amdgpu: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
Applying: drm/armada: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
Applying: drm/exynos: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
Applying: drm/gma500: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
Applying: drm/i915: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
Applying: drm/komeda: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
Applying: drm/msm: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
Applying: drm/tegra: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
Applying: drm/virtio: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
Applying: drm/vmwgfx: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
Applying: drm: Make passing of format info to drm_helper_mode_fill_fb_struct() mandatory


