Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADC1C5518F
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 10:30:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4772610E5A4;
	Mon,  3 Aug 2026 10:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SNmKYYw5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6583210E5A5
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 10:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785753032; x=1817289032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jc9ezVgCCeYzRms3oEKKtkNwbEmHiSp2OS+gnMOLnXA=;
 b=SNmKYYw511vkz8NvAGdudKcUz1S6mAPs4ZzMmVBftlzvH6FEWo1yCJQv
 b4W2qpNYQ8wb2Q7CkIT1/mBECMrZdOXVY/PE7bBNPzlEvcAl6szPoJXvi
 YoRLdigv2TGT0++WelTYpx9DrHnUUKLbFeCkCjEAh5eiK40RpxMM5LTml
 pxinWUasIQDE4tDATl6RXPY7moberyO9yAkh9tDPBdgAOuLNtpyWQxeFY
 Dfp70+Yn/KsrJ4hR3WphTdfwvboig+UwTYS5iu4HYy0Hn6gFiDztLidjg
 9MIfLViIgECHfT+PD0oqDqx1UPkvEnEKq2vEBwwuJRdzkfOfXfwbSJN62 w==;
X-CSE-ConnectionGUID: h+ZZCgwYRQ2H5obSHMqF6g==
X-CSE-MsgGUID: bN0quN5qTleNqZr4Zqg/lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="109080990"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="109080990"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 03:30:32 -0700
X-CSE-ConnectionGUID: FDbvWnJdTZar+Wh3N+v27w==
X-CSE-MsgGUID: Q7t6uBkWQrG7T+EAG9uQNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="299410205"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 03:30:28 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Subject: [PATCH v2 3/3] PCI/IOV: Restore initial VF ReBAR sizes on PF driver
 remove
Date: Mon,  3 Aug 2026 12:30:07 +0200
Message-ID: <20260803103007.209625-4-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803103007.209625-1-marcin.bernatowicz@linux.intel.com>
References: <20260505170010.3414074-1-marcin.bernatowicz@linux.intel.com>
 <20260803103007.209625-1-marcin.bernatowicz@linux.intel.com>
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

sriov_disable() and sriov_enable() error paths restore the per-VF BAR
sizes saved at probe time. They do not cover the case where the PF
driver is detached while VF BARs were resized but SR-IOV was never
enabled (or was already disabled).

Restore the initial sizes from pci_iov_remove() as well. That hook runs
on driver detach while the device is still live, unlike sriov_release()
which runs later from the pci_dev release path.

Skip the restore when the PF driver leaves SR-IOV enabled; in that case
VF memory decoding is still active and pci_iov_vf_bar_set_size() cannot
safely change the VF BAR size.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 drivers/pci/iov.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 999938163ce9..3739825c84e9 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -1085,8 +1085,12 @@ void pci_iov_remove(struct pci_dev *dev)
 		return;
 
 	iov->driver_max_VFs = iov->total_VFs;
-	if (iov->num_VFs)
+	if (iov->num_VFs) {
 		pci_warn(dev, "driver left SR-IOV enabled after remove\n");
+		return;
+	}
+
+	sriov_restore_vf_rebar_initial_sizes(dev);
 }
 
 /**
-- 
2.43.0

