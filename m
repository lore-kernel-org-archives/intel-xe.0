Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA513D2446D
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 03:56:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D1E10EA2F;
	Fri, 11 Oct 2024 03:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HJCz+EnD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758AB10EA2D
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Oct 2024 03:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728619005; x=1760155005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s28yFcfJtWYcVZauf1F4DCLJnYGeG5Y2iirG+ST+mOA=;
 b=HJCz+EnDMSgZOEBP6IH/7JFu0n4POzMtLXuN8F0UOv5hsHVQq7hJ0sPd
 Tj2mp/N6rEaD3GG6SvhxXV+bzvT04wgUOsjc/VMQK+lqJKc33eKWOXPON
 3MNN+ohlS6W9Mbfx1WZ+kuu9q/YlJl7BKZqL0yFtzfbcREGr9Ad/e1Psf
 3+KJ5JUjxmWV7pRK67GZXAZsiLhv2Ra676E7owVgeml85Hv+FKjwwiKv5
 5sP+RB2A/2d1PpYEvTeXvA1dkNJcZ3f2TGKZBIp504cbX6KjXuWdfzJOC
 Kpq7uki2O3+t9uADvnSLLzSb17sPYp3Q6g5Fa75nikCQGK+0uZWBYvKoO g==;
X-CSE-ConnectionGUID: d9tB/UyWSvmqSUgCJ+WF/w==
X-CSE-MsgGUID: EeYWUG4AS5mR2VT1MNDLPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="53411514"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="53411514"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 20:56:45 -0700
X-CSE-ConnectionGUID: tepwEOzPSsOat8m6HMvN7g==
X-CSE-MsgGUID: vDZin9BzSYe4cdo2LQTkYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="100122320"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 20:56:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Szymon Morek <szymon.morek@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 3/3] drm/xe/query: Tidy up error EFAULT returns
Date: Thu, 10 Oct 2024 20:56:18 -0700
Message-ID: <20241011035618.1057602-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241011035618.1057602-1-lucas.demarchi@intel.com>
References: <20241011035618.1057602-1-lucas.demarchi@intel.com>
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

Move the error handling together in a single branch since all of them
are doing similar thing and return the same error.

Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 69307ff4146a1..5093a243e9fe1 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -163,16 +163,10 @@ query_engine_cycles(struct xe_device *xe,
 		resp.width = 36;
 
 	/* Only write to the output fields of user query */
-	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp))
-		return -EFAULT;
-
-	if (put_user(resp.cpu_delta, &query_ptr->cpu_delta))
-		return -EFAULT;
-
-	if (put_user(resp.engine_cycles, &query_ptr->engine_cycles))
-		return -EFAULT;
-
-	if (put_user(resp.width, &query_ptr->width))
+	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp) ||
+	    put_user(resp.cpu_delta, &query_ptr->cpu_delta) ||
+	    put_user(resp.engine_cycles, &query_ptr->engine_cycles) ||
+	    put_user(resp.width, &query_ptr->width))
 		return -EFAULT;
 
 	return 0;
-- 
2.46.2

