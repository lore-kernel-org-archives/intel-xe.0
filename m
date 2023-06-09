Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25874C7EE45
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jun 2023 14:38:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D365610E6B9;
	Fri,  9 Jun 2023 14:38:47 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691CD10E6B6
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jun 2023 14:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686321524; x=1717857524;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g5odRioB34n0SZI4rc48wQ1O0Fep+rlFs4o7qytmeJU=;
 b=LgT/l5MOqMF1syKxxYoj3TDR6RJv+t8lwfV2lMdtTkT1/x+JRFL7Q77i
 wx31EWe90uDeqbaZdR/gBST7mssxZv4isrEXfmVIWGQgHu9pdRcHaxt0O
 LDGcdOIpzu2Ku2g/R7Ia0pLAkxOnAKXE2U54Soo7/OEw3Je6/bZrebUtm
 zrTi/FX4DsFJA6ZKJbjWtLkGo7JlGCX3UQsJ5C4kM0UV21pKTeNROfeEc
 pm3RXXy7RRp5sXMhxjJh8tORLYG3fHFaEroMLNqXH5qx0kBu06a8rGu9N
 3UbQz7pIieO8xX7ZLmzyYoOI8g/RRazIwRUrEUeTjqhCrnbLBX0CVOjrM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="360094476"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="360094476"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 07:38:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="957175727"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="957175727"
Received: from pdhernan-mobl.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.255.35.182])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 07:38:42 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  9 Jun 2023 11:38:15 -0300
Message-Id: <20230609143815.302540-3-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609143815.302540-1-gustavo.sousa@intel.com>
References: <20230609143815.302540-1-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] drm/xe/reg_sr: Apply limit to register
 whitelisting
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

If RING_MAX_NONPRIV_SLOTS denotes the maximum number of whitelisting
slots, then it makes sense to refuse going above it.

v2:
  - Use xe_gt_err() instead of drm_err() for more detailed info in the
    error message. (Matt)

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 65e6ad1906c6..7c88352636d2 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -235,6 +235,13 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 
 	p = drm_debug_printer(KBUILD_MODNAME);
 	xa_for_each(&sr->xa, reg, entry) {
+		if (slot == RING_MAX_NONPRIV_SLOTS) {
+			xe_gt_err(gt,
+				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
+				  hwe->name, RING_MAX_NONPRIV_SLOTS);
+			break;
+		}
+
 		xe_reg_whitelist_print_entry(&p, 0, reg, entry);
 		xe_mmio_write32(gt, RING_FORCE_TO_NONPRIV(mmio_base, slot),
 				reg | entry->set_bits);
-- 
2.40.1

