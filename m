Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D082C04AB8
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 17:48:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D786210E525;
	Wed, 20 Sep 2023 17:48:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B2210E525
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 17:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695232103; x=1726768103;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l0SjxEjHLy3uJDIB3N0b2PKV5vbG7MLUDV+3qI8GYWg=;
 b=EVmhvg4z+36lkYgvC4Qe7Gwh3gQUmmPjx7W1t0as72o220Ii5mLmbMxI
 wdu+Nzdjf+nPZo4SAL+FlZiEG0Yq+5g+TUGAF4/GRy3PRfWZnH6sIwVd0
 ALfa1t3pDKxMPmSVk7TtY+Po6L4Xz4zK1P/lf+HgkOkgPB/8nd2IHwbai
 S+6M3zKuJeAt27HHxY7MjPhhnzNPhdXgVQAKbAD8XvStJsgKE+Dx+DZ3g
 q4zXSVgpcy20+BGCC3yi8SrcAvxdTWtI5MCXeHhDN5g/InyINr2AOfLW1
 FgAGP/arVLgXG/H02u50mIF941dNDonkwX1rBY8PTuSHxi3S/eIKwscwZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="380209576"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="380209576"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 10:48:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="890026411"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="890026411"
Received: from pallavim-desk.iind.intel.com ([10.145.162.180])
 by fmsmga001.fm.intel.com with ESMTP; 20 Sep 2023 10:47:16 -0700
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 20 Sep 2023 23:24:31 +0530
Message-Id: <20230920175431.3381076-1-pallavi.mishra@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Align size to PAGE_SIZE
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
Cc: stuart.summers@intel.com, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Ensure alignment with PAGE_SIZE for the size parameter
passed to __xe_bo_create_locked()

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 1ab682d61e3c..014d084632f2 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1199,6 +1199,9 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	/* Only kernel objects should set GT */
 	XE_WARN_ON(tile && type != ttm_bo_type_kernel);
 
+	if ((size & (PAGE_SIZE - 1)) != 0)
+		size = (size + (PAGE_SIZE - 1)) & ~(PAGE_SIZE - 1);
+
 	if (XE_WARN_ON(!size)) {
 		xe_bo_free(bo);
 		return ERR_PTR(-EINVAL);
-- 
2.25.1

