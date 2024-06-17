Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9F3C27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 18:25:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF0E10E49A;
	Mon, 17 Jun 2024 18:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e7bi7nEb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0082C10E49B
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 18:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718648735; x=1750184735;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DivJHkLB7RlWmmV40/Mvz928XKczRMZbujI/D7gnTBc=;
 b=e7bi7nEbOiix3jj7gbVsXSW6OTH0HYsoYJsVRK1RMGxUaRby+IXCHfTw
 I6TWhR1F4uXA8zAlGQ7H52FBjfW1LUgaPKcXn7rocl3A00QbbMRU6kcZu
 jxX0l3C930n6LrhJMNeXmw78E6gKK0fn0qi0z9b3lPopITfFB7IdXROh5
 RrD7wbHvZvsJwXaaNTS3t2jZ+bWe99TdEwo4G1Lkkawqo20fTmA8DIcsI
 ycDiiGPNkS0OS12NRik/D5SJOJEmGIaNPgMSbr3L4kHu963HPB9XwZ4I2
 bWv2N/RJ2ANMicWmT3+nStOQVR7kr7vHzgiLN4eIvG9pUTw1deJCfr4Zl A==;
X-CSE-ConnectionGUID: njkNh2CmQu2VaSfo/oc7FA==
X-CSE-MsgGUID: 4eHhigrkQKWVJlfo3aLlNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="19276232"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="19276232"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 11:25:35 -0700
X-CSE-ConnectionGUID: lYM3cCBjQRq1UTMA5ske3w==
X-CSE-MsgGUID: Igvb8YYNS5O1KVlYfqcuWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="45642439"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 11:25:34 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 3/5] drm/xe/rtp: Expand max rules/actions per entry
Date: Mon, 17 Jun 2024 11:25:16 -0700
Message-ID: <20240617182518.280975-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617182518.280975-1-lucas.demarchi@intel.com>
References: <20240617182518.280975-1-lucas.demarchi@intel.com>
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

Having at most 4 rules per entry is already reaching the maximum.
Expand it to 6 to allow for more room. With the addition of OR
condition for rules, this will very soon not be sufficient.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.h         | 4 ++--
 drivers/gpu/drm/xe/xe_rtp_helpers.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 5a6b112a8be6..bd5b5ba0fb31 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -346,7 +346,7 @@ struct xe_reg_sr;
  * XE_RTP_RULES - Helper to set multiple rules to a struct xe_rtp_entry_sr entry
  * @...: Rules
  *
- * At least one rule is needed and up to 4 are supported. Multiple rules are
+ * At least one rule is needed and up to 6 are supported. Multiple rules are
  * AND'ed together, i.e. all the rules must evaluate to true for the entry to
  * be processed. See XE_RTP_MATCH_* for the possible match rules. Example:
  *
@@ -371,7 +371,7 @@ struct xe_reg_sr;
  * XE_RTP_ACTIONS - Helper to set multiple actions to a struct xe_rtp_entry_sr
  * @...: Actions to be taken
  *
- * At least one action is needed and up to 4 are supported. See XE_RTP_ACTION_*
+ * At least one action is needed and up to 6 are supported. See XE_RTP_ACTION_*
  * for the possible actions. Example:
  *
  * .. code-block:: c
diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h b/drivers/gpu/drm/xe/xe_rtp_helpers.h
index 7735f217ba71..c59e40fd7fff 100644
--- a/drivers/gpu/drm/xe/xe_rtp_helpers.h
+++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
@@ -58,6 +58,8 @@
 #define XE_RTP_PASTE_2(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL args_)
 #define XE_RTP_PASTE_3(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL args_)
 #define XE_RTP_PASTE_4(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_5(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_4(prefix_, sep_, _XE_TUPLE_TAIL args_)
+#define XE_RTP_PASTE_6(prefix_, sep_, args_) _XE_RTP_CONCAT(prefix_, FIRST_ARG args_) __XE_RTP_PASTE_SEP_ ## sep_ XE_RTP_PASTE_5(prefix_, sep_, _XE_TUPLE_TAIL args_)
 
 /*
  * XE_RTP_DROP_CAST - Drop cast to convert a compound statement to a initializer
-- 
2.43.0

