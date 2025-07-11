Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264E8C83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 21:49:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FF610EAC1;
	Fri, 11 Jul 2025 21:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XgR2pmkl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E36210EAC7
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 21:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752270564; x=1783806564;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P3kAO9HXFN/xTFvncAd8q0fwjd9XcmpumjwOzV7FvFs=;
 b=XgR2pmklNVZdXxP3j7uUIvEvfav8Fo4KeeJoa36glsYswAJ8TfadeOKO
 jXb+ut/asnGp89pybIhIyFbjakNbv7U18q5E8u8aHKKdMrXHNGK5nqkwq
 fz+A9YQSk06rQXtiEWZyLWQsQN9X0VMC/LM/rWY9U+ihXwEllIXDKccXl
 1TY5DyvVYUYVVfm8fuu1HTWtThpZW5PmIBt82M//1WlN4YoaUYy0RfuYN
 Hw9IOx2O8NW6E0/aYR64vzAQulwYfdUBgKMFbO9X9I28DoSBPkIWEjiBf
 fbHLzVNj9AQhPtHO6tFX7h/Si1h0vtKH4947/sxGEWUHehIxJYJrPDWNy A==;
X-CSE-ConnectionGUID: H5v87WUSTsK2rNoXfFyzlQ==
X-CSE-MsgGUID: CFiJf3TQRDu07XHzWsrvrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54730500"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="54730500"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 14:49:24 -0700
X-CSE-ConnectionGUID: 1p//Rs9MRUaB334jRN6E2Q==
X-CSE-MsgGUID: dieHDW8TRP6KKFfQnlkrUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="155873102"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 14:49:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH] drm/xe: Fix missing kernel-doc
Date: Fri, 11 Jul 2025 14:49:12 -0700
Message-ID: <20250711214911.2009714-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.49.0
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

Fix warning:

	Warning: drivers/gpu/drm/xe/xe_device_types.h:658 struct member 'wa_active' not described in 'xe_device'

Fixes: 661a6950e061 ("drm/xe: Add infrastructure for Device OOB workarounds")
Cc: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 61d3f473a7a61..1e6ecf1e6979f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -363,6 +363,7 @@ struct xe_device {
 		u8 skip_pcode:1;
 	} info;
 
+	/** @wa_active: keep track of active workarounds */
 	struct {
 		/** @wa_active.oob: bitmap with active OOB workarounds */
 		unsigned long *oob;
-- 
2.49.0

