Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA12CC27C53
	for <intel-xe@archiver.kernel.org>; Sun,  9 Jun 2024 18:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F3110E1F3;
	Sun,  9 Jun 2024 18:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d608oxJE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A13210E1F3
 for <intel-xe@lists.freedesktop.org>; Sun,  9 Jun 2024 18:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717957189; x=1749493189;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZoRFj3Cxx3I++WbPCyTHWSeYOa0KDM3GLcn33Y/aHYo=;
 b=d608oxJE8rTsi8h4JFhsM9ckQi9EEi1kK6QmXYpILUDmmdcS8hXI5YZa
 hxFepqgvFVesrhQC70ARfgHPGjER8/Q+DQOphmKdmDfNRX6SECnIVK2Q7
 jP/3xbSqygbG0PRTPEZ6E97dXWeGtbGgpymtx2wGwfvmU3eIE3+S/Zqh6
 Ulel3TQFtI0Byp7zckhP2vDIf9JBN4K+NYPxXWkVIUe06PTSyBc4U5DQ/
 jKrBJA+JJfaoyx1QeJqPGaqXeviEw8TZldFQgR0QNr9sQDf9btA+WuYL6
 DwpbLZCFtMwY0vdtBlZWDhyyI4X8RNFUHFD9T3VHEv5gnbVzY+zoAO0QO w==;
X-CSE-ConnectionGUID: CeAk9/5lSlKZmmzAuMaZFQ==
X-CSE-MsgGUID: lCdmg8eVTqi5MosRLaR4Jw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="25192323"
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; d="scan'208";a="25192323"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2024 11:19:48 -0700
X-CSE-ConnectionGUID: R7lhCv7+RUeEDxKjisCfHg==
X-CSE-MsgGUID: bRTcm1OoRV+Id0a/oB//EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; d="scan'208";a="38969110"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2024 11:19:46 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/3] Few GuC PC improvements
Date: Sun,  9 Jun 2024 20:19:28 +0200
Message-Id: <20240609181931.1724-1-michal.wajdeczko@intel.com>
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
  drm/xe/guc: Move H2G SETUP_PC_GUCRC definition to SLPC ABI
  drm/xe/guc: Add pc_to_ct() helper
  drm/xe/guc: Prefer GT oriented messages in xe_guc_pc

 drivers/gpu/drm/xe/abi/guc_actions_abi.h      |  6 --
 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h | 22 +++++++
 drivers/gpu/drm/xe/xe_guc_pc.c                | 63 +++++++++----------
 3 files changed, 53 insertions(+), 38 deletions(-)

-- 
2.43.0

