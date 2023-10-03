Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D58E8FDB4
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 20:37:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DD310E07D;
	Tue,  3 Oct 2023 20:37:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DDC10E312
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 20:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696365449; x=1727901449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WIVPkWMcCgGcU/3bFbMTvR8o0/pSWTiRubciARoaOqA=;
 b=oKcjlBvvXx4Elsw8PPHqtHU3UdriUgRDqNbLIx86Hyj5xBxb2iBM8vAr
 s0pnZ9BTHK1oHQRDJ9GyDNQlfgHPRo9I7prqkur+u8J2mRZtyEnElYbJn
 zVTXrjkdXlXFyIsxhLcLLbxXkCRv6qf2n9SZRrw9Y7r3Bvpm13wNlPfvx
 B54zWuxT677NWEb4EBiTDk7IvlZ8dGWYsk3RTnEB6VG3aiMCmg2USCPdA
 mEsPoV8PVdPBanFbYMcAekfCX9HsrKnmfzKTpSiHeUvFdQXWJ0AIkyLoX
 +e1Uc3bF+t/YN14FEvM6AMoX3TFaac4+Va+VJr2ZhRe7/aLbhZ4vyW5yj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="382882338"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="382882338"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 13:37:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="821393971"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="821393971"
Received: from xuebinta-mobl.amr.corp.intel.com (HELO
 anushasr-mobl7.intel.com) ([10.212.207.176])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 13:37:29 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 13:37:16 -0700
Message-Id: <20231003203716.108979-6-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231003203716.108979-1-anusha.srivatsa@intel.com>
References: <20231003203716.108979-1-anusha.srivatsa@intel.com>
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

