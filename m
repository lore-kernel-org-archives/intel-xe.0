Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4145C5AD69
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 20:19:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C59B10E839;
	Fri, 20 Feb 2026 20:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="naLh+taE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3735010E83A
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 20:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771618754; x=1803154754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tRGSzOMcEqQRH0ewQzoRWp6J5l2TkuxBMRtvoVCya6Q=;
 b=naLh+taEgF/ZH213qOrkXjpCZHkmML030YxmPgppiQhUUhw14K0BzsR+
 sGmPKWsG28ySPL9lOiYCe8EYUJGlcoJcofNhrdZPkbcqQ0ZAuxIbEBMiB
 PJF4LPWwsAP7mYPnSMAIcRv1+J1CZ5OgR0dU83W/msN1kZsj8wwO7cSPl
 2mUBoHM7Ot9Y7yYspONCzyZ+wjZUR8lV6NiuLImSsDIhvouOvwHIIQtLW
 mC1EYoYyqIYwEdFeFEFQJwXiVhdv0KqdH+L+7IVe+vBT+AGHeI5ln+2uZ
 nwN8IloPS3Cm134tmRmbTo0KlNcAL4di0B/zwASzk5qXy+rkyGeKsAoxv A==;
X-CSE-ConnectionGUID: cU/59LEMT6WsnA3F9uvC7A==
X-CSE-MsgGUID: jtlHS1HVSf6cJYRTBsROcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="84169543"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="84169543"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 12:19:14 -0800
X-CSE-ConnectionGUID: RT4uOnh7QOO0NcK5AInEQg==
X-CSE-MsgGUID: fxWKX0U3T3CXzeDG4CT8xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214182105"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 12:19:12 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/3] drm/xe/pf: Don't use LMTT page size if no LMTT
Date: Fri, 20 Feb 2026 21:18:54 +0100
Message-ID: <20260220201857.6113-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220201857.6113-1-michal.wajdeczko@intel.com>
References: <20260220201857.6113-1-michal.wajdeczko@intel.com>
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

While today all our DGFX platforms have LMTT, we already started
preparation to do not rely on this assumption. Add check for the
LMTT presence and return default page size as VRAM/LMEM alignment
if there is no LMTT.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 6383763d02ab..3ae83cffe925 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1451,7 +1451,8 @@ int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid,
 
 static u64 pf_get_lmem_alignment(struct xe_gt *gt)
 {
-	return xe_lmtt_page_size(&gt->tile->sriov.pf.lmtt);
+	return xe_device_has_lmtt(gt_to_xe(gt)) ?
+		xe_lmtt_page_size(&gt_to_tile(gt)->sriov.pf.lmtt) : XE_PAGE_SIZE;
 }
 
 static u64 pf_get_min_spare_lmem(struct xe_gt *gt)
-- 
2.47.1

