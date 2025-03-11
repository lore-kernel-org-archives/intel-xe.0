Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94813C282EC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 14:01:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C08410E0C0;
	Tue, 11 Mar 2025 14:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EVfPQoBy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272FF10E0C0
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 14:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741701686; x=1773237686;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bEEREvH4VMv2f7o8RnhQ8nucIavAXiD2bQTEG8mV/Sc=;
 b=EVfPQoByeEyfstBb3TH/vWiAofJBwN1oDPPhmocg7nRR6Tq7xSU/uwbd
 VMiwFhybM52+0v4mtEBkHT0DrLlcskWz6H+iCCM0PJwsYrLst9wh/RoPn
 LbbOIysIUWqzfOW5ZH7K46FnmdOg4YKq79Oiommx1XdJcSpLsO7xe026I
 IkDh2hwAY5emuXHdqbrWxFxH21htSj8PO6uSL+N5SiKX6HB+Ev6OkLpWh
 QOs1Dq5kYmB1AgCDBLqdAs1HIHSL1n9DF0/f0GHaAjECgZQfQBYjSqWml
 di3Z4JRZEqdpNkRcD228sltCy1sZqZTWLRweO5kprWS6AeiLcycBkPDN/ A==;
X-CSE-ConnectionGUID: d+wfkGE0QGyl614/damfPg==
X-CSE-MsgGUID: uiuOyBhwQZarUlvhOpADUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="60145294"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="60145294"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 07:01:26 -0700
X-CSE-ConnectionGUID: x8WtibOYRxyBqUi73onrvg==
X-CSE-MsgGUID: AV7Zw1s+RqWAsozPBVpGtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="143522706"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 07:01:25 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe: Prefer USEC_PER_SEC over MICRO
Date: Tue, 11 Mar 2025 15:01:15 +0100
Message-Id: <20250311140115.2042-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

It will be easier to understand the meaning of the flr_timeout
value if the USEC_PER_SEC macro is used in the expression.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5d79b439dd62..7d32d5c6538f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -522,7 +522,7 @@ static bool xe_driver_flr_disabled(struct xe_device *xe)
  */
 static void __xe_driver_flr(struct xe_device *xe)
 {
-	const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a 3s wait */
+	const unsigned int flr_timeout = 3 * USEC_PER_SEC; /* specs recommend a 3s wait */
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	int ret;
 
-- 
2.47.1

