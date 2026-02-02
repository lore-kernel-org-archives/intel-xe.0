Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409D6E7314E
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 10:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0172810E45F;
	Mon,  2 Feb 2026 10:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OGxgj/ld";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E67210E460
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 10:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770029651; x=1801565651;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eLQq3Nj02UH2micafNV+YEyQNe3Imgc6ET0a9tWxXv4=;
 b=OGxgj/ldMMzgMjejrj08LZbD6YF/U+iGure3o9lCtp4NyAKnPfxgYjF3
 nsEoBmQYHNlzlNEmOneG8MLhivT0oZPgBEnwLiIDsgzjRKwVm+wUI1EYi
 qxDW3kEACwJsB/71ifk31tEsQ9bTCnaPzJxRM/obir+8AxT09geCib6bO
 mN+oUD+eE58vAsITMexZXvyHWRJJYVlQx4uP+AjXKuWJFgVyoqHvd/6qv
 p9FpfATheg/o0UVXd9zZAKLfKwMpd5chf55UglCXlCK1rc3GLSrKGFQFr
 P3sgO/7VVRXlnWfY5ewRUPMQYYpvwfxhuoxSjPnx0czmtjT+G1alOg4tK w==;
X-CSE-ConnectionGUID: k37dRGDLTpy0BWL1rPmZNw==
X-CSE-MsgGUID: PA0X91nZRq6DGX9n9A/nnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71347926"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="71347926"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 02:54:10 -0800
X-CSE-ConnectionGUID: FJYWnMXxR56uWupCitPoMw==
X-CSE-MsgGUID: +uE54a6DQhetcT1v6aY+dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="208592131"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 02:54:07 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 daniele.ceraolospurio@intel.com, nishanth.p.reddy@intel.com,
 rodrigo.vivi@intel.com, matthew.d.roper@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v4 0/1] drm/xe/guc: Add Wa_14025883347 for GuC DMA failure on
 reset
Date: Mon,  2 Feb 2026 16:23:14 +0530
Message-ID: <20260202105313.3338094-3-sk.anirban@intel.com>
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

Prevent GuC firmware DMA failures during GuC-only reset by disabling
idle flow and verifying SRAM handling completion. Without this, reset
can be issued while SRAM handler is copying WOPCM to SRAM,
causing GuC HW to get stuck.

v2: Modify error message (Badal)
    Rename reg bit name (Daniele)
    Update WA skip condition (Daniele)
    Update SRAM handling logic (Daniele)
v3: Reorder WA call (Badal)
    Wait for GuC ready status (Daniele)
v4: Update reg name (Badal)
    Add comment (Daniele)
    Add extended graphics version (Daniele)
    Modify rules

Sk Anirban (1):
  drm/xe/guc: Add Wa_14025883347 for GuC DMA failure on reset

 drivers/gpu/drm/xe/regs/xe_guc_regs.h |  8 ++++++
 drivers/gpu/drm/xe/xe_guc.c           | 38 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  3 +++
 3 files changed, 49 insertions(+)

-- 
2.43.0

