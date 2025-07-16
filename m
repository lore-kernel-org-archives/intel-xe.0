Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E9EC83F27
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 20:55:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E49410E67A;
	Wed, 16 Jul 2025 20:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ErtnNnQW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E12810E67A
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 20:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752699355; x=1784235355;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BLccZJA+yhazt8CeembCacSusHxfrUTilgTb6b2iq5Y=;
 b=ErtnNnQW2d9eqrTtzCw0I/xPP9W6bmoyqjUtVvJXClEXJnG2ie1BTgQe
 /ACm64OiYByl97YCMJOdi/0LgKa/KAyuJu856MDJ26NCb/YHpJMPEibDo
 JO2YqKngw/mSjREVgAW4n2tTV/ZIONVdo1+WpJBlnJocVCsGQ5wcRh7D0
 EwykpTX1B9K4AL7dPrpogUAVvw2dTGzVDehhQbPyXT0LwBtfURku15uHJ
 cQZGkwQS/PYPcPVRpB4YI2tCAhy/XMKkWGpHkvIAjR+6dYz6UWa+LDPNr
 VV23t0JtblvFe+p0XekV1edzmLbvvNUobdeq5/nr9wpEpwGT9JdTPVX12 g==;
X-CSE-ConnectionGUID: V8BT3tXEQVmX9x7MHMQcQg==
X-CSE-MsgGUID: vd13V/zKQoGjACjVUWkrlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58770465"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="58770465"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 13:55:55 -0700
X-CSE-ConnectionGUID: 179TlznxR/W/QTYDweQ74Q==
X-CSE-MsgGUID: mBOv4QtbRr65TzhWqrEurw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="157686073"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 13:55:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Brian Welty <brian.welty@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Subject: [PATCH 0/4] drm/xe: Add psmi support
Date: Wed, 16 Jul 2025 13:55:43 -0700
Message-ID: <20250716-psmi-v1-0-674c13d7028e@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250618-psmi-9f270bf67895
X-Mailer: b4 0.15-dev-858c0
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

Add PSMI support to aid debugging. More information about PSMI is in the
second patch. This brings the initial implementation to drm-tip so it's
also easy to debug and enable things early directly upstream.

Opens:
 - Expose the toggle via configfs rather than module param? I'm leaning
   towards this for v2 as we may have multiple cards and want to debug a
   single one. It also matches nicely with the latest configurations we
   added there.
 - Expose the allocation request via configs rather than debugfs: this
   would part ways with configfs being for early-init things. I'm
   leaning against this and just leave that in debugfs
 - Add match for RTP to enable WA only if certain feature is enabled
   (like psmi): I'm leaning towards this so we don't enable WAs that are
   not necessary in normal non-debugging scenarios

I will start preparing a v2 soon with the items above. Opinions on those
are appreciated.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Badal Nilawar (1):
      drm/xe/psmi: Enable GuC Wa_14020001231

Lucas De Marchi (2):
      drm/xe/psmi: Add setting of PSMI feature flag
      drm/xe/psmi: Add debugfs interface for allocation of PSMI capture buffers

Vinay Belgaumkar (1):
      drm/xe/psmi: Add Wa_16023683509

 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c       |   3 +
 drivers/gpu/drm/xe/xe_device.c        |   3 +
 drivers/gpu/drm/xe/xe_device_types.h  |   7 +
 drivers/gpu/drm/xe/xe_guc.c           |   7 +
 drivers/gpu/drm/xe/xe_guc_ads.c       |   5 +
 drivers/gpu/drm/xe/xe_guc_fwif.h      |   2 +
 drivers/gpu/drm/xe/xe_module.c        |   3 +
 drivers/gpu/drm/xe/xe_module.h        |   1 +
 drivers/gpu/drm/xe/xe_psmi.c          | 297 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_psmi.h          |  15 ++
 drivers/gpu/drm/xe/xe_wa_oob.rules    |   6 +
 13 files changed, 351 insertions(+)

base-commit: cd8f387cae3dc97c924db689b4849c83249c3b9d
change-id: 20250618-psmi-9f270bf67895

Lucas De Marchi

