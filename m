Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90670C4453C
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 04:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5030210EC43;
	Wed, 22 Jul 2026 04:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UNjZ4kRa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838C410EC31;
 Wed, 22 Jul 2026 04:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784695797; x=1816231797;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3RLZrD1fkLY2aZyzCg9fiMKefiaKiF/zcE0aBk2t2xI=;
 b=UNjZ4kRaBtuipOAJ/xMvYb7cqi4MWDi4OSpergw5NgX36BFbzatvX/2m
 EiqU9rzh1sWapQhxARqGsVZ9uY2CXTJoO9/Lgl4xcDltaN4zZG8lE0wDT
 9Awlu1XhgKwWQL3lq1px77sLma7qgC3vjuQKbX5TbhJJwSyvfO2mYycOE
 IisL8RHAc2XElsJypzb7YvHvsntQrv88vu8cJiLNMbVr3uwhKfYH8AmoZ
 F4byulZ8UmSaqjuncnK1AzmhLkx1t4NLQoAV9teLv1uGnvY/YC4LqQ33R
 kyYi3uj2IWypDLBcqH98xEcGcmHJ+Pgui19IUoQUo2/Uq6cM89msyN0yC w==;
X-CSE-ConnectionGUID: s6DKrLkGRQyrrW2zP7Jc0A==
X-CSE-MsgGUID: CnBTAbfZRqKsDhfC9RYwYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="84298495"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="84298495"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 21:49:57 -0700
X-CSE-ConnectionGUID: c9dwHKQJSMqDAps79gXwYw==
X-CSE-MsgGUID: YOGdud7qRTaWEsBh2g+c0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="253603246"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa006.fm.intel.com with ESMTP; 21 Jul 2026 21:49:56 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v6 9/9] drm/i915/vrr: Enable cmrr
Date: Wed, 22 Jul 2026 10:09:21 +0530
Message-ID: <20260722043923.3241977-10-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260722043923.3241977-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260722043923.3241977-1-mitulkumar.ajitkumar.golani@intel.com>
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

Enable CMRR during compute config and add related state
checker for the same.

--v2:
- Everything else except enable compute to handle before this patch
(Chaitanya)

--v3:
- Remove redundant return from compute config

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 6bc3ccd62513..ed23a03b0d3d 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -302,6 +302,8 @@ intel_vrr_cmrr_compute_config(struct intel_crtc_state *crtc_state)
 	adjusted_mode->crtc_vtotal = div64_u64_rem(dividend,
 						   crtc_state->vrr.cmrr.cmrr_n,
 						   &crtc_state->vrr.cmrr.cmrr_m);
+
+	crtc_state->vrr.cmrr.enable = true;
 }
 
 static
-- 
2.48.1

