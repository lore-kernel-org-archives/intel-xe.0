Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473EA606A31B
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 09:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Npm6OYXp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029F210E9F7;
	Tue, 20 Oct 2026 09:07:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E10910E9F7;
 Tue, 20 Oct 2026 09:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792487260; x=1824023260;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PO0GlusGXL5CI1MSIhNZHzKt/s/xkajr/76jvOlH9L0=;
 b=Npm6OYXpH6/CTKHY9AUEBb3GT2dvcRzyRV8ogPTHbLJMXRp3c3KyMTXe
 mSWc+gwBh1bx3MnbPFsh/kKFWFnP6dg4ewm6bUqFp6wcEXEfYMr8sfykf
 Rjfo8BIRjYaF+ma6ZNRWfNjnabETK2+lSb4mxc1lWbDEiKSuk7YSypK/z
 SfkoLV+aW6nGRuhdgQa8uM9zGwjnZJpSS/Xf4qyhnXFurj9PxunUf663K
 IOHqHg4fa28eEzktnV6ZJurqrlLwVD/cFo0pIy7HBdEaBL/TqeQxFpfsI
 w5N05/CKSZZH4Qp4o1ELVdpoK3sE3b0VzssGHBmqSLcHDSBa7tV3XxMGE Q==;
X-CSE-ConnectionGUID: eNfZhTi8QnayqhtY8x2l1w==
X-CSE-MsgGUID: Bbp+MZBnRvu+HWuejjFhSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1196514"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1196514"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 02:07:39 -0700
X-CSE-ConnectionGUID: 4iN9ZXBuTHSlYocendipMA==
X-CSE-MsgGUID: x9IXRYvCRMeG2vp4wjqqDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2729106"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.121])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 02:07:37 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH v5 1/2] drm/i915/display: move the SNB FBC workaround comment
Date: Tue, 20 Oct 2026 12:05:49 +0300
Message-ID: <20261020090723.803321-2-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020090723.803321-1-luciano.coelho@intel.com>
References: <20261020090723.803321-1-luciano.coelho@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Sandy Bridge FBC workaround comment is still above the PCH
clock gating call in gen6_init_clock_gating().  The registers it
describes are programmed in intel_display_gen6_init_clock_gating()
instead.

Move the comment next to those writes.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 .../gpu/drm/i915/display/intel_display_clock_gating.c | 11 +++++++++++
 drivers/gpu/drm/i915/intel_clock_gating.c             | 11 -----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
index ef1ee72494df..7961c0f10bb5 100644
--- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
+++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
@@ -237,6 +237,17 @@ static void intel_display_gen6_init_clock_gating(struct intel_display *display)
 	intel_de_write(display, ILK_DSPCLK_GATE_D, dspclk_gate);
 	intel_de_rmw(display, ILK_DISPLAY_CHICKEN2, 0, ILK_ELPIN_409_SELECT);
 
+	/*
+	 * According to the spec the following bits should be
+	 * set in order to enable memory self-refresh and fbc:
+	 * The bit21 and bit22 of 0x42000
+	 * The bit21 and bit22 of 0x42004
+	 * The bit5 and bit7 of 0x42020
+	 * The bit14 of 0x70180
+	 * The bit14 of 0x71180
+	 *
+	 * WaFbcAsynchFlipDisableFbcQueue:snb
+	 */
 	intel_de_write(display, ILK_DISPLAY_CHICKEN1,
 		       intel_de_read(display, ILK_DISPLAY_CHICKEN1) |
 		       ILK_FBCQ_DIS | ILK_PABSTRETCH_DIS);
diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
index c5c4441f3a61..6faf29c8d887 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.c
+++ b/drivers/gpu/drm/i915/intel_clock_gating.c
@@ -114,17 +114,6 @@ static void gen6_init_clock_gating(struct drm_i915_private *i915)
 			   GEN6_RCPBUNIT_CLOCK_GATE_DISABLE |
 			   GEN6_RCCUNIT_CLOCK_GATE_DISABLE);
 
-	/*
-	 * According to the spec the following bits should be
-	 * set in order to enable memory self-refresh and fbc:
-	 * The bit21 and bit22 of 0x42000
-	 * The bit21 and bit22 of 0x42004
-	 * The bit5 and bit7 of 0x42020
-	 * The bit14 of 0x70180
-	 * The bit14 of 0x71180
-	 *
-	 * WaFbcAsynchFlipDisableFbcQueue:snb
-	 */
 	intel_pch_init_clock_gating(i915->display);
 
 	gen6_check_mch_setup(i915);
-- 
2.53.0

