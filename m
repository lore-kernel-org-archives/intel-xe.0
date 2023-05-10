Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A307AC77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 15:50:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8E010E4CB;
	Wed, 10 May 2023 15:50:47 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C9610E4CB
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 15:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683733845; x=1715269845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bkoNlcXTXYS65T4m500RNLwZIA0yzJo4Ej5WrDmFKmk=;
 b=HgAgXOLf5IDMsY3Raian3cmtYeim/La+9xUuDyN84JkSzukC/rDsksuZ
 Ym5lZMZVsntzL1iYU8inc6NYvKwRGVLMdzGnvaf3qprg68W4QcW4uaRpz
 KpR4c07Gr061qvJx6PW6X8xGiOWmfVXibCJkfB4tBkEgy9U/x+VJhAC5i
 XyaADdoSKvLJd4MCoRQhD2grcN14e/pWEa/tIRvKIOQFRMNhep5zpD4Mn
 VGBg6b7GeMhUihJEQK6b+WMWGeI07NY7gHvFw0LQz6ifwSAta0OdWA9B9
 jsc/3eosF4gZMHDNZykF08gsHjdRK2EAQF7B70X9HCNcFRZQxjY8pyHkU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="415824037"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="415824037"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 08:50:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="811188249"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="811188249"
Received: from azaki-mobl.amr.corp.intel.com (HELO localhost) ([10.252.63.3])
 by fmsmga002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 08:50:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 18:46:44 +0300
Message-Id: <20230510154644.712030-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230510154644.712030-1-jani.nikula@intel.com>
References: <20230510154644.712030-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] fixup! drm/i915/display: Remaining changes
 to make xe compile
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
Cc: Jani Nikula <jani.nikula@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Currently "drm/xe: Introduce a new DRM driver for Intel GPUs" removes
these lines, so don't add them in "drm/i915/display: Remaining changes
to make xe compile" to begin with!

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_reg_defs.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
index a7c4101370ad..eac5a4141bfa 100644
--- a/drivers/gpu/drm/i915/i915_reg_defs.h
+++ b/drivers/gpu/drm/i915/i915_reg_defs.h
@@ -218,13 +218,9 @@ typedef struct {
 
 #define _MMIO(r) ((const i915_reg_t){ .reg = (r) })
 
-#ifdef I915
 typedef struct {
 	u32 reg;
 } i915_mcr_reg_t;
-#else
-#define i915_mcr_reg_t i915_reg_t
-#endif
 
 #define MCR_REG(offset)	((const i915_mcr_reg_t){ .reg = (offset) })
 
-- 
2.39.2

