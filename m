Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2B0D6E2AA
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 15:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB36910E950;
	Thu, 18 Dec 2025 15:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iCKpN6Zw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6DB10E84E
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 15:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766072130; x=1797608130;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kbHKWIOBGfvNsy1WP9+WqzCst0+VhUcKfY282xDBwjk=;
 b=iCKpN6ZwznKPHc4Xbczyr54ObqHGQwcj4QO6/Sq//cckE/VFRziAf3Vh
 aF0bvtjmjgGFRqRn6fYJAJW0DMosH87SRCKS3E4wC6+c44OcJ2bPVrNXZ
 7LTV5HHBKmaVaOezMvwB0OxonPMuLWXjjMW0otvmTm61gRuAZgQ5JXl0k
 o4AYBbGX4MW7rgRTpvbBMywRnF5kwvIR/qAKf2KkG2cLgLy3FqEkQr6t/
 4I1e5UKE3wFe8LSvgGwiwNfVQhZI8lCCEiE7XB6vp8PLjqShKP+tHl+0S
 6Yg21kORns/91ORPIMmFk5WFXzrGXXQ+Tf9PhQ0lVPxNqeDazFeqyk5Vr g==;
X-CSE-ConnectionGUID: HyHxQqARSJeolilg1Lvs9w==
X-CSE-MsgGUID: VR5463tFTqaGQPV51gGuuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67906270"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="67906270"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 07:35:30 -0800
X-CSE-ConnectionGUID: PDtSLPTTT5ubG17dHHn+BQ==
X-CSE-MsgGUID: tpVQAt0USTe6tdjBSLFrBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="236042214"
Received: from dut4086lnl.fm.intel.com ([10.105.10.207])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 07:35:29 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, daniele.ceraolospurio@intel.com,
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH 0/6] drm/xe/xe_guc_ct: Prevent compiler read/write
 optimization breaks
Date: Thu, 18 Dec 2025 15:35:28 +0000
Message-ID: <20251218153527.6436-8-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

Use READ_ONCE and WRITE_ONCE when operating on ct->state and the
g2h_fence->done values to prevent the compiler from ignoring these
necessary operations.

v2: (Matt Brost)
- Add Fixes tags
- Add comments

v3:
- Split into multiple patches (Rodrigo Vivi)

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Jonathan Cavitt (6):
  drm/xe/xe_guc_ct: WRITE_ONCE g2h_fence done in g2h_fence_cancel
  drm/xe/xe_guc_ct: WRITE_ONCE g2h_fence done in parse_g2h_response
  drm/xe/xe_guc_ct: WRITE_ONCE ct state in guc_ct_change_state
  drm/xe/xe_guc_ct: READ_ONCE ct state in xe_guc_ct_initialized
  drm/xe/xe_guc_ct: READ_ONCE ct state in xe_guc_ct_enabled
  drm/xe/xe_guc_ct: Justify WRITE_ONCE/READ_ONCE usage

 drivers/gpu/drm/xe/xe_guc_ct.c | 14 +++++++++++---
 drivers/gpu/drm/xe/xe_guc_ct.h |  6 ++++--
 2 files changed, 15 insertions(+), 5 deletions(-)

-- 
2.43.0

