Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99CCE7F156
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 10:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B534310E113;
	Fri, 29 Sep 2023 10:51:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6976D10E110
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 10:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695984668; x=1727520668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uRPUrm+2r7hwv8Bog7ZppL/h8o5TsxAZTp10zH5MqHc=;
 b=n/5+KEIRIkx0DI2NygJ8VcWpbNa4niilln1PRoePJMqTzG/FrsOa81d2
 PdKul4sxJXdx3QTgJP1NrfyGSPyEP82FJWGPIQRd0hoCE3AC8v2wBWQ1U
 kFDgzTyc4ELC2B2nS01Ba8ma0yMFkwzZKPNgO61rQPqsX498J7cfYGg65
 CcTEIFDDaJX0tu05iyexeNT8OkoWf9mjTuAgKwwNNjxOwzgWSgoI6e7aE
 pslTxW2JtJRLFDuoIQmI1+bbJt5Jeco8lJk3WENUq+fqMnveots1/66+N
 STMKI0iyWYlCiEu3O5DoMOlB2PNvuxGvttKng5kybEXLsxMCcsCcnTuxj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="386138624"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="386138624"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 03:51:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="699609189"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="699609189"
Received: from hkatter-mobl2.amr.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.249.33.4])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 03:51:06 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 29 Sep 2023 13:50:29 +0300
Message-Id: <20230929105030.1132290-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929105030.1132290-1-jouni.hogander@intel.com>
References: <20230929105030.1132290-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] Revert "drm/i915: Ignore set frontbuffer
 return value on release"
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

This reverts commit 93f635ae20cce2b9ee9b647ef986615552ae28d1.

Next patch is backporting equivalent patch from upstream -> revert
this one.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index e6fb777dc374..21fb5660d977 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -232,7 +232,8 @@ static void frontbuffer_release(struct kref *ref)
 	drm_WARN_ON(&intel_bo_to_i915(obj)->drm, atomic_read(&front->bits));
 
 	i915_ggtt_clear_scanout(obj);
-	(void) i915_gem_object_set_frontbuffer(obj, NULL);
+
+	i915_gem_object_set_frontbuffer(obj, NULL);
 	spin_unlock(&intel_bo_to_i915(obj)->display.fb_tracking.lock);
 
 	i915_active_fini(&front->write);
-- 
2.34.1

