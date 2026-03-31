Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FCF10F92E9
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 18:34:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B03310EAC6;
	Tue, 31 Mar 2026 18:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5JmjNgp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D889110EB09;
 Tue, 31 Mar 2026 18:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774982071; x=1806518071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3dQPsMgC6AhkDUMSy/a00oLhkJDPTvvztBVO0JrMiNo=;
 b=d5JmjNgpvh/bgScyE+WH2NwLpr/gPAhuzuREUW35AbG6KKWhdflJzRpU
 gPgm5y/MiRw0BrzbtWhE5bfKtJJfSg+HLLXij4L54fpyXRWop94vkHhkx
 kAN3YEwueNWXU4BSwfpAwovqEiuV1LsN+RT3WHozENQJWNXNqXE9osq8u
 6o/Hmub3tJzfIHy9//RITPjGRJ1LwV2JbTwH4ChA4ABGo8aF0S0O74TIs
 NMjoktIf29UO3r9B2Vr38vfErILzogsgaFWY+Me0DLza1W9TVso0AbaEZ
 aMuNWMPsS0NSVToRVDwv51mxyd8KDdOVyg5NWQw6lJ1Y3DXDrDU25jiv9 g==;
X-CSE-ConnectionGUID: KVW88Y/MQn+bGCjyJZoOEw==
X-CSE-MsgGUID: +tJzrUwKQmOBEaFYBqBhog==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86705155"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="86705155"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 11:34:31 -0700
X-CSE-ConnectionGUID: CkoY3oSGTiqU+79wZBp+3A==
X-CSE-MsgGUID: mY3FiNA4RsWwe0p+v0iHng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="256944439"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 31 Mar 2026 11:34:30 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v1 02/16] drm/i915/buf_trans: switch from u8 to u32
Date: Tue, 31 Mar 2026 20:33:18 +0200
Message-ID: <20260331183332.1773886-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260331183332.1773886-1-michal.grzelak@intel.com>
References: <20260331183332.1773886-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Match width of fields of struct xe3plpd_lt_* & struct dg2_snps_*
with Vswing / Preemphasis Override tables layout.

This change affects DG2 and MTL+ cases.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 .../gpu/drm/i915/display/intel_ddi_buf_trans.h   | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h
index 7703c6c0a0cb..bea6fb2ec6f4 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h
+++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h
@@ -45,17 +45,17 @@ struct tgl_dkl_phy_ddi_buf_trans {
 };
 
 struct dg2_snps_phy_buf_trans {
-	u8 vswing;
-	u8 pre_cursor;
-	u8 post_cursor;
+	u32 vswing;
+	u32 pre_cursor;
+	u32 post_cursor;
 };
 
 struct xe3plpd_lt_phy_buf_trans {
-	u8 main_cursor;
-	u8 pre_cursor;
-	u8 post_cursor;
-	u8 txswing;
-	u8 txswing_level;
+	u32 main_cursor;
+	u32 pre_cursor;
+	u32 post_cursor;
+	u32 txswing;
+	u32 txswing_level;
 };
 
 union intel_ddi_buf_trans_entry {
-- 
2.45.2

