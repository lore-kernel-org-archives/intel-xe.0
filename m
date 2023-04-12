Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A622C77B6F
	for <intel-xe@archiver.kernel.org>; Wed, 12 Apr 2023 14:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B9410E82A;
	Wed, 12 Apr 2023 14:25:58 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B9D10E82A
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Apr 2023 14:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681309555; x=1712845555;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XWsjawVkiHCg/zLl0H1olcv/5d2wsvEs0ZTnzDhizhI=;
 b=LP+CKdqZWbFA+xhdXd0NW+wqRUKDqk1FlLhQeNWK+5y9BG7oc3FYX1Al
 qF+JI6+B8woEmktcIeVqErnd+XzFV5PAnNB4sUzZyDIUIXgVyJDVzONvt
 bsvfGA7IU9JPV6qZ/1KowcvAD4BZ07eKG6bX71Q4DB/1WVFZ9lF7sLB+B
 19U0vgGp+EZbBVrVTUravog2DTxLfHpZupuMlzjIgNPqo9xnDpRz9ONXH
 EwTqucPr7r2bxo7CjNQ7+9xlU95uJYfpo4M9kZVuuGSjTJbzbrRvdSMg7
 1qG9e2ewXQvnFaQ5589UvN7fYK2+nbX7Pysv99YHPYS7vThlLguxWu3cS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="342667731"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="342667731"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:25:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="800358237"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="800358237"
Received: from smoticic-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.45.172])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:25:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Apr 2023 17:19:50 +0300
Message-Id: <20230412142006.877109-26-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412142006.877109-1-jani.nikula@intel.com>
References: <20230412142006.877109-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 25/41] fixup! drm/xe/display: Implement display
 support
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add a couple of members to allow !I915 build.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index b6d4a6b9b060..a16909c79c8a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -309,6 +309,12 @@ struct xe_device {
 	bool display_irqs_enabled;
 	u32 enabled_irq_mask;
 
+	/* only to allow build, not used functionally */
+	struct {
+		unsigned int hpll_freq;
+		unsigned int czclk_freq;
+	};
+
 	struct {
 		/* Backlight: XXX: needs to be set to -1 */
 		s32 invert_brightness;
-- 
2.39.2

