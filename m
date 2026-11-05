Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB0D606A326
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 23:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cH/T16g1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC79110E6E0;
	Thu,  5 Nov 2026 23:32:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A0510E6E0
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 23:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793921545; x=1825457545;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=iq+cvkDTibzNRfV+orT07BYGvRTzS52dBzHwcgSBDOA=;
 b=cH/T16g1AdkDt2zVuX2miUCytjbK9OrD9LEBuQWFDIZ69D7RhR1uswWV
 OryevE9p4Av2KA0+8Zq+XpDv+SMGMMX3cmsnXzY0WWz7fziH/a5pCSJ8t
 ctvP9at47MTPZSa+d+6B0qnayMmoD6fw2HZrFrM0Hd4+kjhnEJMGusk19
 sQFJ4QPI7ugQpYxoAbYZJks52ksI5W/k5HeqDNxBLNv3aN2FFeQPZjecd
 iM3mtKFIy5zxxnBFFHZZbqe+LUl/KwlrZC7s7sCLfjVlhPXCYvYOKAQ+v
 Mt6tmsQ9Jciems2YBbLvQ6Pau2B3Iv8sIWoNyJSMh4fx331gSgsA1IHqZ w==;
X-CSE-ConnectionGUID: E9nAE4HrRa2t9Bsf2Xts7g==
X-CSE-MsgGUID: ihTZmbS/ReuxnQjf7nqDqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2769903"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2769903"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 15:32:24 -0800
X-CSE-ConnectionGUID: UxEKksjTTKSC2sn4xofZBw==
X-CSE-MsgGUID: nPWgTkHeQ6yxB7J6jecLKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7186932"
Received: from gabaabhi-mobl2.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 15:32:20 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 05 Nov 2026 20:31:49 -0300
Subject: [PATCH v3 02/10] drm/xe: Sync Wa_16023105232 in xe_was to match
 OOB rule
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-wa_16031259911-v3-2-da6ec790aa29@intel.com>
References: <20261105-wa_16031259911-v3-0-da6ec790aa29@intel.com>
In-Reply-To: <20261105-wa_16031259911-v3-0-da6ec790aa29@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, 
 Shekhar Chauhan <shekhar.chauhan@intel.com>, 
 Matt Atwood <matthew.s.atwood@intel.com>
X-Mailer: b4 0.15-dev
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Wa_16023105232 was extended in xe_wa_oob.rules to match extra IP
releases while the respective entry in xe_was[] was overlooked.
Update the latter to be in sync with the former.

Also add comments in the code so that we don't forget to update both
places if new IP versions are added.

Fixes: c96e0df4e9f5 ("drm/xe/xe3: Add support for media IP version 30.02")
Fixes: 4fde66699f1c ("drm/xe/xe3: Add support for graphics IP versions 30.04 & 30.05")
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c         | 5 +++--
 drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index c71318b901d6..bd556412c294 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -581,8 +581,9 @@ static const struct xe_rtp_table_sr engine_was = XE_RTP_TABLE_SR(
 	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE))
 	},
 	{ XE_RTP_NAME("16023105232"),
-	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3000), OR,
-		       GRAPHICS_VERSION_RANGE(2001, 3001)),
+	  /* IP versions need to be in sync with the respective entry in xe_wa_oob.rules. */
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3002), OR,
+		       GRAPHICS_VERSION_RANGE(2001, 3005)),
 	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(0), RC_SEMA_IDLE_MSG_DISABLE,
 			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 	},
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index ba02a7a53b73..0be1fcd38a7f 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -44,6 +44,7 @@
 18013179988	GRAPHICS_VERSION(1255)
 		GRAPHICS_VERSION_RANGE(1270, 1274)
 1508761755	GRAPHICS_VERSION(1255)
+# IP versions need to be in sync with the respective entry in xe_wa.c.
 16023105232	GRAPHICS_VERSION_RANGE(2001, 3005)
 		MEDIA_VERSION_RANGE(1301, 3002)
 16026508708	GRAPHICS_VERSION_RANGE(1200, 3005)

-- 
2.56.0

