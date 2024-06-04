Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F273C25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 11:17:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0366910E45C;
	Tue,  4 Jun 2024 11:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vn3Z0B/t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D3E10E45B
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 11:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717499839; x=1749035839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YLiEAGAnJIhHN1ckhDbKnlBMBoSSaOyp/VvJNSQ5Fe0=;
 b=Vn3Z0B/t1XmB8T0+opjTudNrPyz2EmNzoPEd68ROey0fpRw+VJdVaOFz
 Que4FPASR5SbtiVzUVOf1sN3V23dbTWZbXvqYCXp4tJ5S/J1zlERH/AYq
 55ZPZmIfhZwifNhq0P9d2vm16VGlmfMT3Mp/GLcsTqtX9BRg13TjgWCun
 h/x457AXU6EreksKqTrIFq0uI0oWPIklZI7q3vss5ozLSIWmqxxPxJNBL
 hNbj6XHx+vw2YfRVHR92/Q/cg08tXubJ4JsNzqfyfIKsLyYwuonAaXUH/
 4/gwwqU1iNtKDCOVnhWhyzuIkNiO+7QEBDDfDNee+JAMRLXXd2w7tDvdS A==;
X-CSE-ConnectionGUID: SRVmDpDUSf+ItWjnRrxy8w==
X-CSE-MsgGUID: fmX69u9qSbGZ6mwoF4X/YA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="24701845"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="24701845"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 04:17:19 -0700
X-CSE-ConnectionGUID: dkvpndTZQKak27OadQh2hQ==
X-CSE-MsgGUID: VCo0J6mQR46n7bAT36VSbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="37669662"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 04:17:18 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH 1/9] drm/xe/display: Always call xe_force_wake_put/get in pairs
Date: Tue,  4 Jun 2024 13:02:17 +0200
Message-ID: <20240604110225.29495-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240604110225.29495-1-nirmoy.das@intel.com>
References: <20240604110225.29495-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

xe_force_wake_get() increments the domain ref regardless of success or
failure so call xe_force_wake_put() even on failure to keep ref count
accurate.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index 14b8b4278317..6cd82ef495c2 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -56,8 +56,8 @@ bool intel_hdcp_gsc_check_status(struct xe_device *xe)
 	if (!xe_gsc_proxy_init_done(&gt->uc.gsc))
 		ret = false;
 
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
 out:
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
 	xe_pm_runtime_put(xe);
 	return ret;
 }
-- 
2.42.0

