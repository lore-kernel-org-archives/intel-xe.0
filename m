Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69F4C4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D2310E9F8;
	Fri,  3 Nov 2023 14:35:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C543610E9F4
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022110; x=1730558110;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DMQPi0U/VHp0lUQIWmnEvmJ4/65Lfdl1gH5wWQRjv7A=;
 b=kb3UY4AaWl0UV/kcObE5CJK9gN++TP+OGYPAjm4WQCFlxb+Xg+U/cdut
 oCTYmoTr19GPbXQeJponiAqrbskDxZzfLHehPb5p1zFsNGbHBvD/LFWXM
 msViVomtqt0ExqYXs5rHf2zlKJbmHtycGKGj0Fn7Z+maZjQA2UJhbqFSs
 T1ZkumfvknzzocaNt7lE4qj2ZjjIznhhARjZR4CKaES9M8pcBJEUkCBBI
 I9uviljydYFPFFD6nZWy+nTvXeL+y5RC6R8CSqtHbomBGgb61RmsnhtP9
 tx0MUVVLVepX7dzGtSbqxW42XW2Q3/QMSW8qdNOKYF7252kCL7UdET9Vx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843319"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843319"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832394"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832394"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:09 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:07 +0000
Message-Id: <20231103143456.7-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 01/50] fixup! drm/xe: Correlate engine and cpu
 timestamps with better accuracy
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove checkpatch warning:

    -:126: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
    #126: FILE: drivers/gpu/drm/xe/xe_query.c:108:
    +query_engine_cycles(struct xe_device *xe,
    +               struct drm_xe_device_query *query)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 77499ad5ba56..10b9878ec95a 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -105,7 +105,7 @@ __read_timestamps(struct xe_gt *gt,
 
 static int
 query_engine_cycles(struct xe_device *xe,
-		struct drm_xe_device_query *query)
+		    struct drm_xe_device_query *query)
 {
 	struct drm_xe_query_engine_cycles __user *query_ptr;
 	struct drm_xe_engine_class_instance *eci;
-- 
2.34.1

