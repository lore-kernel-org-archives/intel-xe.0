Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8D9C67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 12:51:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46704113BCA;
	Fri,  5 Apr 2024 12:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MtqAgorW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1849C113BCA
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 12:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712321462; x=1743857462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nPCbwnXFt2quQuMUqEiV8g6HCxsW0KajziwmzUGTXoQ=;
 b=MtqAgorWf365KFiZdlnrE1O7wthFVebKr/fI2IiLR3g3WRz1yWLEeXlv
 f8fE4xjPOfaVEby2DCMXsJnO19tJt7iqijPlIaPr8nGvCDto1Os76flmF
 tZ+7TMtKkEROiK3BMGFBji13JBLQFvDf0hSiuRBo2gbPDEFrLNoh0+Nr6
 tyvBJgNm4+fq/Ju//wYd1Ly9bKItN49LFl6cco9cf/P/sUvD5G/e0UZo8
 IyxWDbrhbUQ57CiqrBW2pK8HParTT/Bwgwn/oF/8UYcYYtFsg8n2IQTsH
 3fN1ha45+r9hS2PPZK96dIg3wEVrPjn3zPt57jL2vgZAOwTtJHFhpaKis w==;
X-CSE-ConnectionGUID: 67sScEPEQ/GMH9DfDVe05g==
X-CSE-MsgGUID: /soG5wNPRzy7LOYEzP2ikw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7810060"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7810060"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 05:51:02 -0700
X-CSE-ConnectionGUID: Uoh7MzmsRYeGQnD4YsrX0g==
X-CSE-MsgGUID: ToldaFoLQiuRQI/wvOHXXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="23643861"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 05:51:00 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v7 1/4] drm/xe: Define xe_reg_is_valid
Date: Fri,  5 Apr 2024 18:31:24 +0530
Message-Id: <20240405130127.1392426-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405130127.1392426-1-karthik.poosa@intel.com>
References: <20240405130127.1392426-1-karthik.poosa@intel.com>
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

Add a function to check if struct xe_reg has valid address.

v2:
 - Rebase.
 - Make xe_reg_is_valid as inline function instead of a macro. (Badal).
 - Update commit msg.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_reg_defs.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
index c89ef2b79a3f..23f7dc5bbe99 100644
--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
@@ -131,4 +131,9 @@ struct xe_reg_mcr {
 				 .__reg = XE_REG_INITIALIZER(r_,  ##__VA_ARGS__, .mcr = 1)	\
 				 })
 
+static inline bool xe_reg_is_valid(struct xe_reg r)
+{
+	return r.addr;
+}
+
 #endif
-- 
2.25.1

