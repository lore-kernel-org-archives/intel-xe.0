Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A520CD98E0
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 22:42:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E912910E6CB;
	Mon, 15 Jun 2026 22:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ATFd9fdh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172D510E6CB
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 22:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781563353; x=1813099353;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=YvxZqyZlq6MWQ1TYRWT/3BNZbpQq05MEUv2/gnhFF2A=;
 b=ATFd9fdhXYIZnW7fsN8jCbhuOWw875A/2A5b101TcSCRe30jCSAGnTKT
 8W7MaKu7fbN6JzpEFTQPtDySGt/UyICmXKrgjjQEe8RSH6Z324qQW3lmz
 HhwS1GWspZcqp1gX982AQ9yIvA3aSGHm6SBXGRLlPKywM3g/sbOmraxOg
 VnWgbbJohCpeocnq+4jGFKzc6Pv9dAKgwpKaCI3U0BAYbqL3cV0YZAS9F
 Z+K7hI/KuQGUTprK2rbAXd+cNgmC42855Sjp6GJIbm35ic/TNSFUaBSsr
 OhfXRo3JBTOXe3aZWFjYvcuduBAtLSjZPwrJgG16kj/h1Oo4uLFPamtmW g==;
X-CSE-ConnectionGUID: 0+MlCGiQQYSUPNXpPdiYWw==
X-CSE-MsgGUID: NbLPybokRcWYvU/wMuupRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82513156"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="82513156"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 15:42:32 -0700
X-CSE-ConnectionGUID: Esb0/gSjT9SISDhQFrgxpw==
X-CSE-MsgGUID: 3q68I0iyQmSaecr7LNeTaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="247676802"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 15:42:31 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 5/9] drm/xe/rtp: Save OA nonpriv registers to register
 save/restore lists
Date: Mon, 15 Jun 2026 15:42:23 -0700
Message-ID: <20260615224227.34880-6-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615224227.34880-1-ashutosh.dixit@intel.com>
References: <20260615224227.34880-1-ashutosh.dixit@intel.com>
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

Now we can save OA whitelisting nonpriv registers to register save/restore
lists. OA nonpriv registers are saved to both hwe->oa_sr as well as
hwe->reg_sr.

During probe, resume and gt-reset flows KMD will apply hwe->reg_sr,
ensuring OA registers are de-whitelisted after these events. For
engine-reset, hwe->reg_sr is registered with GuC and GuC will apply these
registers, ensuring OA registers are de-whitelisted after engine resets.

hwe->oa_sr is used for whitelisting or de-whitelisting OA registers during
OA operation, by toggling the 'deny' bit on oa stream open/close.

v2: Provide more details in commit message (Umesh)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index e9d0a0b82527d..76ac23644a4df 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -215,6 +215,18 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
 	first_oa_slot = whitelist_apply_to_hwe(hwe, &hwe->reg_whitelist, &hwe->reg_sr, 0);
 
 	xe_rtp_process_to_sr(&ctx, &oa_whitelist, &hwe->oa_whitelist, false);
+
+	/*
+	 * Save oa nonpriv registers to hwe->oa_sr, from which oa registers are whitelisted
+	 * or de-whitelisted, by toggling the 'deny' bit on oa stream open/close
+	 */
+	whitelist_apply_to_hwe(hwe, &hwe->oa_whitelist, &hwe->oa_sr, first_oa_slot);
+
+	/*
+	 * Also save oa nonpriv registers to hwe->reg_sr, to ensure oa registers are not
+	 * whitelisted by default after probe, gt reset, resume and engine reset
+	 */
+	whitelist_apply_to_hwe(hwe, &hwe->oa_whitelist, &hwe->reg_sr, first_oa_slot);
 }
 
 /**
-- 
2.54.0

