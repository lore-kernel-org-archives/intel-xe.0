Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26339CD4851
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 15:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBAFC10F25A;
	Thu, 14 May 2026 15:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ml1CeC3w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015AC10F25A
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 15:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778770828; x=1810306828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IKitXBd8Ca5ItuHdH0ceW2qF7BuLwk/idXj10WP/A9g=;
 b=ml1CeC3wX/N5vfzeJvVRuygTAt9OPNtGmmSFZWH1Yt0iFeuvFNSKtPLv
 XFx04IZwIq0KBjxmwx0l9DOyZ1POnFPb5ZHudhCEUNenXB7KIvlZ4v/5f
 wkfpiqywMIyGeJM6Y/EMFRdRCTIzZl6wAtDnNHDOTak79cLITvHVkDQi4
 i400kbXrE1hfJx0wN3B36tH/xMtHvYHz/kiFkiv0ctggShP6hVnIVHKSZ
 0cGZr8Hf/KFtixj/G93S3/0+ADKvgCq0JH7IE1VstJpvrbCj030R3OuFF
 JqmpE6TKJATKht5FPrKftDsevF5d7PcONf7hjDyq3XuYmcDktMSuCAoxn g==;
X-CSE-ConnectionGUID: Uv9RICaTRW+8t+w/rPbuRw==
X-CSE-MsgGUID: 5kOhd9cSS1WdzWh/fiZX6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="91178843"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="91178843"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 08:00:28 -0700
X-CSE-ConnectionGUID: vPl+1yDsSSW6YgIcc9lj/w==
X-CSE-MsgGUID: JikmLoN8S/CjeUhSLWfIfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="262152870"
Received: from johnmoon-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.112.169])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 08:00:27 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 6/9] drm/xe/memirq: Update diagnostic message
Date: Thu, 14 May 2026 17:00:07 +0200
Message-ID: <20260514150010.7123-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260514150010.7123-1-michal.wajdeczko@intel.com>
References: <20260514150010.7123-1-michal.wajdeczko@intel.com>
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

Instead printing static offset values, print number of allocated
pages and the actual GGTT addresses of the page zero source and
status and address of the common mask vector.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 6ffc92f5a0f2..bd2417207b0b 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -226,9 +226,11 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 	memirq_assert(memirq, !memirq->status.is_iomem);
 	memirq_assert(memirq, !memirq->mask.is_iomem);
 
-	memirq_debug(memirq, "page offsets: bo %#x bo_size %zu source %#x status %#x\n",
-		     xe_bo_ggtt_addr(bo), bo_size, XE_MEMIRQ_SOURCE_OFFSET(0),
-		     XE_MEMIRQ_STATUS_OFFSET(0));
+	memirq_debug(memirq, "pages: count %u size %zu\n", num_pages, bo_size);
+	memirq_debug(memirq, "page0: source %#x status %#x mask %#x\n",
+		     xe_bo_ggtt_addr(bo) + XE_MEMIRQ_SOURCE_OFFSET(0),
+		     xe_bo_ggtt_addr(bo) + XE_MEMIRQ_STATUS_OFFSET(0),
+		     xe_bo_ggtt_addr(bo) + XE_MEMIRQ_ENABLE_OFFSET);
 
 	return 0;
 
-- 
2.47.1

