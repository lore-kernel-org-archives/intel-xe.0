Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FADCD4F56
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 23:47:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D00910E35E;
	Mon, 18 May 2026 23:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="asOj9J+E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBA410E26C
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 23:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779148051; x=1810684051;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=C7b6w9+POtnBj6sxI58cNK6e7luY6PkhZE4F0ErL6oo=;
 b=asOj9J+EWfclmHe3CqfzB47MKBvPfEhumnhUmHY4/92+LAWqho/BDqNe
 dTIQZ4rsMrDN3QSy6QHzJe1luOtI1S2faL+EqQqOFl/B1wpF9Mk4EpWId
 bqFNiktU4xlSI6775Zdz/oKHzZbJ6663GrK7LEX7gyQgXxKgELAJw59kg
 uZdREQftxrOTMoRa4ylrNzj2ekaL0LB8c/8iHGueyzH9JSPmvR4W2y0jm
 brZ5smi5aeqCADG3wiJPIpILOQj2to4UggrinlEPq0YvNvxWVgBF3snAh
 vpZmH0PY1wrDvwwZe2kXABaqLXJjogZwOkuIxaxYUgObhDfMhrrAptKpQ A==;
X-CSE-ConnectionGUID: QW/aHSAeQzS7eVrLcRXq1w==
X-CSE-MsgGUID: 7XxDzgVpQ8Wxbr/oH6TvbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79866826"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="79866826"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 16:47:21 -0700
X-CSE-ConnectionGUID: n75gMJ9gTSqZlYodZ1YDbQ==
X-CSE-MsgGUID: OKCgT1UsQ5yUgKkRAdS2fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="236959322"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 16:47:20 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/9] drm/xe/rtp: Keep track of non-OA nonpriv slots
Date: Mon, 18 May 2026 16:47:10 -0700
Message-ID: <20260518234716.1540123-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518234716.1540123-1-ashutosh.dixit@intel.com>
References: <20260518234716.1540123-1-ashutosh.dixit@intel.com>
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

In order to dynamically whitelist/dewhitelist OA registers on OA stream
open/close, we need to keep track of nonpriv slots occupied by non-OA
register whitelists.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 6cc81f53fc601..1e788e2ee4014 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -159,7 +159,7 @@ static const struct xe_rtp_entry_sr oa_whitelist[] = {
 	},
 };
 
-static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
+static int whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
 {
 	struct xe_reg_sr *sr = &hwe->reg_whitelist;
 	struct xe_reg_sr_entry *entry;
@@ -191,6 +191,8 @@ static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
 
 		slot++;
 	}
+
+	return slot;
 }
 
 /**
@@ -203,11 +205,13 @@ static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
  */
 void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
 {
+	int nonpriv_slots;
+
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
 
 	xe_rtp_process_to_sr(&ctx, register_whitelist, ARRAY_SIZE(register_whitelist),
 			     &hwe->reg_whitelist, false);
-	whitelist_apply_to_hwe(hwe);
+	nonpriv_slots = whitelist_apply_to_hwe(hwe);
 
 	xe_rtp_process_to_sr(&ctx, oa_whitelist, ARRAY_SIZE(oa_whitelist),
 			     &hwe->oa_whitelist, false);
-- 
2.54.0

