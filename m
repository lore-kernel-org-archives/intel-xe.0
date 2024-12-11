Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53A7E7717D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 14:08:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D4B10E3EC;
	Wed, 11 Dec 2024 14:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GxlFncmt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8262F10E3EC
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 14:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733926114; x=1765462114;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L18QjPs2ZH/2VHdAskX0MXG+Q+bvm/xkdGjFh5TrycY=;
 b=GxlFncmtNGNx4XiEviBco+ieR/HrqyU3kcVKw+z5KLyf2COC097vEKz8
 xB3lTfRGT6pL7318L+wEcuizjJ0lagx3tYU49aeTMjQNhG3KC3XDqdDzK
 /bu920WR13RUxnRaL1LXVLZXONw8HuYKK8rzJW/4UwFayBZ9Ldy8YdDFt
 nE0nnvfOjZg9QKhYhxfkhTlLLo4ukCTxtb7pw2K+ORoR78tsMJPq8qV/U
 vjkwn6ZXpRUpvuZielMT4TPc+IhFJr0o+RlQrCGRsC8ZiKyosAQA92BeA
 q2h2Liv1cwCGQI/bCkf8FYvU86HxeDjstTf1yXG+XKiZeg0/XnRi2shj0 w==;
X-CSE-ConnectionGUID: 7QKnB67UTV6iyS3deAAGYw==
X-CSE-MsgGUID: kqOz//DoRvarsSuQVnMNyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="21890785"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="21890785"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 06:08:29 -0800
X-CSE-ConnectionGUID: SNybXWMPTUqn6AfVyqwxeg==
X-CSE-MsgGUID: vYyhqHMOTzeYhlCeXiiH/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133202718"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 06:08:27 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe/ptl: Add missing device ID
Date: Wed, 11 Dec 2024 19:43:06 +0530
Message-Id: <20241211141306.2156467-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
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

Probably during movement from xe_pciids.h to pciids.h PTL device id is missed.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 include/drm/intel/pciids.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index 32480b5563db..7883384acd5e 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -829,6 +829,7 @@
 	MACRO__(0xB092, ## __VA_ARGS__), \
 	MACRO__(0xB0A0, ## __VA_ARGS__), \
 	MACRO__(0xB0A1, ## __VA_ARGS__), \
-	MACRO__(0xB0A2, ## __VA_ARGS__)
+	MACRO__(0xB0A2, ## __VA_ARGS__), \
+	MACRO__(0xB0B0, ## __VA_ARGS__)
 
 #endif /* __PCIIDS_H__ */
-- 
2.34.1

