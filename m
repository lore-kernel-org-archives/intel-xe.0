Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74E4C61DA4
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 20:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B363E10E633;
	Mon, 13 Mar 2023 20:46:04 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF3310E62C
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Mar 2023 20:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678740360; x=1710276360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=50dUAPcvwUJs8GupS0LXEFIR+Kmrq6zdRtln/cWDOrs=;
 b=I0iIDKalW81gj1P4U0GzFzebze9mtssF32c/NTeA5Yey5k9feekTpZaY
 A2vSF4LGGsBAzpWTdGAXWJncD/nn0KF6jYegBGonWvHykZYHSQk/vK1Lj
 nDJrQ70p1+WBlC03YrAnjF/lCv6xplE38i0l+bl+C7bNufiBqg9U5Glgp
 Y1rhMVP6aroVvmXocS0JwAhgJRBWFeVp2zSaV+EDNuum3PrTVY4/kCbIa
 xr4m539O7WVM4ZILkPpNRqSLoskXmFYsRb3EompaY2rr9xwe1CNdzo3zn
 AszUIFe8EhXB2Qppr9hW7Ettid5luiYbW6IQuFReKlNxX+/nIPq1GxW7D w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="334733908"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="334733908"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 13:46:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="924650126"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="924650126"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.190])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 13:45:59 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 21:45:16 +0100
Message-Id: <20230313204519.158888-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313204519.158888-1-thomas.hellstrom@linux.intel.com>
References: <20230313204519.158888-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/6] drm/xe/tests: Support CPU page-table updates
 in the migrate test
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

The migrate test currently supports only GPU pagetable updates and
will thus break if we fix the CPU pagetable update selection.

Fix the migrate test first.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index ac659b94e7f5..a3bace16282e 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -66,9 +66,16 @@ sanity_populate_cb(struct xe_migrate_pt_update *pt_update,
 {
 	int i;
 	u64 *ptr = dst;
-
-	for (i = 0; i < num_qwords; i++)
-		ptr[i] = (qword_ofs + i - update->ofs) * 0x1111111111111111ULL;
+	u64 value;
+
+	for (i = 0; i < num_qwords; i++) {
+		value = (qword_ofs + i - update->ofs) * 0x1111111111111111ULL;
+		if (map)
+			xe_map_wr(gt_to_xe(gt), map, (qword_ofs + i) *
+				  sizeof(u64), u64, value);
+		else
+			ptr[i] = value;
+	}
 }
 
 static const struct xe_migrate_pt_update_ops sanity_ops = {
-- 
2.39.2

