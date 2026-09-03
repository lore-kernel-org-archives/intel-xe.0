Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D85BC61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 08:04:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC39310E52B;
	Thu,  3 Sep 2026 08:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oC88xV2g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE4C10E4E9;
 Thu,  3 Sep 2026 08:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788422672; x=1819958672;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qUV6gNL9fGDSMSdwn0ySLmGGmPHJy6IvdBSaKZ5awbs=;
 b=oC88xV2gsdJZ4Tl7gxEb4NGnkFwqEy3lGKsijTyFY59pS5iYx4OT9APw
 /e1wvRi/jqenc9jmBHUff5IqRf08aHXqxdwKVZPwYvANoxXyVwama8A9/
 Ui5Fw57RwDDqu6hD9lax+iCN4rhjySYr6SNLMcg9r5hXVblEj1yGH1dTf
 TO/21KJWxnNJ7aXAlYSwsGwPud6QFFd7vx7vsAFOVVKyEY0yFuSkwky95
 KG2v7uEZAIEGMx++NK+yHpLob8DPclaV2a4NuOIPN0k63kY6vtjrJmNLo
 fvrfaMjKkcodaKj4oW53x51noWJFWYpPEpD1EQjieSZGAMPmITMixBIbp Q==;
X-CSE-ConnectionGUID: rh3FfntERpaufULzq2j/5g==
X-CSE-MsgGUID: rNRq2L5dTNqtu9CkThRpvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88919211"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88919211"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 01:04:32 -0700
X-CSE-ConnectionGUID: TF7wuS8RRa+g9rOEjiPljQ==
X-CSE-MsgGUID: fMXQgv7cQVK0CLDRffaVQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="266397363"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.250.156])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 01:04:29 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com,
 jouni.hogander@intel.com
Subject: [PATCH v2 1/5] drm/xe/pm: initialize the device's system wakeup
 capabilities
Date: Thu,  3 Sep 2026 11:04:06 +0300
Message-ID: <20260903080410.489411-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903080410.489411-1-vinod.govindapillai@intel.com>
References: <20260903080410.489411-1-vinod.govindapillai@intel.com>
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
generate PM PME events.

Bspec: 52979, 52980, 68857, 68867, 68970
Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ab4da1d9a9f1..f8e16aefd2f8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1217,6 +1217,10 @@ static int __xe_pci_probe(struct pci_dev *pdev, const struct xe_device_desc *des
 
 	pci_set_master(pdev);
 
+	err = devm_device_init_wakeup(&pdev->dev);
+	if (err)
+		return err;
+
 	err = xe_probe_info_early(xe, desc, &probed_info);
 	if (err)
 		return err;
-- 
2.43.0

