Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17773C27C52
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 19:56:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C286110E090;
	Thu,  6 Jun 2024 19:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ob2ihF+N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C2F10EA7A
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 19:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717703804; x=1749239804;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IuYaQi4N2k+YZ8iku5L/U6P11Ulq5liHVENmjE5Szk0=;
 b=Ob2ihF+Nhz3ymt3ix6fKYHG9F8YtBIYi7vF+V5tfsY4qoA4Q/i4sZf/x
 pm2ioMms6MCtWlts00L87odLK0wvHdYxcXE9zezJWtJS61VPcMfT4lt2I
 FS416UUHV8HHDgas1e2E+/8dveSoB1aOKqE5qFAlToMDU8WCVgLyxamej
 DpGANAM555nj0ENmraAJs0XerdsNHpzljpzmOJvEx0ZRMa8cKsOUzIVdy
 No7EINlTcxT6P0W/PbuH0b/a282I+zl2qEV3mB1S3b7LeO3fHzR9ANY14
 Pmn+scEnczTQL6m93sV2DDO4D/f/q1EeUvURdzJ9jzjD4ff8ix5/mMZKE g==;
X-CSE-ConnectionGUID: 0z7Y2rk3Qv+wIvxLkbbSZQ==
X-CSE-MsgGUID: Y7+H/WYNRfmSXgYPJgPkXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14535030"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14535030"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 12:56:42 -0700
X-CSE-ConnectionGUID: wldb8PXGSb6M3ieYutww7g==
X-CSE-MsgGUID: S/xHxKOpRxK7DeEjXHyxZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="42655002"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.165])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 12:56:40 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe: Use ttm_uncached for BO with NEEDS_UC flag
Date: Thu,  6 Jun 2024 21:56:30 +0200
Message-Id: <20240606195630.1548-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

We should honor requested uncached mode also at the TTM layer.
Otherwise, we risk losing updates to the memory based interrupts
source or status vectors, as those require uncached memory.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 2bae01ce4e5b..2573cc118f29 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -378,6 +378,9 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 	    (xe->info.graphics_verx100 >= 1270 && bo->flags & XE_BO_FLAG_PAGETABLE))
 		caching = ttm_write_combined;
 
+	if (bo->flags & XE_BO_FLAG_NEEDS_UC)
+		caching = ttm_uncached;
+
 	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
 	if (err) {
 		kfree(tt);
-- 
2.43.0

