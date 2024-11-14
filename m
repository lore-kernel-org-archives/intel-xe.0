Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DE4D68B17
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 13:38:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C6110E2AF;
	Thu, 14 Nov 2024 13:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kg/TkfnM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE2110E2AE
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 13:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731591478; x=1763127478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WIBfVjn8NKxjy5E4l2Ngo4vvzMdNUflmzbq5ScUsH6o=;
 b=Kg/TkfnMwMOG9o0WMTSwcrSm+SYRaw+TAtiqtgJPgGyrjhhB/+LQudNk
 K83yuN7L2pciszpC8wTsGkvFWiDaSJ5U6AhMnk02DhOyph5qcod+lCHq9
 mZt4l3PVD5CKZ+ecy796WXIEImDC5gvBoMYRg3BW7iJLk2cTSwcK/nmmY
 Ot2XUhDBzy5qo2L1z3uLyWUk4Yd5TN2NDvUhL4Jki2gnRhd9JeLTG771W
 sO5ENxw1Mh5Wf8a7NrDRaVkJHegC/O7ykAeOArXaKsy52jtwTCofoEmsb
 bdafKV7l2nInhfWGFn+f1ubU/yXk2LHVU4G+ec5rj+npEquBIvgAS9qhm Q==;
X-CSE-ConnectionGUID: GLhfTq9HTtq/Wk29vfIzRQ==
X-CSE-MsgGUID: Mim8911LQgyqeMdlthkjPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="56926777"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="56926777"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 05:37:57 -0800
X-CSE-ConnectionGUID: A2aELAbiTYiZkNJKIZFX/w==
X-CSE-MsgGUID: CpPQJ2zFSyO4HYLBccRCmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="93155523"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 05:37:56 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH 2/2] drm/xe: Ensure GT reset is complete during ccs_mode change
Date: Thu, 14 Nov 2024 19:07:38 +0530
Message-Id: <20241114133738.2125717-3-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114133738.2125717-1-balasubramani.vivekanandan@intel.com>
References: <20241114133738.2125717-1-balasubramani.vivekanandan@intel.com>
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

Driver returns from the ccs_mode change request soon after initiating an
asynchronous GT reset. Userspace may submit GT workload while the GT
reset is ongoing and may see unexpected results.
Make sure the GT reset is complete before exiting from the ccs_mode
change request.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index b6adfb9f2030..9b6c15239487 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -150,7 +150,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
 		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
 		gt->ccs_mode = num_engines;
 		xe_gt_record_user_engines(gt);
-		xe_gt_reset_async(gt);
+		xe_gt_reset_sync(gt);
 	}
 
 	mutex_unlock(&xe->drm.filelist_mutex);
-- 
2.34.1

