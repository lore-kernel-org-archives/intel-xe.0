Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FC7C982DA
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 10:06:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F4D10F2B7;
	Fri, 18 Sep 2026 10:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HpU212FY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F0410F2B7
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 10:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789725956; x=1821261956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/BMr5QWbRjNvoKxN9IZqV+TgEQE04Iq0C0qsHIGTZL8=;
 b=HpU212FYqEeQkDi7ekWLDZ+qRUr46FP5shA0g7bm2PQMUeqBsHjB+3nn
 qBXrQ7IjU81GyTni6WzEZtaeDKKYLkdpCMsqtajGnhGR+PTWwA0zgmE9f
 y/Vv/ZADWCNlJIW2LhG/j76xGoQrwY14sp2Ejvhha9zDbofzBWyvvQDqb
 XgQnacUeEFlpfx/vjG9e/3LQzWqWLrW/FspBhdEyroVzdijT1IZTYSkd2
 WttkPC4c+kfux04fogDohmvg+UtiLlYWZ1W+RpkhYPVODI3UHS+6VIlcz
 XvugrkWIMFSLbvNT81r717OaE8q75lSGKIlGA2ZyfO+/KbEMDJ6vC3cEn g==;
X-CSE-ConnectionGUID: VV4JEEw/RiuwfwjmNNTymw==
X-CSE-MsgGUID: SrrrrB0RSey6o5LYSiMrmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="737239"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="737239"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 03:05:56 -0700
X-CSE-ConnectionGUID: VvBClfXcS5Kclp+HSsE0hg==
X-CSE-MsgGUID: /hVG++VGR9y5kVPD+0idoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271003592"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by fmviesa007.fm.intel.com with ESMTP; 18 Sep 2026 03:05:54 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v9 09/10] drm/xe/ggtt: Add KUNIT stub for xe_ggtt_shift_nodes()
Date: Fri, 18 Sep 2026 15:35:33 +0530
Message-ID: <20260918100533.567225-21-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918100533.567225-12-satyanarayana.k.v.p@intel.com>
References: <20260918100533.567225-12-satyanarayana.k.v.p@intel.com>
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

Allow to replace xe_ggtt_shift_nodes() with a stub so that VF GGTT
provisioning can be exercised on the fake xe device, which has no real
struct xe_ggtt instance.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 2557e51bb7cc..082a6bbef01c 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -5,6 +5,7 @@
 
 #include "xe_ggtt.h"
 
+#include <kunit/static_stub.h>
 #include <kunit/visibility.h>
 #include <linux/fault-inject.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
@@ -654,6 +655,8 @@ static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
  */
 void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
 {
+	KUNIT_STATIC_STUB_REDIRECT(xe_ggtt_shift_nodes, ggtt, new_start);
+
 	guard(mutex)(&ggtt->lock);
 
 	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
-- 
2.53.0

