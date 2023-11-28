Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8FAC07E97
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 20:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79E510E32A;
	Tue, 28 Nov 2023 20:32:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03ACE10E188
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 20:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701203536; x=1732739536;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hoMkkDPG4Tj2czdA106QtwXk8bjZeTXq9kej8N3C+b4=;
 b=AqBXOZ3FjVWZ2TlkLVsSSTOZzjx9rNDwGlrqkRd8to86VXHmat1IM/60
 pQMO+1iWZs3IdBdzTeeiE8xadEqV24OI9GcFVs0wCXjjA7OVT/MkoumH1
 +106trinp3zswLzlRyUWaBdoVcq+J4baiUk5N/Z6/Kb81a1Kz1xX3u/n8
 EbWK7oyTNoV49TvvHlrxZRR9LJYBszX8QWSt6mQg5u1hSiUTd2qavSWEU
 fScppI0lWASXBB1so+BtFo9XSongn0pv0zqF+z2K8oA3GTPUtUGPBvtjc
 ulpL+r5/t+0FoU9qR5OCifbsu2fdtIYYGXTmSr7Suq0bMLy8R3k/HwhGn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="424168776"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="424168776"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 12:32:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="17038398"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.140.124])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 12:32:14 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 21:32:01 +0100
Message-Id: <20231128203203.1147-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe/guc: Drop ancient GuC CTB definitions
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

Those definitions were applicable for old GuC firmwares only.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../drm/xe/abi/guc_communication_ctb_abi.h    | 21 -------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
index 41244055cc0c..d34f91002789 100644
--- a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
@@ -165,25 +165,4 @@ static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
  * - **flags**, holds various bits to control message handling
  */
 
-/*
- * Definition of the command transport message header (DW0)
- *
- * bit[4..0]	message len (in dwords)
- * bit[7..5]	reserved
- * bit[8]	response (G2H only)
- * bit[8]	write fence to desc (H2G only)
- * bit[9]	write status to H2G buff (H2G only)
- * bit[10]	send status back via G2H (H2G only)
- * bit[15..11]	reserved
- * bit[31..16]	action code
- */
-#define GUC_CT_MSG_LEN_SHIFT			0
-#define GUC_CT_MSG_LEN_MASK			0x1F
-#define GUC_CT_MSG_IS_RESPONSE			(1 << 8)
-#define GUC_CT_MSG_WRITE_FENCE_TO_DESC		(1 << 8)
-#define GUC_CT_MSG_WRITE_STATUS_TO_BUFF		(1 << 9)
-#define GUC_CT_MSG_SEND_STATUS			(1 << 10)
-#define GUC_CT_MSG_ACTION_SHIFT			16
-#define GUC_CT_MSG_ACTION_MASK			0xFFFF
-
 #endif
-- 
2.25.1

