Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC75CC7EE43
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 17:09:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61F110E4AD;
	Wed, 23 Aug 2023 17:09:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C80510E481;
 Wed, 23 Aug 2023 17:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692810560; x=1724346560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8r+l1glz0OnfkTv72zgXHZ7wvIeGE7jqLsgzs1sXck8=;
 b=LOKAMDVbUcJhy4wb+P+tqf9tRSlaI1N++YPWXeX1eo9ND83Zb7VhXAYx
 /6i4uIkQRGLEW0wdoAgp1jpRApgpcPaAlhnUvgjW+4aj2c/Un/+bnvq5D
 4JNqDHr20DjdH9QsiE8Dv/g/xGlIKa7j3dXg5/8VjYp18j07oLtO86kX1
 S+xqBjRjeySObfUsUg885Iz//Z4Bi02sc7ESuIBaXAPNFFbK+Ke5KwSlJ
 b/0026shikOts/RgCAm0WVCW+IiygysliMLv/Y84Z+rkKZm+r13kHsbjU
 LPGWEtOBpT7gf/5SC+gZfsI4jQOp8dAqiaI+vMNTpyder65VN0KMCEgMQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="438147491"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="438147491"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 10:09:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="802204833"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="802204833"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 10:09:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Date: Wed, 23 Aug 2023 10:07:21 -0700
Message-Id: <20230823170740.1180212-24-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230823170740.1180212-1-lucas.demarchi@intel.com>
References: <20230823170740.1180212-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 23/42] drm/i915/xe2lpd: FBC is now supported on
 all pipes
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

FBC is no longer limited by pipe.

Bspec: 68881, 68904
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.h b/drivers/gpu/drm/i915/display/intel_fbc.h
index 4adb98afe6ff..6720ec8ee8a2 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.h
+++ b/drivers/gpu/drm/i915/display/intel_fbc.h
@@ -20,6 +20,8 @@ struct intel_plane_state;
 enum intel_fbc_id {
 	INTEL_FBC_A,
 	INTEL_FBC_B,
+	INTEL_FBC_C,
+	INTEL_FBC_D,
 
 	I915_MAX_FBCS,
 };
-- 
2.40.1

