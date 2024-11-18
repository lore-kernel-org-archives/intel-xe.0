Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3281D43FFA
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 09:07:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4667010E45B;
	Mon, 18 Nov 2024 09:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mlxtq2Ur";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3785410E451
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Nov 2024 09:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731920846; x=1763456846;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3VYLwXwdt1v4dCtHNgjjgzzrEiTplJgITkfDwNRNoaw=;
 b=Mlxtq2UrSAQfVVmstpOfCM+rIvwjF2csjAmWtc3b+Nly4SSnlQLYaF1G
 fXs7epxQoX1ycg8l70ehLMAXrAAALBCYwdGK7AiOXME84joEmmkghIFRX
 vmiwRGkE/WQPf2XJlcClKRJ5kCi8kcCE7Qhrw72Ede2UMpX4RFuLjgdi7
 VOnHYB/Q7wGxi8SWQkBYvbSkj5U2PsrCQQ0/yhbZvfqyuIZmZ19zogObw
 sgc1PhlW3gNySNO3bJrfoLnoG2wLgfFti2gGCRhdRPizVqelCp9hc7vQx
 z36b0I1pNrBGsfdeFAnglvP/xABnVEm4dmKzrkbHA4oZyMdkyD/44uZZ6 Q==;
X-CSE-ConnectionGUID: YIe2L8lbRImK0xDeIA4S4g==
X-CSE-MsgGUID: 2ccyXtxDSoeL5ckU0eV8+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31242924"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="31242924"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 01:07:25 -0800
X-CSE-ConnectionGUID: ceCzfUC0SpqqN7BYC88q3g==
X-CSE-MsgGUID: oTkVWTOaQ/KnysQLFfkrKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="126705146"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 01:07:24 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, jose.souza@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com,
 matthew.d.roper@intel.com, matthew.olson@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v5 1/7] drm/xe/topology: Add a function to find the index of
 the last enabled DSS in a mask
Date: Mon, 18 Nov 2024 01:07:13 -0800
Message-ID: <5d8de05e198bdb20a686aca7d4dbb16211f6ee40.1731919693.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1731919693.git.harish.chegondi@intel.com>
References: <cover.1731919693.git.harish.chegondi@intel.com>
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

Last enabled DSS in a DSS mask can help estimate the maximum DSSes enabled
in the DSS mask, as the enabled DSSes can be discontiguous.

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
index 746b325bbf6e..a72d26ba0653 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.h
+++ b/drivers/gpu/drm/xe/xe_gt_topology.h
@@ -25,6 +25,19 @@ void xe_gt_topology_init(struct xe_gt *gt);
 
 void xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p);
 
+/**
+ * xe_gt_topology_mask_last_dss() - Returns the index of the last DSS in a mask.
+ * @mask: Input DSS mask
+ *
+ * Return: Index of the last DSS in the input DSS mask,
+ *	   XE_MAX_DSS_FUSE_BITS if DSS mask is empty.
+ */
+static inline unsigned int
+xe_gt_topology_mask_last_dss(const xe_dss_mask_t mask)
+{
+	return find_last_bit(mask, XE_MAX_DSS_FUSE_BITS);
+}
+
 unsigned int
 xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum);
 
-- 
2.45.1

