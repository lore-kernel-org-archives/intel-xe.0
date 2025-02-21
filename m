Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACFAC021AA
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 10:51:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8FC10E28D;
	Fri, 21 Feb 2025 10:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P0ga8ygG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CACC10E28D
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 10:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740135098; x=1771671098;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ed+7mQ7l7M2oehW5a9uFAljX6E5fQEXNhGmzsT/vJ9E=;
 b=P0ga8ygG2uPNlnr12nQC36U3EhitCcyW/LxTMUidz9XkAwi4xvPs5O0k
 NZ6/i0Inl+U3aiH4vVOEj9/YMWqezsB6oDDkJMiYbrwn528rMq9acLIkH
 ADkxO65nKJbhy1IM65eA97p9MtfmxUx4g3QVWaMU8sZT5HvRuFCrNwu3c
 ogwadhG/1qghbY6MPrqxD30Ito6kYYN6ket/f2RF6p4dbbuNd0aAx9kRy
 fazE6iVws/KkN5fSiyyKQamVIMLWfV7mbcsqt7YekyYCUjadEE3ZMOHLO
 3nW5rIhb+o/GygzFqslcQfKUG0gofeOUn2FizPPbY2mZcffRecSN/k1sx Q==;
X-CSE-ConnectionGUID: Gk0eg6/cRnuZVfd6WC+APw==
X-CSE-MsgGUID: Oes6FL1nQmSAMnYz4xlhfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="41217045"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="41217045"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 02:51:38 -0800
X-CSE-ConnectionGUID: 8bVwSAv+Rv+ltRi4X7GL0A==
X-CSE-MsgGUID: Rw/YEs7PRmiy5P3wu95jPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="115532565"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa008.fm.intel.com with ESMTP; 21 Feb 2025 02:51:36 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 0/2] Fix VFs resume errors
Date: Fri, 21 Feb 2025 16:37:10 +0530
Message-Id: <20250221110712.29994-1-satyanarayana.k.v.p@intel.com>
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
 drivers/gpu/drm/xe/xe_pci_sriov.c   | 60 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_sriov.h   |  6 +++
 3 files changed, 74 insertions(+), 1 deletion(-)

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
-- 
2.35.3

