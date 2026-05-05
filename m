Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E83CD3427
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 17:00:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E9610E38F;
	Tue,  5 May 2026 17:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aL6XfDf+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D91B10E38F
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 17:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778000434; x=1809536434;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PloGYEOPDQl1zTi9kp545zgPmv+ZW+lkNa+P1IMTbzM=;
 b=aL6XfDf+CQ/bSOh8jDYh1nCIlAC07EuwCCKpJIcZYJErGwapnOfBoiXm
 37ysPYGr6+y6Z4jBfDX3vVXXjE10zTxDYxn2H0kuy+Iwm8qdbOP3kGB8A
 2s4HH0Pg7L3A6OTNQ8I9N2GxcEaSaLC/6iowtkKfeMy/GAVgg8fYQQ4C2
 qCoBETbrlXZEIdqGQFslIvBz+kEBavTD566JUgAORuD8MahjoXtVsZhbs
 Ju94+R1c7TTMzN/cWJ5+6X95IwXZYbsMlUTybJ80ADSFDtTM2GFX9kHyA
 gu9phgzXK7qwtZluxq7priADQWAU22lArX/pQv0srVv+xYLRq0AkHmgzI g==;
X-CSE-ConnectionGUID: NP+RvB9/QYer1o788yr3ag==
X-CSE-MsgGUID: 7Uuc/wHoT6mmpoMYsanMgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78902139"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="78902139"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 10:00:34 -0700
X-CSE-ConnectionGUID: WFWcPKCjQhidUjPuJX89ag==
X-CSE-MsgGUID: W2Y0jcunRO2J22Aqiw9x4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="259539792"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 10:00:30 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH 1/3] PCI/IOV: Remember initial VF BAR sizes
Date: Tue,  5 May 2026 19:00:08 +0200
Message-ID: <20260505170010.3414074-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505170010.3414074-1-marcin.bernatowicz@linux.intel.com>
References: <20260505170010.3414074-1-marcin.bernatowicz@linux.intel.com>
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

SR-IOV initialization records the per-VF BAR sizes derived from the VF
BAR registers in the SR-IOV capability.

PF drivers may later change VF BAR sizes using VF Resizable BAR support
(pci_iov_vf_bar_set_size()). Save the initial per-VF BAR sizes so later
code can restore them when SR-IOV is disabled, when SR-IOV enable fails,
or when the PF driver is unbound while VF BARs are still resized.

The initial size is captured before the resource is multiplied by
TotalVFs, so it represents one VF's BAR size as advertised by hardware.

No functional change on its own.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 drivers/pci/iov.c | 1 +
 drivers/pci/pci.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 30ca4535fc36..19f4dca4eec1 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -869,6 +869,7 @@ static int sriov_init(struct pci_dev *dev, int pos)
 			goto failed;
 		}
 		iov->barsz[i] = resource_size(res);
+		iov->barsz_orig[i] = iov->barsz[i];
 		resource_set_size(res, resource_size(res) * total);
 		pci_info(dev, "%s %pR: contains BAR %d for %d VFs\n",
 			 res_name, res, i, total);
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 19660d068fb7..441ef5b4ddc2 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -670,7 +670,8 @@ struct pci_sriov {
 	u8		hdr_type;	/* VF header type */
 	u16		subsystem_vendor; /* VF subsystem vendor */
 	u16		subsystem_device; /* VF subsystem device */
-	resource_size_t	barsz[PCI_SRIOV_NUM_BARS];	/* VF BAR size */
+	resource_size_t	barsz[PCI_SRIOV_NUM_BARS];	/* Current VF BAR size */
+	resource_size_t	barsz_orig[PCI_SRIOV_NUM_BARS]; /* Initial VF BAR size at probe */
 	u16		vf_rebar_cap;	/* VF Resizable BAR capability offset */
 	bool		drivers_autoprobe; /* Auto probing of VFs by driver */
 };
-- 
2.43.0

