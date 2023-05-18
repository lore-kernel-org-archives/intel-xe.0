Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06453C77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 21:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B5D10E564;
	Thu, 18 May 2023 21:25:21 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312DA10E558
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 21:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684445117; x=1715981117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4QTYKGC7qH2QywY/Q+GtnIPXTNGgCqAHaw/YOWIRxWI=;
 b=H5Cthp2zQgQ00yOaUUwcM/zpywrZcOO60FKVUtVogyzVGRGAHvcgaq+z
 6Tdjw3VY/0l70tUTfCkVG8EOgrWaKPjoVXtFZriKItKGD1wMF9Iq/k38n
 GZHdBKWD0jhnkuKYgOhrtVWj351PiAA6GX+V13fBeQ8061EkYGTAA8JkF
 +HKiHHFb0htRYpQE2qQmwZ99JzBHf1rZFOIcLigxtOKXeSjOdZ5+NsvLB
 K2l8Zrbzp7/5Mr10fwqV6XOZLPPcAOOIIRNWnJLolyU2VcvxGGyEiI1kS
 JnuDXyEHJev97gsQtlEs6EuzuFkCT7k0Cc+7QGICpJzkt+CzgT57h7L2l Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="354543575"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="354543575"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 14:25:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="948846706"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="948846706"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 14:25:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 18 May 2023 14:24:45 -0700
Message-Id: <20230518212446.3570168-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230518212446.3570168-1-lucas.demarchi@intel.com>
References: <20230518212446.3570168-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] fixup! drm/xe/rtp: Improve magic macros for
 RTP tables
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 8bc946694bfc..29fb4eaaba44 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -262,7 +262,6 @@ struct xe_reg_sr;
 
 /**
  * XE_RTP_ENTRY_FLAG - Helper to add multiple flags to a struct xe_rtp_entry
- * @f1_: Last part of a ``XE_RTP_ENTRY_FLAG_*``
  * @...: Additional flags, defined like @f1_
  *
  * Helper to automatically add a ``XE_RTP_ENTRY_FLAG_`` prefix to @f1_ so it can
@@ -285,7 +284,6 @@ struct xe_reg_sr;
 
 /**
  * XE_RTP_ACTION_FLAG - Helper to add multiple flags to a struct xe_rtp_action
- * @f1_: Last part of a ``XE_RTP_ENTRY_*``
  * @...: Additional flags, defined like @f1_
  *
  * Helper to automatically add a ``XE_RTP_ACTION_FLAG_`` prefix to @f1_ so it
@@ -308,7 +306,6 @@ struct xe_reg_sr;
 
 /**
  * XE_RTP_RULES - Helper to set multiple rules to a struct xe_rtp_entry entry
- * @r1: Last part of XE_RTP_MATCH_*
  * @...: Additional rules, defined like @r1
  *
  * At least one rule is needed and up to 4 are supported. Multiple rules are
-- 
2.40.1

