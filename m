Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB7BC05021
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7F510EA17;
	Fri,  3 Nov 2023 14:36:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B0410EA10
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022164; x=1730558164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kjEz/yALdzhPhF7b77evPV/Q1t4DllwK47t8X1Krmcs=;
 b=SQclaaDRsQlljXI6hJYb7IFs5VLHB+LjBShDoDfDutWH3/LQ9RJKKoXq
 MfGd3xC06VAFYxjjc5M0Lf4PTjoZHIjy4zWXLMItAoKq3QQ4gQ8Fpo3+X
 tTz0M6y12H+2BSO0EMFexcpuDWF40vG6MKvgCCS9VLPucgma8qBSAgHkA
 Qu5gF+ARYxT5SN6AL1tdqm71oLxGRKV+62iNmRGzY5rSh4tGOb+B038pA
 ywsopMjL00nQWYgAUMotNQ10RTSxDRzGoOP8HuKny4yfACpymVLbvJ1Ei
 MCdgaGGLxDJgAee7Ee4cRrM7u4ccXVdKoQSE0D6om+BtljwdubOEPJBm8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843543"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843543"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:36:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832554"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832554"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:36:01 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:50 +0000
Message-Id: <20231103143456.7-45-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 44/50] fixup! drm/xe: Make
 DRM_XE_DEVICE_QUERY_ENGINES future proof
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Add more reserved space, since we already know in advance that we
will need to at least show capabilities, because not every engine
even within the same class is able to perform exactly the same actions.

We might also need flags and/or properties. So, let's give us a
bit more room to be really future proof.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/uapi/drm/xe_drm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 690d18e07650..757e6da97f87 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -259,7 +259,7 @@ struct drm_xe_query_engine_info {
 	__u64 far_mem_regions;
 
 	/** @reserved: Reserved */
-	__u64 reserved[3];
+	__u64 reserved[5];
 };
 
 /**
-- 
2.34.1

