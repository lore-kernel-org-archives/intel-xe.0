Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42052C27C5E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 12:04:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E810410E36B;
	Mon, 10 Jun 2024 12:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fgOpbM9c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E829D10E281
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 12:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718021062; x=1749557062;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xhFavR36A6MYzhJ32eG6j8NYbkiuXhRKUa7I3/0zXYc=;
 b=fgOpbM9c7O6mUwjxG3N8bosT43eBGnWi7Glb7JzcNxWMK4pWqTxf9WCg
 vos3Czo3sRIFgscyf+mpURHwxdGmBuB2avgkeLAmYUZp/bMp1wPR3Et+8
 MDcookq4YLk9iduqfaId2VV90vuR3vOpwGzoeRfHPzgZnxiHjN/BvVnUH
 6b3SY2Uu1kEjEoF0UThzX7ZTxhxCFJrUFy560GI6V+nMhCOQORR5pTiYy
 fX8wW2Yco/w3twhfJPtTyPkHPhvkkR+vXFhK6ABlTl86OOtH4cv6itGfX
 s9wRQTMkQBArD/EK7nk00E5Dlzu3g06oG54Wpq7DYwMZTSjG6VocXTSxN g==;
X-CSE-ConnectionGUID: Mconmaq9Qcy/cdpg/qi3pQ==
X-CSE-MsgGUID: tcSIuXN3S5GfgjFCebs9Kg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14830937"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14830937"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 05:04:22 -0700
X-CSE-ConnectionGUID: B2C+2M+HRXiJgaNDY82Wqw==
X-CSE-MsgGUID: z0VlGv+6R+ewVD3cmf9Y8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39117403"
Received: from mmanski-mobl.ger.corp.intel.com (HELO
 mwajdecz-MOBL.ger.corp.intel.com) ([10.246.1.253])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 05:04:21 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe/guc: Add kernel-doc for HXG Fast Request
Date: Mon, 10 Jun 2024 14:04:11 +0200
Message-Id: <20240610120411.1768-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240610120411.1768-1-michal.wajdeczko@intel.com>
References: <20240610120411.1768-1-michal.wajdeczko@intel.com>
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

We have kernel-doc for all HXG message types but Fast Request.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_messages_abi.h | 28 +++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_messages_abi.h b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
index e32142e3fe41..f6ed4dfd215c 100644
--- a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
@@ -91,6 +91,34 @@
 #define GUC_HXG_REQUEST_MSG_0_ACTION		(0xffffu << 0)
 #define GUC_HXG_REQUEST_MSG_n_DATAn		GUC_HXG_MSG_n_PAYLOAD
 
+/**
+ * DOC: HXG Fast Request
+ *
+ * The `HXG Request`_ message should be used to initiate asynchronous activity
+ * for which confirmation or return data is not expected.
+ *
+ * If confirmation is required then `HXG Request`_ shall be used instead.
+ *
+ * The recipient of this message may only use `HXG Failure`_ message if it was
+ * unable to accept this request (like invalid data).
+ *
+ * Format of `HXG Fast Request`_ message is same as `HXG Request`_ except @TYPE.
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN - see `HXG Message`_                                  |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = `GUC_HXG_TYPE_FAST_REQUEST`_                          |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 27:16 | DATA0 - see `HXG Request`_                                   |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | ACTION - see `HXG Request`_                                  |
+ *  +---+-------+--------------------------------------------------------------+
+ *  |...|       | DATAn - see `HXG Request`_                                   |
+ *  +---+-------+--------------------------------------------------------------+
+ */
+
 /**
  * DOC: HXG Event
  *
-- 
2.43.0

