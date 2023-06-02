Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EFEC7EE29
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 17:55:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7262010E0C4;
	Fri,  2 Jun 2023 17:55:05 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410A110E0C4
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 17:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685728503; x=1717264503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1bhMKOl7lnChw0C0CBnaYrN+oKbbM03bPgyznvomHMg=;
 b=iPoKzi0ml1gLlCkLa4Dj6uXsLtlzvZNOfLdf1Yyz5SVU8zpz5sy/jnJI
 vr/3rNF3FPBVjw9WDbKm855IwvTysVTgxHhg04BBJx2Uxsu6/IWP5cEhf
 Y5RA2SvQ+rp4FEZ9KFApmO2sa/KOdfaq0q+RjG1Mpdy2qYgDka4a/SoS+
 FoYQ3tQxVjcC7KMvp7CcRFDxU53D1vZhSGY4et7dVVYov7iVMzMPKTLFc
 hfV8oLnleg8VRnE0OWoMraohgoS7P+85ZLMmDPCuNw9kokk2X7pqFRe62
 9Dgkgk0VXPNZLlE4Oz0Z7xoSRYagooibA3PzUtbpuo7s5PJB2/BP1tn0I g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="335543414"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="335543414"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 10:55:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="740897766"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="740897766"
Received: from jwerner6-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.111])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 10:55:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  2 Jun 2023 20:54:42 +0300
Message-Id: <20230602175444.3511273-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230602175444.3511273-1-jani.nikula@intel.com>
References: <20230602175444.3511273-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/4] drm/i915: Flush power delayed put when
 connector init failed
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
Cc: Jani Nikula <jani.nikula@intel.com>, Imre Deak <imre.deak@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

When intel_dp_init_connector fails, some power wells used in dp aux
communication may not be completely disabled yet. This may result in a
null pointer dereference when icl_aux_pw_to_phy() is called from
icl_combo_phy_aux_power_well_disable() after the encoder and connector
are already freed.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Acked-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20221222201804.1380963-1-maarten.lankhorst@linux.intel.com
(cherry picked from commit f917130f19fe62c6688cc95ebebfafee3e005958)
---
 drivers/gpu/drm/i915/display/intel_dp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index eae92bb7f614..275f468b2364 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5627,6 +5627,7 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
 	return true;
 
 fail:
+	intel_display_power_flush_work(dev_priv);
 	drm_connector_cleanup(connector);
 
 	return false;
-- 
2.39.2

