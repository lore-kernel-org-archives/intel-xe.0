Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACFAEE49B0
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 11:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9E610E413;
	Wed, 23 Aug 2023 11:40:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAC810E413
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 11:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692790847; x=1724326847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wNigBzKHBO6X0nCkPGJ9U676gsBbI7Z3dLxmayTrEug=;
 b=RjkcluljYCp9fqN5v80HDdX+Alg/0muK9KwdI59jylVuOeUA0xjyHCzh
 dOcT5e6naQvuGJzsijOi8OMCZXybAaIZvYj7Bc5nA2vAnOLPP92CoGb89
 gNdXkfapOCh0XRT22/+PcV4XVNukwTsntN3faNhHfz9meIKMBmWhKwAlS
 5uWrZvXHyfW4XVPUR+UaD8QsOpOaI+/J/J9mTXURjZS68sxh1psXj4PIg
 5onvcnAxIMGSI2etdwmzW6m8MwoQOptYoOWc0wsfJoXMrWPlq63Z88tBh
 95Rmp0aeC8pmyLIm9kRZDoKlLyrpLunz5oczBCxXqCroASSf91dusPfwz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="460506106"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="460506106"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 04:40:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="910481341"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="910481341"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 04:40:44 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 23 Aug 2023 04:40:38 -0700
Message-Id: <20230823114040.31769-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20230823114040.31769-1-niranjana.vishwanathapura@intel.com>
References: <20230823114040.31769-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/3] drm/xe/pvc: Blacklist BCS_SWCTRL register
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
Cc: lucas.demarchi@intel.com, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Wa_16017236439 requires the BCS_SWCTRL to be privileged.

v2: Define and use BCS_SWCTRL()

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 2 ++
 drivers/gpu/drm/xe/xe_reg_whitelist.c    | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index d57fd855086a..1a366d8070f3 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -63,6 +63,8 @@
 #define RING_BBADDR(base)			XE_REG((base) + 0x140)
 #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
 
+#define BCS_SWCTRL(base)			XE_REG((base) + 0x200, XE_REG_OPTION_MASKED)
+
 /* Handling MOCS value in BLIT_CCTL like it was done CMD_CCTL */
 #define BLIT_CCTL(base)				XE_REG((base) + 0x204)
 #define   BLIT_CCTL_DST_MOCS_MASK		REG_GENMASK(14, 9)
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index e83781f9a516..e66ae1bdaf9c 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -50,6 +50,12 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
 				   RING_FORCE_TO_NONPRIV_DENY |
 				   RING_FORCE_TO_NONPRIV_RANGE_64))
 	},
+	{ XE_RTP_NAME("16017236439"),
+	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COPY)),
+	  XE_RTP_ACTIONS(WHITELIST(BCS_SWCTRL(0),
+				   RING_FORCE_TO_NONPRIV_DENY,
+				   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+	},
 	{}
 };
 
-- 
2.21.0.rc0.32.g243a4c7e27

