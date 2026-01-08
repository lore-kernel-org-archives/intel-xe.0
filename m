Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6C5D14885
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 01:13:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DFB10E2F1;
	Thu,  8 Jan 2026 01:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E3aqNND1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86CAF10E2F1
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 01:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767834836; x=1799370836;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tMR7QhwR0QosiiznhRBqyYGurSD0lMakR66LhCaH63o=;
 b=E3aqNND1nvl2wPq0N8S45Va9i3Fq4/I0BszNBqF66I1h0U422NBFw8Lw
 5CKupFIZBa5xA0ONhogilecFgjvUjeWlKB7/lJ5zAwcYiyavDHzc+eySC
 un6pPQOO9e/8dHF3vHNYulS+JL9J/3telsaeylbi0WVp3ABJGYNp/he+g
 c7AVkF7u7kK8QmkAxlLk48kAO+4JJh5tSaHkLKw3ROGFDpdUJj9YqHphh
 lWPywViB1WS1s6uSLYpefuPezzIkWcjPpzmmSJexEkZrxiUQUPULEkN15
 wy9KldCBcHnByJ3BQa5/lnW4YOAfbamqQ0EQvrRCHE9RhwiDg7XsMCnAt g==;
X-CSE-ConnectionGUID: WL7rnl2KQNevrSpmOq+TDg==
X-CSE-MsgGUID: wksImFpCQBmaGdrEvf3dew==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="73066459"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="73066459"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 17:13:56 -0800
X-CSE-ConnectionGUID: ptpnfU3kRyyiNElLuFdFMQ==
X-CSE-MsgGUID: pFsrmjjoRTqkaVRQLJ5m5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="207915174"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 17:13:55 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 2/3] drm/xe/ptl: Define GSC for PTL
Date: Wed,  7 Jan 2026 17:13:43 -0800
Message-ID: <20260108011340.2562349-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108011340.2562349-5-daniele.ceraolospurio@intel.com>
References: <20260108011340.2562349-5-daniele.ceraolospurio@intel.com>
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

PTL is identified by GSC major version 105. The compatibility version is
still 1.0.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index b1a9ef3f6195..1ce357d204c5 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -143,6 +143,7 @@ struct fw_blobs_by_type {
 
 /* for the GSC FW we match the compatibility version and not the release one */
 #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	ptl,	105, 1, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	gsc,	mtl,	102, 1, 0))
 
-- 
2.43.0

