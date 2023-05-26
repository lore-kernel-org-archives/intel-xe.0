Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B339C7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 21:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147D210E810;
	Fri, 26 May 2023 21:16:05 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A2D10E800
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 21:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685135758; x=1716671758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rgse5Z8v2PJJU1M5obXgNI/1+AcuxiCcArdaz2IKwms=;
 b=fsi5tQ/C8LTKTw9C0uQ4JWSWwBAcGdvx0dsxw3j0MnE18aRDEDUmZVC1
 AlHNLkjiC/nnUG3xdAEBXLO9RWmGMV66YTmFQOoTC0UFoam1vBB5hCEHe
 F/St+4I/zve6h/Bvf7TLmtA1W8MULZZaXM8ax0H+U/hBY+caszbd/CIwh
 tR4Rr6COD4HrCZe31F+dK4MLbc5h5pAZMEIj3+ysah9CJUdaehRR8yOrx
 7+XAukV/0QXmAwpCuUhlzQirQ9xGxf0aJMLAIuOxXrZdPrmBoeKgjNZ6n
 nc/QW7qZ9DnOrPVNEy/XkPkdPiNf1JlvwMZO74b6NSC4KzXiuFFCnftaw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="382555239"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="382555239"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 14:15:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="1035495056"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="1035495056"
Received: from anushasr-simics.jf.intel.com ([10.165.21.205])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 14:15:57 -0700
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 14:17:30 -0700
Message-Id: <20230526211730.2774851-6-anusha.srivatsa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230526211730.2774851-1-anusha.srivatsa@intel.com>
References: <20230526211730.2774851-1-anusha.srivatsa@intel.com>
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
also add support to xw_wa_test kunit tests for checking
their WAs.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_wa_test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
index f654976506c9..6e1127b276ea 100644
--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
@@ -46,7 +46,11 @@ static const struct platform_test_case cases[] = {
 	PLATFORM_CASE(ALDERLAKE_S, B0),
 	PLATFORM_CASE(ALDERLAKE_S, C0),
 	PLATFORM_CASE(ALDERLAKE_S, D0),
+	PLATFORM_CASE(ALDERLAKE_P, A0),
+	PLATFORM_CASE(ALDERLAKE_P, B0),
+	PLATFORM_CASE(ALDERLAKE_P, C0),
 	SUBPLATFORM_CASE(ALDERLAKE_S, RPLS, D0),
+	SUBPLATFORM_CASE(ALDERLAKE_P, RPLU, E0),
 	SUBPLATFORM_CASE(DG2, G10, A0),
 	SUBPLATFORM_CASE(DG2, G10, A1),
 	SUBPLATFORM_CASE(DG2, G10, B0),
-- 
2.25.1

