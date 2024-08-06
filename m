Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A066C3DA64
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 13:02:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1769610E361;
	Tue,  6 Aug 2024 13:02:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDFE110E361;
 Tue,  6 Aug 2024 13:02:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Add_HDMI_PLL_Algorit?=
 =?utf-8?q?hm_for_SNPS/C10PHY_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Aug 2024 13:02:55 -0000
Message-ID: <172294937583.542888.15008430196104463629@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240806125827.2183899-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240806125827.2183899-1-ankit.k.nautiyal@intel.com>
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

Series: Add HDMI PLL Algorithm for SNPS/C10PHY (rev2)
URL   : https://patchwork.freedesktop.org/series/135396/
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: f3f2526f97af drm-tip: 2024y-08m-06d-12h-15m-38s UTC integration manifest
=== git am output follows ===
Applying: drm/i915/display: Add support for SNPS PHY HDMI PLL algorithm for DG2
Applying: drm/i915/snps_phy: Use HDMI PLL algorithm for DG2
Applying: drm/i915/cx0_phy_regs: Add C10 registers bits
Applying: drm/i915/pll_algorithm: Compute C10 HDMI PLLs with algorithm
Applying: drm/i915/cx0_phy: Use HDMI PLL algorithm for C10 PHY


