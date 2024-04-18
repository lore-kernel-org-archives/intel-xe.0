Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63677C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 15:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCF6113D4C;
	Thu, 18 Apr 2024 15:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KbABYWwr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF83A10F9D1
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 15:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713454092; x=1744990092;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9SVQwofXY10ZqRU0gjxCkFs1DayTgv9XBRqQ0bDGaAc=;
 b=KbABYWwrGNGojGce1nUJ5ZxzI3+/X48d0wv/o0sKReiryTN2jpqNkV31
 JVYCihPERaJ1LPsy4RaZu8hmVNNKsKJN757sH3ccIjk6g4vvAUXdYsNFz
 ASZc4gjWlcEfS1GeNIqcd0rzlaY4qntMNW+i1Qmcdg2NfdaEp6k6R/DNQ
 iqt0VUFoymdU2GGJHyb0rIAfq602hwOHDh3aVKdUsbINcH02VcAH61geU
 OZwgqeR38bkRFFn1nCAuwgLIAKorOVmc2b3nrvkKu7H+D/dNg6MRB6qNV
 rpOhqIld7jRGoyWWmbYaZcdt9Wd3xy3s6meB6NVKDv0tpR4bqz6dICw0Y g==;
X-CSE-ConnectionGUID: Jw8kP+YlRxmFhReHMpcInA==
X-CSE-MsgGUID: p+tE3rzfRXy4HOAFK722aA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8873720"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="8873720"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 08:28:11 -0700
X-CSE-ConnectionGUID: xAp/M8AUSJKzsHkA7yCIjQ==
X-CSE-MsgGUID: +1iP9RQEQqq+mDydurx8ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="54205900"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.62.251])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 08:28:12 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/5] drm/xe: Add few more GT register definitions
Date: Thu, 18 Apr 2024 17:28:00 +0200
Message-Id: <20240418152802.182-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240418152802.182-1-michal.wajdeczko@intel.com>
References: <20240418152802.182-1-michal.wajdeczko@intel.com>
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

While we are not using these registers right now, they are part
of some runtime register lists that PF driver share with VFs on
some legacy platforms that we might want to support as SDV.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 94445810ccc9..6eea7a459c68 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -173,8 +173,11 @@
 #define   MAX_MSLICES				4
 #define   MEML3_EN_MASK				REG_GENMASK(3, 0)
 
+#define MIRROR_FUSE1				XE_REG(0x911c)
+
 #define XELP_EU_ENABLE				XE_REG(0x9134)	/* "_DISABLE" on Xe_LP */
 #define   XELP_EU_MASK				REG_GENMASK(7, 0)
+#define XELP_GT_SLICE_ENABLE			XE_REG(0x9138)
 #define XELP_GT_GEOMETRY_DSS_ENABLE		XE_REG(0x913c)
 
 #define GT_VEBOX_VDBOX_DISABLE			XE_REG(0x9140)
-- 
2.43.0

