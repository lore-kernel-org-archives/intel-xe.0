Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC9FC64EC4
	for <intel-xe@archiver.kernel.org>; Thu,  9 Mar 2023 12:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B5910E801;
	Thu,  9 Mar 2023 12:17:58 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78E010E801
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Mar 2023 12:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678364276; x=1709900276;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dc+pF1Lt4gmOZ+h2n+FNMdhBE42kSS06N0fROUptGDo=;
 b=KvnChTFK1yYOK3G+xo1ORF7NJvF/NYjQVe0jreV0GQHY6hHJ1ts70oKC
 9eCQ+rp0gMnJ5WhP6KsQjVpiFyin7jQTbG6GEWoemY6QV0HijcHw3nDxg
 566BKTKF0ecn936h01bYXovP478HSulysE7j3xUG00k49dAgGOOjNhsOY
 k1o0EfxYvAnLt4slKqGVzCpI+CFt4mdfaToG4aEvwI689MO9sg5bvTZDB
 GAreSHnPaJcZmqVYiF1yZoWPoGJKGQ/G88EXyuLkp6CGup5y54toJEQ08
 AxAToVBI5Sw9wF7A/GBb79QglQN2/ax/4TXkMeLcxA5jEN9WpUNJ42K2h A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="320259048"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="320259048"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 04:17:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="923208468"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="923208468"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.145])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 04:17:54 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Mar 2023 14:17:46 +0200
Message-Id: <20230309121746.479146-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: make compound literal initialization
 const
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Be careful about having const in the compound literal initialization to
keep the initializers in rodata. Here, the impact is 1.8k of mutable
data moved to rodata.

add/remove: 0/1 grow/shrink: 0/0 up/down: 0/-1804 (-1804)
Data                                         old     new   delta
__compound_literal                          1804       -   -1804
Total: Before=42425, After=40621, chg -4.25%
add/remove: 0/0 grow/shrink: 1/0 up/down: 1804/0 (1804)
RO Data                                      old     new   delta
__compound_literal                          7696    9500   +1804
Total: Before=138535, After=140339, chg +1.30%

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index bd44fd8bbe05..8fc393ef7358 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -363,7 +363,7 @@ struct xe_reg_sr;
  */
 #define XE_RTP_RULES(r1, ...)							\
 	.n_rules = COUNT_ARGS(r1, ##__VA_ARGS__),				\
-	.rules = (struct xe_rtp_rule[]) {					\
+	.rules = (const struct xe_rtp_rule[]) {					\
 		CALL_FOR_EACH(__ADD_XE_RTP_RULE_PREFIX, r1, ##__VA_ARGS__)	\
 	}
 
@@ -390,7 +390,7 @@ struct xe_reg_sr;
  */
 #define XE_RTP_ACTIONS(a1, ...)							\
 	.n_actions = COUNT_ARGS(a1, ##__VA_ARGS__),				\
-	.actions = (struct xe_rtp_action[]) {					\
+	.actions = (const struct xe_rtp_action[]) {				\
 		CALL_FOR_EACH(__ADD_XE_RTP_ACTION_PREFIX, a1, ##__VA_ARGS__)	\
 	}
 
-- 
2.39.1

