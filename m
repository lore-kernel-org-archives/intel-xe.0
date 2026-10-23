Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4470606A319
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 05:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CBeCwIz4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83777112992;
	Fri, 23 Oct 2026 05:03:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364E9112976;
 Fri, 23 Oct 2026 05:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792731777; x=1824267777;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BUBS8lve7MD2yOvFZ06JR91F7Gt1s6CN+Id2sSOFElQ=;
 b=CBeCwIz41fVSu0p0Emn04KqqrWx9dg3rP6ee/2mj6WuOTmWDAyUepaGv
 vPEp1gBPuHFccq0E2SOZV0KmLXP4j7BgCwASdWfOBZLjigMCB79FL1S4e
 mwYVpF64f6J5QoI/cqX26gxHIN4N2DZ8TwmDDH9XfCmzvEnioVBQnhuvy
 +PQqjtJGrifbnm4jaNUypSDAzUPB5IzRQd263dhzVjrF5mHCi62g6AG1T
 ouMMbdjuorr7tZwPQUdXCbh60IZAwlbNPsitO5RShNdFXXl0wkLGm+mP7
 b6NCBsQoZa/Oiye0+qkeYyaTKfrWvS3NCV8XrnHEtRb+vxmX0DHGv8wgX Q==;
X-CSE-ConnectionGUID: 0u0xDyY3TZSuPr3YYR1+Bw==
X-CSE-MsgGUID: D9Kq86RPSeyVs/kS6YFHcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1499174"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1499174"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:02:57 -0700
X-CSE-ConnectionGUID: tFkW1LrXRnWgCbI0rxkLYg==
X-CSE-MsgGUID: dkbrCgCLTZWt6V2KYJffUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3926685"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa006.fm.intel.com with ESMTP; 22 Oct 2026 22:02:55 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v8 14/14] drm/i915/dp: Bump the max Link M/N ratio to 22 for
 DISPLAY_VER >= 35
Date: Fri, 23 Oct 2026 10:32:27 +0530
Message-Id: <20261023050227.2068466-15-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023050227.2068466-1-suraj.kandpal@intel.com>
References: <20261023050227.2068466-1-suraj.kandpal@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Starting Xe3p max M/N ratio has been increased to 22.

Bspec: 68922
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 772006691882..bf5e87a72108 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1272,6 +1272,9 @@ bool intel_dp_has_dsc(const struct intel_connector *connector)
 static int
 intel_dp_get_max_m_n_ratio(struct intel_display *display)
 {
+	if (DISPLAY_VER(display) >= 35)
+		return 22;
+
 	if (intel_display_wa(display, INTEL_DISPLAY_WA_14014191401))
 		return 4;
 
-- 
2.34.1

