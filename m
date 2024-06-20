Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADBDC27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 21:21:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879BC10E0E4;
	Thu, 20 Jun 2024 21:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jCVzWju1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E03310E0E4
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 21:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718918473; x=1750454473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R8dbb3VgmZF9CuqsKQAVTfcfpL/OtdrfBMNafCLJTlQ=;
 b=jCVzWju105aB1jut8vKla03YbjoKLq8c9BU2VVn2UHQsQZqHE27m97uH
 RxUuqx6Ge2URtikepueh0nNCBC/eo7xAPCpaDITXfXxFx/QeotwGE1hez
 g9WC7Li3bdi5ifPXP9hbok618dgwZPSrHh4aJKx02vo4tMU7goGvzSKsL
 6gGdi+kTobI3O6gXwMn+6zPdr40nQt7MOfEi1/nxbisExSW1JyvYW/CfZ
 0+zklT4DGU0E21s+trPpx9dBSoBUyhj76max+xD/L1S0gtlRMHzsK94Aw
 9q8TOMBpXv4gL6sH/rbocuGQJcsrnfIZ/bS3HMOuKfxH0PDSjjiXqmGWK g==;
X-CSE-ConnectionGUID: +VTnouU4TTO8ZEHEjDuVAw==
X-CSE-MsgGUID: o/CKXmb6SWqKAvgWMKKvdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="19811220"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="19811220"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 14:21:13 -0700
X-CSE-ConnectionGUID: O+/3UEV/SGGXe8PSeYfgZQ==
X-CSE-MsgGUID: omxrtjujROGy8RpYc062Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="79883669"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 14:21:12 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 david.e.box@linux.intel.com, pavel.e.popov@intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v2 2/6] platform/x86/intel/vsec: Add PMT read callbacks
Date: Thu, 20 Jun 2024 17:20:46 -0400
Message-ID: <20240620212055.3314064-3-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240620212055.3314064-1-michael.j.ruhl@intel.com>
References: <20240620212055.3314064-1-michael.j.ruhl@intel.com>
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

From: "David E. Box" <david.e.box@linux.intel.com>

Some PMT providers require device specific actions before their telemetry
can be read. Provide assignable PMT read callbacks to allow providers to
perform those actions.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/vsec.c | 1 +
 include/linux/intel_vsec.h        | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index 2b46807f868b..7b5cc9993974 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -212,6 +212,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
 	intel_vsec_dev->num_resources = header->num_entries;
 	intel_vsec_dev->quirks = info->quirks;
 	intel_vsec_dev->base_addr = info->base_addr;
+	intel_vsec_dev->priv_data = info->priv_data;
 
 	if (header->id == VSEC_ID_SDSI)
 		intel_vsec_dev->ida = &intel_vsec_sdsi_ida;
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index ff7998cadab4..003301783331 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -67,10 +67,15 @@ enum intel_vsec_quirks {
 	VSEC_QUIRK_EARLY_HW     = BIT(4),
 };
 
+struct pmt_callbacks {
+	int (*read_telem)(void *args, u32 guid, u64 *data, u32 count);
+};
+
 /* Platform specific data */
 struct intel_vsec_platform_info {
 	struct device *parent;
 	struct intel_vsec_header **headers;
+	void *priv_data;
 	unsigned long caps;
 	unsigned long quirks;
 	u64 base_addr;
-- 
2.44.0

