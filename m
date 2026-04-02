Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FFFD6AB10
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 22:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCEE10F434;
	Thu,  2 Apr 2026 22:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="luKNwynp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E593710E083
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 22:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775170121; x=1806706121;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cSR5SiDDqsNnyEWYDphf08BL1kOjInt8hzIMM8MCE+U=;
 b=luKNwynp3f83MlFRGCC/YU3b9iBzCTqTHZNiyvNX9Nsn0yiKMlQkAw6e
 ZlGarz/99OQj8kOww3vzvK6dtFeNC9YZmWJUDxICiiRyS1i5dWWMzhMc2
 TBPm+5bhIbhcySjtWMWUmUnVbDkBY+FC8ek3WkmMYYuWf5UpPTajvEL7/
 UyhGZrzgWMQjKrMP1/iruln/NiwyerWCrTcU7clhtdyQPEE/n6sD2C5cp
 fWbnd26o5SwBe6fBeD/8aGwmyefaB8yTUGktjn4HJpbdJaaSUy6D3+yng
 Me/8iXucMcotOLCK53dYfFrKuCxaizv2pbwXX1GLb6/idBRlDLVFVWSUG Q==;
X-CSE-ConnectionGUID: 41Gyd1EGTju1yUmvd7hphg==
X-CSE-MsgGUID: CZMHVR/GR5OG+gEXhM5j1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93823868"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="93823868"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 15:48:40 -0700
X-CSE-ConnectionGUID: jRfhj4ohRwKcyPiHGjukzQ==
X-CSE-MsgGUID: VT4dPvpeSiaE4Vff5ORmVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="231137206"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 15:48:41 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 0/7] drm/xe/guc: Recommend GuC v70.60.0 for LNL, BMG, PTL
Date: Thu,  2 Apr 2026 15:47:44 -0700
Message-ID: <20260402224819.405728-9-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
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

Recommend newer GuC firmware for LNL, BMG, PTL. UAPI version: 1.31.0

Platforms NVL-S, CRI, NVL-P are not merged to upstream at present. The
GuC definitions for those only exist in the for-ci topic branches
drm-xe:topic/xe-for-ci and drm-intel:topic/core-for-ci. This patch set
reverts those patches, updates the recommended GuC versions for fully
upstream platforms, then re-adds the CI only platforms definitions.

Julia INTEL (7):
  Revert "drm/xe/nvlp: Define GuC firmware for NVL-P"
  Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
  Revert "drm/xe/nvls: Define GuC firmware for NVL-S"
  drm/xe/guc: Recommend GuC v70.60.0 for BMG, LNL, PTL
  Reapply "drm/xe/nvls: Define GuC firmware for NVL-S"
  Reapply "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
  Reapply "drm/xe/nvlp: Define GuC firmware for NVL-P"

 drivers/gpu/drm/xe/xe_uc_fw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.51.0

