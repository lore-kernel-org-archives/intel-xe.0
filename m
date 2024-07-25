Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77F4C3DA7F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 00:32:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5564A10E486;
	Thu, 25 Jul 2024 00:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AENCVjCq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACA810E486
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 00:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721867562; x=1753403562;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bjm9ZJWVbrGvJbe7v4LLRh7Ql+NM1BPrPPG19SwRZSM=;
 b=AENCVjCqyBAdH2sfujpL/3L9mHL2IjdLDOtfcbsDcfzmttBIQkY6EY33
 er+gCnO6C6R3vy0BsHGR/xzrpzx1HvvZ+x92e+xP7OeFdTabZbxT0y7no
 MfqzXXomCKK5i5wLVJKeYMMjhOqj4Eqn3MAeNgFT6ml22OkNvMfWx6ghf
 CQoVDGc7fAnf+NyZdKf8qfQrUwsomRrx171Z4CYoJbE+ao+7sa3BYaRbo
 ZfJOxRwU2vOMFNqnIpd7X8DdwqJuh/ALPiD2kvhG+xQxQ8VOnWNnuVWqF
 CoX3jkyOR/EIiKnQ88xrR1AIEBhSofDQpSukgQ01aU5ScXEPQhEbl2LdD Q==;
X-CSE-ConnectionGUID: 5jY9kNNSSRCLPeGIMPOgnA==
X-CSE-MsgGUID: 2Gtygjt3TnWGKac5rgB8Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19192546"
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="19192546"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 17:32:41 -0700
X-CSE-ConnectionGUID: X08pWGboQLihNWCaRBBqRw==
X-CSE-MsgGUID: h+N1hdwMT/eozPhghdERAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; d="scan'208";a="75976393"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 17:32:41 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 6/6] drm/xe/huc: Define HuC binary for BMG
Date: Wed, 24 Jul 2024 17:32:23 -0700
Message-ID: <20240725003224.516233-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240725003224.516233-1-daniele.ceraolospurio@intel.com>
References: <20240725003224.516233-1-daniele.ceraolospurio@intel.com>
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

Add the unversioned define for the BMG HuC FW.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index f6a242822d6e..6b92255a769d 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -118,6 +118,7 @@ struct fw_blobs_by_type {
 	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 2))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
+	fw_def(BATTLEMAGE,	no_ver(xe,	huc,		bmg))		\
 	fw_def(LUNARLAKE,	no_ver(xe,	huc,		lnl))		\
 	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
 	fw_def(DG1,		no_ver(i915,	huc,		dg1))		\
-- 
2.43.0

