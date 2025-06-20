Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28D1C7115C
	for <intel-xe@archiver.kernel.org>; Fri, 20 Jun 2025 21:49:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E5910EBCF;
	Fri, 20 Jun 2025 21:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PDodqggY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8A610EBCD
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Jun 2025 21:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750456167; x=1781992167;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FER6Amr89YhE85gOVB7L/hTCVZh4vmmjwy4zot0FOeg=;
 b=PDodqggYTTp7VrgauZhXOoNljUHCD0bsJZMTX63WVKW37DXnDyeyC1xm
 +kkkEWBQ/FAI38gf34/xyTwrQ4EPWRaqJSB2Y1dj8HMIOcdCTIC14rZnG
 H+LAeovIH2OecXPjHCJW52RqZlmRCrIEe2DzhBPtnD1AGkuXRRDCUC6QI
 QpZ1aYrYkLVmKQql1QWliv7Sv/hUMwiTLb2afEazJUX+5Ft2gnjhxh+C9
 DOgL75y5Dsh19pY6v9qk07eyoFB4hRfluV6W4WJuUJW5oUvinjht73Bf6
 Iu5fWvw/MOo2htkP05+x7+I+X7X0W6h0W6sH57zFhL57HcvYjqMwLs1wW g==;
X-CSE-ConnectionGUID: 6FbcFQMST8uzv6cABaLE0A==
X-CSE-MsgGUID: aruIasqnT16FFHEFFxhJoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="40336503"
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; d="scan'208";a="40336503"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 14:49:27 -0700
X-CSE-ConnectionGUID: pU951dokRrqQovgxeRyTqQ==
X-CSE-MsgGUID: mP8Zjw55QXKwOo6xuHhPeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; d="scan'208";a="151158402"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 14:49:26 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 4/5] drm/xe: extend Wa_15015404425 to apply to PTL
Date: Fri, 20 Jun 2025 14:49:19 -0700
Message-ID: <20250620214920.718179-5-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620214920.718179-1-matthew.s.atwood@intel.com>
References: <20250620214920.718179-1-matthew.s.atwood@intel.com>
MIME-Version: 1.0
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

Wa_15015404425 needs to be applied to PTL A0 to B0, a subsequent patch
will address the complexity required to do this. For now apply to PTL as
a whole.

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_soc_wa_oob.rules | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_soc_wa_oob.rules b/drivers/gpu/drm/xe/xe_soc_wa_oob.rules
index b7d12ea4d65c..3a0c4ccc4224 100644
--- a/drivers/gpu/drm/xe/xe_soc_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_soc_wa_oob.rules
@@ -1 +1,2 @@
 15015404425     PLATFORM(LUNARLAKE)
+		PLATFORM(PANTHERLAKE)
-- 
2.49.0

