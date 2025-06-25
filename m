Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D71C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 19:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7918510E7F7;
	Wed, 25 Jun 2025 19:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Csy5wxC1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A02710E7DF
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 19:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750880028; x=1782416028;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2bEfFrK6Dc5QFNNeFbUhl/Y81879OXdd+wHDx2/cj2M=;
 b=Csy5wxC1k0nN4+seI3opHj8gyj5ho6Ax/7IRKi0ic62X8+pk0/5DEYQn
 LHwms8T9BeALfrwdBRjuQkX2JNnSRlqvNg2V4bWgnun3K2R3u96e5+Erw
 INdCw5DGfnWTIII4ZBeFEB56XWDokTU9fYPBuKAAr2awkG5w5IFjfzEXt
 aorjsIlrqL3IzZfDLDZAQvVBmdFwr7f1Vce0oaCzw2ZtNlsg895XSF5/S
 DEyl2MpR65GpB5ClBX/Vo82zJOz+LH2+wtM/r3gRCrc89Dt/+iqsQhRzI
 mkNpkz+O3K+BRYuqlKhinMeYK9oqq1BfxLB0yd9NSaYZ6HsEWRlGz+HDv Q==;
X-CSE-ConnectionGUID: c2F/hmpwQGOzxZfkdUKVzA==
X-CSE-MsgGUID: LVKoYkBKRBSoliutncoKUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53305192"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="53305192"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:33:48 -0700
X-CSE-ConnectionGUID: 8nZNsWtaRl+hpO+jD+9iPA==
X-CSE-MsgGUID: oXJpooFcSCm3jRfKvPqiSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="156697208"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:33:48 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, matthew.d.roper@intel.com,
 rodrigo.vivi@intel.com, Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v3 4/5] drm/xe: extend Wa_15015404425 to apply to PTL
Date: Wed, 25 Jun 2025 12:33:39 -0700
Message-ID: <20250625193340.38971-5-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625193340.38971-1-matthew.s.atwood@intel.com>
References: <20250625193340.38971-1-matthew.s.atwood@intel.com>
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

Wa_15015404425 needs to be applied to PTL A0 to B0, a subsequent patch
will address the complexity required to do this. For now apply to PTL as
a whole.

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_device_wa_oob.rules | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
index b7d12ea4d65c..3a0c4ccc4224 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -1 +1,2 @@
 15015404425     PLATFORM(LUNARLAKE)
+		PLATFORM(PANTHERLAKE)
-- 
2.49.0

