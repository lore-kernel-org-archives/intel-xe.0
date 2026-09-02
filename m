Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E310C624D4
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 19:59:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B524D10E087;
	Wed,  2 Sep 2026 19:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jq+fAMXD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B34310E087
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 19:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788379139; x=1819915139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DZVEZhJOLROuYlcS0C66HtBBxzGH0yYOpYG4e0ZIEOw=;
 b=jq+fAMXDAGuMda/vuRHAiv4w85lBBGzyOKExJe5BTOPHcAlWJ1+q5h2p
 e+s1g1ZdBcHN6IhXg23F91RZjPSVpV8tERJt91Ik5FAlVF6kWJB8E2O5C
 b9lXMddf0M2ACfno4FNgrSJimO5SPLDkyHxF5NtqZkbuQbaM9DkuY1LV/
 TD/vKltjBUpSswZDCS8TnpInT3vT6f9tqf0A9aT/aOllmG3LR0YDhWhpq
 b8CClPcIvCT64CUnpOzHTSvnxyePP2lFWmToO+H8A7Bq+k/UGirsD5HSR
 fOjRRTPs0BHRFUWMP60FoM7FiWKovMLl4ql0+bb6B6QaAV48knvLBiLWb g==;
X-CSE-ConnectionGUID: AL/MucT/SWinaA5ATZycFQ==
X-CSE-MsgGUID: nfru7xiKQ4q7os4la/khuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="106216467"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="106216467"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 12:58:58 -0700
X-CSE-ConnectionGUID: opZysU4VS1OJ1H0uOndEeg==
X-CSE-MsgGUID: OltoDtGfRz+Uj+HOj0k4hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="266265693"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 12:58:56 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: alex.zuo@intel.com, jonathan.cavitt@intel.com, michal.wajdeczko@intel.com,
 raag.jadav@intel.com, andi.shyti@linux.intel.com, jani.nikula@intel.com
Subject: [PATCH v6 1/3] drm/xe/printk: Add xe_warn_once()
Date: Thu,  3 Sep 2026 03:58:49 +0800
Message-ID: <20260902195851.306669-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902195851.306669-1-jonathan.cavitt@intel.com>
References: <20260902195851.306669-1-jonathan.cavitt@intel.com>
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

Create a wrapper function xe_warn_once() that calls drm_warn_once().

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_printk.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_printk.h b/drivers/gpu/drm/xe/xe_printk.h
index 87f51d7edfa8b..79db1f78e822c 100644
--- a/drivers/gpu/drm/xe/xe_printk.h
+++ b/drivers/gpu/drm/xe/xe_printk.h
@@ -27,6 +27,9 @@
 #define xe_warn(_xe, _fmt, ...) \
 	xe_printk((_xe), warn, _fmt, ##__VA_ARGS__)
 
+#define xe_warn_once(_xe, _fmt, ...) \
+	xe_printk((_xe), warn_once, _fmt, ##__VA_ARGS__)
+
 #define xe_notice(_xe, _fmt, ...) \
 	xe_printk((_xe), notice, _fmt, ##__VA_ARGS__)
 
-- 
2.53.0

