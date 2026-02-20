Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A028C53217
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 05:02:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47FE110E78A;
	Fri, 20 Feb 2026 05:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O+kBwpOj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0ED10E784;
 Fri, 20 Feb 2026 05:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771563750; x=1803099750;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yb8j/+2jrPye5oLwJMI1JvZWpy3lbDZGIiCv7JMG+kQ=;
 b=O+kBwpOj+h/LmAGd7PbnYJB1PXlp09TZveb0k3ENmiJCKgbzKLnPMn5G
 kxsdqYEUK4aGz3IYdPIu5a8OKvdvBwhQRZg21rE53epL264p5X55N6gkq
 b9dJ4djNJeDe1PQTfcmxfp0tmhgr9CokZLMuqbRkyW6M1yo9I3u/9/pnl
 yRbm8BfZ8a9mmU3xt5VTNtkL1aQjs8OIhvR5uLRa+6/stjHt/r4BTDpnA
 2wzF0g88bkSkms1YEyXXi5Y8d6+1hDtRM2vAiBkQQD8vST/C3h2OvOhM0
 5bNGjj6Cx1scsj3zCMcrNExR6TrID7J6qpPFwBkjufXH0WzePLv5PqPdZ w==;
X-CSE-ConnectionGUID: sg/85kWlQrKvMce49Zr1mQ==
X-CSE-MsgGUID: iysC81VnTxO/O1RQ/k/nCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72758228"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="72758228"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 21:02:29 -0800
X-CSE-ConnectionGUID: yr2isZG4QG2tzBCn/mfLdQ==
X-CSE-MsgGUID: m0IcKIW3Qt2YZpCzkdXORQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="218894633"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa003.jf.intel.com with ESMTP; 19 Feb 2026 21:02:28 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 2/8] drm/i915/backlight: Use intel_panel variable instead of
 intel_connector
Date: Fri, 20 Feb 2026 10:32:11 +0530
Message-Id: <20260220050217.2453681-3-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260220050217.2453681-1-suraj.kandpal@intel.com>
References: <20260220050217.2453681-1-suraj.kandpal@intel.com>
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

Use the intel_panel variable since it has already been declared and
looks cleaner.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index c40ce310ad97..05d6d033f60b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -459,7 +459,7 @@ static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector, en
 		return val / 1000;
 	}
 
-	return connector->panel.backlight.level;
+	return panel->backlight.level;
 }
 
 static void
-- 
2.34.1

