Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E13C5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 18:24:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9383010E8CF;
	Tue,  3 Jun 2025 18:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KYgGiqDd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846C510E912
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 18:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748975083; x=1780511083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CNeVLuzn9nz1y3YnnxYmkYZ7tEfjjAMAaP0veKybtME=;
 b=KYgGiqDdE0G7G8RLZ5+T93sIWaF3jBjjkmmTCA/Q5fjMSrN2/stBF0gF
 8xEC6Lq5eoRY2NtEVgeouoSjnLUC6EsqK/A+dXLPyWgGg/JfaPcMXToXF
 o8u2BjGoyETYelA0kJNI/vlyarV8VHTodQ60qbNyKJkaU8NvYQ9KYlMWc
 tOgODlq7c7YU2ldxk4nhnc06h7RimmRR0Co9uTCouy6DL6rEY43lWsGkF
 Fe7FqwNiDrc439d0LM4ofqU1V9FpXKRkZNFqMFlP0YdEw3iQ8Ay7KfdG9
 g+y2uIyQRJjAZw3XRQAk6goru6uD8VcXvrb6BP9yL9kW44WCIZoowmjD9 A==;
X-CSE-ConnectionGUID: 0EIS+3GpS/qQioDkZZJ9XQ==
X-CSE-MsgGUID: N/H7pD6pSiKE7fu8JxAkMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="54693871"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="54693871"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:24:43 -0700
X-CSE-ConnectionGUID: w05wndBGTjO0Dqm5aMfOpw==
X-CSE-MsgGUID: kKBymjz+T4ill0zh36XQkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="145562056"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa007.jf.intel.com with ESMTP; 03 Jun 2025 11:24:41 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 6/6] drm/xe: Add Wildcat Lake device IDs to PTL list
Date: Tue,  3 Jun 2025 23:54:30 +0530
Message-Id: <20250603182430.1016734-7-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603182430.1016734-1-dnyaneshwar.bhadane@intel.com>
References: <20250603182430.1016734-1-dnyaneshwar.bhadane@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

Introduce wildcat lake device Id.
Wildcat Lake uses slightly different graphics and media IP versions
than Panther Lake, but can still be treated as PTL for general driver
flows.

Bspec: 73951
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 include/drm/intel/pciids.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index a7ce9523c50d..258273e8b794 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -868,6 +868,8 @@
 	MACRO__(0xB08F, ## __VA_ARGS__), \
 	MACRO__(0xB090, ## __VA_ARGS__), \
 	MACRO__(0xB0A0, ## __VA_ARGS__), \
-	MACRO__(0xB0B0, ## __VA_ARGS__)
+	MACRO__(0xB0B0, ## __VA_ARGS__), \
+	MACRO__(0xFD80, ## __VA_ARGS__), \
+	MACRO__(0xFD81, ## __VA_ARGS__)
 
 #endif /* __PCIIDS_H__ */
-- 
2.34.1

