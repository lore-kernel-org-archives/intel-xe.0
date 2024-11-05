Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA915D3176C
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 17:30:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D07B10E414;
	Tue,  5 Nov 2024 17:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZOQc1hSU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF9510E414
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 17:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730827847; x=1762363847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ibudgkv65pq2xiSu4wW/WSCWmh9yLZARI2oxO+LDkuw=;
 b=ZOQc1hSUsQcOqTiP6kxW2n9ugBv6YlwynyLi76sbEQVZ7LNyOlYWec7L
 fKUvzxkGTdX53SPGjp4ruSNd2AkF5ygcvFyZ97TPsDxw87Dxv95iG0LOn
 J4Ll8SHn8OP8BLoB5aCZTUJotn1ApMqjcVWEFjKlRulT4HK0ROodTI0hq
 e61aOwDjKWl2ScBZjNcF7ISVbrhUa9F6VIbwB5XGLgCh8u6OOg0FGk8Yd
 KxZvoqqsABi/SRC8Dp+qSIn6UjMHnwhOKxtvKRYSft5LzXchVhnzBTeQ3
 ZBiZTOcaXqe4KApUd06wDIhWl+JG85r4dNQ5oj5y4PrpD4GSMJUDlyTnK w==;
X-CSE-ConnectionGUID: Y7bbH96WTUCXaLqrqNEfeQ==
X-CSE-MsgGUID: qlRMQxoZRVGKgd+wCp/H0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="48094135"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="48094135"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 09:30:46 -0800
X-CSE-ConnectionGUID: JbIrzaS+SL6RsVwsfOaQlw==
X-CSE-MsgGUID: jClsbZZhSRKKQASXScw5zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="114906264"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.120.199])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 09:30:45 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/4] drm/xe/guc: Log content of the failed G2H message
Date: Tue,  5 Nov 2024 18:30:29 +0100
Message-Id: <20241105173032.1947-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241105173032.1947-1-michal.wajdeczko@intel.com>
References: <20241105173032.1947-1-michal.wajdeczko@intel.com>
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

We are already logging an error once we failed to process a G2H
message, but then it's quite hard to extract the content of the
broken G2H message from the captured snapshot. Extend our error
log with the raw hexdump of the G2H message.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 550eeed43903..63bd91963eb1 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1299,8 +1299,8 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 	}
 
 	if (ret) {
-		xe_gt_err(gt, "G2H action 0x%04x failed (%pe)\n",
-			  action, ERR_PTR(ret));
+		xe_gt_err(gt, "G2H action %#04x failed (%pe) len %u msg %*ph\n",
+			  action, ERR_PTR(ret), hxg_len, (int)sizeof(u32) * hxg_len, hxg);
 		CT_DEAD(ct, NULL, PROCESS_FAILED);
 	}
 
-- 
2.43.0

