Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96650C0032E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 17:29:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6954510E6C0;
	Wed, 25 Oct 2023 17:29:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A0410E6C0
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 17:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698254959; x=1729790959;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pMdOPUdp/jWlF1JDYLblR+qJUabNFI5AEAb7WBqkwiE=;
 b=e3jnpVn47qYe6kqcCHj8BuvZ2kRgzk8mc0bU1jGbCNQty7NX8Mr3l2fi
 r8rfQXflkVPf1Gyf9I+14tghkP+x7Fu9Q8+8zq481rmrMwCAMsLrPcOA8
 27Bs9SAyjF0sMkWUGqx/kuu+vbeSXYulRDNOXBfnNpfuJjE3On5Z48mbN
 IdXvmC0ix+3O236OUkCQZpGiwRQb2gRxMNK3cisYS2UflXRJIseyOzCTq
 5M7XnpOa+2TEcnO2ScE/cXxVw5kANmOfN0dO82D/nh6vGxEsHus7dpuj9
 ILRDEtvL9VsESu6AumyoX/Ht4mepZWy5xuYw0O8mN+HSaW0vXzICq2vLO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="391230463"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="391230463"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 10:28:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="932432722"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="932432722"
Received: from dtorrice-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.33.83])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 10:28:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 20:28:36 +0300
Message-Id: <20231025172836.770398-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025172836.770398-1-jani.nikula@intel.com>
References: <20231025172836.770398-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/i915: Abstract display info away during
 probe
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
Cc: Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

The goal is to have this function ready for Xe to use
directly. So, let's use the available macro.

Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230929205023.1202735-1-rodrigo.vivi@intel.com
(cherry picked from commit 4c7690614c8bbd6cd29b949f9084ddb294ffe284)
---
 drivers/gpu/drm/i915/display/intel_display_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index a6a18eae7ae8..ce55b968e658 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -926,7 +926,7 @@ void intel_display_device_probe(struct drm_i915_private *i915)
 	else
 		info = probe_display(i915);
 
-	i915->display.info.__device_info = info;
+	DISPLAY_INFO(i915) = info;
 
 	memcpy(DISPLAY_RUNTIME_INFO(i915),
 	       &DISPLAY_INFO(i915)->__runtime_defaults,
-- 
2.39.2

