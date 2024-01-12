Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78644C4707C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 10:26:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4919410E10D;
	Fri, 12 Jan 2024 10:26:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E010510E10D
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 10:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705055170; x=1736591170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kWqUsxVb41AE6ZxnJgTRroRg15X/1+kw2eu+wE+z4I8=;
 b=di8+7bcrgscL6JrHkyH51gwU/9qznv7n/zof8hVmauHdW4xWSLVLJeuH
 n41tbIEr4nY1wATa6sYsBzA/L5SLdPpQLXq+v5IrKfv6UN9CfSJyUbNt3
 zrt2ty0vVyb1wTUirroR78+pcHsrCGeuE5xAz6H8gYqo3kKYOFHy/vec4
 zVdT70hZimuQXD1S1APCoGpzluJwMcy5wU0Z4aoqJfjPXiIMPiVc4hUqN
 mAy8dXCFEk1OrGUG1onlrRp/snWMbnSu84UjWwfjSrJsHoHOMcf4wcJjB
 IeS5mllWTsr9gL1adKGVJ+yElfNkIYbyjpr2pOMuybr4V3Yd5UyDi/4eI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="485313884"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="485313884"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 02:26:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="24667217"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.135.224])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 02:26:10 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe/guc: Add kernel-doc for xe_guc_ct_send_recv()
Date: Fri, 12 Jan 2024 11:25:54 +0100
Message-Id: <20240112102554.761-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240112102554.761-1-michal.wajdeczko@intel.com>
References: <20240112102554.761-1-michal.wajdeczko@intel.com>
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

The communication with the GuC firmware is crucial for the driver
but unfortunately it has limited documentation.  Add initial
documentation for recently updated xe_guc_ct_send_recv().

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 4ae1a0cd9537..ee5d99456aeb 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -785,6 +785,24 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	return ret > 0 ? response_buffer ? g2h_fence.response_len : g2h_fence.response_data : ret;
 }
 
+/**
+ * xe_guc_ct_send_recv - Send and receive HXG to the GuC
+ * @ct: the &xe_guc_ct
+ * @action: the dword array with `HXG Request`_ message (can't be NULL)
+ * @len: length of the `HXG Request`_ message (in dwords, can't be 0)
+ * @response_buffer: placeholder for the `HXG Response`_ message (can be NULL)
+ *
+ * Send a `HXG Request`_ message to the GuC over CT communication channel and
+ * blocks until GuC replies with a `HXG Response`_ message.
+ *
+ * For non-blocking communication with GuC use xe_guc_ct_send().
+ *
+ * Note: The size of &response_buffer must be at least GUC_CTB_MAX_DWORDS_.
+ *
+ * Return: response length (in dwords) if &response_buffer was not NULL, or
+ *         DATA0 from `HXG Response`_ if &response_buffer was NULL, or
+ *         a negative error code on failure.
+ */
 int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 			u32 *response_buffer)
 {
-- 
2.25.1

