Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB32CC3DA4D
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 19:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD1C10E2F4;
	Thu, 11 Jul 2024 19:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bnRUCGd9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F54210E2CB
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 19:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720725814; x=1752261814;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AR2X4jTQMmwXXPZiXuocsuTJ5Q3tX6BaFtn6MZW33rg=;
 b=bnRUCGd9/DggC7+S+pee+5wyn3i5yxqb9TO3UqUdGwYtZ+qUb6AFjvrI
 24Uq1d8ET5f7plFjnuPDRIFzR4t/pj+EsauJaQ5sRlff3bdc3dakx7KTe
 +1tE1gBQbzY/bmwXMzXSCMYUXADg1O15Va2Gl3Kgr5hIsOdxRtVQuOje4
 c61S9+UCVc3I+aDHLQh/VVXgjFybJt/+gUhGQODnmRii7Yxd6v1xmrGTO
 7X+CMDg03MyQcwxAXiyep9V39dVS1Wif5wDZWIFpMNaSrrDCpdZPnYbfM
 XeesWw/7+BpRdDT97nq4hdIeJOBxHAYF3wXD6s6oUd1N34lI+Zm0FBZOb g==;
X-CSE-ConnectionGUID: bFefv4NyRKCW//FPuX+JAA==
X-CSE-MsgGUID: W0DsWwBjS4+rD3CGAE9yVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="28808969"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="28808969"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 12:23:34 -0700
X-CSE-ConnectionGUID: 6dxmo9QZRDmJhL1bb0KG0A==
X-CSE-MsgGUID: dCtQrWDiR/WmoPexjvE9ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="79790269"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.49.75])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 12:23:33 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/2] drm/xe/pf: Limit fair VF LMEM provisioning
Date: Thu, 11 Jul 2024 21:23:19 +0200
Message-Id: <20240711192320.1198-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240711192320.1198-1-michal.wajdeczko@intel.com>
References: <20240711192320.1198-1-michal.wajdeczko@intel.com>
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

Due to the current design of the BO and VRAM manager, any object
with XE_BO_FLAG_PINNED flag, which the PF driver uses during VF
LMEM provisionining, is created with the TTM_PL_FLAG_CONTIGUOUS
flag, which may cause VRAM fragmentation that prevents subsequent
allocations of larger objects, like fair VF LMEM provisioning.

To avoid such failures, round down fair VF LMEM provisioning size
to next power of two size, to compensate what xe_ttm_vram_mgr is
doing to achieve contiguous allocations.

Fixes: ac6598aed1b3 ("drm/xe/pf: Add support to configure SR-IOV VFs")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index db6c213da847..4699b7836001 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1543,6 +1543,7 @@ static u64 pf_estimate_fair_lmem(struct xe_gt *gt, unsigned int num_vfs)
 	u64 fair;
 
 	fair = div_u64(available, num_vfs);
+	fair = rounddown_pow_of_two(fair);	/* XXX: ttm_vram_mgr & drm_buddy limitation */
 	fair = ALIGN_DOWN(fair, alignment);
 #ifdef MAX_FAIR_LMEM
 	fair = min_t(u64, MAX_FAIR_LMEM, fair);
-- 
2.43.0

