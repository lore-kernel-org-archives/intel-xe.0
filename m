Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68BDCCD19F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 22:07:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5227310E901;
	Wed, 15 Oct 2025 22:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WfUQJECs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A477210E903
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 22:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760566031; x=1792102031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4j5dYhLzjKRPZV4iwdeYpYy9JWd6OWSPBwugQV0XG3Q=;
 b=WfUQJECs0mT/LgghPbaYFnqM3zdUUD9p/fLCvkwA9J+dAkz2YObx21pz
 5EnK9FjTWSQu5+ARnyGLmNM7C4M6FJCmusfYDpg4YA/RsYnaFQ60LPKcE
 akL7Y8SqIioeElzxwp3BoHlRyAr+im8GsyiwbmorZgWuliJo4JaEQr7Tx
 oaK7nNTG4EMkqatynXGL2Nb3w8WJcciwr1D/9yhFs0Kd6q4oqUAtD8rqZ
 +hhrXQFIt2jqCo2+hDGxpY2nfbC+k+KLxNbw0AGZa54JHTJk4BBJfNjCU
 RlSZONQlb4OfXXCfm4yCC0AnMwnoZ4RbRNhyKI5wxbJvB+ecbJY7Su5B3 w==;
X-CSE-ConnectionGUID: ULYphUysR6a84ILUO2NZGQ==
X-CSE-MsgGUID: NX8CqVAeRE65TpVvDB19oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62794058"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="62794058"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
X-CSE-ConnectionGUID: /T3J14ZHQ3CTRL+N/1Ps0A==
X-CSE-MsgGUID: vEfZYxIBQS2YePmFiaJyEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="186298300"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 15:07:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v2 13/22] drm/xe/nvls: Attach MOCS table for NVL-S
Date: Wed, 15 Oct 2025 15:06:28 -0700
Message-ID: <20251015-xe3p-v2-13-b9189b3056a2@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
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

The MOCS table for NVL-S is the same as that of
Xe2.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
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

