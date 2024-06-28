Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FD0C3064D
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 15:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA5010E271;
	Fri, 28 Jun 2024 15:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dk1UMFT/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622CB10EC6A
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 15:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719587432; x=1751123432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R8dbb3VgmZF9CuqsKQAVTfcfpL/OtdrfBMNafCLJTlQ=;
 b=Dk1UMFT/Mc/x63YCZ056kOxfTeBF9WLT6Uml+HadCQWxD0oYn9eg4DHP
 klNt3js401ANwkxjuy7xsOifDWwiooScSU+9cRQKt9G+5lHG++xGB79jc
 Cp2yb9q9jpy5dzFl3pe+fyCKkdflw04/k6X9Pev182F9z48Q0Up2C9hyf
 D4+pNrvEyRQXYT8OawDEJV9eiNj+Dr8zl6tHlUN7hkcLDpYSIpgwZQdQV
 0NmfS+YD6lQrJ3IpjKbxFw6H1OaAKnhadumTJKQE+r6gBFslT/C1cS0FS
 YQqCQXv2FZFuFRFs2Cn5QDw7gh7OSbqBM9A7W8hKBlABxNjIULBJwzyB8 Q==;
X-CSE-ConnectionGUID: ZlSajSXwQoWs6XoKwgqSEg==
X-CSE-MsgGUID: 5GL6WigvT4qFpWwfmSXqDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27460847"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="27460847"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 08:10:32 -0700
X-CSE-ConnectionGUID: ooUVYUKcSvCVLO1TFVn/Qw==
X-CSE-MsgGUID: xG6KHdMnTN+Ymp91fqQQJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="44848122"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 08:10:31 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v4 2/6] platform/x86/intel/vsec: Add PMT read callbacks
Date: Fri, 28 Jun 2024 11:09:40 -0400
Message-ID: <20240628150945.3363575-3-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240628150945.3363575-1-michael.j.ruhl@intel.com>
References: <20240628150945.3363575-1-michael.j.ruhl@intel.com>
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

