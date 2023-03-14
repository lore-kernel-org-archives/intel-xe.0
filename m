Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB8AC6FD19
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 00:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D73C10E6A7;
	Tue, 14 Mar 2023 00:30:53 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8054610E6AD
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 00:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678753847; x=1710289847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eIYMgvbTJWXZPpWfiadQpYeqYHS4h0sV8MRonm9j7yg=;
 b=fp+QUGU2afQqM6Szx+xkkvJwTNOs0rpCXe6sIzl5Zkb6MdYPfvxL++I8
 YbAq0aX3YpgbbPVCxlci50wUhD8dmyBbugq6jTsR1ESaI9ElYNNq4t0CD
 cu09zG/tQbswee9V9V1U5InS4GJTI4drG9DI+/qbR9U6jnkRtftWoxe3H
 Gxd1yCDxF6gm1a10XuF9P79vGoLjVMiGzLxoIKktY3nndJDwil3EzaWv/
 tIJhOBxuiwMcgEf53XXDfS+S3wN85+vNt7QsuIK6pJs2xaL46BpoV/ACw
 Z5XAtGPpwLPxw7aaAevwlavF2TFP73FWeW2CpVPqAvBs8/r4nKzU1XSyk g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="402168036"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="402168036"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 17:30:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="789116714"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="789116714"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 17:30:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 17:30:10 -0700
Message-Id: <20230314003012.2600353-13-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230314003012.2600353-1-lucas.demarchi@intel.com>
References: <20230314003012.2600353-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 12/14] drm/xe: Add missing ADL-P engine
 workaround
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

Add the one missing workaround for ADL-P when comparing to i915 up to
commit 7cdae9e9ee5e ("drm/i915: Move DG2 tuning to the right function").

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 0621706f46e6..e21c7ec53b2f 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -299,6 +299,16 @@ static const struct xe_rtp_entry engine_was[] = {
 			     XE_RTP_ACTION_FLAG(MASKED_REG)))
 	},
 
+	/* ADL-P */
+
+	{ XE_RTP_NAME("1607297627, 1607030317, 1607186500"),
+	  XE_RTP_RULES(PLATFORM(ALDERLAKE_P), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(RENDER_RING_BASE),
+			     GEN12_WAIT_FOR_EVENT_POWER_DOWN_DISABLE |
+			     GEN8_RC_SEMA_IDLE_MSG_DISABLE,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+
 	/* DG2 */
 
 	{ XE_RTP_NAME("22013037850"),
-- 
2.39.0

