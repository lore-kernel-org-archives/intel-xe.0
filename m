Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1931DC27C7A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 11:04:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB3F10E449;
	Thu, 17 Aug 2023 11:03:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8297210E449
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 11:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692270238; x=1723806238;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J9jwYEuitaTj+uiIe4lVVo1DzCXVuBdst4cj0pEqYyc=;
 b=GwFDOMckDMgD0mJwIpmg8kWF2Cl/oN9LHVUvRj27Rjl3dSzHWd7zI96Q
 a0Ifz/i4K0E8tmJMxeadUhuE+LSmGxqFp5RsoXtivvlsfMP4PvoujzV+H
 dztrB/ne+lVf7baGf3RA7l5p51bCLKDB1muEDDmhqiv5arP4Z0/B5yBP2
 tI3hXRTtwzi9qnvfMQqRmIiGYxxq6pdFbgqX7kGtt9CWbr64/GSosTOMI
 iisQbNyWwLhjL7EQ9T+doP56LK9Z8YLFKxnFP5quMhig39qNvQDwdR8ow
 JkDQ1SlpJ7sFjz9wmu1yo9UuiTyVxPVV4mgNY61LQQHARpn8+5x9yKPfJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="376516674"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="376516674"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 04:03:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="728099944"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="728099944"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 04:03:56 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 04:03:49 -0700
Message-Id: <20230817110352.7601-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/3] drm/xe/pvc: Add Wa_16017236439
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add workaround 16017236439 on PVC which makes even copy engine instances
to use 64B transfers instead of 256B, hence making it bit slower than
odd copy engine instances.
Update migrate engine to use the faster odd copy engine instances along
with the reserved copy engine for a better throughput.

v2: Blacklist BCS_SWCTRL register

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (3):
  drm/xe/pvc: Blacklist BCS_SWCTRL register
  drm/xe/pvc: Force even num engines to use 64B
  drm/xe/pvc: Use fast copy engines as migrate engine on PVC

 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  3 +++
 drivers/gpu/drm/xe/xe_hw_engine.c        | 31 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.h        |  1 +
 drivers/gpu/drm/xe/xe_migrate.c          |  7 +++---
 drivers/gpu/drm/xe/xe_reg_whitelist.c    |  6 +++++
 drivers/gpu/drm/xe/xe_wa.c               |  7 ++++++
 6 files changed, 52 insertions(+), 3 deletions(-)

-- 
2.21.0.rc0.32.g243a4c7e27

