Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F6BC4167D
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:22:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974D810E2DB;
	Mon,  6 Nov 2023 11:22:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114B910E2D5
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 11:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269760; x=1730805760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pneecn1U3A/zlaBI6e6/Bk43TF9j209SznynYjGkQU0=;
 b=lvIKzUUVXAO4XzgjJrosGJXP5zV22ee2/HZRwXakwOVQ7hdXQoYkQbQW
 VKEeERDUloVtHbkIoQJx9mab04DubsBxZpT6AYEbQIN35CjB5fRpThLGC
 3ckZNVoI+PuI7zTpMtVnJwvCf2jqiMv4lTc83A9YAM3GO7kC4EWrzRW0C
 rTH64UJVfunZx0NNgANnml0kSIVqkGloWnReV9bejvq9KPJr/8fcDwxNI
 lAi3qd95C8L1n1P2PEKJsZUPxGorE1DyPdL3S00y0B2n0sNgtIR4L6n62
 /g8SXsKuYym+BYeCD1phbIvvw4fmiWJFDNVPq3G1KlUa7ZUTS3Nd4dAqF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379646835"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="379646835"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879411662"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="879411662"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:31 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 13:18:35 +0200
Message-Id: <20231106111845.2333093-16-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 15/25] drm/xe/eudebug: Set vm metadata
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

Event definition for set vm metadata

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 include/uapi/drm/xe_drm_tmp.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/uapi/drm/xe_drm_tmp.h b/include/uapi/drm/xe_drm_tmp.h
index 0c49583e453d..776ec9d0f32f 100644
--- a/include/uapi/drm/xe_drm_tmp.h
+++ b/include/uapi/drm/xe_drm_tmp.h
@@ -91,6 +91,21 @@ struct drm_xe_eudebug_event_metadata {
 	__u64 id;
 } __attribute__((packed));
 
+struct drm_xe_eudebug_event_vm_set_metadata {
+	struct drm_xe_eudebug_event base;
+
+	__u64 client_handle;
+	__u64 vm_handle;
+
+	/* XXX: Refer to xe_drm.h for fields */
+	__u64 type;
+	union {
+		__u64 cookie;
+		__u64 offset;
+	};
+	__u64 len;
+} __attribute__((packed));
+
 /*
  * Debugger ABI (ioctl and events) Version History:
  * 0 - No debugger available
-- 
2.34.1

