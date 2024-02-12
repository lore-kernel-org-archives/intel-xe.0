Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1050BC4829E
	for <intel-xe@archiver.kernel.org>; Mon, 12 Feb 2024 23:02:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0C710E218;
	Mon, 12 Feb 2024 23:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZDGBCOOZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608AA10E218
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Feb 2024 23:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707778921; x=1739314921;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tlTuANJey/2JEepKXX9yuNbiT9LzeFUn82/JBf32tb8=;
 b=ZDGBCOOZTxjDYI+xy8Fs1gyDv5z86fuP+joK8hs5jpBGWvVW3y0pRJNq
 +OSq4dCmXQHt6U9a40vEJVqQbgXM1KWK6r9LC/u/zpEJyvkr4xXRm8zuz
 OdVRy4UdDV47CBZpgmgny1461KXiY58d/NWGTu4xdyFprt3vRQ9PBKKyB
 n97E2DFiIiH2wsei28s3WyhTsw3tSAc5bXgH52sRnySEdW2ZWLdxcuvfi
 deOgP31p8aWD4nZxyQY0znvZ93lKXYUSOp6Glf5pGyvjI1ryAo/zDrBy4
 9lsHTPTbxsciU43seJkTL7wtmy6KAsMAm498MqiKggzoUkFeyVqzrMnPo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1900554"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="1900554"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 15:01:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="7348621"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 15:01:55 -0800
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [topic/xe-for-ci v2] fixup! drm/xe: Add PVC's PCI device IDs
Date: Mon, 12 Feb 2024 15:00:24 -0800
Message-Id: <20240212230024.973104-1-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
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

A new PVC vector only SKU got introduced. Add the new PCI id
to the list of PVC PCI id's.

v2: Make it a fixup comment(MattR)

Bspec: 44484
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 include/drm/xe_pciids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index 3011d99a05c5..2b7c2003ddb4 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -186,6 +186,7 @@
 #define XE_PVC_IDS(MACRO__, ...)		\
 	MACRO__(0x0B69, ## __VA_ARGS__),	\
 	MACRO__(0x0B6E, ## __VA_ARGS__),	\
+	MACRO__(0x0BD4, ## __VA_ARGS__),	\
 	MACRO__(0x0BD5, ## __VA_ARGS__),	\
 	MACRO__(0x0BD6, ## __VA_ARGS__),	\
 	MACRO__(0x0BD7, ## __VA_ARGS__),	\
-- 
2.34.1

