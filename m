Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66613C9830B
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 18:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0A110E959;
	Wed, 23 Sep 2026 18:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XA/P4FyQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC9C10E961
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 18:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790188563; x=1821724563;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y7YMmHjmyLzvrOXVOpsowdwhmn5u5VrcSSw7EeKabtA=;
 b=XA/P4FyQFl0FAB4jN9nB+k5Z5QZO74BEzhw9za3BmeEgXpzYeZCkPYM9
 Yq1f6v24xPjNZeaGgcjaY6n6eA8TPq3v+U6VxK3p8vidH6GQCAGLBhxDW
 eacbdvG8ycb3p0vJ62LyfyVHP8evQDxvu6zeAax01LOUq0mhwDwG0V/lh
 OojtYmGpZOv+hU7hVjQAr7VVtSUke3OqwCqwL86yZxe8FJlLZTOz55mRT
 JNUTAz+VrxvFTng5E5oVzHqGSsNaQUk8wbUjL/8ltKdEqea05/ecR+zfC
 ECMrtQHcyWsE4C5d1OFmfZljjn+g65405KuVaG6idoGMr0BqijufeM+1x Q==;
X-CSE-ConnectionGUID: XeA0yoTcTfidZYEt1OXSIQ==
X-CSE-MsgGUID: 9M3PMUSSRK2HYOTw/9f8zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="89832139"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="89832139"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 11:36:03 -0700
X-CSE-ConnectionGUID: CrmzVRkuREmBWFBFz0KYrw==
X-CSE-MsgGUID: fwDaYCVAQXyUrFzc9EZO1Q==
X-ExtLoop1: 1
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by fmviesa003.fm.intel.com with ESMTP; 23 Sep 2026 11:36:03 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 0/2] Enable GSC loading and PXP for NVL-S
Date: Wed, 23 Sep 2026 11:36:01 -0700
Message-ID: <20260923183600.1186943-4-alan.previn.teres.alexis@intel.com>
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

GSC firmware is required for content protection features (PXP, HDCP).
This series adds this support.


Alan Previn (2):
  drm/xe/gsc: Define GSC for NVL-S
  drm/xe/nvl-s: Enable PXP for NVL-S

 drivers/gpu/drm/xe/xe_pci.c   | 1 +
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 2 files changed, 2 insertions(+)


base-commit: 703cd271db3a35088460ab3fec0a96bd48e7fe04
-- 
2.43.0

