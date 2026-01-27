Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE94ED2FEDC
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 19:37:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8482710E5B7;
	Tue, 27 Jan 2026 19:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WfXt9RDd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE25C10E5B6
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 19:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769542659; x=1801078659;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ckxywbTFiXiWlG5qK1DIJK8cjB8a3KDdUbAzBv9LxGo=;
 b=WfXt9RDdxKi8o5CHxl2UllRTVOrgMkFYsxg68uL6O3ch/x9LeH51dZaP
 buL6NWHCTVVqK9rYUHQIl/e2iE33mzHjMrh97AsE6sNbdBMLVl4n7ZXvi
 H5PXE2Zsq1EzMCS2xX6dJacg7NDL3mniLLDJpnC5bK38luGU6JsBCSe4e
 07lMtV4jpPohGEAPvPWQE6ad88+FrtHAgL/eWqpR815dJFlQxpVDWW9JG
 Ff5OFx92WbJck6TQmkoI5nYzi47zZcNQd3Itv3Mq08DxSKxSd6nnVFzvG
 eKWbIRubZChy+OMbQ9OKFtKSBW0Wfhjzgk54wnP1kQFV3A3m8SBjjsbNk A==;
X-CSE-ConnectionGUID: ffs4Ax3HSDKbPaq9Zk8EbQ==
X-CSE-MsgGUID: nE7u6okmTWukZmmR9H+83g==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="69764779"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="69764779"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 11:37:38 -0800
X-CSE-ConnectionGUID: Ule7MO6oQkWLppBxrKRTAg==
X-CSE-MsgGUID: ywTDKBOzTRClz0DgREoT1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="207958942"
Received: from mahadzix-mobl.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 11:37:38 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 2/6] drm/xe: Move exponential sleep logic to helper
Date: Tue, 27 Jan 2026 20:37:22 +0100
Message-ID: <20260127193727.601-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127193727.601-1-michal.wajdeczko@intel.com>
References: <20260127193727.601-1-michal.wajdeczko@intel.com>
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

We want to reuse the same increased sleep logic in other places.
To avoid code duplication, move it to the helper.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c |  5 +----
 drivers/gpu/drm/xe/xe_sleep.h      | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4ea14f2794f4..66dffa13553e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1045,10 +1045,7 @@ static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
 				return -ENODEV;
 			}
 
-			msleep(sleep_period_ms);
-			sleep_total_ms += sleep_period_ms;
-			if (sleep_period_ms < 64)
-				sleep_period_ms <<= 1;
+			sleep_total_ms += xe_sleep_exponential_ms(&sleep_period_ms, 64);
 			goto try_again;
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_sleep.h b/drivers/gpu/drm/xe/xe_sleep.h
index a772f1a37395..2bc3f4c0ee0b 100644
--- a/drivers/gpu/drm/xe/xe_sleep.h
+++ b/drivers/gpu/drm/xe/xe_sleep.h
@@ -33,4 +33,25 @@ static inline void xe_sleep_relaxed_ms(unsigned int delay_ms)
 	usleep_range(min_us, max_us);
 }
 
+/**
+ * xe_sleep_exponential_ms() - Sleep for a exponentially increased time.
+ * @sleep_period_ms: current time in msec to sleep
+ * @max_sleep_ms: maximum time in msec to sleep
+ *
+ * Sleep for the @sleep_period_ms and exponentially increase this time for the
+ * next loop, unless reaching the @max_sleep_ms limit.
+ *
+ * Return: approximate time in msec the task was delayed.
+ */
+static inline unsigned int xe_sleep_exponential_ms(unsigned int *sleep_period_ms,
+						   unsigned int max_sleep_ms)
+{
+	unsigned int delay_ms = *sleep_period_ms;
+	unsigned int next_delay_ms = 2 * delay_ms;
+
+	xe_sleep_relaxed_ms(delay_ms);
+	*sleep_period_ms = min(next_delay_ms, max_sleep_ms);
+	return delay_ms;
+}
+
 #endif
-- 
2.47.1

