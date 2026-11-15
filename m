Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2D2606A31F
	for <intel-xe@archiver.kernel.org>; Sun, 15 Nov 2026 13:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ntzW7s/6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4446710E657;
	Sun, 15 Nov 2026 13:23:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D748A10E0DA;
 Sun, 15 Nov 2026 13:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794749012; x=1826285012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bPhKIuoygfP0DPdonGv5LpQ1Suk/TKQu70VYkDtnJYM=;
 b=ntzW7s/66hYLnuhpt6CqRda7lUGimalzpivT7lPid9GucN33yKoYbMUP
 wTAJExlLCRC7e8Qik7zF6sSDqtQOLTWlL1l/rlohA38oe0RQHA/2oTHQW
 qOp/6QvKkenkM4eZ/iWMq2762r9tCB6235uiiHbMjNQvH0j8R9I3IybRN
 vfClfuoIRqUrcW/oLACfTts2vpGfjxJfHsuYKK7HiRHTCGOtpN/kyfMZG
 qgaDpcXHV6raMdqffmcg8+jrNINQuvn7T2vhxVOvdASNsRdYlPJsucCLf
 P5qXbBSxyxR9YTrbbVS9LXGARojckesm+bUk3Q8YOMSGD0VRAtE8IIXIm Q==;
X-CSE-ConnectionGUID: GMIaJftJTtW0wsJlrMCzMQ==
X-CSE-MsgGUID: NeK6MLmvR0SixfEsA6+OrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3483752"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3483752"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 05:23:31 -0800
X-CSE-ConnectionGUID: ODjz/02JSeCXlo5deVKFlg==
X-CSE-MsgGUID: cRNMBV25TAyeVbbN5EtojA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9751547"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 05:23:30 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v2 2/2] drm/i915/psr: clean register macro's name from typo
Date: Sun, 15 Nov 2026 14:23:05 +0100
Message-ID: <20261115132305.3326951-3-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261115132305.3326951-1-michal.grzelak@linux.intel.com>
References: <20261115132305.3326951-1-michal.grzelak@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Apply s/_CONTINUOS_/_CONTINUOUS_/ for both
ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME and
PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME.

No functional change.

v1->v2
- apply correct substitution (Sashiko)

Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c      | 6 +++---
 drivers/gpu/drm/i915/display/intel_psr_regs.h | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index f1091c85d7018..28d7ec408159f 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1074,7 +1074,7 @@ static void dg2_activate_panel_replay(struct intel_dp *intel_dp)
 
 	intel_de_rmw(display,
 		     PSR2_MAN_TRK_CTL(display, intel_dp->psr.transcoder),
-		     0, ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME);
+		     0, ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOUS_FULL_FRAME);
 
 	intel_de_rmw(display, TRANS_DP2_CTL(intel_dp->psr.transcoder), dp2_ctl_clear, dp2_ctl_set);
 }
@@ -2618,8 +2618,8 @@ static u32 man_trk_ctl_partial_frame_bit_get(struct intel_display *display)
 static u32 man_trk_ctl_continuous_full_frame(struct intel_display *display)
 {
 	return display->platform.alderlake_p || DISPLAY_VER(display) >= 14 ?
-	       ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME :
-	       PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME;
+	       ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOUS_FULL_FRAME :
+	       PSR2_MAN_TRK_CTL_SF_CONTINUOUS_FULL_FRAME;
 }
 
 static void intel_psr_force_update(struct intel_dp *intel_dp)
diff --git a/drivers/gpu/drm/i915/display/intel_psr_regs.h b/drivers/gpu/drm/i915/display/intel_psr_regs.h
index a57bc111290d1..90e50b616fc5f 100644
--- a/drivers/gpu/drm/i915/display/intel_psr_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_psr_regs.h
@@ -241,7 +241,7 @@
 #define  PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR_MASK		REG_GENMASK(20, 11)
 #define  PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR(val)		REG_FIELD_PREP(PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR_MASK, val)
 #define  PSR2_MAN_TRK_CTL_SF_SINGLE_FULL_FRAME			REG_BIT(3)
-#define  PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME		REG_BIT(2)
+#define  PSR2_MAN_TRK_CTL_SF_CONTINUOUS_FULL_FRAME		REG_BIT(2)
 #define  PSR2_MAN_TRK_CTL_SF_PARTIAL_FRAME_UPDATE		REG_BIT(1)
 #define  ADLP_PSR2_MAN_TRK_CTL_SU_REGION_START_ADDR_MASK	REG_GENMASK(28, 16)
 #define  ADLP_PSR2_MAN_TRK_CTL_SU_REGION_START_ADDR(val)	REG_FIELD_PREP(ADLP_PSR2_MAN_TRK_CTL_SU_REGION_START_ADDR_MASK, val)
@@ -249,7 +249,7 @@
 #define  ADLP_PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR(val)		REG_FIELD_PREP(ADLP_PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR_MASK, val)
 #define  ADLP_PSR2_MAN_TRK_CTL_SF_PARTIAL_FRAME_UPDATE		REG_BIT(31)
 #define  ADLP_PSR2_MAN_TRK_CTL_SF_SINGLE_FULL_FRAME		REG_BIT(14)
-#define  ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME		REG_BIT(13)
+#define  ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOUS_FULL_FRAME		REG_BIT(13)
 
 #define _LNL_SFF_CTL_A				0x60918
 #define _LNL_SFF_CTL_B				0x61918
-- 
2.45.2

