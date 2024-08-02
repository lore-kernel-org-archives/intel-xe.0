Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1E8C52D6F
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 22:21:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9E110E1F4;
	Fri,  2 Aug 2024 22:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DQognMi3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43EBE10E1F4
 for <Intel-Xe@lists.freedesktop.org>; Fri,  2 Aug 2024 22:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722637293; x=1754173293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w4DZuRwWzQvwtj8QfYpoHx9AS/0sURMK/RVjnQsQuUg=;
 b=DQognMi3cW2KeZ0728W4ThZ4poiim6I3/yDNVzjCMpES78bq6cHs+xtA
 n86zpJ2jv91LcFUfUQe25AcrVLPylV5/RD5ko4ay2/eIJSO5WAL4A5uWc
 Rb7c0pRbJMDJsXEaC0jmBsnx4x02zlu6EbVWP+8SO+bTVcFmUXGY2AhcL
 Glt4xuSvFlPQGIN1x76R6TnHo1WpU1cCpmbXAef2uLhidwUwBuvKzngtc
 At1EfSaNsOUKKKU8DNN0+8LNYxBz4L9DNFRYMGWOPd/atqWO8/fcmx+KC
 JK7S7EfIbjT4INDfUEMBLVrGZZnHfGkjT4DqSsCKtJ+OvipvbXMVhg98g g==;
X-CSE-ConnectionGUID: JnPAYPVBR7WGj9NnMRBlNg==
X-CSE-MsgGUID: C587ajIsSkex25T61+lM6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20808504"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; d="scan'208";a="20808504"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 15:21:32 -0700
X-CSE-ConnectionGUID: 0vy7AWzdTO+dJ21lk5vCfg==
X-CSE-MsgGUID: Ziw8gVboSeuBIuAiRHX+KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; d="scan'208";a="60385239"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa005.jf.intel.com with ESMTP; 02 Aug 2024 15:21:30 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v4 3/4] drm/xe/guc: Define GuC version v70.29.2 for BMG
Date: Fri,  2 Aug 2024 15:21:28 -0700
Message-ID: <20240802222129.3976212-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240802222129.3976212-1-John.C.Harrison@Intel.com>
References: <20240802222129.3976212-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: Julia Filipchuk <julia.filipchuk@intel.com>

UAPI version 1.13.4

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 6bd1962bce36..4bb2a4a80ddc 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -106,6 +106,7 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
+	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
 	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2))	\
-- 
2.45.2

