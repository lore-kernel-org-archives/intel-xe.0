Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC4A606A31B
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 03:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y6Vs3bQz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B809B10E37F;
	Thu, 22 Oct 2026 03:23:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723ED10E3CF;
 Thu, 22 Oct 2026 03:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792639392; x=1824175392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H5vJ5PeANaMrDnCNMv6tLOO/D9A0+tI3oK+Df/e3h3c=;
 b=Y6Vs3bQzEvP/nFOTa+UmBHOXLOI+7LQ9ZuZI+ctYmCw2eUA9awNRJ7qN
 QZDDIUNPs+J6m9hCHlw+mRw93ev30eAe1wMbQgQM/+rTCs64hG2NX8/M1
 x0GbZo8wxI1MhRm8ZlDvnz0KYc07WmITZxi+z5TbnJPjUyrSMHP+tyrGd
 2pCaNtECVI7UJnksu2RC278CnstpWxqRVIYS+mp0NZazXYukJvfZ1ye+E
 mWr+ZrbsFIwlAsKysw2IWq0hpmxvhk8Fo29IYRaKvHx/NNHF763gHpG4z
 m0ktqVd1zeh8RGK41Ve8wLIPXZjUDJmDjIRF+LQAc5/74vXHwY1FnW7b5 g==;
X-CSE-ConnectionGUID: CduqWyR3Rxis4BI2Xc4dEQ==
X-CSE-MsgGUID: ovwyVUXKQ0u8xOzD4/REvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1383506"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1383506"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 20:23:11 -0700
X-CSE-ConnectionGUID: +w0bs837RFKFzt7Op/PoBw==
X-CSE-MsgGUID: Jity/kb3RlyVO9ygmh5vMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3197347"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa001.jf.intel.com with ESMTP; 21 Oct 2026 20:23:10 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v7 10/13] drm/i915/display: Dump bypass_m_n_ratio_limit in the
 crtc state dump
Date: Thu, 22 Oct 2026 08:52:44 +0530
Message-Id: <20261022032247.1378809-11-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022032247.1378809-1-suraj.kandpal@intel.com>
References: <20261022032247.1378809-1-suraj.kandpal@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dump whether the Link M/N ratio limit is bypassed with Wa_14021768792
along with the rest of the M/N values in the crtc state dump.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc_state_dump.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 92675a88b969..c51b21222dc6 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -36,10 +36,12 @@ intel_dump_m_n_config(struct drm_printer *p,
 		      const char *id, unsigned int lane_count,
 		      const struct intel_link_m_n *m_n)
 {
-	drm_printf(p, "%s: lanes: %i; data_m: %u, data_n: %u, link_m: %u, link_n: %u, tu: %u\n",
+	drm_printf(p,
+		   "%s: lanes: %i; data_m: %u, data_n: %u, link_m: %u, link_n: %u, tu: %u, bypass_m_n_ratio_limit: %s\n",
 		   id, lane_count,
 		   m_n->data_m, m_n->data_n,
-		   m_n->link_m, m_n->link_n, m_n->tu);
+		   m_n->link_m, m_n->link_n, m_n->tu,
+		   str_yes_no(m_n->bypass_m_n_ratio_limit));
 }
 
 static void
-- 
2.34.1

