Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FD6EB64DD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 06:42:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7AC10E23B;
	Wed,  9 Aug 2023 06:42:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0F010E23B
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 06:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691563344; x=1723099344;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MbSQzPt+pML5Xrg+ugZFPX4johGHseQV3e56W73+UJg=;
 b=Cd2t0TwZe78VHHW2OwffHx7k7p4f5n12AHsPaqXHuAA30VAPL1gNQVZR
 fyBoeqCYGLBC4nBDi572e32tNgiZIJ+NPx2wKp6q2wd8Btc5+1KqGyejg
 0H9V03tlYBaAo33fdgy7GSkUhqAqn10070bJCDBqtqi4jAniWpXdZvFUO
 bA1wcfvCovlcA7SduVvbQ/m3BsJqZIBxY/SyDzF6DeQLBuw2HEAn4b4co
 ZWXHNyOWb5OSUdYl6REtc3beu0bLOKfOjY8HQaW9Qo/5G+eNAfvip/69M
 b6yqQVJpQ3X9R3UNPlMKqwoLQV+46f47qNTCoMZaYazj+oyKWr9BjC6CP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="368495777"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; d="scan'208";a="368495777"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 23:42:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="1062327985"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; d="scan'208";a="1062327985"
Received: from shekharc-desk.iind.intel.com ([10.190.239.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 23:42:22 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  9 Aug 2023 12:12:13 +0530
Message-Id: <20230809064213.375269-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/mtl: Disable RNE in SF Unit
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

Workaround to disable the round to nearest even in SF unit

BSpec: 45818
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 36c80e9fb758..9e511ba69878 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -602,6 +602,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
 	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
 	},
+	{ XE_RTP_NAME("15010599737"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN))
+	},
 
 	{}
 };
-- 
2.34.1

