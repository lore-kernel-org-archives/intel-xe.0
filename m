Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C12AC04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 06:31:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C115610E244;
	Tue, 14 May 2024 06:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHKBm+gs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C129D10E244
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 06:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715668285; x=1747204285;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mrOQVxUeoBN/QBOEkx1I22FWeIiARU59PrzqwQ8M3UM=;
 b=mHKBm+gsqkOIjpZRtKBgw0Ng+mZ8aRTc7TegJjge0/i5Z9J82fkaKz6z
 hBQwkjpOaq7EW2k9BZTfNk3Ax39ljFA/rAebGaTVRGm5QmhyHE2rqISlH
 JJEfr1XlUhGalzG3j4Hf+rtFF1t1UPslh/6msgo7EElzbiPliXr+egfRW
 XWmQryJPBfXR2yYfE4GmGcOvNtJsezVjjH7rDG7ZqTbib0ifyGMc2O5C/
 anIZ7YPLM2DrX4fO+JIApv5/cHQs8+JY4x877iIUeX1PUqesqChh0Q51r
 wnvsox2Rt/gvc7cGb+yx17nm8ZPECkMSUzz400UJnYAjT1P9+mGt82WpZ A==;
X-CSE-ConnectionGUID: iKnN69+mSzynvfKbctRAFg==
X-CSE-MsgGUID: GYGGT9M0Tfmsk2WoJy598Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="23032503"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="23032503"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 23:31:24 -0700
X-CSE-ConnectionGUID: UpYbBnb9ReiIX8lOCGPXsA==
X-CSE-MsgGUID: FyhqhfEwS8OYKALAPwiAlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30623721"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 23:31:22 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com
Subject: [PATCH 0/2] Enable Coarse Power Gating
Date: Tue, 14 May 2024 12:13:07 +0530
Message-Id: <20240514064309.3819722-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
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

Coarse Power Gating (CPG), where Render and Media can enter C6
independent of the remaining GT. Enable render and media
power gating

Also enable VD HCP/MFX sub-pipe power gating
HCP/MFX power gating is disabled by default, turn it on for
the vd units available.

Riana Tauro (2):
  drm/xe: change the power gating register names
  RFC drm/xe: Enable Coarse Power Gating

 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 10 +++----
 drivers/gpu/drm/xe/xe_gt.c           | 10 +++++++
 drivers/gpu/drm/xe/xe_gt_idle.c      | 45 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_idle.h      |  2 ++
 drivers/gpu/drm/xe/xe_wa.c           | 10 +++----
 5 files changed, 64 insertions(+), 13 deletions(-)

-- 
2.40.0

