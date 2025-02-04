Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8771AC02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 18:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B7F10E044;
	Tue,  4 Feb 2025 18:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dotpiddt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F2910E044
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 18:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738692337; x=1770228337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n/MgSvQwnlaj+0au0P/uNwSCSmpG0+tCR7tLaWvM7qA=;
 b=Dotpiddt8coOCHyyCzbWyJQx52dTDujOPN6S/OKpucW21K2e8Brm9E7m
 KliBkypG0icXU6/QASd3eU5iLUQHKoWChegXX8P0y0m2d793Oq2bT7E1U
 EPGP6h+988yrKsxDMrXnRghk+WTdIcCZvtI5CrGx2D/C0FYM7lEUnJ0fB
 i06v+Te+jzQvIBooaxKadaB3Nl9dHhQ5AYln/6zmFFjxd+W5T8hvKXWu5
 QAct749OaY4UXOIMhZqTGev0gIfs+KHha5nL0mQNTtFAuRVGRO7kQMSVR
 sjrKvyQqhGTqY7hbYSmyJ6wpXEP4cZQX6NjC9Iq3CfmVqLB2AnXrIH0s4 g==;
X-CSE-ConnectionGUID: m2MT/tU1TIOZhrWTnqk1VQ==
X-CSE-MsgGUID: IQDOwikVR/akY0AqkRUIZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50651341"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50651341"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 10:05:37 -0800
X-CSE-ConnectionGUID: zGnBO7YcQOyJ8QJ5+1aKzQ==
X-CSE-MsgGUID: FQr+BKSXS7uEFC+HCg4ZcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="115701632"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.83.184])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 10:05:35 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 1/3] drm/xe/vf: Return EOPNOTSUPP for
 DRM_XE_DEVICE_QUERY_ENGINE_CYCLES if VF
Date: Tue,  4 Feb 2025 19:05:20 +0100
Message-Id: <20250204180522.2327214-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250204180522.2327214-1-marcin.bernatowicz@linux.intel.com>
References: <20250204180522.2327214-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

RING_TIMESTAMP registers are not available for VF (Virtual Function)
drivers. Return -EOPNOTSUPP when the DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
ioctl is invoked on a VF device.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index c059639613f7..69b0f1478d7d 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -120,6 +120,9 @@ query_engine_cycles(struct xe_device *xe,
 	struct xe_gt *gt;
 	unsigned int fw_ref;
 
+	if (IS_SRIOV_VF(xe))
+		return -EOPNOTSUPP;
+
 	if (query->size == 0) {
 		query->size = size;
 		return 0;
-- 
2.31.1

