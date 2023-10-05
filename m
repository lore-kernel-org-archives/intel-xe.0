Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB2CE92FC0
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 20:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82A410E497;
	Thu,  5 Oct 2023 20:57:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE9B10E409
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 20:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696539417; x=1728075417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vvK84fNK5anEIr5ucLH81EAkgXoJnnDV61Edwm7kVx0=;
 b=XKeSBM339qPS/aUc6F7E8FzHqzqsDzbsuHDbQDY94PXfEjTD8i2B/iN4
 zyeWmgmGAERofB+b5lKY0gv/tLnJD5ipUXtQiL9EVBqF9kH4xlnaUdGIv
 AdG6V361fnagVQ8dxyzsUYRjbcOZnmRTx/hd33UNffQbAdbtdQVp/LDgw
 ckSEuNNGlR7T9V4wYF/FAkGHPO9wJsWcGzuz7q735HR08/BArorioMY5v
 uEMUYm5kzyKMjF7Ud9YP7bcNqGY+jbka0u1rpOPaFCXNaM+0GHT0CkEAt
 xVy6CEFolk/7FxC9jiQCFAewJleIDNgf1p1eDqYVBwo/e7cQnXQxhDth3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="382490117"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="382490117"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 13:56:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="755613822"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="755613822"
Received: from anushasr-simics.jf.intel.com ([10.165.21.200])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 13:56:40 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  5 Oct 2023 13:54:50 -0700
Message-Id: <20231005205450.3177354-6-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231005205450.3177354-1-anusha.srivatsa@intel.com>
References: <20231005205450.3177354-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/5] drm/xe: Add missing ADL entries to xe_test_wa
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

With all ADl platforms and subplatforms added,
also add support to xe_wa_test kunit tests for checking
their WAs.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_wa_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index 69c9ea1fa82b..6e1127b276ea 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -50,6 +50,7 @@ static const struct platform_test_case cases[] = {
 	PLATFORM_CASE(ALDERLAKE_P, B0),
 	PLATFORM_CASE(ALDERLAKE_P, C0),
 	SUBPLATFORM_CASE(ALDERLAKE_S, RPLS, D0),
+	SUBPLATFORM_CASE(ALDERLAKE_P, RPLU, E0),
 	SUBPLATFORM_CASE(DG2, G10, A0),
 	SUBPLATFORM_CASE(DG2, G10, A1),
 	SUBPLATFORM_CASE(DG2, G10, B0),
-- 
2.25.1

