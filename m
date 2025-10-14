Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A78DCCD18D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 03:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84F910E52A;
	Tue, 14 Oct 2025 03:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aI0nIQZ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8656C10E129
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 03:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760412330; x=1791948330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WQuBkVg+xhlb4yHkNMt1R0pI5FJIPCKExZl7nSvWuXk=;
 b=aI0nIQZ/cuDQO1xsY2v486QdmvfmyWTD1yeOOMpPX9/wAdsIwnY5lyRA
 C0LdJBZB7tQs1DBq4WuA9+YnH0hWwqARwBdYNGf2LQf44TLtyoWFYj1+k
 C56szywS+IaBkXWPdJJB4dJErM6zGP7Our7QGf9VeU/8ry9mI6lDDxEVu
 QsnLw67buIyyiCZjlEULjxnXqVzT8jkrRH+c/Ia6usglKuEE+FiapRs5l
 qzHKjlxqqFAu4lX962ZTQRZADbRxo76LlVJs59lvgFjzXM32EHPLQfi+y
 aO+oL1hWgIVLObDUtN7vcc7Ywc2G99TguF2Y/TgwxvDUTEmulzrNUZDT8 g==;
X-CSE-ConnectionGUID: N1OzFJtBQCqq9Onyt8xF0Q==
X-CSE-MsgGUID: 8vJdn4b2Sm+VB4+W8Vh3Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66414880"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="66414880"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:30 -0700
X-CSE-ConnectionGUID: FhDW94PWTqeqKc2DaOuERQ==
X-CSE-MsgGUID: OlS0hTmFQeir4AcYZptUvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181567314"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 16/23] drm/xe/nvls: Attach MOCS table for NVL-S
Date: Mon, 13 Oct 2025 20:24:48 -0700
Message-ID: <20251013-xe3p-v1-16-bfb74f038215@intel.com>
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

From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

The MOCS table for NVL-S is the same of Xe2.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 7b68c22ff7bbc..e8ec4114302e5 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -576,6 +576,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 	memset(info, 0, sizeof(struct xe_mocs_info));
 
 	switch (xe->info.platform) {
+	case XE_NOVALAKE_S:
 	case XE_PANTHERLAKE:
 	case XE_LUNARLAKE:
 	case XE_BATTLEMAGE:

-- 
2.51.0

