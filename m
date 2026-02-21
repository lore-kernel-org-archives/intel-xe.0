Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C8EC61DE5
	for <intel-xe@archiver.kernel.org>; Sat, 21 Feb 2026 15:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B366810E0C3;
	Sat, 21 Feb 2026 15:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TSWSkVOL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E62A10E0A0
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Feb 2026 15:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771687383; x=1803223383;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=wd43/I1AmreUdW+4aqROcWdpU8Mq/iXXG6pCWx5onqg=;
 b=TSWSkVOLiryvHPwAvfC60FXj9LUL0CWyQAIga5aM4APi3DdVbE+5FPrA
 DymkVo/7Y9n5OCfBJBjAJKTtilQ8zm9/hNJVnczqwBlCARe5XLfb55OKA
 ZyfMo7VOZfALcQrbaKVjUmNh1xtr7o3/NBi5XJB8Vhm3o5qLcQ/etORLa
 guy91VHceX2ftbNHo7XnLfFmK1HRikju2yDRQyehteJvo9CYMAJqgKjgk
 F1p7ZlCbfdt5z5wHqPKhupZPg/NSQQbME25IId9YHIavTFB0DdfeyRGrT
 EkzpEGIrpLUwbyZOXxgg/lNOYvmvggNkGrJponllM/49wxV78Wug8BkWr w==;
X-CSE-ConnectionGUID: AHeEMwgHQteMOkCx20/2Cg==
X-CSE-MsgGUID: 6klZKW6uQRy7T22v0cP3mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="72852229"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; d="scan'208";a="72852229"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2026 07:23:02 -0800
X-CSE-ConnectionGUID: Kgi7fkIITzeYkvcI+WXS4g==
X-CSE-MsgGUID: xsqMRPR/Q36PRSjUgkto2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; d="scan'208";a="215136031"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2026 07:23:02 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/xe/pf: Don't use LMTT page size if no LMTT
Date: Sat, 21 Feb 2026 16:22:30 +0100
Message-ID: <20260221152230.7071-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260221152230.7071-1-michal.wajdeczko@intel.com>
References: <20260221152230.7071-1-michal.wajdeczko@intel.com>
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

While today all our DGFX platforms have LMTT, we already started
preparation to do not rely on this assumption. Add check for the
LMTT presence and return default page size as VRAM/LMEM alignment
if there is no LMTT.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 53f03e7075d2..b867203b4997 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1451,7 +1451,8 @@ int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid,
 
 static u64 pf_get_lmem_alignment(struct xe_gt *gt)
 {
-	return xe_lmtt_page_size(&gt->tile->sriov.pf.lmtt);
+	return xe_device_has_lmtt(gt_to_xe(gt)) ?
+		xe_lmtt_page_size(&gt_to_tile(gt)->sriov.pf.lmtt) : XE_PAGE_SIZE;
 }
 
 static u64 pf_get_min_spare_lmem(struct xe_gt *gt)
-- 
2.47.1

