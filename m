Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9369FC52D70
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 15:40:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5610E10E3B4;
	Tue,  6 Aug 2024 15:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a1U3LCu7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F104B10E3A7
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 15:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722958800; x=1754494800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iVw4S+D84T5ZV9xsg8Oiq38jZI6Gw8BAzt6wmi0QB74=;
 b=a1U3LCu7eqTxwCprO3mJU6edLx5hYoQExasw3qpChlB3+n5vIEldA42O
 F/Fru2v3Wy+KdZN2z+nzPvtAVKVaUUB5V6s8zXW9EkfQh93CCdZ3lRwae
 6neiYL740wYDm7bh0s0BNbDdYwhN2uRCGNg+kkyCorbMGseowDIsw61Zb
 y624i5D/n9QzAalWV0QZ3ieeAfWxoCttZuSQeyy/Q5IoOZnjmzVhOJE01
 w0qXVWvcFu9cha3Dx6Un90AYrxWYHCzaAp0KqvsT7dDnVKWPFkm+3kvr2
 YU3Cpj+ZVDAQPCWwEdOJcPYIPJswNO6Uie2pMhvHYRbKYdrkM9K0b4X13 g==;
X-CSE-ConnectionGUID: xXlVWVQeSQ+UWbfXtBMZSg==
X-CSE-MsgGUID: X+HQwe3YTViYRC3KWmhtrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="12886162"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="12886162"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 08:40:00 -0700
X-CSE-ConnectionGUID: 9hRGMS2iTYeWDqYBfWmKfA==
X-CSE-MsgGUID: 2IZZxWAXSfGf1qk5gzyKgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; d="scan'208";a="94117327"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 08:39:58 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 2/2] drm/xe: Add kernel doc for xe_hw_engine_lookup
Date: Tue,  6 Aug 2024 18:30:09 +0300
Message-Id: <20240806153009.1081382-2-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240806153009.1081382-1-mika.kuoppala@linux.intel.com>
References: <20240806153009.1081382-1-mika.kuoppala@linux.intel.com>
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

kerneldoc was missing from earlier commit where
we exported xe_hw_engine_lookup. Add it.

Fixes: 6f20fc09936e ("drm/xe: Move and export xe_hw_engine lookup.")
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index c7c44de7c30f..68180f1ff8a9 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1173,6 +1173,16 @@ static const enum xe_engine_class user_to_xe_engine_class[] = {
 	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
 };
 
+/**
+ * xe_hw_engine_lookup() - Lookup hardware engine for class:instance
+ * @xe: xe device
+ * @eci: engine class and instance
+ *
+ * This function will find a hardware engine for given engine
+ * class and instance.
+ *
+ * Return: If found xe_hw_engine pointer, NULL otherwise.
+ */
 struct xe_hw_engine *
 xe_hw_engine_lookup(struct xe_device *xe,
 		    struct drm_xe_engine_class_instance eci)
-- 
2.34.1

