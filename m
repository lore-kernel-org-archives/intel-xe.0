Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98746C4332F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:22:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6527C10E2D5;
	Mon,  6 Nov 2023 11:22:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EAB10E2D5
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 11:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269758; x=1730805758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xgj0g71pPBvfuNY9OWDpsBz+JcorIbyYvEMzOFDXuYE=;
 b=W0KHUNZ4BZkLdp1NOo1LdNyM6ymDbXfK35vIX6XRrz0WKAxPTslXlG8x
 O9NzIEgsG33bHenpyHyvnTLFRddLXYPp4UCVqSuWXGbhCcyLG7iLwxvuQ
 5793yt84jkJQZP14KinXN2FvhYbe+C4XMGpPvFCi7G5BjJKO4yOLlLuh3
 Amqt4AWTcWbu6kf9FbhTD1w+zYCaBTFtM8I81z31grNr6jYIsYNk+VYAB
 3kpS2F2EhhNMEH3Do+H5YgKe9qfvgw6iGLbHM5ryLaV1WZ8w3NzadWEFR
 5BVMxSHGADByQnFCrcru3bKkyf2KMTC6M+fvoJdb/oXbB5xwDF6fh+Qty A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379646829"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="379646829"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879411652"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="879411652"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:30 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 13:18:34 +0200
Message-Id: <20231106111845.2333093-15-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 14/25] drm/xe/eudebug: Create/destroy user metadata
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

Event definition for create/destroy user metadata

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 include/uapi/drm/xe_drm_tmp.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/uapi/drm/xe_drm_tmp.h b/include/uapi/drm/xe_drm_tmp.h
index 6b07f5a5c404..0c49583e453d 100644
--- a/include/uapi/drm/xe_drm_tmp.h
+++ b/include/uapi/drm/xe_drm_tmp.h
@@ -79,6 +79,18 @@ struct drm_xe_eudebug_event_eu_attention {
 	__u8 bitmask[0];
 } __attribute__((packed));
 
+struct drm_xe_eudebug_event_metadata {
+	struct drm_xe_eudebug_event base;
+
+	__u64 client_handle;
+
+	/* XXX: Refer to xe_drm.h for fields */
+	__u64 type;
+	__u64 user_addr;
+	__u64 len;
+	__u64 id;
+} __attribute__((packed));
+
 /*
  * Debugger ABI (ioctl and events) Version History:
  * 0 - No debugger available
-- 
2.34.1

