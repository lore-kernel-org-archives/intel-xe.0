Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7989060A2624
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 09:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=THE1bxNm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5FA1121A9;
	Thu, 26 Nov 2026 09:07:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC09112199
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 09:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795684033; x=1827220033;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=DvLhGOhtc91e2n9qY1FJgHwmXpZH22kykQkWiRDUhUY=;
 b=THE1bxNmAVpUcbCg20Bx/OLXXOc1vEZtkuTsgSondviZJ01Ev8JyugWM
 //UOD/QTt4OF/4Z1v/8Bu94mxQyNvphosMMTdUM2uW+OP/u8Kva8N7dSB
 Ak1zqfz0Fh+xQpLCpqgHMI5h54hZoL900xZ9Z6E95FgFQahV2eZugpfcV
 KfRIm51eX5s76Mch4LQmoZBXd9L0BOV0ayK3OLZgsGCJpGuJhaEJn87vt
 716fClL5POLhUCIDn1sfS6iE7PKYqujx9E4CKBojwych/t3bmymXqcqtq
 fnT9vljXNaZaDjf+JmwGyj8MedJa70XJAqI2VqotUneSwtaiT43Z+wcrA A==;
X-CSE-ConnectionGUID: pz1WoFW1RVSM//pssHf70g==
X-CSE-MsgGUID: 0ejhg/EfQhav0Du/AgtF3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4496712"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4496712"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:07:12 -0800
X-CSE-ConnectionGUID: YqiZxlvPQsegT6dGVfCFUA==
X-CSE-MsgGUID: CnD16DlGRJGnfirymzIL5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12340461"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa003.fm.intel.com with ESMTP; 26 Nov 2026 01:07:10 -0800
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, satyanarayana.k.v.p@intel.com,
 piotr.piorkowski@intel.com, jesus.narvaez@intel.com,
 daniele.ceraolospurio@intel.com, stuart.summers@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe: Add MI_SEMAPHORE_WAIT_64 instruction definition
Date: Thu, 26 Nov 2026 14:34:44 +0530
Message-ID: <20261126090445.1220148-2-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261126090445.1220148-1-tilak.tirumalesh.tangudu@intel.com>
References: <20261126090445.1220148-1-tilak.tirumalesh.tangudu@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Wa_16029281913 recommends using the MI_SEMAPHORE_WAIT_64 instruction
instead of the legacy MI_SEMAPHORE_WAIT, due to an issue with the legacy
semaphore on some Xe3p platforms.

v2: Rename to MI_SEMW64_32BIT_COMPARE to fix alignment (Satya)
v3: Drop the WA comment (Satya)

Assisted-by: LLM
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index 835ef75bbeb1..75e6a4d0e79d 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -48,6 +48,11 @@
 #define   MI_SEMW_COMPARE(OP)		REG_FIELD_PREP(MI_SEMW_COMPARE_OP_MASK, COMPARE_OP_##OP)
 #define   MI_SEMW_TOKEN(token)		REG_FIELD_PREP(REG_GENMASK(9, 2), (token))
 
+#define MI_SEMAPHORE_WAIT_64		(__MI_INSTR(0x3b) | XE_INSTR_NUM_DW(7))
+#define   MI_SEMW64_INTERRUPT		REG_BIT(20) /* raises the semaphore-fail interrupt */
+#define   MI_SEMW64_32BIT_COMPARE	REG_BIT(19) /* 0: 64b compare (default), 1: 32b compare */
+#define   MI_SEMW64_INHIBIT_CTX_SWITCH	REG_BIT(15) /* poll in place, don't switch out on fail */
+
 #define MI_STORE_DATA_IMM		__MI_INSTR(0x20)
 #define   MI_SDI_GGTT			REG_BIT(22)
 #define   MI_SDI_LEN_DW			GENMASK(9, 0)
-- 
2.46.0

