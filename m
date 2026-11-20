Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102AA606A32A
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 12:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q/oDfB2b
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A731129A1;
	Fri, 20 Nov 2026 12:05:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B29112974
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 12:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795176305; x=1826712305;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ePy8fzFk6Q4Cm1sEIv/oTaz5CxqzDl/Mno1jWBy7itk=;
 b=Q/oDfB2b40yHE1vfx6rBoxLFi5M1xMB/3icbJi3IuMB6ZuueCNCvuRYW
 t/x3leTAFD/4ythiJNZOkMazellYB/DLB+sc/Gp57ablgbOrqOIMbsqKK
 4qBqjb1qNGMmD6CHmP5vQzYyfMNKYo/zkWPJvz+esab3B0glaJW8ktn36
 8uR7Rp9qLsG/SFi+8MIaS2aA2o+H+hcn9GckPeswL+PnLbBCiOZ+ajutM
 ZEfOFwrSkeVRlRgPlr9FPNVtlzJeZHnzgSACR/dS9gRM42VkVauAhFhV1
 w69HVvacrbdJBJevMEqsPwSZ4dJ10GIpFGUgR92Z5FMT/6uPxU4hcuHVd g==;
X-CSE-ConnectionGUID: THGr95FmRuG9LAHffMVwuA==
X-CSE-MsgGUID: TuMEao6wRlyWmb8vcjLbXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3936329"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3936329"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 04:05:04 -0800
X-CSE-ConnectionGUID: itlbko8UT+Kb6Jump42biA==
X-CSE-MsgGUID: MtSo+orCTvOP6hLq8bNMRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10674142"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa004.fm.intel.com with ESMTP; 20 Nov 2026 04:05:00 -0800
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, satyanarayana.k.v.p@intel.com,
 piotr.piorkowski@intel.com, jesus.narvaez@intel.com,
 daniele.ceraolospurio@intel.com, stuart.summers@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH 2/4] drm/xe: Add MI_SEMAPHORE_WAIT_64 instruction definition
Date: Fri, 20 Nov 2026 17:32:29 +0530
Message-ID: <20261120120231.748267-3-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261120120231.748267-1-tilak.tirumalesh.tangudu@intel.com>
References: <20261120120231.748267-1-tilak.tirumalesh.tangudu@intel.com>
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

Assisted-by: LLM
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index 835ef75bbeb1..6321b5e4aeb4 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -34,6 +34,7 @@
 #define MI_FORCE_WAKEUP			__MI_INSTR(0x1D)
 #define MI_MATH(n)			(__MI_INSTR(0x1A) | XE_INSTR_NUM_DW((n) + 1))
 
+/* Wa_16029281913: MI_SEMAPHORE_WAIT has an issue on some Xe3p, use MI_SEMAPHORE_WAIT_64 */
 #define MI_SEMAPHORE_WAIT		(__MI_INSTR(0x1c) | XE_INSTR_NUM_DW(5))
 #define   MI_SEMW_GGTT			REG_BIT(22)
 #define   MI_SEMW_REGISTER_POLL		REG_BIT(16)
@@ -48,6 +49,11 @@
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

