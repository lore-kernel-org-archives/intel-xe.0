Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B047C021B3
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 09:47:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5163F10E4BA;
	Thu, 20 Feb 2025 09:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QeA9vCOJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1331610E4BA
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 09:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740044852; x=1771580852;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xAaFYLNkjxpsFCEQ6HKuIuus2QUFcWT5RN/N3kMLDFY=;
 b=QeA9vCOJAj9yOwXrAHZWES9r3GxrfwUVhe0PgIT+G9Y1XvJ4zC/37ZEv
 EDc39QddDXtIKjmJvmqSLHbmjvHc4BdIFP/rzmwheNJLhJkmRP3xzHfIs
 caaP/eU7hGqUz1KI0C2qR10PCeT6JcKYEiKmIR/0EJeEeVqnVuUP+zM9D
 HMH0uHfX+Uz8LQukRm9cOgUXwIZfdJ4x1zMyEMh3qCz1X/3QqTyZ8r47o
 Oe3i+YrkoV82Y7YMS4xsyNi/rkrXimvDGCXLTiT+Rmn0fHzxXLfPXaAo1
 wzurPdeU/6kq/LL/Sw5cFU4dlq7zs2dzSUxUZII2z5KIgnQlDTtEN4RqZ A==;
X-CSE-ConnectionGUID: t+/qEoipQMeRepKw5d17GA==
X-CSE-MsgGUID: BUgnMR+gTVa9bYuzHot3ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40004629"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="40004629"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 01:47:17 -0800
X-CSE-ConnectionGUID: A0r4gxZJTQ+a8RV1SiZuug==
X-CSE-MsgGUID: zv/WYBZbTg6zwli0CtB5Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120215732"
Received: from unknown (HELO aradhyab-desk.iind.intel.com) ([10.190.216.90])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 01:47:15 -0800
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: [PATCH v5 0/2] drm/xe: Add and refactor workarounds
Date: Thu, 20 Feb 2025 15:16:43 +0530
Message-Id: <20250220094645.358647-1-aradhya.bhatia@intel.com>
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

Hello,

This patch series adds the workarounds, Wa_16021333562, and Wa_14016712196.
It further refactors  Wa_18013179988, Wa_14015568240, Wa_1508761755, and
Wa_1509372804, to use the newer macro, XE_WA(), for OOB workarounds,
instead of selection based on platform labels.

Thanks,
Aradhya

---
Change Log:
V5:
  - Rename LRC_PPHWSP_SCRATCH_ADDR to LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR
    in the WA implementation, as the name has gotten updated in commit 
    f0c06677d110 ("drm/xe/pxp: Add VCS inline termination support"), in
    patch 1/2, as reported by Lucas De Marchi.
  - Move the Wa_14016712196 diff chunk above all the flags and calculations
    for better clarity in patch-1/2, as recommended by Lucas De Marchi.
  - Add R-b tags of Tejas Upadhyay in patch-1, and Lucas De Marchi in
    patch-2.

V4:
  - Combine Wa_16021333562 condition check with another workaround in
    patch-1, as suggested by Tejas Upadhyay.
  - Fix the offset value for the pipe control emit for Wa_14016712196 in
    patch-1, as suggested by Tejas Upadhyay.
  - Add Tejas Upadhyay's R-b tag for patch-2.

V3:
  - Fix the applicable Gfx platform ranges for WAs, in patches 1, and 2.
  - Add more WAs for refactoring in patch-2, and reword it accordingly.

V2:
  - Add new patch (patch-2/2) which involves refactoring the WA
    implementation as suggested by Lucas De Marchi.
  - Expand the ranges of Wa_16021333562 and Wa_14016712196 as per WA
    database, in patch-1/2, and in that process add the WAs properly
    instead of porting them for a select few platforms.
  - Reword the commit subject and commit text in patch-1 accordingly.

Previous Revisions:
V1: https://lore.kernel.org/all/20250115080048.2282183-1-aradhya.bhatia@intel.com/
V2: https://lore.kernel.org/all/20250116091004.3060996-1-aradhya.bhatia@intel.com/
V3: https://lore.kernel.org/all/20250120060916.778406-1-aradhya.bhatia@intel.com/
V4: https://lore.kernel.org/all/20250130055939.282988-1-aradhya.bhatia@intel.com/

Aradhya Bhatia (2):
  drm/xe: Add Wa_16021333562 and Wa_14016712196
  drm/xe/oa: Refactor WAs to use XE_WA() macro

 drivers/gpu/drm/xe/xe_guc_ads.c    |  2 +-
 drivers/gpu/drm/xe/xe_oa.c         | 30 +++++++++---------------------
 drivers/gpu/drm/xe/xe_ring_ops.c   |  4 ++++
 drivers/gpu/drm/xe/xe_wa_oob.rules |  9 +++++++++
 4 files changed, 23 insertions(+), 22 deletions(-)


base-commit: a1e5b6d83e03d60d15ba393cbbd7d5c13e5cf0b3
-- 
2.34.1

