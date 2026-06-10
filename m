Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5DCCD8CB9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 17:07:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6975C10E528;
	Wed, 10 Jun 2026 17:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dZfXJuXT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BA710E643;
 Wed, 10 Jun 2026 17:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781111222; x=1812647222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LPIAmBR9OhrxNdaYl4+cfF7nHGYcYW/S/zRlMQw113o=;
 b=dZfXJuXTvvD2veAh0BNomIK9tTsUAAQuXS/qK480wzUIJAwiUdqz318l
 xRVWyDeRcYciUW5bZ2HZwg89+VkJ+oDE4QIkVllctdvlbMEZ/pzrM2UIf
 RmWTtJGPKkboQme41FiRspPGeF8KGvdUJbNUTGuWA40hzPCIoQNo2brfR
 ghc2Jfvc5j1c2PoEIY4KyQUC9WJu++3JpgrCqVlHIKU2bgFx1y7ltDsqw
 jDBXPtZYYJoXBRU2bpl5Us78aD8tvp+qMBip05eGo/rZGlZkip6Sjk3Gs
 xRJ8uAPR5EPCw/2X82ALRrQZxiOIt+y3NwAcg9400OF2HItJoWWeMmPzd Q==;
X-CSE-ConnectionGUID: uz4Z1SyxQQK+kkq3sbNWow==
X-CSE-MsgGUID: E4n9hJ6pSMWdEjAKQX+gRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99490268"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="99490268"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:07:01 -0700
X-CSE-ConnectionGUID: GnxEMSwwRTCsDs9kgD0B7Q==
X-CSE-MsgGUID: giT01X7JTWeQy4KlrU1w5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="250507250"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.62])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:07:00 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 01/14] drm/i915/cdclk: Don't bail if pcode post nofify fails
Date: Wed, 10 Jun 2026 20:06:38 +0300
Message-ID: <20260610170652.5320-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260610170652.5320-1-ville.syrjala@linux.intel.com>
References: <20260610170652.5320-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

We already changed the actual cdclk frequency by the time we do
the pcode post notify. So skipping the subsequent readout is plain
wrong.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 189ae2d3cfc9..9ca56bab281f 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2301,12 +2301,10 @@ static void bxt_set_cdclk(struct intel_display *display,
 						       HSW_PCODE_DE_WRITE_FREQ_REQ,
 						       cdclk_config->voltage_level, 2);
 	}
-	if (ret) {
+	if (ret)
 		drm_err(display->drm,
 			"PCode CDCLK freq set failed, (err %d, freq %d)\n",
 			ret, cdclk);
-		return;
-	}
 
 	intel_update_cdclk(display);
 
-- 
2.53.0

