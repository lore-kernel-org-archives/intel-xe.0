Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2A7C02185
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jan 2025 06:23:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB8910E2DB;
	Mon, 20 Jan 2025 06:23:03 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C1010E2F6;
 Mon, 20 Jan 2025 06:23:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Add_HDMI_PLL_Algorit?=
 =?utf-8?q?hm_for_SNPS/C10PHY_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 20 Jan 2025 06:23:01 -0000
Message-ID: <173735418134.1953407.5949109838185773633@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250120042122.1029481-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250120042122.1029481-1-ankit.k.nautiyal@intel.com>
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

Series: Add HDMI PLL Algorithm for SNPS/C10PHY (rev4)
URL   : https://patchwork.freedesktop.org/series/135396/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: aceaa93d2b1d drm-tip: 2025y-01m-19d-21h-56m-14s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/display: Add support for SNPS PHY HDMI PLL algorithm for DG2
Applying: drm/i915/snps_phy: Use HDMI PLL algorithm for DG2
Applying: drm/i915/cx0_phy_regs: Add C10 registers bits
Applying: drm/i915/intel_snps_hdmi_pll: Compute C10 HDMI PLLs with algorithm
Applying: drm/i915/cx0_phy: Use HDMI PLL algorithm for C10 PHY


