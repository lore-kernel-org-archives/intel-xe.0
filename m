Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B724C624DB
	for <intel-xe@archiver.kernel.org>; Sat,  5 Sep 2026 20:02:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA77510E33F;
	Sat,  5 Sep 2026 20:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="URPLRvGw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F56710E326
 for <intel-xe@lists.freedesktop.org>; Sat,  5 Sep 2026 20:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788638531; x=1820174531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qWfm8q0q6RkKynRefxPtHutkhBGL/fJHQAIy4jV6zWU=;
 b=URPLRvGw7DCI+WiuYE/w3tzowpsg7DYTsGJLJ3HJ3hEiJQ59E4TtgSrT
 /eGf7mCxMauSDw0wTrFcN4ZI5/oaVE8XnvRAlK7k1EMCNj8/MVrEf9kya
 ZCIGjJcE5C9rg34T0Wz29CqBacLibclBiUTnxbgExgbtcXlOC79JFW1Ec
 AcqFnsxVYNH5ExYAvktfXrb9yn4zT3vNeMKOuPurthlMZloTNqPf3fh/j
 xarDMQR6B5EIknO2kgt0B9Vf4hgIYXnuQlFxT4juPPdrpdm24wtLTu71j
 G3TjQ3ysgSQBwv47Z96mkGycsNzytJsZ/lE2/wsQ/eERh1gOEfR49uSFa w==;
X-CSE-ConnectionGUID: rGF24bWRRVqRsaEfppBtfw==
X-CSE-MsgGUID: pySl8qz4T8KwdfdR7q/92g==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="88248625"
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; d="scan'208";a="88248625"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2026 13:02:11 -0700
X-CSE-ConnectionGUID: p+9mRE09TxOTzJ/gf7FvWA==
X-CSE-MsgGUID: eBDShBZZRNSFKz3foofZYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; d="scan'208";a="274154556"
Received: from yshashi-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.113.202])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2026 13:02:09 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 1/2] drm/xe/tests: Fix default subplatform selection
Date: Sat,  5 Sep 2026 22:01:56 +0200
Message-ID: <20260905200157.3164-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905200157.3164-1-michal.wajdeczko@intel.com>
References: <20260905200157.3164-1-michal.wajdeczko@intel.com>
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

If a test does not specify details about the fake device it wants
to create, our helper selects the device descriptor from the first
entry from the pciidlist and uses NULL for the subplatform descriptor.
While this works fine today, as the first device is a TGL which does
not have any subplatforms, it will be broken if we reorder pciidlist.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index bb0393475524..a82cab7a2b86 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -351,7 +351,7 @@ int xe_pci_fake_device_init(struct xe_device *xe)
 
 	if (!data) {
 		desc = (const void *)ent->driver_data;
-		subplatform_desc = NULL;
+		subplatform_desc = desc->subplatforms;
 		goto done;
 	}
 
-- 
2.47.1

