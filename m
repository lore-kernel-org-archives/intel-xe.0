Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB1AC47073
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 22:20:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFF510E56A;
	Thu,  4 Jan 2024 22:20:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C4610E568
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 22:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704406847; x=1735942847;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=g2KLmsBMnSX3j6Z3baa8s46R6F4AzxGhiklLc6uEQ1E=;
 b=U7xCY3VXSN9DmcippUn7WNjpe0tQR1gcE50enX176WSXUWHhw+f8Sb2Y
 Gydo0YhoRXdzbhavJwjdk2Hj1LLW3SRtrnev8cKzpZzbhiAgXZ14sJoIr
 Xlcet+7VwCsou4z8b0afXlAhv22w0jMatzUFGjqPgJPkZauQLM9MsyqwP
 yN7266fSSPfwtH0fZdcHfHAL+xTCNbcqAKQU9F2MaV9XuX9tjuvYr2nih
 cXsC/ma7zKqK75tOThJI8KgMyQh/k7U8iTfVHRHYLk+sBd4P9O0kNBgwE
 v9289kX7vxGw3Bv7WJeJZvEx3aTJeWdmWFtQIufoTsL+xD3ab1+wY3M5D w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="428546867"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="428546867"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 14:20:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="784022805"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="784022805"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.149.125])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 14:20:46 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 05/10] drm/xe/guc: Update few GuC CTB ABI definitions
Date: Thu,  4 Jan 2024 23:20:26 +0100
Message-Id: <20240104222031.277-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240104222031.277-1-michal.wajdeczko@intel.com>
References: <20240104222031.277-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
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

