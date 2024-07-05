Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D37DC3DA40
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jul 2024 19:11:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7085F10E1BD;
	Fri,  5 Jul 2024 19:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OblqAjDH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B4710E1BD
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jul 2024 19:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720206671; x=1751742671;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=j0GGNcyHkvkUQsHpEh481grYYORM1zKi63lh3YCUxUI=;
 b=OblqAjDH5q6cY5BloRiXO/ukeRRLavjmC7FgKW9UEwgqK1B2w6jdkw0G
 s2vhGc19pkjYx8pkNI9Grm6d1bXWjo0cFBr8x+UmKu+et92sywSBMnq/s
 wU6SVlSJl3xU+LmYBXr/8ARtlmzBabFOMxyl5MkYJjJoRKuUrnIZFQukm
 lNaIWjgXb2l47QbizwnFM+d5xC/DOgIXB5MS36tvZFABG+O0luYCbjQSK
 TNQrNqnTkj98Wbemh+tZS3vl22ftM+w7T0td53BFzDSovuHVXsSXQBgIZ
 m/wUFigm4woyqlmZ5asNbPuf0M35cz1jW2W8DO+Uqhhx5LSqG1B0vcbZ8 w==;
X-CSE-ConnectionGUID: YM1Vb0/1TZ6E35yivSD4nw==
X-CSE-MsgGUID: cR4d52iLSbeO0Wqww+LpGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17644041"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="17644041"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 12:11:11 -0700
X-CSE-ConnectionGUID: r9ixRIN8S4yi7DiPya5UYQ==
X-CSE-MsgGUID: ZURipR1SRX6cyzbsdTlerQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; d="scan'208";a="51781486"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.48.40])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 12:11:09 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe/kunit: Drop XE_TEST_EXPORT
Date: Fri,  5 Jul 2024 21:10:57 +0200
Message-Id: <20240705191057.1110-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240705191057.1110-1-michal.wajdeczko@intel.com>
References: <20240705191057.1110-1-michal.wajdeczko@intel.com>
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

It's unused and can be replaced with VISIBLE_IF_KUNIT if needed.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_test.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_test.h b/drivers/gpu/drm/xe/tests/xe_test.h
index 55e5b5bedccc..9c23ad9dba8d 100644
--- a/drivers/gpu/drm/xe/tests/xe_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_test.h
@@ -31,7 +31,6 @@ struct xe_test_priv {
 
 #define XE_TEST_DECLARE(x) x
 #define XE_TEST_ONLY(x) unlikely(x)
-#define XE_TEST_EXPORT
 
 /**
  * xe_cur_kunit_priv - Obtain the struct xe_test_priv pointed to by
@@ -58,7 +57,6 @@ xe_cur_kunit_priv(enum xe_test_priv_id id)
 
 #define XE_TEST_DECLARE(x)
 #define XE_TEST_ONLY(x) 0
-#define XE_TEST_EXPORT static
 #define xe_cur_kunit_priv(_id) NULL
 
 #endif
-- 
2.43.0

