Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A347BC021AA
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 05:41:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552D410E997;
	Fri, 21 Feb 2025 05:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ApEBe1j6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4253C10E0E8
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 05:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740116511; x=1771652511;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YwmEbkqImWQgCqUtUaPQ5MA293JVbidw5pG2E719Xqw=;
 b=ApEBe1j6IaTycSDC6+IJmXDVbGJwVUU9ng60t3JNcWxJxKcMFwt2jggS
 p5ysHTDBVShSviJBMjiGhjvg84V1sWH6jXHFcvGHgnMPzfKC1VSeCzwt7
 /1hC5TrjOb0+lRihz6lbC/U784oZlCd7r957qOQ2fxTpT6d2c1MALFTsN
 fows7ZDnjHYAjBI/gHQyqAOvSSVjx1XdPOetw3fhG6TTIyKI+uxp1DxAk
 ItA8RTrNHoqrMTU12SjsDqCNH5HtorSI9xviiTMspst8C6PbqoDoLXC0O
 8VJ3t2rISioYjabguWEhxOPbhuEXCBgkHCF8IDl6rrcByvMIEqyHeBLTv g==;
X-CSE-ConnectionGUID: qg6bn6O3TWa/2R0kkgE4rg==
X-CSE-MsgGUID: G+iPDLKQRDSw6SdyUuH7Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="52326336"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="52326336"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 21:41:49 -0800
X-CSE-ConnectionGUID: KSCMcu1WS1OksWXlc9bYGg==
X-CSE-MsgGUID: kWjEKI1fTwWtx1eTtfJGow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="120248355"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa004.jf.intel.com with ESMTP; 20 Feb 2025 21:41:47 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 0/2] Fix VFs resume errors
Date: Fri, 21 Feb 2025 11:27:20 +0530
Message-Id: <20250221055722.21370-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
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

Establish a connection between the PF and VF to ensure that VFs only
resume after the PF has resumed. Although the PF resumes, the VF reset
and provisioning occur in a separate worker process. VFs begin resuming
once the PF has completed its resumption.

However, some VFs might attempt to resume before the provisioning is
fully completed. In such cases, if a VF resume fails due to an MMIO
request, retry the operation up to GUC_RESET_VF_STATE_RETRY_MAX times.

Satyanarayana K V P (2):
  drm/xe/pf: Create a link between PF and VF devices
  drm/xe/vf: Retry sending MMIO request to GUC on timeout error

 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  9 +++++-
 drivers/gpu/drm/xe/xe_pci_sriov.c   | 44 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_sriov.h   |  6 ++++
 3 files changed, 58 insertions(+), 1 deletion(-)

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
-- 
2.35.3

