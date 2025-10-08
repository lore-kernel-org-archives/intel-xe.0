Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB19CCD187
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 21:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBD310E903;
	Wed,  8 Oct 2025 21:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CWGHO8KI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDDF10E8F2
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 21:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759959952; x=1791495952;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=vqy65TM/erB+dODD3Z2jzO+3Uzmt7zG98Lqdn4wDiCc=;
 b=CWGHO8KIHADK6M3Z/mYwl5bDle1C4S8zfKOuSvfT4pKrY7k0HILFWYKe
 WkG/XfsQx75phTFy0Jfpj7Rmf9QBcBit5cZugaF9B1QscIHPyYmNz8uYA
 7Df3JU1ppLeKC4u1EtJ4UIQ6otmNPqyCMFQ+Nm3DypdGQ2kJQaZAkJ1at
 IoF60RuyObkpDUQjfzO/94kjfKbhkzaJP/6PWIN127/IQQA7Zwl8RrbfK
 rhHnyY6qnr0b26pQO5S81fiqeJng6ISk+d7MVcgNoBv7E27QnmmO6pJPk
 iveTzHWRF7+2ypmRo19oHPvsJS5MOpS5f44yDGZ2LbMsTYjy0gH2h+Toj Q==;
X-CSE-ConnectionGUID: aCuyUGHDSCOJ7XMV3kCifQ==
X-CSE-MsgGUID: jSDYfIHlQ8CgVXoqgzmSHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="49726880"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="49726880"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:43 -0700
X-CSE-ConnectionGUID: NZ1E3Wd/SwGsKrINtptz9A==
X-CSE-MsgGUID: 6bT+1y8TQz6LvD7po7eS+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217635222"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:45:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v10 34/34] drm/xe/guc: Increase wait timeout to 2sec after
 BUSY reply from GuC
Date: Wed,  8 Oct 2025 14:45:32 -0700
Message-Id: <20251008214532.3442967-35-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008214532.3442967-1-matthew.brost@intel.com>
References: <20251008214532.3442967-1-matthew.brost@intel.com>
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

From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

Some VF2GUC actions may take longer to process. Increase default timeout
after received BUSY indication to 2sec to cover all worst case scenarios.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index d5adbbb013ec..d94490979adc 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1439,7 +1439,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 		BUILD_BUG_ON((GUC_HXG_TYPE_RESPONSE_SUCCESS ^ GUC_HXG_TYPE_RESPONSE_FAILURE) != 1);
 
 		ret = xe_mmio_wait32(mmio, reply_reg, resp_mask, resp_mask,
-				     1000000, &header, false);
+				     2000000, &header, false);
 
 		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
 			     GUC_HXG_ORIGIN_GUC))
-- 
2.34.1

