Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348E2C7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 20:35:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A7D10EA62;
	Wed,  5 Apr 2023 20:35:38 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D502410EA3E
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 20:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680726935; x=1712262935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PJ8a9gI37L/xtX4wTl1U7wi0wzpB6KG8bYMlD80XDyY=;
 b=GxiRg9e3UaGMnYr0oWdD3S1uaQf8KzRIMg/jC9UCe7KANTggL86YmADR
 1wQEBYdoX3+31EZyILG5qslX8kZmK4aFfEj2NEi/pTb3vQn/5r9nbwDO0
 xUXJgRRwk5Sui/Au79Slo3+5fT75OXNZPxTsyhhca6H4IMdAQgrsLFKy8
 IIZIBOBaFbjX5SCIUNAunMlYbt/eCEsnPxFSuabOXQRXudW6mBPHy9Vss
 Fi4w3OAr0EeHNq1cKYWLPKbOJhtmGRVtj4v6HlbCHCzqaCLH/G+Fwf+FC
 Jq6fBzr4lvE5Qsw//4Hwx8l6MvuU7rIqyZODqguNKkxVtfEhjG94OOe1P Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322210732"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="322210732"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 13:35:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="719445973"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="719445973"
Received: from anushasr-simics.jf.intel.com ([10.165.21.205])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 13:35:34 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Apr 2023 13:35:33 -0700
Message-Id: <20230405203533.2182217-2-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230405203533.2182217-1-anusha.srivatsa@intel.com>
References: <20230405203533.2182217-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: GuC and HuC loading Support for RKL
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Rocketlake uses TGL guC and HuC

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index cd3cbc8981a2..7a682dd85796 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -106,11 +106,13 @@ struct fw_blobs_by_type {
 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))		\
 	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 5))		\
 	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 5))		\
+	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 5))		\
 	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)				\
 	fw_def(ALDERLAKE_S,	no_ver(i915,	huc,	tgl))			\
 	fw_def(DG1,		no_ver(i915,	huc,	dg1))			\
+	fw_def(ROCKETLAKE,	no_ver(i915,	huc,	tgl))			\
 	fw_def(TIGERLAKE,	no_ver(i915,	huc,	tgl))
 
 #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
-- 
2.25.1

