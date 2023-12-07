Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580DAC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 11:17:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2763210E884;
	Thu,  7 Dec 2023 11:17:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9189410E884
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 11:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701947852; x=1733483852;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8kmh9tfBB6w0Ox2I67sVzjVhPPPIrFWe/9OvBjy4HU4=;
 b=NNFM4la0uiM9w1q8xEGg6q50w+3jRdh7rynzukGflnGsC5IgdlbClXg5
 PNnYOOOzEZp4Bg5exj9mmLYfCBkHmoHl5bD6WsYeGTchZouAlwsTSZs1O
 68Y3KxUuXFV/XNxgdkITnj7jT6s+wHBwFiureMuXqn5utszkK92/Jr4C1
 0DqM9AAF0kfnPD+xAYsg/p1dmDm+pQSbUYyICDaIV4yvaDPcduRFO/M/7
 wGT32JUQDX8QQUfkTPXmuUOpXc7mkfXITxlHiuVNdV/o24dJdCyX7eQdY
 +nUdvZXypEGhTrfLJBqFWB2Wq3FxvatDFXLS1okuq2teGN2GWCBvV8eiv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="460704541"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="460704541"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 03:17:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="837686023"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="837686023"
Received: from rlgreyi-mobl.amr.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.46.17])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 03:17:30 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/9] fixup! drm/xe/display: Implement display support
Date: Thu,  7 Dec 2023 13:17:02 +0200
Message-Id: <20231207111706.2293105-6-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207111706.2293105-1-jouni.hogander@intel.com>
References: <20231207111706.2293105-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add emtpy compat-i915-headers/gem/i915_gem_lmem.h to get rid of ifdefs from
intel_display.c.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h
new file mode 100644
index 000000000000..710cecca972d
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h
@@ -0,0 +1 @@
+/* Empty */
-- 
2.34.1

