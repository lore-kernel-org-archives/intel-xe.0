Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4548EB64D8
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 20:52:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE2310E46B;
	Wed, 14 Jun 2023 20:52:17 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E84210E469
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jun 2023 20:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686775932; x=1718311932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rlps2124NGYmLU4VsJw5emaYEO7nFA8jaOY1S3Mbx78=;
 b=ik9WqTw3ZBvwO7KYTeuBv3TAK/Ai0nnrF+wn4zizW/BKoT0Ix8e3307r
 Gra+Ij3LEGj/xx5NL91jhlNVgn1IXMn68sDy5HYxbGmKDtAJy7IOs/n0V
 TD7Zuia4UAb9w0IraLkWGH/ulm4azKFqIBoJiA4JJqKPjkyvB6X4vNDpz
 W9gc/qd03PKTgPyO3vJCCf/zktlbaUNxMahY3thuXJjIKgGSk89D+5fGQ
 Z5XjQJS24zWiSPVC3TxAsrK/fYeAxpqcY/nnUFs3GhMpjJyA6320X5TSS
 HzFvpMSLIJyJknyKUZ80kuV2cPg1g/vXiMk5giVYb3USI3A0n7OhDy/1Q A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="343431997"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="343431997"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 13:52:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="712206068"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="712206068"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 13:52:08 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 14 Jun 2023 13:52:00 -0700
Message-Id: <20230614205202.3376752-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614205202.3376752-1-matthew.d.roper@intel.com>
References: <20230614205202.3376752-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/4] drm/xe: Don't raise error on fused-off media
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

It's legitimate for the media GMD_ID register to read back as 0x0 if
media functionality is fused off or otherwise not present on the
platform.  Avoid printing an "unknown media version" error message for
this case.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 7926c2fa1433..b5bea42a458d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -465,6 +465,10 @@ static void handle_gmdid(struct xe_device *xe,
 
 	peek_gmdid(xe, GMD_ID.addr + 0x380000, &ver, media_revid);
 
+	/* Media may legitimately be fused off / not present */
+	if (ver == 0)
+		return;
+
 	for (int i = 0; i < ARRAY_SIZE(media_ip_map); i++) {
 		if (ver == media_ip_map[i].ver) {
 			xe->info.media_verx100 = ver;
-- 
2.40.1

