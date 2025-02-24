Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB64C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 13:44:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411F310E56D;
	Mon, 24 Feb 2025 13:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OlsCxdvz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C585410E120
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 10:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740391953; x=1771927953;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mh/fSHXilYrNH7Fl8V20WrjNKI7+s73KBJMAqscwRWQ=;
 b=OlsCxdvzN6spfWHHGSAvROt3epjfDxbKI++2motz0PgfXGxjzHaF25HW
 JfvXpDuDBKtqI5U8xP2Rax6pxiCmJ6VXCL1xkm2aUjTIO2mdtG4YnGQA1
 LPtaYm6pcsRcNgQKJvgOBZNCnXugJOUbbwRMoTrJYTccBJW8o3rCTcIUx
 5WbuG1jLZ/BrhxJecr/8ieAHlTiSlvslGR4z8YWq7OaZlIsLcB/TaOAgV
 GLRWi5g/x5NTh0qV5OBb7q8UskcBA2EfsdCgJ8811+GcFYiQLKrCA6WQI
 jsTxi49FMim/hpzQK0nMLlSWkQNXYaTY1e/nje/uAym0ofMzWcETYAEk3 A==;
X-CSE-ConnectionGUID: GN/n8UG/QA2mhU+Yx6FekQ==
X-CSE-MsgGUID: SXEwxciQQm+VxDsirk2z1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41258588"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="41258588"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 02:12:33 -0800
X-CSE-ConnectionGUID: gijl7rQrRkG/OpONTkb+eA==
X-CSE-MsgGUID: OrfrSz4eRemrhQCag2zOlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115860885"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa010.jf.intel.com with ESMTP; 24 Feb 2025 02:12:31 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v5 0/2] Fix VFs resume errors
Date: Mon, 24 Feb 2025 15:58:05 +0530
Message-Id: <20250224102807.11065-1-satyanarayana.k.v.p@intel.com>
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

 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  9 ++++-
 drivers/gpu/drm/xe/xe_pci_sriov.c   | 51 +++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+), 1 deletion(-)

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
-- 
2.35.3

