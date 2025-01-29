Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B822C0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 20:00:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BBA10E1B3;
	Wed, 29 Jan 2025 20:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A2GzB/BX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED28110E1B3
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 20:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180801; x=1769716801;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G+j9vBvRqyW9KwMig3yydxAHbJoyZSaasFUEfm+hqcs=;
 b=A2GzB/BXHed5G0sSa5YVDet8Kc8bKbCCKPZgDV8Xi/EvB4VZ6sL/PvRR
 oUrYoTMKuPyS1HGXv2gcqV2DvY3cYJS43PwBteTtWMPZnv+E6t7eC9lYW
 HBPNAT3LR/TJ0N57aPMyr5KOxQekbs1ldKCZNXMNNRShXPSXo49JG70u0
 YkpMTDVMrqTB3aOhJEucQjsCO//XQJ6L1eN9q0lvRAyiW0yA/KRKFNX5P
 XTQEoiz6cLFX7vYqg+PHdyQIr/N0K8R/qAQf07am8lLe1nECUQb55F3Hn
 dDWEZkuHsUpaCgldtefk4xTizhb9raqkmw31SaKqFQf4LzSnxX+FuBTxp Q==;
X-CSE-ConnectionGUID: Qm4X8QW0RNeiRS/N6hsmAA==
X-CSE-MsgGUID: hyBPfn/OSE+ULXyJnkTKjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50133998"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50133998"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 12:00:01 -0800
X-CSE-ConnectionGUID: VL+sl7KhSBioqeNr4M5RFg==
X-CSE-MsgGUID: wTK8I2tNQ4qLV77hV626KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="109710066"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 12:00:00 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/2] PF: Mitigate unexpected GuC VF config checks
Date: Wed, 29 Jan 2025 20:59:45 +0100
Message-Id: <20250129195947.764-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Michal Wajdeczko (2):
  drm/xe/pf: Don't send BEGIN_ID if VF has no context/doorbells
  drm/xe/pf: Reset GuC VF config when unprovisioning critical resource

 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 41 ++++++++++++++++++----
 1 file changed, 35 insertions(+), 6 deletions(-)

-- 
2.47.1

