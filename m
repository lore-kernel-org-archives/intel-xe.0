Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0506CC2BA18
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 05:00:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DA310E163;
	Tue, 18 Jun 2024 05:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hoxr35aJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3948A10E1C8
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 05:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718686855; x=1750222855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JZTNu8ZdAtxl/Vmz6NdHobj1ZjBDz1UZA5WKhXcIVCw=;
 b=hoxr35aJAjDD2suDVVuJxX42szuuJBZ10q39ky0IjUK2juOlGGgAZJpp
 LLCpQga8HBFaJEMFa4AB/CHW7xnQhGf7EYvLCPdfpoqFe38mVDn3y/pFb
 Zs+HOKPriVPYC8asrW4yj4rrUzp8BuBXw8U3IqFMQR88JXSt8TzV+4M8j
 9s+KmnHSaYjVBHZl2BUjAhUOj5SEqOIQDYzFMcNnyluCAwlZLJ1nJGTtY
 rWHiHckCPpn6lalkhhp8aHlM/GAteIBB48qzcq9OR8kwDeED+Z99fmmaC
 wn8plpKHHTnKhkyRAg4oE4uVphbNOVACKAwBwGsznf2ZpxGbV54Dq8asw Q==;
X-CSE-ConnectionGUID: E/pv3iK2ScSN2QM83jQIOg==
X-CSE-MsgGUID: BRVTqVjsSNu3ggdB/QlkiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15256599"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="15256599"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:00:55 -0700
X-CSE-ConnectionGUID: Ven3icKOS+iUYheJcsHwlA==
X-CSE-MsgGUID: Zxl0TPXjRmCLeN7MAero2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="41537735"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:00:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 1/5] drm/xe/rtp: Allow to match 0 sr entries
Date: Mon, 17 Jun 2024 22:00:40 -0700
Message-ID: <20240618050044.324454-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618050044.324454-1-lucas.demarchi@intel.com>
References: <20240618050044.324454-1-lucas.demarchi@intel.com>
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

If none of the rules match, there should be 0 entries in the sr xarray,
so none of them should have a register matching.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 06759d754783..474a0b222ce1 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -255,9 +255,14 @@ static void xe_rtp_process_tests(struct kunit *test)
 	}
 
 	KUNIT_EXPECT_EQ(test, count, param->expected_count);
-	KUNIT_EXPECT_EQ(test, sr_entry->clr_bits, param->expected_clr_bits);
-	KUNIT_EXPECT_EQ(test, sr_entry->set_bits, param->expected_set_bits);
-	KUNIT_EXPECT_EQ(test, sr_entry->reg.raw, param->expected_reg.raw);
+	if (count) {
+		KUNIT_EXPECT_EQ(test, sr_entry->clr_bits, param->expected_clr_bits);
+		KUNIT_EXPECT_EQ(test, sr_entry->set_bits, param->expected_set_bits);
+		KUNIT_EXPECT_EQ(test, sr_entry->reg.raw, param->expected_reg.raw);
+	} else {
+		KUNIT_EXPECT_NULL(test, sr_entry);
+	}
+
 	KUNIT_EXPECT_EQ(test, reg_sr->errors, param->expected_sr_errors);
 }
 
-- 
2.43.0

