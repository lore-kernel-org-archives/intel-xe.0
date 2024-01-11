Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E86AC47DA2
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 15:49:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E785910E945;
	Thu, 11 Jan 2024 15:49:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737B510E945
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jan 2024 15:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704988150; x=1736524150;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yFkAQ3qimPnB8qRfvLVpG7ftBMt0CSROY2YxXhdzQpk=;
 b=agXc+worecMo4sWcmyupjUzvq7DeMSH8jDFxQPncc0Zc5SZTpqt7PN6K
 6AORS5+cIGMOp2eVD9ePA/wbJW0I52qAps34FjtDCvLYlyItqfP1ImNr4
 eUxZkh24ff7OIW2+e802cskhqnlpvmVCV2wNCH9ja2Y17n8C7hGuvpSte
 or3eLNdBhii/h3aAcuinPgONE2t9FNcaGgVmnOHZPAvSv9RfE9jfHcnsQ
 C1dFi3nw/3I5QuxR/z8fnK/5WNeV4ka5/PoaNyAwVZPONGdLcQiqPwTA1
 W2U3bVKkSULtdiVx38g7XMIBcoPwuW80aZgFW9opLZQDai2QG0L0W3aDG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="12372890"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="12372890"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 07:48:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="852990643"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; d="scan'208";a="852990643"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.150.229])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 07:48:46 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/guc: Treat non-response message after BUSY as
 unexpected
Date: Thu, 11 Jan 2024 16:48:38 +0100
Message-Id: <20240111154838.541-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Once GuC replied with GUC_HXG_TYPE_NO_RESPONSE_BUSY message then
we may expect that only RESPONSE_SUCCESS or FAILURE message will
be sent, anything else is a violation of the HXG protocol.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 6e73ebf67251..254c9d3c8c73 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -718,8 +718,12 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
 			     GUC_HXG_ORIGIN_GUC))
 			goto proto;
-		if (unlikely(ret))
+		if (unlikely(ret)) {
+			if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) !=
+			    GUC_HXG_TYPE_NO_RESPONSE_BUSY)
+				goto proto;
 			goto timeout;
+		}
 	}
 
 	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) ==

base-commit: 79184e72263e91528195db01783148435c7e4fad
-- 
2.25.1

