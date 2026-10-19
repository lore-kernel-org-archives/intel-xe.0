Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2A8CCA490
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 02:37:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F036D10E777;
	Mon, 19 Oct 2026 02:37:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB7810E76F
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 02:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792377467; x=1823913467;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hlztRoBGPa61+oS+R9RDHk0iK6Cv0Vod7puwi9F3ias=;
 b=GWUkcTGwl3o7eDHAHZkQroMA//HdETDdPoaJZQkWVMERASyX3jBz3B+G
 adoxE4ODSzX1Z30HSkFTTQinZXC3Jc4Xd6SQUlrIrgl51Ak/CJVS/7B5X
 Bbl8ALpe7vJteQdGEPPrtKMhGuupOrbgEau2KJZPSJ95gUECOnRV5ebEt
 jCT6fSyJGg3pYkLQJpRXSLc2VHegHmQLCUin7/vklskxqO4Jc/6+YuxsJ
 0wVYMQHTfPFwcYFIf8XorAoGGspPK6sTVIlEwrmt4/rMgmN2ZfKXVWK9b
 bpsmgt9bWTNKobRxrN1S2oY8keYaYKHmogw5gQ/4LS4T5EM9Qz9ehq9x+ w==;
X-CSE-ConnectionGUID: 0v3nhHkOTmCimyTLSDOodA==
X-CSE-MsgGUID: zz4kL0UAQv2NwSXJfhiYXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="943669"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="943669"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2026 19:37:46 -0700
X-CSE-ConnectionGUID: XndMjz0uQ8ieMQQ1cDguLg==
X-CSE-MsgGUID: Wss9EL4kRUSVVQtzEOklLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2526504"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 18 Oct 2026 19:37:44 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v12 6/9] drm/xe/pci_error: Flush GT wedge worker before bus
 reset
Date: Mon, 19 Oct 2026 08:06:37 +0530
Message-ID: <20261019023708.128835-7-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019023708.128835-1-raag.jadav@intel.com>
References: <20261019023708.128835-1-raag.jadav@intel.com>
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

With GT wedging now done async, make sure the wedge worker is flushed to
avoid side-effects during PCI bus reset.

Fixes: 13b9555ffb03 ("drm/xe/xe_pci_error: Implement PCI error recovery callbacks")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_error.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index e1b9dc5f0a6d..a5c8fd67738c 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -30,8 +30,10 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
 
 	xe_device_set_in_reset(xe);
 
-	for_each_gt(gt, xe, id)
+	for_each_gt(gt, xe, id) {
 		xe_gt_declare_wedged(gt);
+		flush_work(&gt->wedge.worker);
+	}
 
 	pci_disable_device(pdev);
 }
-- 
2.43.0

