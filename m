Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79074C41513
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 16:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE6510E6E3;
	Tue, 25 Jun 2024 16:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TyvRwBPW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2F410E6E3
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 16:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719334699; x=1750870699;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WRMEuEziv7TX9gIgKXhim4XoVnw0XjAtg6/iDHFwFAY=;
 b=TyvRwBPW1hv0FUXDp3Xkomlfgns5Z4HOXcPcpyep7YkDD2JGI0HK/Yxt
 xJ/nb3+DvkLsuvRjNB9lT/idkvqDgIh2wky8aROdXLJJbxrby9b4JpbAy
 m871TvsEAT40yBEgM+kFiCh2PD0Gp1d/4Uge6hDh27tAKL3rnFZqDEEnK
 xQdfnlPWDgK1B+e/IOwx/aiVkOEMWJLNp5fPCzRxgyEo0uZn3K3de8FwW
 RlgWgLxLbKPefw9Un/3M2RtszJBgeGasvlVIhCSd8iteGDZwlgAy/WErU
 E0ErWx8DpIgMmsZeOkzclGuBc3rtBWkNycUPEQ9zCKffdyosL41nlTaZ6 A==;
X-CSE-ConnectionGUID: GoawMSA2RPqQOVZ6pAhSbw==
X-CSE-MsgGUID: MCIpTFcTTn6PI/h3sLR/YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="20178749"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="20178749"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 09:58:18 -0700
X-CSE-ConnectionGUID: BPaNODMSTI68fGJUMauMDA==
X-CSE-MsgGUID: QSHa3oTASpmxKtsHuDFjUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43524765"
Received: from xpumcyp04.jf.intel.com ([10.75.202.213])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 09:58:17 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	lucas.demarchi@intel.com
Subject: [PATCH 0/2] Capture per client stats when destroying an exec queue
Date: Wed, 26 Jun 2024 00:58:10 +0800
Message-Id: <20240625165812.58411-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: root <root@xpumcyp04.jf.intel.com>

Some utilization stats may be lost if the user did not query the stats
prior to destorying the queue. Fix that use case

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (2):
  drm/xe: Use a helper to get delta run ticks from the exec queue
  drm/xe: Record utilization before destroying the exec queue

 drivers/gpu/drm/xe/xe_drm_client.c       |  7 ++----
 drivers/gpu/drm/xe/xe_exec_queue.c       | 29 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h       |  1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
 4 files changed, 34 insertions(+), 5 deletions(-)

-- 
2.34.1

