Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5620C02193
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 18:05:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F60C10E044;
	Tue,  4 Feb 2025 18:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TpIjsGfa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B25910E37B
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 18:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738692349; x=1770228349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cf3FvjX+7pUG0XchBH6FHQkkIerbuSxjO5TDphBX534=;
 b=TpIjsGfa39r6qpN+o/FjV9Aa7bh3mR3O6QdyVOaeM2ZuOL9JpgLWzZa+
 CKtaSwEMJcncJF9P7x7LojHZzRxkvUY42+0iGpwhhflvLfJToPDBYAA5X
 5IRqoDaozpBS3cXnfOkn2gWoyYv9x9B4HavhEDmJHV2qg+G5GlSJ/3wfo
 OGs0lISTZ0Cgu+mOpYwd3oDYTDwDcDy1Iyeq3CiwuYzETo85iR3fF9sWO
 xTv5kurVyWn8UBtCCmcvnjMJWTyqWNrrEPqc2Fyv0JRxmv4uW6vwQywX8
 4Q4WVrPGQ/ck6o99vvK/+2k41n1CHXFl7w7YmE8kd4SXxU9OZT4G0Btd4 A==;
X-CSE-ConnectionGUID: lY+FGk7sQkmo9xEaoVmBPQ==
X-CSE-MsgGUID: iiLD7FW7RxuPTfv+F5Aihw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50651348"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50651348"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 10:05:49 -0800
X-CSE-ConnectionGUID: GqrjY0Z9QByscCZbFDxZIg==
X-CSE-MsgGUID: xV42q+UDTjWrY0elm9vBQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="115701733"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.83.184])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 10:05:47 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 3/3] drm/xe/client: Skip drm-total-cycles if unable to read
 timestamp
Date: Tue,  4 Feb 2025 19:05:22 +0100
Message-Id: <20250204180522.2327214-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250204180522.2327214-1-marcin.bernatowicz@linux.intel.com>
References: <20250204180522.2327214-1-marcin.bernatowicz@linux.intel.com>
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

Ensure show_run_ticks() only prints drm-total-cycles when timestamp
retrieval succeeds.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 63f30b6df70b..e5c4f342380e 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -323,6 +323,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 	struct xe_exec_queue *q;
 	u64 gpu_timestamp;
 	unsigned int fw_ref;
+	int err;
 
 	/*
 	 * Wait for any exec queue going away: their cycles will get updated on
@@ -350,7 +351,7 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 	}
 	mutex_unlock(&xef->exec_queue.lock);
 
-	gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
+	err = xe_hw_engine_read_timestamp(hwe, &gpu_timestamp);
 
 	xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref);
 	xe_pm_runtime_put(xe);
@@ -371,8 +372,10 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 		class_name = xe_hw_engine_class_to_str(class);
 		drm_printf(p, "drm-cycles-%s:\t%llu\n",
 			   class_name, xef->run_ticks[class]);
-		drm_printf(p, "drm-total-cycles-%s:\t%llu\n",
-			   class_name, gpu_timestamp);
+
+		if (!err)
+			drm_printf(p, "drm-total-cycles-%s:\t%llu\n",
+				   class_name, gpu_timestamp);
 
 		if (capacity[class] > 1)
 			drm_printf(p, "drm-engine-capacity-%s:\t%lu\n",
-- 
2.31.1

