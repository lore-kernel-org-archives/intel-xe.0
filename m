Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BCFD44D7E
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 15:13:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A72410E707;
	Wed,  6 Nov 2024 15:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cWlsbH6c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2A610E70C
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Nov 2024 15:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730905992; x=1762441992;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=6n0Fm/v4jXqTGMpkOpUzr5uMIIbSC1kD3osu5QmGFwk=;
 b=cWlsbH6cVNRalb0WZ8VNoobDiDIljnHVjA6Zj2zmoOCXxQDZu7ZJ+uwC
 H4cjWv209lJRPiuNk6aakz4itrT2YPUce/I+YEjMs5Ga4+3j8h39xG0Kg
 4afu2cSMbnPinxwgwHWTRDS1i00X+vTYBJIGwreZ/9lOVVrRzuQWPb7Pe
 G1gJAyXGYaURth7+M6vumb4ZId50Yan5cyQDfs4WETuPf6W8fU5/p14kG
 ZKnywujaQP0BCeB0qlNJsx72Zx6SaFVrZPW4yxNZT1akSkxzC8RjFhYOX
 Rh6teS8GX8uLQeXsBAD0izEuDPjW8AqcQBigOzg5MJr5x4HMnA+1Q5cmp A==;
X-CSE-ConnectionGUID: wCrEILw8T6694xVXc+z1dA==
X-CSE-MsgGUID: ZUCG44ODRcalSNAvU+dN2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30867679"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30867679"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 07:13:11 -0800
X-CSE-ConnectionGUID: m7PGa5uWRA++QY2ffZr1CA==
X-CSE-MsgGUID: etWPrwpeSmmvTgofIbb3MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="84136786"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.98.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 07:13:10 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 1/5] drm/xe/guc: Add VF_CFG_SCHED_PRIORITY_KEY KLV definition
Date: Wed,  6 Nov 2024 16:12:57 +0100
Message-Id: <20241106151301.2079-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241106151301.2079-1-michal.wajdeczko@intel.com>
References: <20241106151301.2079-1-michal.wajdeczko@intel.com>
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

This KLV allows to set the scheduling priority for each VF, also
for the PF.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
v2: update description of the HIGH priority(Lukasz)
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 37606cf8cc5e..7dcb118e3d9f 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -291,6 +291,14 @@ enum  {
  *
  *      :0: (default)
  *      :1-65535: number of contexts (Gen12)
+ *
+ * _`GUC_KLV_VF_CFG_SCHED_PRIORITY` : 0x8A0C
+ *      This config controls VF’s scheduling priority.
+ *
+ *      :0: LOW = schedule VF only if it has active work (default)
+ *      :1: NORMAL = schedule VF always, irrespective of whether it has work or not
+ *      :2: HIGH = schedule VF in the next time-slice after current active
+ *          time-slice completes if it has active work
  */
 
 #define GUC_KLV_VF_CFG_GGTT_START_KEY		0x0001
@@ -343,6 +351,12 @@ enum  {
 #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_KEY	0x8a0b
 #define GUC_KLV_VF_CFG_BEGIN_CONTEXT_ID_LEN	1u
 
+#define GUC_KLV_VF_CFG_SCHED_PRIORITY_KEY	0x8a0c
+#define GUC_KLV_VF_CFG_SCHED_PRIORITY_LEN	1u
+#define   GUC_SCHED_PRIORITY_LOW		0u
+#define   GUC_SCHED_PRIORITY_NORMAL		1u
+#define   GUC_SCHED_PRIORITY_HIGH		2u
+
 /*
  * Workaround keys:
  */
-- 
2.43.0

