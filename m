Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D89AC25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 08:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2514510E301;
	Mon,  3 Jun 2024 08:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YBIp9s07";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2B010E301
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 08:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717403535; x=1748939535;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yEKjZVt1HS3wZrxvcjf/MgS2g3E4tKZ0B6yvHDz+1YY=;
 b=YBIp9s07TVaDHHvoLgGMSpXwcv4apLvddfj646ejmVZobyCsVicnb1LN
 VDxGk+b2T2wIp3kL0SQQnjoAXZql7mJFkzPwuHoHsUvwoGb8ZJuvrWyiq
 6jbd/tb4ZZA+fZzFO2noGIVjV0IRmAUcee0fgLgKhCvIGfs8dTIKaiT31
 KwBy352gooWhLDe8LZq+cv59rC48j25aCkFFm8bUW4SAroepjVFj1r0w6
 plTLH3TXRuOLdBMxCSEPWvEl/MTGs0aqrQAWqQEqiqm5yKZyDc+mnH5GG
 r4Zrv0oGxlu7baMOz19sRj/nAi6TdjC0+qfJxdCVpa/QbVyYPHfsC2T0e w==;
X-CSE-ConnectionGUID: I3xEcpggSB6zL025SLFA2Q==
X-CSE-MsgGUID: ZDJffon9QjOad9zadrnSsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="24512265"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="24512265"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 01:32:15 -0700
X-CSE-ConnectionGUID: sWrKW4JISPmQCHiRYe1NJA==
X-CSE-MsgGUID: YmIVfskQTgOx/NAg0F+vMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="74299143"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 01:32:13 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe: Use missing lock in relay_needs_worker
Date: Mon,  3 Jun 2024 10:17:23 +0200
Message-ID: <20240603081723.18775-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Add missing lock that is protecting relay->incoming_actions.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_relay.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
index c3bbaf474f9a..ade6162dc259 100644
--- a/drivers/gpu/drm/xe/xe_guc_relay.c
+++ b/drivers/gpu/drm/xe/xe_guc_relay.c
@@ -761,7 +761,14 @@ static void relay_process_incoming_action(struct xe_guc_relay *relay)
 
 static bool relay_needs_worker(struct xe_guc_relay *relay)
 {
-	return !list_empty(&relay->incoming_actions);
+	bool is_empty;
+
+	spin_lock(&relay->lock);
+	is_empty = list_empty(&relay->incoming_actions);
+	spin_unlock(&relay->lock);
+
+	return !is_empty;
+
 }
 
 static void relay_kick_worker(struct xe_guc_relay *relay)
-- 
2.42.0

