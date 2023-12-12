Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6268C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 21:01:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7898210E69D;
	Tue, 12 Dec 2023 21:01:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2881410E69D
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 21:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702414884; x=1733950884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZEV0gkxmjWT5jFMT8v+ssw4aV9xPmRXcAdSkuM36Hh4=;
 b=Bz1ffPEF03LdeDfSZUrMX/q0jG65esgxQg92ShG2Zc7aUAbkuslTD66Q
 W/y/nibIOwg8EvcPm1HmlIWgs+DjMyaeVQcV/RoLTLirygrG5Qo7wmBcD
 u1NYkEb3ebHhKjGHddsyl/TDRA0C2fqnC5aM5RBfeXyLKlZD+tvBIAHEN
 zKh0CzhoM5dVhv0jzYn3fxgqOoh3eISAt2GNN0HrrOYlXMZ+JI1Pez/bO
 mloJ1/SkJ9RPq95989ZrnN6DoQKP24Ll7SjyKGZFY8rtVHtSWN7xVOyJW
 eoTD/FcNDcP+hvwcX0PCxWxdU1TXmL7r+iu3JJ76v1S/ZZAk39dfaSDip g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="397654582"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="397654582"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 13:01:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="917417150"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="917417150"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.128.218])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 13:01:13 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 02/10] drm/xe: Add command MI_LOAD_REGISTER_MEM
Date: Tue, 12 Dec 2023 22:00:46 +0100
Message-Id: <20231212210054.1747-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231212210054.1747-1-michal.wajdeczko@intel.com>
References: <20231212210054.1747-1-michal.wajdeczko@intel.com>
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

We will need this shortly during context state preparation.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index 1cfa96167fde..c74ceb550dce 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -56,6 +56,9 @@
 #define   MI_FLUSH_IMM_QW		REG_FIELD_PREP(MI_FLUSH_DW_LEN_DW, 5 - 2)
 #define   MI_FLUSH_DW_USE_GTT		REG_BIT(2)
 
+#define MI_LOAD_REGISTER_MEM		(__MI_INSTR(0x29) | XE_INSTR_NUM_DW(4))
+#define   MI_LRM_USE_GGTT		REG_BIT(22)
+
 #define MI_BATCH_BUFFER_START		__MI_INSTR(0x31)
 
 #endif
-- 
2.25.1

