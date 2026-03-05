Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57967F30957
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 12:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1659910E2A3;
	Thu,  5 Mar 2026 12:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Of9Ctp0w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C586210E295
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 12:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772713173; x=1804249173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fFOfGxID7117Jejg+3Jm88/NpmLv+7bgRyi7xOBJ0+0=;
 b=Of9Ctp0wAIuYkOs5TYLDu+8C7VfvI4zrdmQdTDC8VRPlQ/ZFaxoBDySJ
 +1jn7fT34pELA/ykYhaIx/T9e8z8ODP4GE/k/jvDL8KqwSgrbi+KpPHe+
 vANGyrtH0jbKSktxo3LxxFQpslTyeFXfXZwvh8hMCCREvpMx5X4R+MFX5
 8GOy68s2bkhK0AwpPayVxYN1XsKHe/lKlJ8+FohY2+WA6oJClX0S9h9O2
 F+9QXbjbeVFQSL6zwDBOPyubXbo85bCykDnmkFzgHKp5C7r++o+axWnmm
 OXNVVEgo42JyWXMufczEs1Ohz5GZDJFrLLc2qHPw4lCkakhIe+BPnZcf1 A==;
X-CSE-ConnectionGUID: oLhAYeMaQm2G1K/Q5Z2gNQ==
X-CSE-MsgGUID: 4xSZ47rpR/KcMufOkN3Jtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91370975"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="91370975"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 04:19:32 -0800
X-CSE-ConnectionGUID: jI0E4hYKRb678UnYssQV/w==
X-CSE-MsgGUID: 1DkPWY9iQkOwwSEB4Ukoag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="217904745"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 04:19:30 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 carl.zhang@intel.com, jose.souza@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V6 4/4] drm/xe/xe3p: Skip TD flush
Date: Thu,  5 Mar 2026 17:49:07 +0530
Message-ID: <20260305121902.1892593-10-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305121902.1892593-6-tejas.upadhyay@intel.com>
References: <20260305121902.1892593-6-tejas.upadhyay@intel.com>
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

Xe3p has HW ability to do transient display flush so the xe driver can
enable this HW feature by default and skip the software TD flush.

Bspec: 60002
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 94c9f17da4b4..0dca20133b94 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1166,6 +1166,14 @@ void xe_device_td_flush(struct xe_device *xe)
 {
 	struct xe_gt *root_gt;
 
+	/*
+	 * From Xe3p onward the HW takes care of flush of TD entries also along
+	 * with flushing XA entries, which will be at the usual sync points,
+	 * like at the end of submission, so no manual flush is needed here.
+	 */
+	if (GRAPHICS_VER(xe) >= 35)
+		return;
+
 	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
 		return;
 
-- 
2.52.0

