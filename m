Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB60D4662F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jan 2026 22:43:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D8A10E0CA;
	Thu, 15 Jan 2026 22:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fIuffBzQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F2F10E0CA
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jan 2026 22:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768517021; x=1800053021;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B9QvgqGTVXnsFQaEOpVZKm5TOpTTU1xWmba7olQu0ko=;
 b=fIuffBzQHh6+uadrDT686XNgxjh8nFe3YbO5If2R3cRPmI/+BQu/3cZw
 ngNK83q/suWqrawfuKtv0o5kvB5Y+Ev0Qgak9pZHmxRTKFER2bRwEnYZZ
 EJTRNAggsp62MsWyLKJFc/sKgg+NTZhphTDRuyTUecOTqsW+Jtz/ZdSoG
 jiXDXyrqyjkYNogLaQB7ooX05aB39hYeIp+eQl3Fw/TrGByst3+TwlGJ8
 UlBdVHeQ8qltaEde2SZL1ITLNTl7QvLdTpx6PSNHeAVeamPXLlAlSKWp8
 ev/DYVeXB52XpX8D65ZdK/7f1eeZqPjInrDk6GtiUaAmMUlsBUxMsUb1D A==;
X-CSE-ConnectionGUID: JR/Wun4fTsWxrbYECa40pQ==
X-CSE-MsgGUID: 1kLeP4gnQOePwK+nf6xqUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69037136"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="69037136"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 14:43:41 -0800
X-CSE-ConnectionGUID: Nr2Efa4gSpSTO2YDPHAmnw==
X-CSE-MsgGUID: Zw2CoT9pS/K+igsXgC9grw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="204274183"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by orviesa010.jf.intel.com with ESMTP; 15 Jan 2026 14:43:40 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH 0/2] drm/xe: Add more info to powergate_info debugfs
Date: Thu, 15 Jan 2026 14:40:38 -0800
Message-Id: <20260115224040.2668209-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Add GSC status and dump forcewake registers with ref counts for all
domains.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (2):
  drm/xe: Add GSC to powergate_info
  drm/xe: Add forcewake status to powergate_info

 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
 drivers/gpu/drm/xe/xe_force_wake.c   | 46 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_force_wake.h   | 11 +++++++
 drivers/gpu/drm/xe/xe_gt_idle.c      | 25 +++++++++++++++
 4 files changed, 77 insertions(+), 6 deletions(-)

-- 
2.38.1

