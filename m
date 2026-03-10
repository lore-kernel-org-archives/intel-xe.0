Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571C4FD88CC
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 22:50:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B4710E796;
	Tue, 10 Mar 2026 22:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VaUPXcHn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BC210E78F
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 22:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773183044; x=1804719044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CCohocB8mU+UKXhQOgjuJJzp/M1ULH/IMXj9VkhA6iE=;
 b=VaUPXcHnc6gjeld+xEYnaCBvWPu9p/k4tn4a3cjHtaRlPsDel5OqzTzE
 GV/QIVS1h6p2YHC7L4FoSK/kjW1EgUy6RXSKw5bxKtThXURp4r3d2LUZU
 gyWcIervPwhucz+t5JwJjwvynH91y7vracKUet/orIpjknh6phmc4Srd2
 J62m2MhXXLdBgQyL2a4n5r+j99lsgijw4EM+AYFbhzOL7aaXdW22rhmTT
 97yRUa5hG7ULZj2/MWN+iEMSsWkmvMYUvgVwFSqIDrb2Mm2pDA+U4slnq
 geuGkqlheEBZb1GEadceZ56n2Tr7iHGQjntM3Bth8H5Du2KgYC2iBDVQb w==;
X-CSE-ConnectionGUID: rKgVuQK2QWqlq4ESPqsO7Q==
X-CSE-MsgGUID: 4wD5oQftQIy+TR7C9W4I9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="61817887"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="61817887"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 15:50:43 -0700
X-CSE-ConnectionGUID: 73UP1crSQW+NZZE/dGAOng==
X-CSE-MsgGUID: YvyaAG6dSbGo9lpAAHtrsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="220441001"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa007.jf.intel.com with ESMTP; 10 Mar 2026 15:50:41 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v9 5/7] drm/xe/guc: Ensure CT state transitions via STOP
 before DISABLED
Date: Tue, 10 Mar 2026 18:50:37 -0400
Message-Id: <20260310225039.1320161-6-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310225039.1320161-1-zhanjun.dong@intel.com>
References: <20260310225039.1320161-1-zhanjun.dong@intel.com>
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

The GuC CT state transition requires moving to the STOP state before
entering the DISABLED state. Update the driver teardown sequence to make
the proper state machine transitions.

Fixes: ee4b32220a6b ("drm/xe/guc: Add devm release action to safely tear down CT")
Cc: stable@vger.kernel.org
Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 496c6c77bee6..3b1c03743f83 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -352,6 +352,7 @@ static void guc_action_disable_ct(void *arg)
 {
 	struct xe_guc_ct *ct = arg;
 
+	xe_guc_ct_stop(ct);
 	guc_ct_change_state(ct, XE_GUC_CT_STATE_DISABLED);
 }
 
-- 
2.34.1

