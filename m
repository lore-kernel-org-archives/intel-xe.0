Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF07DE7718A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 14:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0061F10EBC8;
	Wed, 18 Dec 2024 14:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AYPmSQvT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B53410EBB2;
 Wed, 18 Dec 2024 14:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734532110; x=1766068110;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KKli7dlZsQbM+YYJ6NRDNkjuOx2gG2SwBDEnYjoybe8=;
 b=AYPmSQvTGkv5gU5xOnrvEQ7v55ymXzBOSuHZfzmpAK58g2+RhjZbMjhA
 IOGB8+i06ahyoBzT/8TMUCHWTs8TEOHDkJnkgDuHZArlBftkXB/PCiW+c
 EVI38pWeIPa5bYebK/3yWHgC07p5f31oUiIcDdtozGLRtgdHiUAV9NtQo
 O4+eRv2xej3O9ajtftlMSTlt2MrtGHE45BwdlgxSVnRxbWUKwWgnY8UpH
 FNglK9l4e9kHgWs1VX2VtTV/R0mTxFO5juFJzRfvriFIOn1NH21EnOtpT
 YsSkPiH/aS/rA/fI6qUy3ODDDIBU1Jyiy6RoZYt6XWMmCUwTfIRM79WCu A==;
X-CSE-ConnectionGUID: w6mE4retT1C0IVx7mOD+VQ==
X-CSE-MsgGUID: bZH5gWNSTaG29RDalChUhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="52534674"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="52534674"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 06:17:42 -0800
X-CSE-ConnectionGUID: liQ3Tp1IQCaHpc5gSvB/GA==
X-CSE-MsgGUID: PFRqiLjyRR6kpdXnEQPuvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="98291449"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.108])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 06:17:39 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH] drm/i915/dmc_wl: store register ranges in rodata
Date: Wed, 18 Dec 2024 16:17:34 +0200
Message-Id: <20241218141734.2583601-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Add const to register range arrays to store them in rodata. They don't
need to be modified.

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc_wl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.c b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
index 3ac44151aab5..02de3ae15074 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc_wl.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
@@ -55,12 +55,12 @@ struct intel_dmc_wl_range {
 	u32 end;
 };
 
-static struct intel_dmc_wl_range powered_off_ranges[] = {
+static const struct intel_dmc_wl_range powered_off_ranges[] = {
 	{ .start = 0x60000, .end = 0x7ffff },
 	{},
 };
 
-static struct intel_dmc_wl_range xe3lpd_dc5_dc6_dmc_ranges[] = {
+static const struct intel_dmc_wl_range xe3lpd_dc5_dc6_dmc_ranges[] = {
 	{ .start = 0x45500 }, /* DC_STATE_SEL */
 	{ .start = 0x457a0, .end = 0x457b0 }, /* DC*_RESIDENCY_COUNTER */
 	{ .start = 0x45504 }, /* DC_STATE_EN */
@@ -94,7 +94,7 @@ static struct intel_dmc_wl_range xe3lpd_dc5_dc6_dmc_ranges[] = {
 	{},
 };
 
-static struct intel_dmc_wl_range xe3lpd_dc3co_dmc_ranges[] = {
+static const struct intel_dmc_wl_range xe3lpd_dc3co_dmc_ranges[] = {
 	{ .start = 0x454a0 }, /* CHICKEN_DCPR_4 */
 
 	{ .start = 0x45504 }, /* DC_STATE_EN */
-- 
2.39.5

