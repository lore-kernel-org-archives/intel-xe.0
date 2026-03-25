Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A088FEA80C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 05:00:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD06610E777;
	Wed, 25 Mar 2026 05:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VEW7PdeY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5C410E775;
 Wed, 25 Mar 2026 04:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774414798; x=1805950798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cdmOICKFqJo5FArksuTrNoGoknld2fYTqkl37PhXk4A=;
 b=VEW7PdeYN6bd5U4T4zyscYNiYRHHvcDq3rJIDjne/y5i08FNZTay81ni
 3Z4+GOOI2iCNHfL8WVpffvuI8rRwml87THtMJzP6dbPxKp/Y/00eS3kvP
 ZmvpP/Y2CAIdCmo6Bo7Z09W2hG5qjx2fCPTVkWHwe8AAdZLLkiOOEm149
 m9g6+/3oGw88XjsI8SD5BDxWiGz2di0lms4DHbeTSXbTQwzQXstWio3dt
 PDmzJm6qMQgUC9TiekHReq6Yscnp8VHeNegwFOBdDACXGRumFXDhsqyKj
 1jT1XqLDMdy+r8yauIY+ULBbjU0CIbnPHVgSNMTRwzHESd4gCs3yYcipy g==;
X-CSE-ConnectionGUID: i77sKU7lQxWwn3O0v1D9Lg==
X-CSE-MsgGUID: 0jQ3haezScWgTEHVGpCGLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86922310"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="86922310"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 21:59:52 -0700
X-CSE-ConnectionGUID: aXgN/HoURZCSNl0kP2Xl4g==
X-CSE-MsgGUID: ikueSK2sTPWiga70cH/BEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="224580524"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 24 Mar 2026 21:59:50 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: sowmiya.s@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com,
 chaitanya.kumar.borah@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 10/26] drm/i915/writeback: Add private structure for
 writeback job
Date: Wed, 25 Mar 2026 10:29:00 +0530
Message-Id: <20260325045916.984243-11-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325045916.984243-1-suraj.kandpal@intel.com>
References: <20260325045916.984243-1-suraj.kandpal@intel.com>
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

Create intel_writeback_job to track drm_writback_job and other structure
we might need to complete the writeback job.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_writeback.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index 1df04538d48c..02c61dfcacba 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -24,10 +24,17 @@
 struct intel_writeback_connector {
 	struct intel_connector connector;
 	struct intel_encoder encoder;
+	struct intel_writeback_job *job;
 	enum transcoder trans;
 	int frame_num;
 };
 
+struct intel_writeback_job {
+	struct drm_framebuffer *fb;
+	struct drm_writeback_connector *wb_connector;
+	struct i915_vma *vma;
+};
+
 static const u32 writeback_formats[] = {
 	DRM_FORMAT_XYUV8888,
 	DRM_FORMAT_YUYV,
-- 
2.34.1

