Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDDFC04FF9
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 08:14:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9F01122DD;
	Mon, 15 Apr 2024 08:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MjGZMQPx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93ACD1122F8;
 Mon, 15 Apr 2024 08:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713168877; x=1744704877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nQIsVKIs2iYDuQRPd7DkuHGVvjiw8mwR4g7NMEddPzk=;
 b=MjGZMQPxT717FCSFaXl5AcDWO8G/SkSqLuySf4xyLNuOf53jxWP9OT+f
 kPc9E1TVE13BGzm2if/wyY572/DvoLEArDwq+VQVfXAm79p+953xNQ9eJ
 Fd1eo6dlu1pRSIfMydBiiGyt5yC0sskkUmdrJMYCPIsdXbldNVi5Ax7Tp
 eNq25v9n8lLvvGJTpd8fjggEOjVPPt03OyEsPJ+jzUy4LgWkemZKc+fV/
 JmJC8yag1/+BD7zbxWzfEp7DHP7rnELnySubsLbGOw/jiMMFP2ylzlPe/
 n5qd2aZPzZA6IZRVnzSQrIjAmjvO0zuJBb9mp/o0xv90aZLTCryZvy0B7 Q==;
X-CSE-ConnectionGUID: kOSUTJbcTgGz7q5kew1l2Q==
X-CSE-MsgGUID: FFDtpPcFTg6d5FdPrIa4sg==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="9096436"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="9096436"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 01:14:37 -0700
X-CSE-ConnectionGUID: KUH8DVbDSxWc3oaNn5mfng==
X-CSE-MsgGUID: 3m8nIIbgQZCx7C4f7I2y4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="26400476"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 01:14:35 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v3 18/21] drm/xe/gt_print: add xe_gt_err_once()
Date: Mon, 15 Apr 2024 13:44:20 +0530
Message-Id: <20240415081423.495834-19-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240415081423.495834-1-balasubramani.vivekanandan@intel.com>
References: <20240415081423.495834-1-balasubramani.vivekanandan@intel.com>
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

From: Matthew Auld <matthew.auld@intel.com>

Needed in an upcoming patch, where we want GT level print, but only
which to trigger once to avoid flooding dmesg.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_printk.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
index c2b004d3f48e..d6228baaff1e 100644
--- a/drivers/gpu/drm/xe/xe_gt_printk.h
+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
@@ -13,6 +13,9 @@
 #define xe_gt_printk(_gt, _level, _fmt, ...) \
 	drm_##_level(&gt_to_xe(_gt)->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
 
+#define xe_gt_err_once(_gt, _fmt, ...) \
+	xe_gt_printk((_gt), err_once, _fmt, ##__VA_ARGS__)
+
 #define xe_gt_err(_gt, _fmt, ...) \
 	xe_gt_printk((_gt), err, _fmt, ##__VA_ARGS__)
 
-- 
2.25.1

