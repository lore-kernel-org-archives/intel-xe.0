Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1E9C5CFEB
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 23:53:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6037D10EDE3;
	Tue, 11 Aug 2026 23:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MAVsBWtY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69D910EDD8
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 23:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786492386; x=1818028386;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=JTdSBi34fbo3MXlK8PxJShks1Ql4X+9srg5rrllB6/M=;
 b=MAVsBWtY8jK49AHwDmM0MaD5V85p6Rnyk5oV5wqM8Thccs1P46K9BMmE
 MkjOWNKx1+7AbqSx9V8bsfloHdq3ewTwaOXz5VpIlITdssh50A4KF6N1R
 TeUMQUCa5C6zCmLeOXJC/gJU13JWTrzhadp5SqAzHvDq0Ee7MJzrw+G3H
 iq39Rhya7K9J+ygyw9mF5u4gY+BSl0okq+ZNLh0x2FwPTc/YYGlDOzKZF
 ulplAbMIe4WI2dzlJ5diRIp426P7DoHSugmRxX2oT7d8G0sIZInCp5Mwp
 vbibU88gdgYw8a2QRqZOInwZNjqaJvEjZxgSHRN8wBlHpfzDsL/OzR2NY g==;
X-CSE-ConnectionGUID: TYp5rBv6S6OFs92UWIHH6A==
X-CSE-MsgGUID: K+lIM0f2QcWXO+NAV2iWkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98183268"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="98183268"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 16:53:05 -0700
X-CSE-ConnectionGUID: BX0zC67NTX2afnX0mWh7wQ==
X-CSE-MsgGUID: Dc1I1M0JSmOAypMfHPe59w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="261729332"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 16:53:05 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, mallesh.koujalagi@intel.com
Subject: [PATCH 4/4] drm/xe/ras: Report CSC errors using SIGID
Date: Tue, 11 Aug 2026 16:52:59 -0700
Message-ID: <20260811235254.153783-10-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260811235254.153783-6-umesh.nerlige.ramappa@intel.com>
References: <20260811235254.153783-6-umesh.nerlige.ramappa@intel.com>
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

Use xe_log_err() to report CSC errors using SIGID.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index d1aa3794f2e0..e50ab49bce5a 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -283,9 +283,8 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
 		 * is required.
 		 */
 		if (csc_error->hec_fw_error) {
-			xe_err(xe, "[RAS]: CSC %s detected: 0x%x\n",
-			       sev_to_str(counter->common.severity),
-			       csc_error->hec_fw_error);
+			xe_log_err(xe, SOC, 0, "[RAS]: CSC %s detected: 0x%x\n",
+				   sev_to_str(counter->common.severity), csc_error->hec_fw_error);
 			xe_survivability_mode_runtime_enable(xe);
 			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
 		}
-- 
2.51.0

