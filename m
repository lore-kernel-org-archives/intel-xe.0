Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8119F606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 03:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G1uYd8EF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3706F11230B;
	Thu, 22 Oct 2026 03:23:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6CF10E3C0;
 Thu, 22 Oct 2026 03:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792639391; x=1824175391;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DCrH2DG31TN7Cn9Mtsejb3Eek5M4EukZEVGhklQaV9Y=;
 b=G1uYd8EFnixWSlaiN49IR2iVlrcq90JbjeQcdBwM/zIXm5fPkeA9nHvd
 NrzXD3KZ279tgvoY3aNTC+ITIdTJV0OC6PPu3yg357qKBGvOkJkLvULl1
 y0jskN5G7NDTW6Id1CF0+CzPDgXOuwSq56FJ3tNhM6dGG4QHZCwIBzORy
 K4kgD6jpBskfanuasRVbJ73msO0/9kXvxWYjUNcS4gAE72ugvYA1groGe
 PYCyWkTNsf5UcEOUHZChzMn3sODkKxmWlY9K+uKJWnO4vphMMKhyVJQTc
 cH6F4qub7m5blwV2ettJzES/IHC86ijOoHoZTB/SsfQ1/K1p/iw3n+ARQ g==;
X-CSE-ConnectionGUID: G2SN6B/aTeetHmlR/tiZIQ==
X-CSE-MsgGUID: gs0rMv4oTBWbdemc6+x9rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1383504"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1383504"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 20:23:10 -0700
X-CSE-ConnectionGUID: 3Iw9t6rXS4a+RGZ/ECGHCQ==
X-CSE-MsgGUID: m5AOxz7JSkmjWUTpMBEARQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3197338"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa001.jf.intel.com with ESMTP; 21 Oct 2026 20:23:09 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v7 09/13] drm/i915/display: Compare bypass_m_n_ratio_limit in
 the state checker
Date: Thu, 22 Oct 2026 08:52:43 +0530
Message-Id: <20261022032247.1378809-10-suraj.kandpal@intel.com>
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

Compare bypass_m_n_ratio_limit in intel_pipe_config_compare(), so that a
mismatch between the computed and the read back state of
Wa_14021768792 is caught.
Only bypass_m_n_ratio_limit is compared, not the ratio integer and
fraction themselves. That is deliberate: both are derived from Link M
and Link N, which are compared already, so the thing worth verifying is
whether the workaround ended up being applied or not.
Unlike the rest of the M/N registers, CHICKEN_TRANS and HDMI_EMP_DATA
are not double buffered, so the flag has to be compared outside the
fastset exemption that PIPE_CONF_CHECK_M_N() has for update_m_n.
Otherwise a seamless M/N update could switch the DDA out of the
workaround on a live transcoder, with the Link M/N values only following
at the next MSA.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9e9321976a21..ecc0e5ec181a 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5523,6 +5523,8 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 		PIPE_CONF_CHECK_M_N(dp_m2_n2);
 	}
 
+	PIPE_CONF_CHECK_BOOL(dp_m_n.bypass_m_n_ratio_limit);
+
 	PIPE_CONF_CHECK_X(output_types);
 
 	PIPE_CONF_CHECK_I(framestart_delay);
-- 
2.34.1

