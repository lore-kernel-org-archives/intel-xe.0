Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80049C54ED1
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 20:55:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34CD810E19D;
	Thu, 22 May 2025 20:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLb6hQnx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E0510E0CC
 for <intel-xe@lists.freedesktop.org>; Thu, 22 May 2025 20:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747947315; x=1779483315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RrwNAn2LHqOyD6kc0H5uAoRBtkf0nKgpnhnjLgXZr0w=;
 b=NLb6hQnxJoSoxSEQD0HhDddPZGoC9987MicvBoqKxJh7Vb7pX6wnLulO
 ZZcP90Clse4Ig5LS9B3EdsUo8Xz2S74ITnCmLM/gQyOdcbifnVmk8//Iy
 czMHPRG56V1i1cueKS0imCTHwXlpSFWwdJNugv7RE2wpG9webRgvhh5Hi
 obtypfpzwF35WfoUBlb7rLA3T4twXuFBwjB8qqNhMzJUzCzEsHLvBlp96
 BcoeHLkx+E/kN4ZieLNgYZr0jtR0bYD5vquALTPsR/jDdWUYx/1u+ZA5b
 kDReWrnB9/tEn1gBRSnCNLq0XP50LkuzBNgx+B7A6jDll0HI59mtOxpG1 Q==;
X-CSE-ConnectionGUID: Bsa19IXTRc6ocuhjj+EqJw==
X-CSE-MsgGUID: rf2uFhILRIqEyBwhVU5q5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49699437"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="49699437"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 13:55:15 -0700
X-CSE-ConnectionGUID: EF+V9zxmRpe/HACo1Ek1fw==
X-CSE-MsgGUID: f3z4AVFCQoaxlj/6tl1rRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="145634553"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 13:55:13 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com, riana.tauro@intel.com,
 jani.nikula@intel.com
Cc: lucas.demarchi@intel.com, soham.purkait@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH v1 3/3] drm/xe/regs/xe_pmt: Macros for G-State residency offset
Date: Fri, 23 May 2025 02:19:37 +0530
Message-Id: <20250522204937.545284-4-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522204937.545284-1-soham.purkait@intel.com>
References: <20250522204937.545284-1-soham.purkait@intel.com>
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

   Add G-State residency offset macros for G2, G6, G8, G10
and ModS.

V1 : Residency offset moved to regs/xe_pmt. (Riana)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pmt.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index b1d4504e4adc..23995835a583 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -21,4 +21,10 @@
 #define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
 #define   SG_REMAP_BITS			REG_GENMASK(31, 24)
 
+#define BMG_G2_RESIDENCY_OFFSET			(0x530)
+#define BMG_G6_RESIDENCY_OFFSET			(0x538)
+#define BMG_G8_RESIDENCY_OFFSET			(0x540)
+#define BMG_G10_RESIDENCY_OFFSET		(0x548)
+#define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
+
 #endif
-- 
2.34.1

