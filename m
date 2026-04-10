Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E501BF45A11
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 22:51:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8533410E9DD;
	Fri, 10 Apr 2026 22:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hiViejS3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22E110E05E
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Apr 2026 22:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775861467; x=1807397467;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=WYvw/hse+pPFaKH2A8+6tVOIS7Ds75J7zKiicxAOkV4=;
 b=hiViejS342pF7xkDLXmuJWvSpBBexLoAXw4wuiiKMCac+7nXkoqiptXw
 COUOWh4izyYYVUfHiY0/c4Mjdnb1l9DzggZJoL17fH4NOcf/drJXHSfao
 9ge39zghtpbTa1v4sbFrYlHkOojwRlW72KG6gaplGb+7LG3sw4bEhV5R8
 0/GfAgriLszrcEts2LF4gbJHYG3zG4sXzZQ+gb+OtpFvlW+0FCR+RbXre
 zLfiZNgZ1FwbPedKCFTbk+Sra1IoLNUPVuI2vFb2ocq0gE2P9CdiMF37w
 3Vp3nfhD0gzNWzGSrlxtwUohvLy4znBGsEQppEKbu68L4z+5VLE1boArT Q==;
X-CSE-ConnectionGUID: IJD73VKVTEmKj6/kr5lVog==
X-CSE-MsgGUID: seGbfxVkQPmZBNgO6Jckow==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76849549"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; d="scan'208,223";a="76849549"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 15:51:07 -0700
X-CSE-ConnectionGUID: Ua5HAPm6TBC8Sls4sl/5HQ==
X-CSE-MsgGUID: Rvx00e+fS8atxvgdBb+Cdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
 d="scan'208,223";a="222728519"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 15:51:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 10 Apr 2026 15:50:29 -0700
Subject: [PATCH 2/3] drm/xe/tuning: Use proper register offset for GAMSTLB_CTRL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-xe3p_tuning-v1-2-e206a62ee38f@intel.com>
References: <20260410-xe3p_tuning-v1-0-e206a62ee38f@intel.com>
In-Reply-To: <20260410-xe3p_tuning-v1-0-e206a62ee38f@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1502;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=WYvw/hse+pPFaKH2A8+6tVOIS7Ds75J7zKiicxAOkV4=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp2X7aDl0hjPzqdrvsvfCmRDeD9IkLT1pV2px+V
 yrnuBdqNFqJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCadl+2gAKCRBNeSQFyHKQ
 BOSlD/wIDSwT9J3VIxstMI+gr25jtdF87DwBj8dfKT1K2jFIoeIP5ONlafHd3XIJ5pPgFXrWBvZ
 JdKH8Jg7vWJ4fUA4bInxbfpZS/H2TTnqoaivB4Dj/KC5jmpWwLQIipYkgIn+d+qLQJGjLsKUZuu
 TIKmbKMI1gtCOh9QlLgJ+lqWWQH8Q2GQUUrj9v1aX+hZIrUqTDDAipvc4Kyip4PN/ldCsMS5fWD
 I1RIr4u2SQ3nUzJ9FYXl3PAgWe8ESGNmSJrP9RjXwIMjdkuqHr61n6hpRqWxzqR2x/uhyz3fgg9
 GQSN2Ylg5y63SRzv38Brxdkn3BtJVxQXFoiGr6QMDXoxfDh51DsgsD8Chgoeu/Z7KA687tb1MSD
 1RtMg62nOmpLhKuQdwOseFAMxzgCwC/YbEdGAvvQ/VvWYxro/TPImp4/JMI7sXxYAlVWC4tfCZP
 tzTuLI9zB5iEbAPeIpDrljAQObUkz0V0qTfblHtxsDF6F+z+hLdF6S/ts+FPBGqA6ZM1I4mMJuR
 9AjEnIzg3J3oCeR+UUbEIKkfdoY94YREJgg0w1DpBfIddNsSZ9F/F6fKuuSAkg+Z5hD3a9CkgZR
 K1MnQ0D6usQqu/sI0woPJv9gkrpOVjcDD1qw/cSG6mhJMvmH40r7Hukmu99322h+hPnGBTOReol
 jAc6+I6UYZfxwyg==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

From Xe2 onward (i.e., all platforms officially supported by the Xe
driver), the GAMSTLB_CTRL register is located at offset 0x477C and
represented by the macro "GAMSTLB_CTRL" in code.  However the register
formerly resided at offset 0xCF4C on Xe1-era platforms, and we also have
macro XEHP_GAMSTLB_CTRL that represents this old offset in the
unofficial/developer-only Xe1 code.  When tuning for the register was
added for Xe3p_LPG, the old Xe1-era macro was accidentally used instead
of the proper macro for Xe2 and beyond, causing the tuning to not be
applied properly.  Use the proper definition so that the correct offset
is written to.

Bspec: 59298
Fixes: 377c89bfaa5d ("drm/xe/xe3p_lpg: Set STLB bank hash mode to 4KB")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_tuning.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index ea48e2a60fcd..6fb8887d1482 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -97,7 +97,7 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	{ XE_RTP_NAME("Tuning: Set STLB Bank Hash Mode to 4KB"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3510, XE_RTP_END_VERSION_UNDEFINED),
 		       IS_INTEGRATED),
-	  XE_RTP_ACTIONS(FIELD_SET(XEHP_GAMSTLB_CTRL, BANK_HASH_MODE,
+	  XE_RTP_ACTIONS(FIELD_SET(GAMSTLB_CTRL, BANK_HASH_MODE,
 				   BANK_HASH_4KB_MODE))
 	},
 };

-- 
2.53.0

