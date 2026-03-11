Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E0E112583D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 14:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BCC89A86;
	Wed, 11 Mar 2026 14:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Adlp+5ro";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C301910E8FC;
 Wed, 11 Mar 2026 14:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773238760; x=1804774760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hd6hovMmB7VUPTF3ZkjiVaGe8Cn5dgkbMrKroebKH/U=;
 b=Adlp+5roEP5W3MF8Jq1Lk1dObv9iaqilqAvnTLbh+iiNaQ9dCe8jT63p
 Ht7ZA0Y8lUmUJ1Ql7mj9qHyqBJ0UbpPEd4j1EhCD2bJrNmEkcnXR7Ru2p
 mLRZ8gONh9fwftQvEbr9yuoZVGnzMuVrsiiUdYL9NYVk+2B7HTMjt7hA4
 jWh2Dide389m9ow+norjKG73o+xZE5XbQXFKhvVPaq7CQ06z8sFBJUy1C
 HF6oNtIWPZ4rXvPRbl4COwVlEDDZQeg1TUXUZzsjIl+YYAnJE3SaDixZ0
 HZ2cGamvckacLl6Cx26boMkJZqIX+Cpxo8SAIrXZi01OCSHbp95w3+yts A==;
X-CSE-ConnectionGUID: H/SmhYMUT1aDz6S34ZbdQQ==
X-CSE-MsgGUID: Htf6NrqAQWqTHnCdcDAbyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="99775208"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="99775208"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 07:19:19 -0700
X-CSE-ConnectionGUID: OL8hgAoiSFiBfotPg3yN7w==
X-CSE-MsgGUID: 8vlv5WlrSbSEzsvt3Z16Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="216730462"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa006.fm.intel.com with ESMTP; 11 Mar 2026 07:19:18 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v3 09/24] drm/i915/lt_phy: Add xe3plpd .update_active_dpll hook
Date: Wed, 11 Mar 2026 14:18:50 +0000
Message-ID: <20260311141905.2526418-10-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311141905.2526418-1-mika.kahola@intel.com>
References: <20260311141905.2526418-1-mika.kahola@intel.com>
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

Add .update_active_dpll function pointer to support
dpll framework for xe3plpd platform. Reuse ICL function
pointer.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index af2613eeaf92..c1ed44b23bba 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4655,6 +4655,7 @@ static const struct intel_dpll_mgr xe3plpd_pll_mgr = {
 	.compute_dplls = xe3plpd_compute_dplls,
 	.get_dplls = mtl_get_dplls,
 	.put_dplls = icl_put_dplls,
+	.update_active_dpll = icl_update_active_dpll,
 };
 
 /**
-- 
2.43.0

