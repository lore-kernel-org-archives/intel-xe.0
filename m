Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D06C46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 07:01:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4A010E1B2;
	Mon, 18 Sep 2023 07:01:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806E510E1B0
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 07:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695020512; x=1726556512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pwaRuCLCHQWrQm27RO0m6KloYt9gfgcslAak6tFMh6U=;
 b=MxxLb/cn7L8nfBTTjQb2WhKK2RFL/wU/IqV8KNYynLOQ+98xkSuJWNom
 iP4R/J6Hf5azGKIHlJAkRrGKvSk3klnGp9sOAUWpxEzVyE+BFWeP3lt2O
 ehsSkafjnXbEij2wBCcRInXLHC8sik8bFOt+FwbQMPHhFon7gZUE/nJzg
 toE+bEgTZRuVsgUiYkKrlEOKR8vOhoRV7NsWMcqb7DuZ1XZf8gexSRY/Z
 gcJDxcsVuEnFcu3MfzVuzij3KsnuDpAOxEBpUGWn+q93O51lJGy6GXQ18
 EoTORZM1AV5javcof+/GEAS22p1to0odjLZ7BdTvheDY8VAW/1bQMcZxH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="382325254"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="382325254"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 00:01:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="695420473"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="695420473"
Received: from pjfarr-mobl2.ger.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.251.218.135])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 00:01:41 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 18 Sep 2023 10:00:59 +0300
Message-Id: <20230918070100.1387082-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918070100.1387082-1-jouni.hogander@intel.com>
References: <20230918070100.1387082-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/4] fixup! drm/xe: Introduce a new DRM driver
 for Intel GPUs
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

intel_runtime_pm is ok for Xe driver as well. Especially as this
whole struct is here just to kill some build problems.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a82f28c6a3a0..ae18097cf8ea 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -402,7 +402,7 @@ struct xe_device {
 	u32 edram_size_mb;
 
 	/* To shut up runtime pm macros.. */
-	struct xe_runtime_pm {} runtime_pm;
+	struct intel_runtime_pm {} runtime_pm;
 
 	/* For pcode */
 	struct mutex sb_lock;
-- 
2.34.1

