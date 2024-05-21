Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46231C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 14:23:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF99310E876;
	Tue, 21 May 2024 14:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yv0OKpVC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B93110E876
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 14:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716301392; x=1747837392;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sbiykuajZFFExhc1s3CuaQIcgckYx1rcmqD2kFApA64=;
 b=Yv0OKpVC7DnXxTO6ZD5q61HV6EhxNw7M0nfuMjPhnl0mVvnq9mdw9kIu
 9Xthe0lFVXzXUEctemLR44n3nbZg+nbSFX1icBXxDeoKWdHd3XxuQHUR3
 AJNM16yLoZ3zDe7CENSnGQXwg/NVA9zpFLUqLJij0rGa4+G5noBNSXi89
 byegBGj1t0DndeHZuf62vnAdMvoIbwiOlj2GcMKkb+FswvtuL4LZ+8xRq
 BiHKZrvsChxYfRU0oKM4UdmgPkBfe+7TT2OL49fXLebfyl1uqcz/vsepA
 xhHSoAhJpZwwaSjsyoUbiBNAvMVwoOMjNVy8LW2CbTriVT1jB4RkRYZsw A==;
X-CSE-ConnectionGUID: DNNpn2CuR8SwgJcUlwc44g==
X-CSE-MsgGUID: Prf0I8X8R16wLYsjyYSvcA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23075807"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="23075807"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 07:23:11 -0700
X-CSE-ConnectionGUID: SGfODw5JRgu6R72NrzsnfA==
X-CSE-MsgGUID: vol/lyiWSgKgyDjh5BQuLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; d="scan'208";a="37711466"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.128])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 07:23:09 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/3] Store platform name in xe_device.info
Date: Tue, 21 May 2024 16:22:54 +0200
Message-Id: <20240521142257.756-1-michal.wajdeczko@intel.com>
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

Michal Wajdeczko (3):
  drm/xe: Store platform name in xe_device.info
  drm/xe: Drop undesired prefix from the platform name
  drm/xe: Use platform name in xe_assert()

 drivers/gpu/drm/xe/xe_assert.h       |  4 ++--
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 25 +++++++++++++------------
 3 files changed, 17 insertions(+), 14 deletions(-)

-- 
2.43.0

