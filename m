Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A24E743EA
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 05:04:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1191110E0DD;
	Fri, 29 Sep 2023 05:04:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D407A10E0E0
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 05:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695963868; x=1727499868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2YuhGjYVqblJDmJpBYeEXMfacHFLdMQ3UpEEs6WW2eY=;
 b=MD+585+8tXnShcl7ARQRvKi9lvQuPZFj4ACstkR3RMZ1jc+5DQ8eQ0s9
 XixijAAncULdjuhLmuDqQsSz1dGaIkk+l43Fy3xPClOL//Gh2Dq3S6oV2
 g2SNLqjm81JO9R3ojeNbisCzBikPpHklIJ8tiFOLROUgfklZsiPSV+T6U
 cycJg5g0D0IX0D+6DyRSvjWK63ZFgGi4P8i2YKzLJzleekRT3zo3aeCTm
 8qWpSs3n8ll4TakjlMUxTWNJ8rLACYa+XCUrwX27CNj7ybY8Ox4XkyOzc
 ccTS5OIkwyGbC2A/D7oAz5SxFTYYYshcHWHvxJt+tyNaa6T6iDEEuwaZ5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="413142027"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="413142027"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 22:04:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="865570964"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="865570964"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 22:04:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 22:02:50 -0700
Message-Id: <20230929050253.3153804-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230929050253.3153804-1-lucas.demarchi@intel.com>
References: <20230929050253.3153804-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/7] drm/xe/xe2: Add one more bit to encode PAT
 to ppgtt entries
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Xe2 adds one more bit to cover all the possible 32 entries. Although
those entries are not used by internal kernel code paths, it's expected
that userspace will make use of it.

Bspec: 59510
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h | 1 +
 drivers/gpu/drm/xe/xe_vm.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 5090bdd1e462..7ffc26446d2e 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -40,6 +40,7 @@
 #define XE_BO_INTERNAL_64K		BIT(31)
 
 #define XELPG_PPGTT_PTE_PAT3		BIT_ULL(62)
+#define XE2_PPGTT_PTE_PAT4		BIT_ULL(61)
 #define XE_PPGTT_PTE_PAT2		BIT_ULL(7)
 #define XE_PPGTT_PTE_PAT1		BIT_ULL(4)
 #define XE_PPGTT_PTE_PAT0		BIT_ULL(3)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 140a70d91d76..7e5f4bbea451 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1223,6 +1223,9 @@ static u64 pte_encode_cache(struct xe_device *xe, enum xe_cache_level cache)
 	if (pat_index & BIT(3))
 		pte |= XELPG_PPGTT_PTE_PAT3;
 
+	if (pat_index & (BIT(4)))
+		pte |= XE2_PPGTT_PTE_PAT4;
+
 	return pte;
 }
 
-- 
2.40.1

