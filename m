Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D581ACCD193
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 16:48:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7169610E203;
	Tue, 14 Oct 2025 16:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="loeezLQm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C413410E668
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 16:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760460482; x=1791996482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BE4zIUOQtl4jvLoSVADAEl2NfRFNO85z7rlNBhYd8Cw=;
 b=loeezLQmaKAL1L67h5jYAkgR6vGA4idHTzjMyxZjLLwdszO6wHjZq4+b
 7O/WzmtNLYCWr5kWpCRugctoJ9NqlpWW6GASnz1soG5cRus6Fkp6P3o2C
 ivtHYEJUiAFbsk4Wbh0LXXjo5K17tqV1VOAFrgK1clpfpNqGDE24DinpW
 6s0TabR940JZWFCBxyd5dBNbift8cIYrxPPIlUoPMyDjqNdAbOFp5G5EY
 cHfKEWEw8MIPjNVphTQFr1Cb1EIm2L3RKxWMx+Y1KXvN8fuDLNTcjwEi3
 ciIL2tRz3Zts4DdUIr56dnSfodILQUmRlRvODqHnGoHIpjcZ9KXLNxqA7 A==;
X-CSE-ConnectionGUID: 46HSLTsWT2ujFeR++0cxrQ==
X-CSE-MsgGUID: WQdJFneaTZidpq/tYis4Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="80063045"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="80063045"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:48:01 -0700
X-CSE-ConnectionGUID: a+SWAHSFQW2Y+wOGs4lDmA==
X-CSE-MsgGUID: /gf8ApCCSUWcn7ejRTtLfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="186184687"
Received: from dut4443lnl.fm.intel.com ([10.105.8.76])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:48:01 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 rodrigo.vivi@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH v3 3/7] drm/xe/xe_device: Reintroduce xe_device_get_gt
Date: Tue, 14 Oct 2025 16:48:02 +0000
Message-ID: <20251014164758.125598-12-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014164758.125598-9-jonathan.cavitt@intel.com>
References: <20251014164758.125598-9-jonathan.cavitt@intel.com>
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

Reintroduce the function xe_device_get_gt, as it was earlier renamed to
xe_device_lookup_gt.  It performs the same functionality as
xe_device_lookup_gt, but it guarantees the xe_gt pointer returned is not
NULL using an assertion.

Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 807db49a5306..af9476879454 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -97,6 +97,21 @@ static inline struct xe_gt *xe_device_lookup_gt(struct xe_device *xe, u8 gt_id)
 	return gt;
 }
 
+/**
+ * xe_device_get_gt() - Same as xe_device_lookup_gt, but return must not be NULL
+ * @xe: The XE device to search
+ * @gt_id: The ID of the GT to search for
+ *
+ * Returns a pointer to the xe_gt struct with the given gt_id.
+ */
+static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
+{
+	struct xe_gt *gt = xe_device_lookup_gt(xe, gt_id);
+
+	xe_assert(xe, gt);
+	return gt;
+}
+
 /*
  * Provide a GT structure suitable for performing non-GT MMIO operations against
  * the primary tile.  Primarily intended for early tile initialization, display
-- 
2.43.0

