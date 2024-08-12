Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5D0C531DC
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 02:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCD310E068;
	Mon, 12 Aug 2024 02:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G+93c3bw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3556610E065
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 02:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723430789; x=1754966789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mfdyh6M1N6QZFJ2pHAf54XtgZK0k7qDfMOCdX0tPxUM=;
 b=G+93c3bwBY7KJHP5rKfsJmqnnQ0j+mOFcwZ2AtaugHg8H8thT+o7JNZA
 SXCUokOnwtOWE/AZ9+oZOIGgFfgEMf8wu9Xcgi1kWJFqKnV3ikl8P2EGA
 0VYuEKJpz+XEr9tC+FYtfMxaGzaZ9Sb4PxEczrN2PlcazPWrPWrK97rqA
 dWrGa9p1EaHGINk14thBeR6VYMi+1ymAywW7sT6gHaz3uNf86yQg3T+Wm
 kENNCvQgdNenT/i6TX/o1Ohsx6gfvpL9uBr9QZ0lRmynjGKfehwqmq9g6
 bkLrcxxr7l38PdybYv79sbxyyTDI6bmotXHrIKPOALPISxKUzPJ2tANBC w==;
X-CSE-ConnectionGUID: 49vyRLqwS1yPbB46PZMARQ==
X-CSE-MsgGUID: n9QyXEDLSLyZwCfQLjBwcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="32099519"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="32099519"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 19:46:28 -0700
X-CSE-ConnectionGUID: Eq+hsrexR62r2sCIQY+ZUw==
X-CSE-MsgGUID: 3jMSAfEhTYSyi+8gQBimrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="62256301"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 19:46:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [RFC PATCH 3/8] drm/xe: Add ULLS flags for jobs
Date: Sun, 11 Aug 2024 19:47:12 -0700
Message-Id: <20240812024717.3584636-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812024717.3584636-1-matthew.brost@intel.com>
References: <20240812024717.3584636-1-matthew.brost@intel.com>
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

Will help communicate to submission backend and ring ops job is ULLS.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sched_job_types.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index 0d3f76fb05ce..916e87158b7e 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -41,6 +41,9 @@ struct xe_sched_job {
 	 * can safely reference fence, fence cannot safely reference job.
 	 */
 #define JOB_FLAG_SUBMIT		DMA_FENCE_FLAG_USER_BITS
+#define JOB_FLAG_ULLS		(DMA_FENCE_FLAG_USER_BITS << 1)
+#define JOB_FLAG_ULLS_FIRST	(DMA_FENCE_FLAG_USER_BITS << 2)
+#define JOB_FLAG_ULLS_LAST	(DMA_FENCE_FLAG_USER_BITS << 3)
 	struct dma_fence *fence;
 	/** @user_fence: write back value when BB is complete */
 	struct {
-- 
2.34.1

