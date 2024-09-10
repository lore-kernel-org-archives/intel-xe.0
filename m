Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738D6ECE564
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 11:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265ED10E7A3;
	Tue, 10 Sep 2024 11:13:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A1310E793;
 Tue, 10 Sep 2024 11:13:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_drm=3A_fix_and_enabl?=
 =?utf-8?q?e_warnings_on_unused_static_inlines?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Sep 2024 11:13:48 -0000
Message-ID: <172596682854.980405.5734034798248267585@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1725962479.git.jani.nikula@intel.com>
In-Reply-To: <cover.1725962479.git.jani.nikula@intel.com>
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

Series: drm: fix and enable warnings on unused static inlines
URL   : https://patchwork.freedesktop.org/series/138461/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: bab1666fc237 drm-tip: 2024y-09m-10d-03h-10m-44s UTC integration manifest
=== git am output follows ===
Applying: drm/bridge: dw-hdmi-i2s: annotate hdmi_read() with __maybe_unused
Applying: drm: renesas: rcar-du: annotate rcar_cmm_read() with __maybe_unused
Applying: drm/kmb: annotate set_test_mode_src_osc_freq_target_{low, hi}_bits() with __maybe_unused
Applying: drm/bridge: ti-sn65dsi86: annotate ti_sn_pwm_pin_{request, release} with __maybe_unused
Applying: drm/imagination: annotate pvr_fw_version_packed() with __maybe_unused
Applying: drm/meson: dw-hdmi: annotate dw_hdmi_dwc_write_bits() with __maybe_unused
Applying: drm/msmi: annotate pll_cmp_to_fdata() with __maybe_unused
Applying: drm: enable warnings on unused static inlines


