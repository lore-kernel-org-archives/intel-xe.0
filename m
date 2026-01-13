Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFE1D29DCA
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 04:29:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB3A10E2FD;
	Tue, 13 Jan 2026 04:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJopSUn+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8611410E2E9
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 04:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768278559; x=1799814559;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qpP7DbpWOj1qeq+tXjckNWwcyOLfreNOZz/LHR4DhdM=;
 b=nJopSUn+KwNzbwDJby07Tw4hQaJJHAYYc6JMWKs5WW/uPw57/JfFYHNq
 QmL4a8Q0xSyBHwvHP+lQpx2uGvIFKMlPHUTY0OMTFE617i7X8L6OJGEVQ
 lORaMA8WKovHBiRhdN8jqpssrL8fbBq0Dd0lqw8LAHYA6myrN4L6hvrgu
 givCDqN8j6omoa4g8rCxUsa6/qSJ8GsNcvFj1XNtqWyPuEU7lPnq3Xlpn
 Mq6IduKP+/zKohoKIr5/O7fVZt+oaYJH8pV8a5VKwwWUTZvsPk7mEs2gp
 B3Achyj4Ftgx/qPbcv25896x7wrZ/ZUYcqFBLnt2k/fq00SNiPSd5t6kf w==;
X-CSE-ConnectionGUID: DcDnjZ31TluxXwjbGNtcaQ==
X-CSE-MsgGUID: Sh+F1ThBT9eH4hLK4iw16A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="72141441"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="72141441"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 20:29:18 -0800
X-CSE-ConnectionGUID: 1pMPVsgPTVWRobWv7K/iMA==
X-CSE-MsgGUID: 44gTeKFOR/GJISTiB6oqBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="208793274"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 20:29:17 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com
Subject: [PATCH v2 2/2] drm/xe/multi_queue: Enable multi_queue on xe3p_xpc
Date: Mon, 12 Jan 2026 20:29:13 -0800
Message-Id: <20260113042913.3517169-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113042913.3517169-1-matthew.brost@intel.com>
References: <20260113042913.3517169-1-matthew.brost@intel.com>
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

From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

xe3p_xpc supports multi_queue, enable it.

v2: Rename multi_queue_enable_mask to multi_queue_engine_class_mask
    (Matt Brost)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 91e0553a8163..e21b437ad8fb 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -113,6 +113,8 @@ static const struct xe_graphics_desc graphics_xe3p_xpc = {
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
 		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
+	.multi_queue_engine_class_mask = BIT(XE_ENGINE_CLASS_COPY) |
+					 BIT(XE_ENGINE_CLASS_COMPUTE),
 };
 
 static const struct xe_media_desc media_xem = {
-- 
2.34.1

