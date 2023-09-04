Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00306C71153
	for <intel-xe@archiver.kernel.org>; Mon,  4 Sep 2023 12:38:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A554110E1D9;
	Mon,  4 Sep 2023 12:38:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6727210E1D4
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Sep 2023 12:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693831106; x=1725367106;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ngcPfwSHaihNEvf8oLxnPTsI2fwdVA4LsXTvPk6lrfU=;
 b=HAVFC2l/dzCuUNVV9sPFJQEyVryki3rR4rS/kD2YPCg+9VQNeRu7VIvy
 HIAd0zP/wLoClAB4mLChcnR9+d7ut74V96fxHW1AsCvBW7v/Vw6qr7/8f
 0BWc8149onlvnkQjEXR5japKOhHON7OPzy4dSkbCiFRLBGHKJ7zHWFiva
 qzWdE/k3NSh8AUpTBPmnZYmQVzNJJjNAAV/En1+T7N508hBnLuVzoSa+C
 7WXUWm1Pl5eve7hQ0BGlSIBDFYPVtqG75LQr3wXrPHS1M47+G/Kowmq0a
 GZ9NyDQe9/qs0cOMGwcp4jtVe053QW8Fl6/7qHRFX/aC/ceuBhBH/D+l0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="442986869"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; d="scan'208";a="442986869"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 05:38:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="717538235"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; d="scan'208";a="717538235"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 05:38:25 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  4 Sep 2023 15:36:05 +0300
Message-Id: <20230904123605.3255946-2-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230904123605.3255946-1-mika.kuoppala@linux.intel.com>
References: <20230904123605.3255946-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 1/1] drm/xe: Extend drm_xe_vm_bind_op
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

The bind api is extensible but for a single bind op, there
is not a mechanism to extend. Take one reserved field and
mark it as an extensions.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 include/uapi/drm/xe_drm.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 86f16d50e9cc..74fb3db99fde 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -637,8 +637,11 @@ struct drm_xe_vm_bind_op {
 	/** @mem_region: Memory region to prefetch VMA to, instance not a mask */
 	__u32 region;
 
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
 	/** @reserved: Reserved */
-	__u64 reserved[2];
+	__u64 reserved[1];
 };
 
 struct drm_xe_vm_bind {
-- 
2.34.1

