Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3056E7B60F
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 13:09:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641DB10E369;
	Wed,  4 Oct 2023 13:09:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D9610E369
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 13:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696424956; x=1727960956;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4CdFXNbrhpxhQ2iFzKoSDF0FEa3cyJM0INR99Br4UPg=;
 b=JxWgsJJ3jL7UunPvxfh+f2I8zckDjkKp+LK3TwtpNPAB5AduPNxT8cHO
 4haYCu0Lbkdo/E2v6VU4OqYFB/CR0EIH6apSFd2+r821AWtx2jyymBTy+
 AYlTXB/1mxYkKiURVi1VsLdY/1zivYZRIUtJXQsttWgrNCdRCIgQc5s4F
 DtajI7wF/Ev4fKkbxg2T8K50C4MIb3sno5tFRVDG9hkeYXsGj1WPZNin/
 UxugtKkdH83kzevRvvH9vh1qAyJFrRwd8hy8tkUTUccpffu+qzPGtCAik
 cWgkccDXeXgrRK93rxDkxodCTYDlVaSqok4MT1LCoNsjJwxfwzw2gjJkN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="362521563"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="362521563"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 06:09:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="701087516"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="701087516"
Received: from thingoc2-mobl1.ccr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.255.32.82])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 06:08:43 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  4 Oct 2023 10:08:24 -0300
Message-ID: <20231004130824.13909-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/rtp: Fix doc for XE_RTP_ACTIONS
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

Replace the paragraph that was meant for XE_RTP_RULES with one proper
for XE_RTP_ACTIONS.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 04ccb26452ad..c56fedd126e6 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -350,9 +350,8 @@ struct xe_reg_sr;
  * XE_RTP_ACTIONS - Helper to set multiple actions to a struct xe_rtp_entry_sr
  * @...: Actions to be taken
  *
- * At least one rule is needed and up to 4 are supported. Multiple rules are
- * AND'ed together, i.e. all the rules must evaluate to true for the entry to
- * be processed. See XE_RTP_MATCH_* for the possible match rules. Example:
+ * At least one action is needed and up to 4 are supported. See XE_RTP_ACTION_*
+ * for the possible actions. Example:
  *
  * .. code-block:: c
  *
-- 
2.42.0

