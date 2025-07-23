Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E547C83F17
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 16:57:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2843910E832;
	Wed, 23 Jul 2025 16:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZPu8I3aX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029CB10E832
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 16:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753289849; x=1784825849;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dpa8ml4DUMg2WUkYMcXDlSMAzKfVvoWo3m0Q20Mxdwo=;
 b=ZPu8I3aXq+ddxi/TmfXpMqp0hQd3pvn0uw2HWeljoZZhMPhAhpwirlqv
 Y9zK+vtgKn6pkqC0jw6gDufZIPx0uhxdEmm/22gvMMaj50OjLHmEIbWtr
 9MJa8OMvmzFgX/hgD/GDqnh6mCYm8J5uHiwbJrpJ5lIG1kDOUl9ZMtS/c
 fueOO0MTd4M4GYgqDrvdjTnNR7oDRiAxxKCbGqcGCxshHeiwcEGLbyg+z
 pDXKMm5QdkdVTzoJcu5k+n00ckCVvpYHSw0WJmg1AyV3WK8+AoPp0YQXA
 qHoXTUrP/XhGgXk9czBzEgRbHSNPlpocdF03vAwVZTjtfRxNrHx35O93N A==;
X-CSE-ConnectionGUID: ltSbt5e5QWaocLtLZSd8pQ==
X-CSE-MsgGUID: ycsNULzdRAGtOlXh7t5OZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66279077"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="66279077"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 09:57:28 -0700
X-CSE-ConnectionGUID: LhdlfhnWRo6gFIW92sb5+w==
X-CSE-MsgGUID: GwqDllBCS0GSySmQQU95Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="190621698"
Received: from msienkie-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.96.116])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 09:57:27 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH] drm/xe/guc: Explicitly initialize g2h_fence.cancel
Date: Wed, 23 Jul 2025 18:57:17 +0200
Message-ID: <20250723165717.206730-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

The struct g2h_fence must be explicitly initializated using the
g2h_fence_init() function to avoid trash values in its members,
but we missed to update this helper function with the new member.

Fixes: 94de94d24ea8 ("drm/xe/guc: Cancel ongoing H2G requests when stopping CT")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index b6acccfcd351..ebe74a6b27ee 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -98,6 +98,7 @@ static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
 	g2h_fence->response_buffer = response_buffer;
 	g2h_fence->response_data = 0;
 	g2h_fence->response_len = 0;
+	g2h_fence->cancel = false;
 	g2h_fence->fail = false;
 	g2h_fence->retry = false;
 	g2h_fence->done = false;
-- 
2.47.1

