Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DABCF044A
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 10:36:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C5910E6CD;
	Wed,  9 Oct 2024 10:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T523xWHo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C35410E6CE
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 10:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728470189; x=1760006189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U8oYGJmGupKd4mZzpP189Afw3AWUndE0nbjq7ya0y38=;
 b=T523xWHoTHdbtXP6PcmuSMpYfdAOUOBgIl5vaa50a1qawK+YrK/WGiI2
 FvZQ1AsWcnbvcqJXzk00iei8OZI8+LXpDdUTiqAU8aBnVidKR2bqrf0dJ
 kSLF2w1FDY4FvJ/uu3RP4ZYV0UMAocTkvmXkDm+aAfFBxf7nGnGRyoo4p
 1l0H4qtvRTlspHgIZs5wzp+BQz6wl5BobqIwr1+fVmQAetL8c09SXYba7
 91akrh4Ld6oVlbIh9bYV3punVFloUwfk4XO92pg17Lqn+XOTkO2UsrOGL
 1fcgxStvgm2mlzZqzkI7y4ZrIK9rNA67YWEtzSk5a5PyZSOaWZ5qk89yT A==;
X-CSE-ConnectionGUID: ftL2a8pIQgy1uowN2FdNoQ==
X-CSE-MsgGUID: OvOBDKfOT2aPNrtfTxhwIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="39152338"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="39152338"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 03:36:28 -0700
X-CSE-ConnectionGUID: k447mAYMQaW3lRxSoJGwag==
X-CSE-MsgGUID: mtCkeim0RyORs7RQfI/LVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="80191516"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 03:36:25 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, john.c.harrison@intel.com,
 rodrigo.vivi@intel.com, matthew.brost@intel.com, matthew.auld@intel.com
Subject: [PATCH 3/3] drm/xe/guc/ct: Flush g2h worker in case of g2h response
 timeout
Date: Wed,  9 Oct 2024 16:26:45 +0530
Message-Id: <20241009105645.1416588-4-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009105645.1416588-1-badal.nilawar@intel.com>
References: <20241009105645.1416588-1-badal.nilawar@intel.com>
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

In case if g2h worker doesn't get opportunity to within specified
timeout delay then flush the g2h worker explicitly.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2902
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index dcc95c01b6f0..2e2fa59eadfb 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1034,6 +1034,18 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	}
 	mutex_unlock(&ct->lock);
 
+	/*
+	 * Flush g2h_worker explicitly in case if it didn't get opportunity
+	 * to run after it is queued
+	 */
+	if (!ret) {
+		xe_gt_dbg(gt, "Flush G2H worker to service H2G action %#x\n",
+			  action[0]);
+		flush_work(&ct->g2h_worker);
+		if (g2h_fence.done)
+			ret = 1;
+	}
+
 	/*
 	 * Ensure we serialize with completion side to prevent UAF with fence going out of scope on
 	 * the stack, since we have no clue if it will fire after the timeout before we can erase
-- 
2.34.1

