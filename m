Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49871C07548
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 07:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A50210E4FE;
	Wed, 15 Nov 2023 07:38:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB47110E4F9
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 07:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700033898; x=1731569898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e1CKvCt0a3rojwp7GhgBaZrOvg/zDZh7GQvXqOuQUTY=;
 b=AWP8WZkAv+gAimvrVFqNqUSIxWqEizSfhzY5b/QsordFkiOL0Wc48X0C
 ucrwiY9vNKuD+9+Y9Ab4HhmeCRTaA3h3dqO6F1Reg+kHXbPuURh/OFPlT
 pw9lQOe47N32TLUINh123nBxqogb2c2oIDGm05scJb4zdWgQSO8YtKf0t
 4PjMKHeja8/RnNZr/qTxZJ14xA7UrE5vYbdxC1jGHrjfs+My4ac7fjRdL
 7A+hR+3SiGfsuu6cl9uCJKpeJYi2DCMIPl81C0HdSHFbqtHmkE8cUtS2P
 hdS2q1qwjg4jU/wufSgaMliKOfMdYSKzkjzv2DFnHevvrrd5tN3w/OsHL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="393689400"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="393689400"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 23:38:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="1096371391"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="1096371391"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.134.235])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 23:38:17 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 08:38:04 +0100
Message-Id: <20231115073804.1861-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231115073804.1861-1-michal.wajdeczko@intel.com>
References: <20231115073804.1861-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe: Print virtualization mode during
 probe
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

We already print some basic information about the device, add
virtualization information, until we expose that elsewhere.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3030b223e4a0..cb762c11dd0f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -736,6 +736,10 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		xe_step_name(xe->info.step.display),
 		xe_step_name(xe->info.step.basedie));
 
+	drm_dbg(&xe->drm, "SR-IOV support: %s (mode: %s)\n",
+		str_yes_no(xe_device_has_sriov(xe)),
+		xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
+
 	err = xe_device_probe(xe);
 	if (err)
 		goto err_pci_disable;
-- 
2.25.1

