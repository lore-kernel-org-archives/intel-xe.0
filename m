Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7135C982C7
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 09:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5B110E8FB;
	Wed, 16 Sep 2026 09:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ng3gG1pm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C7310E803;
 Wed, 16 Sep 2026 09:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789549812; x=1821085812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jxr10S0g/4wHZjAtLOqgHuixkMkBsqlMAQQ2K7NheoE=;
 b=ng3gG1pmNWw9gdLS9B0N5IUc8NzuJsc16v5FL7T1GuJpWnXxhBqW2xhA
 8iA5QiaNNuVOWPlmfociCewCP+m2GBijhTjTko1WwptMyyr42fwAp6e6C
 /xEotLm5O9Uf/Q6/ID/hlc2qg7QS7LkD5tD+SlFZyuvtJhjstib5CLKMG
 XaNsAc8jdN/wS9QAVE+IVoBiMiXc/Qi9b77JXmdsc2Q5/0VhvzEOYP+2R
 Q4ZklQFa8bNBq2LEpxCEgokN/eIOplMnkpr3aqboUNgwbxCZ8buCvX5uP
 QCZbuPVDg3gKTRwG82EA1opCrOjTpEMlDRXALwsJN3wfIud5UNElBE6NZ Q==;
X-CSE-ConnectionGUID: fhQluKuVSo6X03xo+nY4Hg==
X-CSE-MsgGUID: JhCCOmZ1SR258ikJiNckpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88858894"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="88858894"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 02:10:09 -0700
X-CSE-ConnectionGUID: 7WLJp5c4RkW9Fd64lbMDFQ==
X-CSE-MsgGUID: tvKwwagNT7WMYQ+8ItCWDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="277030263"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa004.jf.intel.com with ESMTP; 16 Sep 2026 02:10:09 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 10/10] drm/i915/dp: Bump the max Link M/N ratio to 22 for
 DISPLAY_VER >= 35
Date: Wed, 16 Sep 2026 14:39:46 +0530
Message-Id: <20260916090946.677564-11-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916090946.677564-1-suraj.kandpal@intel.com>
References: <20260916090946.677564-1-suraj.kandpal@intel.com>
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

Starting Xe3p max M/N ratio has been increased to 22.

Bspec: 68922
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 04a492a0b369..2610c33565a6 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1269,6 +1269,9 @@ bool intel_dp_has_dsc(const struct intel_connector *connector)
 static int
 intel_dp_get_max_m_n_ratio(struct intel_display *display)
 {
+	if (DISPLAY_VER(display) >= 35)
+		return 22;
+
 	if (display->platform.dg2)
 		return 4;
 
-- 
2.34.1

