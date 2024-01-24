Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655A6C46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 04:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A94C10F60E;
	Wed, 24 Jan 2024 04:54:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C13310F60E
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jan 2024 04:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706072089; x=1737608089;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/ppj+SDY8qroYlpwFVehON3VKohfinRdWAt70I54uSQ=;
 b=bH2/8UHmKFc/DVtOZuyS8elD9bFj9WjNqrs9uXmHJRv8i3f41nlu6JFB
 iQIcyKD8SkKhT1cDoRlGgRBo1L/RLbK6wJS29jeYO7jqeD2NFbY3O+X1Z
 mhttju6AqSrn7UfpkhWiUoJ7yELmVa9xnnruE/JKtTE0G5t+iwX/l6F75
 JnmGoMJElxN1SMxZtzdmCeAyLeIv0pjpYxA0nKdh1Sy2GU7zmEKOiBVQg
 uUgZQaEDnxm8h3memJ+llK4KVXW4pHLGqbhG9M0v8IRNs4VKgbBZCqs/y
 b00iHqVO6O7vumYqnjqapAFk9Q8uJsk+HIrDzzg1RN3eQTRl4KvWgd6su Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="400604007"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="400604007"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 20:54:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="929556987"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="929556987"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmsmga001.fm.intel.com with ESMTP; 23 Jan 2024 20:54:47 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/gsc: Add status check during gsc header readout
Date: Wed, 24 Jan 2024 10:22:48 +0530
Message-Id: <20240124045248.687023-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.25.1
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

Before checking if data is present in the message reply check the
status in header and see if it indicates any error.

--v2
- Use drm_err() instead of drm_dbg_kms() [Daniele]

--v3
- Use &xe->drm in drm_err to make it more cleaner [Daniele]

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc_submit.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gsc_submit.c b/drivers/gpu/drm/xe/xe_gsc_submit.c
index 9ecc1ead6844..348994b271be 100644
--- a/drivers/gpu/drm/xe/xe_gsc_submit.c
+++ b/drivers/gpu/drm/xe/xe_gsc_submit.c
@@ -125,11 +125,18 @@ int xe_gsc_read_out_header(struct xe_device *xe,
 {
 	u32 marker = mtl_gsc_header_rd(xe, map, offset, validity_marker);
 	u32 size = mtl_gsc_header_rd(xe, map, offset, message_size);
+	u32 status = mtl_gsc_header_rd(xe, map, offset, status);
 	u32 payload_size = size - GSC_HDR_SIZE;
 
 	if (marker != GSC_HECI_VALIDITY_MARKER)
 		return -EPROTO;
 
+	if (status != 0) {
+		drm_err(&xe->drm, "GSC header readout indicates error: %d\n",
+			status);
+		return -EINVAL;
+	}
+
 	if (size < GSC_HDR_SIZE || payload_size < min_payload_size)
 		return -ENODATA;
 
-- 
2.25.1

