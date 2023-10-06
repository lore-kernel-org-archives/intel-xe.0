Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B38E92FF8
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 08:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE0F10E4CC;
	Fri,  6 Oct 2023 08:52:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA6710E4CF
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 08:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696582328; x=1728118328;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ELb8lyCPeKgZnZsZqMWocx5CbRGSSKALLrV4CyuLmno=;
 b=Cmnksq2Ytx0Y+8CeIDUZ+/6mIy5j1twRdLFsMtPUiJEEFVoxO4V4qW7D
 YxrIRYyAB01+D6hxiC8xEZK3MQ+XeBHE4qJ9ejubuUMXOc/LXba65fHFD
 ccJDvZtAPUMUj/RzOssjSN68IRZjm43c0nS6nHMePSSuJ2/9LC9cRlhZp
 7oU0x/Z/aFKndcJNEY/UMjKUZ7neq8oS3EtpAs/uXUeLQyTKY07Bqo6cn
 OobnWYuLEkVZ307avAHa4BD/shNFr7X6RMtWAGe872nkiNFin3V7goLCR
 RXIeSU6qDBvdM1Caxz2N2K38289tg4ZnpsAeg8ojNk/0cFuK5zsh9FT3s w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="383599722"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="383599722"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 01:47:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="745783339"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="745783339"
Received: from johnodri-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.31.16])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 01:46:42 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  6 Oct 2023 09:46:15 +0100
Message-ID: <20231006084614.19838-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 1/2] drm/xe/pat: trim the xelp PAT table
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We don't seem to use the 4-7 pat indexes, even though they are defined
by the HW. In a future patch userspace will be able to directly set the
pat_index as part of vm_bind and we don't want to allow setting 4-7.
Simplest is to just ignore them here.

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 869aee64641f..36b79d675e54 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -42,10 +42,6 @@ static const u32 xelp_pat_table[] = {
 	[1] = XELP_PAT_WC,
 	[2] = XELP_PAT_WT,
 	[3] = XELP_PAT_UC,
-	[4] = XELP_PAT_WB,
-	[5] = XELP_PAT_WB,
-	[6] = XELP_PAT_WB,
-	[7] = XELP_PAT_WB,
 };
 
 static const u32 xehpc_pat_table[] = {
-- 
2.41.0

