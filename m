Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43512606A31E
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 21:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SkDTTs4S
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F13010E706;
	Fri, 23 Oct 2026 21:10:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FCD10E70D
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 21:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792789845; x=1824325845;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=sG7UO4siroYB0k70m44SX9BxAaNG/gG94sjvSetczb4=;
 b=SkDTTs4SgygrWJfsUhCDuCGUB+Szps0CArC8K4Ukdp8ZVzDGrH+humjX
 jmBkn5EkPoPVuyPxajL+sZ796toInpt+VSkf5D7yMOsBKBd29Qaoq823i
 tItyrc7tl8xEZ7lIloerYYseAQHXbUaTHhqOJ08ntzP1XKpx1qXJ1l+IJ
 dDia9OBVQBcM9qm/a20Cvm52WE+8F+pgtErZ1fPoLhBu5jvYEz5alQMVN
 e1YpFcLNErlyopRCoJuegrK5MPCGC/9R0wOIz0eHpRZv5pWXoT2vs34jn
 xrSaNNVGrSfKHJK/CPIfxT1Dct7GrUciPNygol6pY1RR6+ynO8jjR25tq g==;
X-CSE-ConnectionGUID: U1L+B/53T3uwEtSAw6JrQQ==
X-CSE-MsgGUID: NYO3WvzkRjqfryRGQcU4lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1562597"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1562597"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:10:41 -0700
X-CSE-ConnectionGUID: 2y52PLgVSQqIGcLTbI5V8w==
X-CSE-MsgGUID: HMR0O45oQfqN5kjWAtzbpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3804795"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 14:10:39 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 23 Oct 2026 18:09:38 -0300
Subject: [PATCH 10/10] drm/xe: Implement Wa_16031259911
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-wa_16031259911-v1-10-b0453f79c4e1@intel.com>
References: <20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com>
In-Reply-To: <20261023-wa_16031259911-v1-0-b0453f79c4e1@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Implement Wa_16031259911, which applies to graphics version 35.10 and
35.11.  The workaround definition instructs us to set the minimum idle
delay value to 2 times the memory read delay, and tells that using 1
unit of the IDLE_DELAY field covers that minimum.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ads.c    | 6 ++++--
 drivers/gpu/drm/xe/xe_hw_engine.c  | 3 +++
 drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 2e738d205738..7f830122ae16 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -227,7 +227,8 @@ static size_t calculate_regset_size(struct xe_gt *gt)
 		if (XE_GT_WA(gt, 1607983814) && hwe->class == XE_ENGINE_CLASS_RENDER)
 			count += LNCFCMOCS_REG_COUNT;
 
-		if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt, 14025941587))
+		if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt, 14025941587) ||
+		    (XE_GT_WA(hwe->gt, 16031259911) && xe_gt_supports_multi_queue(hwe->gt, hwe->class)))
 			count++; /* RING_IDLEDLY */
 	}
 
@@ -875,7 +876,8 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 		}
 	}
 
-	if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt, 14025941587))
+	if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt, 14025941587) ||
+	    (XE_GT_WA(hwe->gt, 16031259911) && xe_gt_supports_multi_queue(hwe->gt, hwe->class)))
 		guc_mmio_regset_write_one(ads, regset_map,
 					  RING_IDLEDLY(hwe->mmio_base),
 					  count++);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 18c8f88739d5..96741d3050c5 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -618,6 +618,9 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
 	if (XE_GT_WA(gt, 14025941587))
 		min_idledly_ps = max(min_idledly_ps, 5000000);
 
+	if (XE_GT_WA(gt, 16031259911) && xe_gt_supports_multi_queue(gt, hwe->class))
+		min_idledly_ps = max(min_idledly_ps, idledly_units_ps);
+
 	if (XE_GT_WA(gt, 16023105232)) {
 		u32 maxcnt_units_ps = 640000;
 		u32 maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 9be392bce969..a28552c09019 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -77,3 +77,4 @@
 14025941587	GRAPHICS_VERSION_RANGE(2001, 3511)
 		MEDIA_VERSION_RANGE(1301, 3503)
 16030224309	GRAPHICS_VERSION(3510)
+16031259911	GRAPHICS_VERSION_RANGE(3510, 3511)

-- 
2.56.0

