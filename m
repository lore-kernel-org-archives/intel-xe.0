Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1683EF433D3
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 23:47:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8AAB10E7D7;
	Wed, 15 Apr 2026 23:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N15bL+8R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA3810E7BE;
 Wed, 15 Apr 2026 23:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776296827; x=1807832827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bdR4UQxPBctEr+x2xQo9w3FWXkm7LcQIgZpuqPar2H0=;
 b=N15bL+8Ri11FiMPYXOorNqnUbeVZmf8GnxABRTd3TwWfyH526t14iUbL
 gGHOSHwTbnYZzeRl6ffnARRbdxl7EaCzvY0F1sz5trA2rIMa/LJbtjr7Z
 ugJ+tpL+0AOCuu/RoaYJC6R0GGSGu02VRdQZfDTRSkbJuYabe/OzXyYsZ
 SKiY02hISp+u3BhtqONY1gVGCW//qc3l4pqAHXpjvCCPPX9BU7CzAxPTn
 5GbTSSYSkK9b3VLoK83VhusXIxuNRM3RLAqfXIsVxYSqmJR5B3kKX23SO
 s5PJpK3goiBlwfoZrBa4irdZvuPp7XX1PLZPEKtAegXj6oRw6YK0Bp/DH A==;
X-CSE-ConnectionGUID: 0MuIgBscQ/O91RGfh5F1mw==
X-CSE-MsgGUID: 8bgu508OSqe7QJy/JZii3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77403496"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77403496"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 16:47:07 -0700
X-CSE-ConnectionGUID: aoaKee4eTGO7itKNhyqSww==
X-CSE-MsgGUID: HIdnq/XQSVOZAPEFvC6pqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235511168"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 15 Apr 2026 16:47:06 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v2 10/32] drm/i915/bios: print VS/PE-O port info
Date: Thu, 16 Apr 2026 01:46:17 +0200
Message-ID: <20260415234639.3577774-11-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260415234639.3577774-1-michal.grzelak@intel.com>
References: <20260415234639.3577774-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Issue a debug message when port asks to override default Vswing /
Preemphasis tables.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 05ac1c42a4ea3..266993db66c5c 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2801,6 +2801,11 @@ static void print_ddi_port(const struct intel_bios_encoder_data *devdata)
 			    "Port %c supports dynamic DDI allocation in TCSS\n",
 			    port_name(port));
 
+	if (intel_bios_encoder_overrides_vswing(devdata))
+		drm_dbg_kms(display->drm,
+			    "Port %c overrides VS/PE tables\n",
+			    port_name(port));
+
 	hdmi_level_shift = intel_bios_hdmi_level_shift(devdata);
 	if (hdmi_level_shift >= 0) {
 		drm_dbg_kms(display->drm,
-- 
2.45.2

