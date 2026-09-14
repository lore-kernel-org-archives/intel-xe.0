Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1133C88E7B
	for <intel-xe@archiver.kernel.org>; Mon, 14 Sep 2026 20:40:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40F910F235;
	Mon, 14 Sep 2026 20:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C6Rh0jTm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F35910F230;
 Mon, 14 Sep 2026 20:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789418452; x=1820954452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TpBsxnBPOropYp2z3XKgKrT+/xUwYdriH2lmQptdtlA=;
 b=C6Rh0jTm4FUfAc6/qgk5nIGws3jP3nsXoCQOJZu0fggZmWP9vwEo4DmS
 VenuqhzlmtZoORmI3ydzi00JXdOlE2ddgHidqKfOufdDYLKKfEjzjigDB
 nePA8KZSRJbI+R32BA8dhsjkHV5r8TWL561u00pZch2kCZx4IgDYeGh0M
 ccV8iMRuve/RmLAe19XEhRPtp7BfOzZoXhaDQhCmZfNpzvCKgGulN+y7j
 wgt/Fq+qTkonFHHJRv48Uyx/BYLl9YNJys89YiifEK3g7KcolAxoarqFN
 sf5lZ0aKDBgcEr3u1Iz1VKqsMJ1ggr/uXBK55jkTH+tnkylIEC8beZrrY A==;
X-CSE-ConnectionGUID: dUsVggpBS563JukJWdPliw==
X-CSE-MsgGUID: eI8EOApKRkaaL/mFL3dz1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107288123"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="107288123"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 13:40:52 -0700
X-CSE-ConnectionGUID: gsOgemJ5RWeOEsigmU+avw==
X-CSE-MsgGUID: ANicvmVTRey1jCASKidYTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270113226"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.251.20])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2026 13:40:50 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: jouni.hogander@intel.com
Subject: [PATCH v7 1/7] drm/xe/pm: initialize the device's system wakeup
 capabilities
Date: Mon, 14 Sep 2026 23:40:28 +0300
Message-ID: <20260914204034.309566-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914204034.309566-1-vinod.govindapillai@intel.com>
References: <20260914204034.309566-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

NVL+ XE devices are capable of generating PME from HPDs. Enable
the device as a wakeup device so the display hotplugs can
generate PM PME events and can invoke pm runtime resume routine.

v2: rebased

Bspec: 52979, 52980, 68857, 68867, 68970
Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index c401c8803796..30c81042145f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1216,6 +1216,10 @@ static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *des
 
 	pci_set_master(pdev);
 
+	err = devm_device_init_wakeup(&pdev->dev);
+	if (err)
+		return err;
+
 	err = xe_probe_info_early(xe, &probed_info);
 	if (err)
 		return err;
-- 
2.43.0

