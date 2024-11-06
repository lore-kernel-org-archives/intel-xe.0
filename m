Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8D9D40D08
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 00:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9C410E07B;
	Wed,  6 Nov 2024 00:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VdlZloel";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A354410E07B
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Nov 2024 00:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730852649; x=1762388649;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Eve25oClP1K4E25tmCYsLOVMM10XxZCH2Rm9mesfRn0=;
 b=VdlZloelhSTu+zSq0wmSACVaKUWfXSaY+PjQFgloDVJ9nR8YQWsQFG4k
 tkA9d4nQ3GNAY2dCWLtcKcY7rsY4tNM4zaWf8zMjgslXCnxbtd3bZQSfH
 7KsdrfYWFCbQSdOlNoFXJI6nItdj02JIhBYZWQGtcqRobuM1UL5wCrxjE
 Cuj4fktOlaXwnT6QOghcvDx6a3MswqUNXROO6xMmAx2IFVBGMy+O7CKEe
 5GZsdYbA26CnQWOZ8focRynWF1eZZUd0Zsco11uklp+aJIth5ImdpsY4O
 GeRHRfnODra3pDMVAKvgMM1V+GWKwf5ySDTC9jvoJWgduYZ/eoOjn0zs9 Q==;
X-CSE-ConnectionGUID: +CPLp9pwRKWRezhzzwpAIg==
X-CSE-MsgGUID: TYCl3/CnRiGA6CpDunR+oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30792731"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30792731"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 16:24:09 -0800
X-CSE-ConnectionGUID: rZ+q7GrRRxy0/XF4mEZpzg==
X-CSE-MsgGUID: Lum9amFoQDuAEjPGU7FkZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="88741797"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 16:24:10 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH] drm/xe/gsc: Improve SW proxy error checking and logging
Date: Tue,  5 Nov 2024 16:24:01 -0800
Message-ID: <20241106002402.486700-1-daniele.ceraolospurio@intel.com>
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

If an error occurs in the GSC<->CSME handshake, the GSC will send a
PROXY_END msg to the driver with the status set to an error code. We
currently don't check the status when receiving a PROXY_END message and
instead check the proxy initialization status in the FWSTS reg;
therefore, while still catching any initialization failures, we lose the
actual returned error code. This can be easily improved by checking the
status value and printing it to dmesg if it's an error.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc_proxy.c | 47 +++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
index fc64b45d324b..24cc6a4f9a96 100644
--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
@@ -139,17 +139,29 @@ static int proxy_send_to_gsc(struct xe_gsc *gsc, u32 size)
 	return 0;
 }
 
-static int validate_proxy_header(struct xe_gsc_proxy_header *header,
+static int validate_proxy_header(struct xe_gt *gt,
+				 struct xe_gsc_proxy_header *header,
 				 u32 source, u32 dest, u32 max_size)
 {
 	u32 type = FIELD_GET(GSC_PROXY_TYPE, header->hdr);
 	u32 length = FIELD_GET(GSC_PROXY_PAYLOAD_LENGTH, header->hdr);
+	int ret = 0;
 
-	if (header->destination != dest || header->source != source)
-		return -ENOEXEC;
+	if (header->destination != dest || header->source != source) {
+		ret = -ENOEXEC;
+		goto out;
+	}
 
-	if (length + PROXY_HDR_SIZE > max_size)
-		return -E2BIG;
+	if (length + PROXY_HDR_SIZE > max_size) {
+		ret = -E2BIG;
+		goto out;
+	}
+
+	/* We only care about the status if this is a message for the driver */
+	if (dest == GSC_PROXY_ADDRESSING_KMD && header->status != 0) {
+		ret = -EIO;
+		goto out;
+	}
 
 	switch (type) {
 	case GSC_PROXY_MSG_TYPE_PROXY_PAYLOAD:
@@ -157,12 +169,20 @@ static int validate_proxy_header(struct xe_gsc_proxy_header *header,
 			break;
 		fallthrough;
 	case GSC_PROXY_MSG_TYPE_PROXY_INVALID:
-		return -EIO;
+		ret = -EIO;
+		break;
 	default:
 		break;
 	}
 
-	return 0;
+out:
+	if (ret)
+		xe_gt_err(gt,
+			  "GSC proxy error: s=0x%x[0x%x], d=0x%x[0x%x], t=%u, l=0x%x, st=0x%x\n",
+			  header->source, source, header->destination, dest,
+			  type, length, header->status);
+
+	return ret;
 }
 
 #define proxy_header_wr(xe_, map_, offset_, field_, val_) \
@@ -228,12 +248,17 @@ static int proxy_query(struct xe_gsc *gsc)
 		xe_map_memcpy_from(xe, to_csme_hdr, &gsc->proxy.from_gsc,
 				   reply_offset, PROXY_HDR_SIZE);
 
-		/* stop if this was the last message */
-		if (FIELD_GET(GSC_PROXY_TYPE, to_csme_hdr->hdr) == GSC_PROXY_MSG_TYPE_PROXY_END)
+		/* Check the status and stop if this was the last message */
+		if (FIELD_GET(GSC_PROXY_TYPE, to_csme_hdr->hdr) == GSC_PROXY_MSG_TYPE_PROXY_END) {
+			ret = validate_proxy_header(gt, to_csme_hdr,
+						    GSC_PROXY_ADDRESSING_GSC,
+						    GSC_PROXY_ADDRESSING_KMD,
+						    GSC_PROXY_BUFFER_SIZE - reply_offset);
 			break;
+		}
 
 		/* make sure the GSC-to-CSME proxy header is sane */
-		ret = validate_proxy_header(to_csme_hdr,
+		ret = validate_proxy_header(gt, to_csme_hdr,
 					    GSC_PROXY_ADDRESSING_GSC,
 					    GSC_PROXY_ADDRESSING_CSME,
 					    GSC_PROXY_BUFFER_SIZE - reply_offset);
@@ -262,7 +287,7 @@ static int proxy_query(struct xe_gsc *gsc)
 		}
 
 		/* make sure the CSME-to-GSC proxy header is sane */
-		ret = validate_proxy_header(gsc->proxy.from_csme,
+		ret = validate_proxy_header(gt, gsc->proxy.from_csme,
 					    GSC_PROXY_ADDRESSING_CSME,
 					    GSC_PROXY_ADDRESSING_GSC,
 					    GSC_PROXY_BUFFER_SIZE - reply_offset);
-- 
2.43.0

