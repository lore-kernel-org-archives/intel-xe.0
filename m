Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4317AC54E58
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 10:41:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E435110F2BD;
	Wed, 13 Mar 2024 10:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwOF9P9k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D6B10E2EB
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 10:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710326512; x=1741862512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0mg1pJvhdrWyYhziAhAa9GKP+JQ+Tq3pU+TrbxuA/g8=;
 b=XwOF9P9kWs3DZ07Tf0By+D6GRt2PPXe3uuZEAGnt5KZuW47DGUB2R21G
 KUu6GSbtqA/hsuYmQgFgC5rsk5YDSBRf7e17cgwDghzHkgd0cTy571zda
 b2BeHXF9oV9jd1c+eHCJwKJLUwsMuPEUpkTrughdJ5WCYPEvMw+Liq1us
 5jG2SYUcpTwf0mkhTNIHLBIcS8q2Sk2FNivUZA85p661aOfjyCfUKha7A
 11+MFpIEn+5B9Pc7BI9yNuEkKlSeYySx4lS+3C8/PNq3UDgkc3h2i2Brr
 NZIpiJi4cH3QzZ4zsZ2ggkkxGTeVkgJ0G0eEJEHIUbRHw/P+tbgoWfmEG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8025291"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="8025291"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 03:41:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="11798990"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.141.133])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 03:41:50 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 2/3] drm/xe/pf: Request 64K aligned allocations for LMTT PD
Date: Wed, 13 Mar 2024 11:41:31 +0100
Message-Id: <20240313104132.1045-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240313104132.1045-1-michal.wajdeczko@intel.com>
References: <20240313104132.1045-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The LMTT Page Directory, as well as the directory entries, must be
aligned on a 64KB boundary in VRAM. Use explicit alignment flag to
match hardware requirement.

Bspec: 52404, 67468
Cc: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_lmtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index 0d7c5514e092..dfb0e1887615 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -71,7 +71,7 @@ static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level
 					     lmtt->ops->lmtt_pte_num(level)),
 				  ttm_bo_type_kernel,
 				  XE_BO_CREATE_VRAM_IF_DGFX(lmtt_to_tile(lmtt)) |
-				  XE_BO_CREATE_PINNED_BIT);
+				  XE_BO_NEEDS_64K | XE_BO_CREATE_PINNED_BIT);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto out_free_pt;
-- 
2.43.0

