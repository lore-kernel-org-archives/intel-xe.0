Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4A1CCD194
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 03:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B6710E1B0;
	Tue, 14 Oct 2025 03:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ayGSVTeB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD7710E1A5
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 03:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760412329; x=1791948329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=50bVYenaSyIxPNF2k0Vcl4JX5zdCJOGL/TP5+EmQ/38=;
 b=ayGSVTeBCzNbrLEyVJ7JONmF9kAdR8r1Mtw1cDzZAf8+LMmqt7HZ+t2u
 oXvojwusG1GSAUkuObrUCRQjH2r+jRiHX5mrkzPLOj+pynWdK9FY2cP90
 X1XhWYUXxYrpgrrOEkofp7yjuGC2cmISKftiWyC3jwBuKKNtOxlm5av0x
 p+CdiGBrr8XOYO+6JPrdTnpouWzfqWWhnqLoV9maKB3MdVToGQZqV6Mrf
 KoWHeQoeIMpXqrR1Gt4TUkiEnuBlsYR8UBLiL/9zxsGsZ0s41YT+cgwOg
 DWi2ASK6amc3NtdjibiO4IepdRCg8H8JLY21x5niCtDzeX/6D/dRnfQWu g==;
X-CSE-ConnectionGUID: W3RYs8+QRt27ejn3VeTXZg==
X-CSE-MsgGUID: kwgnFxMITymn+6RJ3LI2JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66414869"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="66414869"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
X-CSE-ConnectionGUID: PT3XqafsSMqYXqT0DcPqLA==
X-CSE-MsgGUID: AcsoJom3TAe1y81I6YI+Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181567277"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 05/23] drm/xe/xe3p_lpm: Stop reading the CTC_MODE register
Date: Mon, 13 Oct 2025 20:24:37 -0700
Message-ID: <20251013-xe3p-v1-5-bfb74f038215@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

CTC_MODE register is removed by Xe3p.  Stop reading that register on
Xe3p and later platforms.

Bspec: 62395
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_clock.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 4f011d1573c65..26052710be8a7 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -57,6 +57,10 @@ static void read_crystal_clock(struct xe_gt *gt, u32 rpm_config_reg, u32 *freq,
 
 static void check_ctc_mode(struct xe_gt *gt)
 {
+	/* CTC_MODE register is removed by Xe3p */
+	if (GT_VER(gt) >= 35)
+		return;
+
 	/*
 	 * CTC_MODE[0] = 1 is definitely not supported for Xe2 and later
 	 * platforms.  In theory it could be a valid setting for pre-Xe2

-- 
2.51.0

