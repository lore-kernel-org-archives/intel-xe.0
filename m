Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD359C88E4D
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 20:12:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4552E10E534;
	Fri, 11 Sep 2026 20:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JEHdRoak";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38BA610EAA6
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 20:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789157521; x=1820693521;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=DBKLN8FmLqkvBBAF+LqMH6CGh96m/3rHcRJHazJBsRA=;
 b=JEHdRoakwJ0RmfayBZnwLeQ0KnlYzQeOvkXfTM+MVTIf5w1hHjKD47tN
 rIpaUjp2B6GWdBkj0lqsDvEewFnGyhQ1ddx8/pBR5Ww0cBcFEQw1ocFrs
 N1BDvsr/aT+nhH1xQBHxZjBIHAqqwdyV//511MlqCJKKmtarT2hyU3jKN
 JpTaDxLg5YXBRnkSpAyawrEvztCxw1WspAV3hCZkCX1VnWgooRcyronYp
 HGGUEMmBbKw/pm0yWgDqT3nLT4cqXBGtWILmiTuQcScgX//yfii8/3bBr
 SNN8R/X/9P2GKKHL7HzNqpAaNcxoKrEfZekB7RokHMg+WerFP3dkmjM2k Q==;
X-CSE-ConnectionGUID: 440NlMaaQ1ORgTxbegHVEA==
X-CSE-MsgGUID: oF2gQRYAREKROmSQzEdeUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="115162411"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="115162411"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:11:59 -0700
X-CSE-ConnectionGUID: m4u4whtPSh+cbulg4D/r4w==
X-CSE-MsgGUID: YsUzVbUoRemJfAdYbN5ORQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="277272103"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:11:59 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 airlied@gmail.com, simona@ffwll.ch, david.e.box@linux.intel.com,
 anoop.c.vijay@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, james.ausmus@intel.com, karthik.poosa@intel.com
Subject: [PATCH v8 12/20] drm/xe/vsec: Update VSEC probe order
Date: Fri, 11 Sep 2026 13:12:00 -0700
Message-ID: <20260911201148.1610547-34-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
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

Both debugfs and hwmon access the PMT data area before PMT is
initialized.

Hardwired offset usage allows this to work by accident.
Upcoming changes will break this usage.

Re-order the probe steps to initialize VSEC before the other
features are initialized.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 205cb4e7f9e8..3ec950606e67 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1053,6 +1053,8 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	xe_vsec_init(xe);
+
 	xe_debugfs_register(xe);
 
 	err = xe_hwmon_register(xe);
@@ -1066,8 +1068,6 @@ int xe_device_probe(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_sanitize_freq(gt);
 
-	xe_vsec_init(xe);
-
 	err = xe_sriov_init_late(xe);
 	if (err)
 		goto err_unregister_display;
-- 
2.43.0

