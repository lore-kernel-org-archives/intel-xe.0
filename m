Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4E5C2BD09
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 10:27:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D7D10E38B;
	Mon,  1 Jul 2024 10:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bGcURSCr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7029310E38B
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jul 2024 10:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719829668; x=1751365668;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=si5lShzsZ9Z9BFIuK6jr1cG62ovGqtLh03Dn/r6QPDs=;
 b=bGcURSCrV4oRfzpDw+tLvkiLDUwuIQl/r224myCDsmAa5hlqx0xarDQO
 KQTw4JkY8/ZEz6/2NcquYAAtlF9+KKWKQWHvjRJyYylpAjtfcP5bvoy9i
 SQh/nJ7Vj0HH3Tg+WbumA3gwR4l++opzc13Cdg7dVwUE9Ef4hpg2j7cEW
 hyvSrHquuys2aoIj3e5SzLsk52/B6RpEXOFYeG85UGUax9t/gwhVsvoQk
 IbTV6j88ngSV4zypqpDHJS5wDKVfKnQv9q1h87A4vkNOKRguwdsWOv2xd
 fmKCLQDhPs96NobeO3Mbo5CV5OUjXaDyQRb5WkMki4LKUh5jIwwyPWEo2 Q==;
X-CSE-ConnectionGUID: XHL9PBRHSue4qJlVaEZLTg==
X-CSE-MsgGUID: gBx6z74WSFC58PdMORwSdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="28341414"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="28341414"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 03:27:47 -0700
X-CSE-ConnectionGUID: JvpwyTCsT76Tgy0vWf5Olw==
X-CSE-MsgGUID: zrBySnE4TwifjiaoXBcL3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="76665647"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.99])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 03:27:46 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] PF: Provisioning improvements
Date: Mon,  1 Jul 2024 12:27:35 +0200
Message-Id: <20240701102738.934-1-michal.wajdeczko@intel.com>
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

v1: With the HAX to actually test it on the CI.

Michal Wajdeczko (3):
  drm/xe/pf: Skip fair VFs provisioning if already provisioned
  drm/xe/pf: Restart VFs provisioning after GT reset
  HAX: Try SR-IOV on ADLP/ATSM

 drivers/gpu/drm/xe/xe_gt.c                 |  3 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c        | 12 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h        |  5 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 78 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  4 ++
 drivers/gpu/drm/xe/xe_module.c             |  3 +
 drivers/gpu/drm/xe/xe_pci.c                |  2 +
 drivers/gpu/drm/xe/xe_pci_sriov.c          | 13 ++++
 8 files changed, 120 insertions(+)

-- 
2.43.0

