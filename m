Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2ADCD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 03:44:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE04112DBB;
	Thu,  4 Apr 2024 03:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XL+qmIuA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56494112DBB
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 03:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712202259; x=1743738259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tmDpPslQ/sogovsidp13J5G+EKgklY03HQGWmT6WgPg=;
 b=XL+qmIuA1p2FAuKFzf/dikspoIWOuAYJjxk4MS90U0D//wXKuwAV7IGf
 BHRu3zHERJpcNye0upZUJNGZV2mJK3T64JV78qUkHhYqhSRTPYWL6EHX6
 5E6QIYnzKmpYJKsBbRpDoy0goOgK0Zn1Y5qJyLhLXkBEf0/Ji4mjLA9Uh
 Kw99ANEC2DyqNJIEdDrytYYQSf1kCbfEa9agtEbXRQPkejQgZebCZsugj
 q3idNE/jpC4zznKXFINmZqDHDqeDa9skLU48K4vpmgmXXrYEhl56dRAhY
 gC7Mx3XeeWAfGkqb6PQoQDUtrWVbNL+wzpeLecRc0Wwi7qts+jvA30LnG g==;
X-CSE-ConnectionGUID: LbdXPF8rS2S8Sf6ZiUNEtA==
X-CSE-MsgGUID: UARexMAjRIC7bAbBFQGU2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11296490"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="11296490"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 20:44:18 -0700
X-CSE-ConnectionGUID: MBvqWaFjT1y1CgJ5amGixQ==
X-CSE-MsgGUID: WtPmqotKSH6FZToTEbjUKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="23405167"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 20:44:16 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 1/4] drm/xe: Define XE_REG_IS_VALID
Date: Thu,  4 Apr 2024 09:24:38 +0530
Message-Id: <20240404035441.965590-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240404035441.965590-1-karthik.poosa@intel.com>
References: <20240404035441.965590-1-karthik.poosa@intel.com>
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

Add macro to check if struct xe_reg has valid address. (Lucas, Badal).

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_reg_defs.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
index c89ef2b79a3f..42078643be6b 100644
--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
@@ -131,4 +131,6 @@ struct xe_reg_mcr {
 				 .__reg = XE_REG_INITIALIZER(r_,  ##__VA_ARGS__, .mcr = 1)	\
 				 })
 
+#define XE_REG_IS_VALID(r)	((r.addr) ? true : false)
+
 #endif
-- 
2.25.1

