Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACC0C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 04:20:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0751C10E3D2;
	Thu, 23 Jan 2025 04:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Khmm+bYj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983A910E147
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 04:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737605989; x=1769141989;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sU2zceit82BkL6W3a8LC3UYg5h23YrZLnJeaoynkC5k=;
 b=Khmm+bYjtDWE3yNWj3WYrKAyhik2laq8n2snQTj+sRh8pzdpUzjBlbDP
 s3op9CEqpPIJdRNOTMgp8CyMXe/vvwP8vElt4tm8lubJ3vT8i37LwP5sd
 V20nBO6UtldFfocUIxwYbdzhoVSbJaUq6lgSiZ3pD5W+OBwwp+stHvaih
 qtQ7LH5UaJqKFqWnmmrQy6XQlBnxbgQcwwbbrwNNb+ngF8oSvRKp+8lC9
 /uufpCNQKmcrP/nRc0CODhx44SW4qsn82kiFaLBrMgIXmWtU9A4iyz6KY
 VbwH0oM2eSMuCT+rJfmUrNY4hN65YBa9Fx4pr+cavyehBM6bgkXghqiLs w==;
X-CSE-ConnectionGUID: EGCtNL0iT2eQDPUrdGgfoA==
X-CSE-MsgGUID: BnezTRj5Qa68hkP9onexJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37971645"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="37971645"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 20:19:48 -0800
X-CSE-ConnectionGUID: oQ7493TiSVOMxlqZiH6gSg==
X-CSE-MsgGUID: acXVC5u3Q+OYV4MnwGZUbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107202058"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 20:19:47 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 linux-perf-users@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v15 2/6] drm/xe/pmu: Assert max gt
Date: Wed, 22 Jan 2025 20:19:19 -0800
Message-ID: <20250123041923.1892837-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250123041923.1892837-1-lucas.demarchi@intel.com>
References: <20250123041923.1892837-1-lucas.demarchi@intel.com>
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

XE_PMU_MAX_GT needs to be used due to a circular dependency, but we
should make sure it doesn't go out of sync with XE_PMU_MAX_GT. Add a
compile check for that.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index b3da3863928af..df93ba96bdc1e 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -249,6 +249,8 @@ int xe_pmu_register(struct xe_pmu *pmu)
 	int ret = -ENOMEM;
 	char *name;
 
+	BUILD_BUG_ON(XE_MAX_GT_PER_TILE != XE_PMU_MAX_GT);
+
 	if (IS_SRIOV_VF(xe))
 		return 0;
 
-- 
2.48.0

