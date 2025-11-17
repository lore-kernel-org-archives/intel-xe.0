Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BD9CE8D6B
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 19:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A91C10E11E;
	Mon, 17 Nov 2025 19:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQueAXWJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946D510E11E
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 19:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763406089; x=1794942089;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=shirWEz/7nTxHM/X6pUBuTT8CvtK2QcEshPyV1ES6y4=;
 b=RQueAXWJkSx2ho8bWWB4ACTYEgL9uoGTXZwWTAWKxjAd8uBetQfbU+pM
 H/oIAYhF7I0fnLgGjMj9/YQRKM3jX47GUvgsCauunmLWcgv4Eg9+eu6C3
 c8+1tA0/paiXZs/ckvZrKr3QmwCecWo1PRtBV/9eHOSLiL/N27evwoOJ7
 vo7Rlp4/3d+sXsmyCZNKwI7PVhsr5BbThSm6rJJrwTu4jJASC7icHXscy
 R/5GitbZuBmcaT1D6j/ZN9jMV7uMtwSmozKM/AvQywPiqmAc2W42TSU0+
 NDB2QIwnADmdLKxkPZIy4gs0IF/70o/NLPUm2AeR5X9ID04MhUT0/f0Lx A==;
X-CSE-ConnectionGUID: r+6j28d5TnilfYgcKjuKqA==
X-CSE-MsgGUID: 5BhNziKjTDmtoBBOby8SfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65352314"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="65352314"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 11:01:28 -0800
X-CSE-ConnectionGUID: 6+EB5zEKSRaOYbcnwW4ddQ==
X-CSE-MsgGUID: CccpPOT+SqiMQKv0YFQw/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="194635005"
Received: from dut4025lnl.fm.intel.com ([10.105.8.193])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 11:01:23 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 michal.winiarski@intel.com
Subject: [PATCH] drm/xe/xe_sriov_packet: Return int from pf_descriptor_init
Date: Mon, 17 Nov 2025 19:01:15 +0000
Message-ID: <20251117190114.69953-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

pf_descriptor_init currently returns a size_t, which is an unsigned
integer data type.  This conflicts with it returning a negative errno
value on failure.

Make it return an int instead.  This mirrors how pf_trailer_init is used
later.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_packet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.c b/drivers/gpu/drm/xe/xe_sriov_packet.c
index bab994696896..2cefefaed9ba 100644
--- a/drivers/gpu/drm/xe/xe_sriov_packet.c
+++ b/drivers/gpu/drm/xe/xe_sriov_packet.c
@@ -358,7 +358,7 @@ ssize_t xe_sriov_packet_write_single(struct xe_device *xe, unsigned int vfid,
 
 #define MIGRATION_DESCRIPTOR_DWORDS	(GUC_KLV_LEN_MIN + MIGRATION_KLV_DEVICE_DEVID_LEN + \
 					 GUC_KLV_LEN_MIN + MIGRATION_KLV_DEVICE_REVID_LEN)
-static size_t pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
+static int pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
 {
 	struct xe_sriov_packet **desc = pf_pick_descriptor(xe, vfid);
 	struct xe_sriov_packet *data;
-- 
2.43.0

