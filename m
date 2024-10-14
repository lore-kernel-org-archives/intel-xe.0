Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E47DD1A429
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 06:00:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C076D10E270;
	Mon, 14 Oct 2024 06:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ekuUPx8v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B314A10E270
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 06:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728885643; x=1760421643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3EMNjWYrlMikdWT5RJd0BDU0wHliCenkpFo+uRoK60A=;
 b=ekuUPx8vMFUzRmVxSY+Ay8GHoJsvaTS+zKsZkwvE27ByFXRPyLZ1J7Yy
 cLTIpMHEsgsAXl5yvps6uoximWW8oCEm7yeyFgQhMqcILYShHBMFfFugo
 c7/GwSbc80cQ9qIIyQ4r0d03zqQkV5qDhj4/k3tck0v4HHbESPvcmTjyV
 Bm/WflpuwzUtBcTupJPNkdUezuTuvQMPpm45Q14Ls+zBZv3p7R6mdE5yG
 bKGhNNjwtOIeLJFMFzPEOtGL+MXEqH8ZMutEs4BDXR9e1VZzPHmW2BV1i
 f+SWjfWs/ph5w1/6TaIo2zR77jMDiYWwBDCpotv4ZDhi9qPtlCLBsgJTj Q==;
X-CSE-ConnectionGUID: BWoftwUDTBql/b0f8QI/uA==
X-CSE-MsgGUID: dn4vmpz2QFiQjnx5F7royw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="39599326"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="39599326"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2024 23:00:42 -0700
X-CSE-ConnectionGUID: bKrFPyToTGGfAiOm3rbzAA==
X-CSE-MsgGUID: aJmlZyHKQNa05bH0ZK9l8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="77575032"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2024 23:00:42 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, jose.souza@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v4 1/5] drm/xe/topology: Add a function to find the index of
 the last DSS in a mask
Date: Sun, 13 Oct 2024 23:00:32 -0700
Message-ID: <a8835bd49e78c13d277e8faec70f4c311c32adf0.1728884074.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1728884074.git.harish.chegondi@intel.com>
References: <cover.1728884074.git.harish.chegondi@intel.com>
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

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 9 +++++++++
 drivers/gpu/drm/xe/xe_gt_topology.h | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index df2042db7ee6..1e7476f71906 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -278,6 +278,15 @@ xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum)
 	return find_next_bit(mask, XE_MAX_DSS_FUSE_BITS, groupnum * groupsize);
 }
 
+/*
+ * Used to obtain the index of the last DSS.
+ */
+unsigned int
+xe_dss_mask_last_dss(const xe_dss_mask_t mask)
+{
+	return find_last_bit(mask, XE_MAX_DSS_FUSE_BITS);
+}
+
 bool xe_dss_mask_empty(const xe_dss_mask_t mask)
 {
 	return bitmap_empty(mask, XE_MAX_DSS_FUSE_BITS);
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
index 746b325bbf6e..7ee022784397 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.h
+++ b/drivers/gpu/drm/xe/xe_gt_topology.h
@@ -28,6 +28,9 @@ void xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p);
 unsigned int
 xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum);
 
+unsigned int
+xe_dss_mask_last_dss(const xe_dss_mask_t mask);
+
 bool xe_dss_mask_empty(const xe_dss_mask_t mask);
 
 bool
-- 
2.45.1

