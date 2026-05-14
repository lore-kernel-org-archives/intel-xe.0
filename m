Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2243ACD4F25
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 15:00:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC46E10E5CF;
	Thu, 14 May 2026 15:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YuUgieGP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A73F10E5CF
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 15:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778770824; x=1810306824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kpac3ypHxGW60Eoz3liYkv4ETxZrarLgsrhKRDOAeB0=;
 b=YuUgieGPX1E2HHr3E1W+1wiidDGpABXXu+Gfy6MYHyJdqXqEK5W6QZ8B
 J328/MFz1OqhOH63LKvlEhF+Z39QMbenHHyO1z7XNkfZYgMpenGqx0jDm
 4ZNiCZXklZnFtd2rz91zQScTMePE38RO72C2QasXgqeb7aYxIzSUoPfHp
 YmLSJaplF8i4nnI5y01jBQ+hewUCLaXILyWaMk1TUCEBG7ZZIVLlI/Ia3
 gyrl5et2sPknpiSpZSgm7QgeJ0gXzvhVrtn7Zioc0AU9K5DPx4Q0qCko8
 zYtm5p/pcOhfIzx+RPFf02tmbJCooEsu0jb9bdKiyTbTFto9Vh0B0hIDu A==;
X-CSE-ConnectionGUID: sH2JayTwSieJ+y1izRF3jA==
X-CSE-MsgGUID: eFZfBI6STD+acDCLzAM7gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="91178821"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="91178821"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 08:00:23 -0700
X-CSE-ConnectionGUID: ETc4EX5FT7i+mVrU5pp4lw==
X-CSE-MsgGUID: d7qaYrGHToufstZZMLiKvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="262152855"
Received: from johnmoon-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.112.169])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 08:00:22 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Ilia Levi <ilia.levi@intel.com>
Subject: [PATCH 2/9] drm/xe/memirq: Make page layout macros private
Date: Thu, 14 May 2026 17:00:03 +0200
Message-ID: <20260514150010.7123-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260514150010.7123-1-michal.wajdeczko@intel.com>
References: <20260514150010.7123-1-michal.wajdeczko@intel.com>
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

There is no need to expose the macros describing memory-based
interrupts page layouts in the .h file as we only use them in
the private code. Move them to the .c file near the kernel-doc.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c       | 7 +++++++
 drivers/gpu/drm/xe/xe_memirq_types.h | 7 -------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 3848ff81c1f9..118c2285e893 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -152,6 +152,13 @@ static const char *guc_name(struct xe_guc *guc)
  *
  */
 
+/* ISR */
+#define XE_MEMIRQ_STATUS_OFFSET(inst)	((inst) * SZ_4K + 0x0)
+/* IIR */
+#define XE_MEMIRQ_SOURCE_OFFSET(inst)	((inst) * SZ_4K + 0x400)
+/* IMR */
+#define XE_MEMIRQ_ENABLE_OFFSET		0x440
+
 static inline bool hw_reports_to_instance_zero(struct xe_memirq *memirq)
 {
 	/*
diff --git a/drivers/gpu/drm/xe/xe_memirq_types.h b/drivers/gpu/drm/xe/xe_memirq_types.h
index 9d0f6c1cdb9d..02ac938cadb4 100644
--- a/drivers/gpu/drm/xe/xe_memirq_types.h
+++ b/drivers/gpu/drm/xe/xe_memirq_types.h
@@ -10,13 +10,6 @@
 
 struct xe_bo;
 
-/* ISR */
-#define XE_MEMIRQ_STATUS_OFFSET(inst)	((inst) * SZ_4K + 0x0)
-/* IIR */
-#define XE_MEMIRQ_SOURCE_OFFSET(inst)	((inst) * SZ_4K + 0x400)
-/* IMR */
-#define XE_MEMIRQ_ENABLE_OFFSET		0x440
-
 /**
  * struct xe_memirq - Data used by the `Memory Based Interrupts`_.
  *
-- 
2.47.1

