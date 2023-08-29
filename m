Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9FCC83F1A
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 14:13:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD5B10E2E1;
	Tue, 29 Aug 2023 14:13:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CB110E2A2;
 Tue, 29 Aug 2023 14:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693318380; x=1724854380;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mCWPUe9IQ24QEs6XdG/KoSkc/Mx58qahar7bnb5ZREE=;
 b=BAbeLLtQ1KGfm60qTY+KEz91q23TEZSoBWYPqrbTvepRm1w2nfxS5vsy
 kTIRiCm6EQAuYnn142aZxqWwLA7k1ivFMMoYunYSxeU9n7v4+yCFWWQ03
 /h/eB8qmmpNKwpaoYeYIbGyoA9i2KsJc/DiVWDyd5u2lcm+fuzZxLXcnj
 8uHAGK/VVG9Rd5plk97TpUM40q7UfCbt/n9K9WyYxIuqHwjljRzeAjofE
 dZ2AAXCtJHg9doTPDivBx7aEUT0BkkiBTSjHxdT5MOsrUWTUr6qqwQE4w
 VWqwdTlMJdpON0n4a8JthLNDO8wEKkOIIia4PY8smQieqvQ2VGALGj6+6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441733943"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441733943"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 07:11:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="804123955"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="804123955"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 07:11:11 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Aug 2023 07:11:06 -0700
Message-Id: <20230829141107.1505705-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230829141107.1505705-1-lucas.demarchi@intel.com>
References: <20230829141107.1505705-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH igt 3/4] lib/intel_device_info: Add blitter cmd
 info for Lunar Lake
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Swati Sharma <swati2.sharma@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Add separate cmd info for LunarLake. This re-uses the commands for PVC
since all the commands being used in IGT match the ones for PVC.

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/intel_device_info.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 86a8b3650..d1c268482 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -511,7 +511,8 @@ static const struct intel_device_info intel_lunarlake_info = {
 	.has_4tile = true,
 	.has_gmdid = true,
 	.is_lunarlake = true,
-	.codename = "lunarlake"
+	.codename = "lunarlake",
+	.cmds_info = &gen12_pvc_cmds_info,
 };
 
 static const struct pci_id_match intel_device_match[] = {
-- 
2.40.1

