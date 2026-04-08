Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261FD1073CBC
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 14:01:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F64C10E675;
	Wed,  8 Apr 2026 14:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A4BVbN2y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860E410E67C;
 Wed,  8 Apr 2026 14:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775656910; x=1807192910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WzbUTAT9Tr/xHqza7h2MxvUWfyeCnzZXrsIYtudhZqU=;
 b=A4BVbN2ybrwKrYxcBRa9wJrui9DeuhJYtZbyNOiGKR2ApB5g9MTZpXgF
 Yc1kNPUTz9KVz8AiAJMEatRP9G+VvAs+g67JWuef39Rg4joyRzgSLOBy+
 2GWaYO6kUIxyJTfZ7z3iMbZprYUtA5ytJDBmTbAWOw3JzfPuvYC3RQ91B
 LJzsZVimY1blr6U5BgpexK2WILXrbWWiY+/EzM7uN1gxFmf5JZG0rtnm7
 I6BeIajEfge5tpNYTFJjWVv6CBRSj8luDnLQlP76zSCtgONpjQHhvZLQL
 TXjNG+0+/2gVrPosnIoAyWIHCFKx0JPYc8HO7NmPZddxxIJqxylcYjc1m A==;
X-CSE-ConnectionGUID: j4bq/KjAS4qag2nE4bd0pg==
X-CSE-MsgGUID: eJuq8d+DTpOR9lXyFK+r4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="75811551"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="75811551"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 07:01:25 -0700
X-CSE-ConnectionGUID: t+O72rc2TEOMXgQuwrZq7A==
X-CSE-MsgGUID: YcM/jAVZQdWNg6XmUWJclg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="228726686"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.244.251])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 07:01:24 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 4/7] drm/i915/psr: Add new macro for accessing cached PSR DPCD
 registers
Date: Wed,  8 Apr 2026 17:00:56 +0300
Message-ID: <20260408140059.252067-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408140059.252067-1-jouni.hogander@intel.com>
References: <20260408140059.252067-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Add new macro to ease accessing cached PSR DPCD registers.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index e2496db1642a..7d04867e3053 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -584,6 +584,7 @@ struct intel_connector {
 
 		struct {
 			u8 dpcd[EDP_PSR_RECEIVER_CAP_SIZE];
+#define INTEL_PSR_DPCD_INDEX(psr_dpcd_register)	((psr_dpcd_register) - DP_PSR_SUPPORT)
 
 			bool support;
 			bool su_support;
-- 
2.43.0

