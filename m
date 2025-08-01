Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304EFC87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 18:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACAE10E8E8;
	Fri,  1 Aug 2025 18:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AeLc1QDN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1831010E8E8
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 18:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754072047; x=1785608047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HsZBBo1/wB/TuYZGPyhQMm0uypIzKhur8wNRypq9zYA=;
 b=AeLc1QDNtuKls/S76VmM9CWq9vIIMpvQvexbLRGUbkGoy9b6E138MFSt
 Cih1SF0thQPTrLPKorQukQ1018nLIPnDyg2MZdaT8fkVdpN3e/pKb5oo7
 a6y2PqT76uLrMov8EJoADZeRzMLnSdajhtc5hVJgmwDjMYPkUKoUF5WD1
 TqTuNOx8ZI4THtdmt1rRn7MS9sbk5d+JjU6L5NFEVCA5qQ/s6EROAvfcF
 e1ZVX89JbhmJYdVt4SGt1s5quwjb9JLcqJnmA/5vO6/4VK86QV89LzV+i
 wo9l5Gv2sKPY3geQROwo7fZZMgB9W+qlz+VcMsELKceGRLP8Zx4XLvURU w==;
X-CSE-ConnectionGUID: uDBcu/e/QE+sS2js/AB+7A==
X-CSE-MsgGUID: j0sytP1YQbmoQBbJqibUpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56315579"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56315579"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 11:14:07 -0700
X-CSE-ConnectionGUID: zgUWckLmRvOOKsal4wG7Dg==
X-CSE-MsgGUID: 42pHQ8s2QKGDFC/ap5lV0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163553820"
Received: from mkolod1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.39])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 11:14:06 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 5/6] drm/xe/kunit: Use default GMDID version if none provided
Date: Fri,  1 Aug 2025 20:13:49 +0200
Message-ID: <20250801181350.180780-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801181350.180780-1-michal.wajdeczko@intel.com>
References: <20250801181350.180780-1-michal.wajdeczko@intel.com>
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

For pre-GMDID platforms it is sufficient to provide platform enum
or platform/subplatform enum pair to get full fake Xe device for use
in KUnit tests. But if we specify GMDID platform without providing
explicit verx100 values, we might get incomplete device test object
that lacks any GTs.

To relax tests from specifying full device config, use some default
(or first available or defined) GMDID version if none was provided.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index e78d10df8359..90c55f72d687 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -262,10 +262,10 @@ static void fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
 	struct xe_pci_fake_data *data = test->priv;
 
 	if (type == GMDID_MEDIA) {
-		*ver = data->media_verx100;
+		*ver = data->media_verx100 ?: media_ips[0].verx100;
 		*revid = xe_step_to_gmdid(data->step.media);
 	} else {
-		*ver = data->graphics_verx100;
+		*ver = data->graphics_verx100 ?: graphics_ips[0].verx100;
 		*revid = xe_step_to_gmdid(data->step.graphics);
 	}
 }
-- 
2.47.1

