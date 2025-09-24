Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAE3CAC5B9
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 01:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2140E10E6A5;
	Wed, 24 Sep 2025 01:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PRrvQzN4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8715A10E69D
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 01:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758676572; x=1790212572;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=TP0iJnmwk6AURwKgtwQ6T8UHsv9Kh3VRhsc01y3Q67s=;
 b=PRrvQzN4vYbFKmr3KPZgFOCFnPl+PFGreCXvhYdox/IgloAW0Wx5f3WJ
 QGmbeUQjisevzRMsmSoLL8LXLTmXacPAxcEGgpAcpnTPV5zIprfVojsg3
 hVRncvqoDX3omvjQJhxjFeq38SmP6LxGrqH3haKszLvjud+y1hVly2psZ
 rbiDBwL1GarK1bPqQCh+/YYCq37Dc3sC6LHFJoYPaFSHShxiHcdWnZpj6
 kiWQ/SDlO8RwvWWahDcApPXix4GvUrfk+KqiVcT1BHGO2L2z+2u158Uld
 2ZRa1Mc2xfJk+WP23/Rm2ekggjBQVqGTWB+FlOX2EVEoHYSg+Pu5uh13U w==;
X-CSE-ConnectionGUID: 6u6qTh6TRraDZq4P06j9og==
X-CSE-MsgGUID: WgtTVLeTT2e74cswxn6VAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60908289"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60908289"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:11 -0700
X-CSE-ConnectionGUID: dbhZW6rIRACNBMyTSHT7Sg==
X-CSE-MsgGUID: iMyFa9uxSDKe6ufWKVUM3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="207841811"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 29/34] drm/xe/vf: Workaround for race condition in GuC
 firmware during VF pause
Date: Tue, 23 Sep 2025 18:15:56 -0700
Message-Id: <20250924011601.888293-30-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924011601.888293-1-matthew.brost@intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
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

A race condition exists where a paused VF's H2G request can be processed
and subsequently rejected. This rejection results in a FAST_REQ failure
being delivered to the KMD, which then terminates the CT via a dead
worker and triggers a GT reset—an undesirable outcome.

This workaround mitigates the issue by checking if a VF post-migration
recovery is in progress and aborting these adverse actions accordingly.
The GuC firmware will address this bug in an upcoming release. Once that
version is available and VF migration depends on it, this workaround can
be safely removed.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index fa55e9c9de3a..794028c9d4b3 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1391,6 +1391,10 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 
 		fast_req_report(ct, fence);
 
+		/* FIXME: W/A race in the GuC, will get in firmware soon */
+		if (xe_gt_sriov_vf_recovery_inprogress(gt))
+			return 0;
+
 		CT_DEAD(ct, NULL, PARSE_G2H_RESPONSE);
 
 		return -EPROTO;
-- 
2.34.1

