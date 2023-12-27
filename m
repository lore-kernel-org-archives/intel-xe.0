Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65046C47072
	for <intel-xe@archiver.kernel.org>; Wed, 27 Dec 2023 23:59:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C4410E240;
	Wed, 27 Dec 2023 23:59:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72A210E181
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Dec 2023 23:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703721550; x=1735257550;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=X9ZPHmc/oq0dlcxm63JnzvQJE1SauMhe9SO7srj5Quo=;
 b=mL/wtmN0GeCpT3A7gUv20BPGW61zLjRYMYEOxRxBGJAsdral02GoEjdP
 d/9ntHP40qaGQXGPyEtQ1g0e7rhOFTIVq8p368+xB0ySWhK7qsLmf0z4C
 OgIoGRoj7+yiPiCD8gIJWcoOJrbS5FzlgfqYspkx8gK2+9zvTLUmSlmA6
 Y265vlcuuY6Vqi0+itR55EvMstLLmz11MzVA0XyU8G5PYTqk5E8ejPuYW
 CmConTbNnqnubwYE87kAABLMFfQYGh/cpG5CACMTelRna2EzTFkbyi9QG
 A0ThEwMqY7G8uA1DqiWfiP+90ZBnWQSufAz8kP5mjrd+djef/MTCQ0RgB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="3329153"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="3329153"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 15:59:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="754589878"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="754589878"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.132.129])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 15:59:08 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 05/10] drm/xe/guc: Update few GuC CTB ABI definitions
Date: Thu, 28 Dec 2023 00:58:33 +0100
Message-Id: <20231227235838.212-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231227235838.212-1-michal.wajdeczko@intel.com>
References: <20231227235838.212-1-michal.wajdeczko@intel.com>
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

In upcoming new GuC ABI definitions we will want to refer to max
number of dwords that could fit into CTB HXG message. Add explicit
definition named as GUC_CTB_MAX_DWORDS and start using it.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
index 3b83f907ece4..4aaed1cb4e12 100644
--- a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
@@ -81,12 +81,13 @@ static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
 
 #define GUC_CTB_HDR_LEN				1u
 #define GUC_CTB_MSG_MIN_LEN			GUC_CTB_HDR_LEN
-#define GUC_CTB_MSG_MAX_LEN			256u
+#define GUC_CTB_MSG_MAX_LEN			(GUC_CTB_MSG_MIN_LEN + GUC_CTB_MAX_DWORDS)
 #define GUC_CTB_MSG_0_FENCE			(0xffff << 16)
 #define GUC_CTB_MSG_0_FORMAT			(0xf << 12)
 #define   GUC_CTB_FORMAT_HXG			0u
 #define GUC_CTB_MSG_0_RESERVED			(0xf << 8)
 #define GUC_CTB_MSG_0_NUM_DWORDS		(0xff << 0)
+#define   GUC_CTB_MAX_DWORDS			255
 
 /**
  * DOC: CTB HXG Message
-- 
2.25.1

