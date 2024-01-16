Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BD9C47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 14:56:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D5E10E59D;
	Tue, 16 Jan 2024 14:56:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A213C10E538
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 14:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705416992; x=1736952992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Uie57BAjh3G8nlgcviwXdvxs2ZnDY3B6y5RNJ9F9tLM=;
 b=KL0bjNwJQAbpYOg5QZ+qQksNtR1tYuc2duBVK74w3+lwLNznRopuJqBF
 +sE2aVm5OVa/lxLRFiTUS0Q9CflayUY9PMsrc0NVIs6pRbvCC0oxtH3DL
 AwUsBFYlYmThxqtRqZUFqTnadmKO9CZmkrKpn9MJ5Cvf7ZEa060xF+7dd
 /DIXvUwiAjY4SgsyJ1skjjiz+KcxE7F3JJ91HWx7VuF/xnqbVWvCg6t4+
 PLypV/cKm1sxl7BfdbS9DltJUmmaj7/b5WMuduOhnEotweZbxT6SqjaRP
 wiuE2Xs0beVynemKsKClzLq5IVDsihneWFxkporpHRjsSawYKjE3aBumq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="466262450"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="466262450"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 06:56:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="854374884"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="854374884"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.50.177])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 06:56:31 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/6] drm/xe: Mark VF accessible global registers
Date: Tue, 16 Jan 2024 15:56:15 +0100
Message-Id: <20240116145617.1177-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240116145617.1177-1-michal.wajdeczko@intel.com>
References: <20240116145617.1177-1-michal.wajdeczko@intel.com>
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

Only selected registers are available for Virtual Functions.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 2c214bb9b671..722fb6dbb72e 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -57,7 +57,7 @@
 #define   DG1_MSTR_IRQ				REG_BIT(31)
 #define   DG1_MSTR_TILE(t)			REG_BIT(t)
 
-#define GFX_MSTR_IRQ				XE_REG(0x190010)
+#define GFX_MSTR_IRQ				XE_REG(0x190010, XE_REG_OPTION_VF)
 #define   MASTER_IRQ				REG_BIT(31)
 #define   GU_MISC_IRQ				REG_BIT(29)
 #define   DISPLAY_IRQ				REG_BIT(16)
-- 
2.25.1

