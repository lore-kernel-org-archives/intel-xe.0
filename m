Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85306CA6007
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 12:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 472DD10E803;
	Thu,  8 Oct 2026 12:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XTc5KCXl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F25310E803
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 12:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791462356; x=1822998356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yMcXAUbptiMVDZLAS3b2SVLZ3pjEQciz3c4cdqPQZz4=;
 b=XTc5KCXldt3V8vmu1DMkNvBDIzuABZOpNVRP1G6z/wJ+z+g5rhw8NR5V
 ffI3WUWXMASm4n/Th+dmcmrgx8AjomYuM2hNcKcGI1xjn77TcpEGK0iR+
 mr+f1t2jLqwb4a71xiLR7xIHGJXkg6rnXkxAfpCS15CQoafW4rbL1FOCy
 26OYmJ1TMM10FUW8+W8Z2VA8+nQ3xFeyHrBdYd5lg3RMce0EKPDqBJlmC
 roUO9H22Ks/Rk7+vChviJfS1UfKStZPP3f6niRHD8SXTxVoHcJ22KTIhJ
 SDHM+yymAxTMYvCx7tL5Pmg59pWUVDxZCg7gWl8DuoBZH+iwXzNItNJXJ Q==;
X-CSE-ConnectionGUID: /T3EZneYSVSPo3J08P49ZA==
X-CSE-MsgGUID: fETaGPMTTwa6OcQFPVfQ4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="141497"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="141497"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 05:25:56 -0700
X-CSE-ConnectionGUID: kfwvroB9RTydTuPA/kHInA==
X-CSE-MsgGUID: 0R2kk8x5S/OHr5vH1SVY7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="50921"
Received: from gsd-build.iind.intel.com ([10.190.229.108])
 by orviesa004.jf.intel.com with ESMTP; 08 Oct 2026 05:25:56 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH 1/1] drm/xe: Prevent VF memory IRQ from accessing a torn-down
 engine
Date: Thu,  8 Oct 2026 12:25:45 +0000
Message-ID: <20261008122543.390356-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008122543.390356-3-satyanarayana.k.v.p@intel.com>
References: <20261008122543.390356-3-satyanarayana.k.v.p@intel.com>
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

The VF memory IRQ handler iterates over HW engines whose names are set.
Engine teardown clears hwe->gt but leaves hwe->name set, so the handler
can select an engine whose GT has already been invalidated. This can
cause a NULL pointer dereference in xe_hw_engine_handle_irq().

Invalidate the engine name during teardown so subsequent engine scans
skip it.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 265f95c0c899..fb1492c86bde 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -279,6 +279,7 @@ static void hw_engine_fini(void *arg)
 	if (hwe->exl_port)
 		xe_execlist_port_destroy(hwe->exl_port);
 
+	hwe->name = NULL;
 	hwe->gt = NULL;
 }
 
-- 
2.43.0

