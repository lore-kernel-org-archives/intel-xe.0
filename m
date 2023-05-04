Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A23C7EE23
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 07:33:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A2010E3AF;
	Thu,  4 May 2023 07:33:47 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85C310E3AF
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 07:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683185625; x=1714721625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RZJOCPQEf7sNCYKUXnQmYyN1rToCnb9kml4HxVFs/uE=;
 b=hHlVaX4/EdVcTEofwWuYxtDy2lvO7wNmW+l2vWWGScFf4ymlaScP9r2E
 SNByQjX73DN+QI3rnvdswVs08W+vn+yPAQPuzFINwgiXKZS1G/qg0T5BG
 sI2YrTLhyeIjpdgWctQoQKMlYngpngrbLNVg0dkYOuYZC2K0pu+SooXUn
 VswfuvgqPrs0xmAEevZcnWmyYRUrDPtcQpnrjW6MVb8IXUI8NkcVkga6/
 dHmto8xotcw9l6a61wMsQBF5O8tkKNsf7q7FzXMq1SZ1MpeIbliQhwvCv
 aQMqWQMRyO3dugx2i2imA0npxCWiu19WN6s+7awMNp/rxxTZJzzbOga55 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="414323831"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="414323831"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 00:33:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="674439439"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="674439439"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 00:33:43 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  4 May 2023 00:32:48 -0700
Message-Id: <20230504073250.1436293-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230504073250.1436293-1-lucas.demarchi@intel.com>
References: <20230504073250.1436293-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/7] drm/xe/rtp: Let rule_matches() receive
 xe_device
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

Since some rules use xe_gt, rule_matches() uses that for matching the
rules, even if most of them are actually checking flags in the
device/platform layer. In order to allow the device-centric rules to be
checked for out-of-band WAs, let's pass the pointer to xe_device, too.

Also group the simple rules together to make it easier to separate the
ones checking the device info from others checking gt or hwe.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index f2a0e8eb4936..88eaea597cf7 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -23,11 +23,11 @@
  * the values to the registers that have matching rules.
  */
 
-static bool rule_matches(struct xe_gt *gt,
+static bool rule_matches(const struct xe_device *xe,
+			 struct xe_gt *gt,
 			 struct xe_hw_engine *hwe,
 			 const struct xe_rtp_entry *entry)
 {
-	const struct xe_device *xe = gt_to_xe(gt);
 	const struct xe_rtp_rule *r;
 	unsigned int i;
 	bool match;
@@ -62,6 +62,12 @@ static bool rule_matches(struct xe_gt *gt,
 			match = xe->info.step.graphics >= r->step_start &&
 				xe->info.step.graphics < r->step_end;
 			break;
+		case XE_RTP_MATCH_INTEGRATED:
+			match = !xe->info.is_dgfx;
+			break;
+		case XE_RTP_MATCH_DISCRETE:
+			match = xe->info.is_dgfx;
+			break;
 		case XE_RTP_MATCH_ENGINE_CLASS:
 			match = hwe->class == r->engine_class;
 			break;
@@ -71,13 +77,6 @@ static bool rule_matches(struct xe_gt *gt,
 		case XE_RTP_MATCH_FUNC:
 			match = r->match_func(gt, hwe);
 			break;
-		case XE_RTP_MATCH_INTEGRATED:
-			match = !xe->info.is_dgfx;
-			break;
-		case XE_RTP_MATCH_DISCRETE:
-			match = xe->info.is_dgfx;
-			break;
-
 		default:
 			XE_WARN_ON(r->match_type);
 		}
@@ -108,11 +107,12 @@ static void rtp_add_sr_entry(const struct xe_rtp_action *action,
 static void rtp_process_one(const struct xe_rtp_entry *entry, struct xe_gt *gt,
 			    struct xe_hw_engine *hwe, struct xe_reg_sr *sr)
 {
+	const struct xe_device *xe = gt_to_xe(gt);
 	const struct xe_rtp_action *action;
 	u32 mmio_base;
 	unsigned int i;
 
-	if (!rule_matches(gt, hwe, entry))
+	if (!rule_matches(xe, gt, hwe, entry))
 		return;
 
 	for (action = &entry->actions[0]; i < entry->n_actions; action++, i++) {
-- 
2.40.1

