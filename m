Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EB9C83F09
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 19:30:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD14A10E77E;
	Wed,  2 Jul 2025 19:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XsFGp9vB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C102F10E77E
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 19:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751484642; x=1783020642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2bEfFrK6Dc5QFNNeFbUhl/Y81879OXdd+wHDx2/cj2M=;
 b=XsFGp9vByEBtkE7Ri6bbYiuSEnNotnaXvfqiUXZrv6MtlQcty2GnaMVc
 /AbDRlyQ78rQCkGJI6P7Xaqr4gkqlhJo5AlaGFOC4G6qBCIujeRwy5Q4n
 bGTWzddxnHN04q2+iyJzzPYHdR5pb2YucZs6yzub6WGlECJWfdDBERoNr
 MTrfXJVHPb1UrmBgjTX/L3bCQdPwXF1r7hXCRnFBizLzC+3m/Mzg3ngb0
 IXyg5o4DP9L2OTZJNwlCgKoHBqGz6BXCFcwtJwHbZiOIzacMDvZldU0LF
 DpxvNWbowZzgiOnExRWOlMlKzfTa+4B0iMxVy2HPVFBTEj3/UlFNVz2QU w==;
X-CSE-ConnectionGUID: 45XL0kXfQbO4nEj6lg4uFQ==
X-CSE-MsgGUID: VRxf/BlMQD6DMui8hW9wlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64039100"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="64039100"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:30:41 -0700
X-CSE-ConnectionGUID: vsOQTl17TYeetAZoys/uLw==
X-CSE-MsgGUID: z5MXeu/NT6u42fFxIEpn2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="153615531"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:30:42 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org,
	rodrigo.vivi@intel.com
Cc: matthew.d.roper@intel.com, lucas.demarchi@intel.com,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v5 5/6] drm/xe: extend Wa_15015404425 to apply to PTL
Date: Wed,  2 Jul 2025 12:30:35 -0700
Message-ID: <20250702193036.1417416-6-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702193036.1417416-1-matthew.s.atwood@intel.com>
References: <20250702193036.1417416-1-matthew.s.atwood@intel.com>
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

Wa_15015404425 needs to be applied to PTL A0 to B0, a subsequent patch
will address the complexity required to do this. For now apply to PTL as
a whole.

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_device_wa_oob.rules | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
index b7d12ea4d65c..3a0c4ccc4224 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -1 +1,2 @@
 15015404425     PLATFORM(LUNARLAKE)
+		PLATFORM(PANTHERLAKE)
-- 
2.49.0

