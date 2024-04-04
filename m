Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B31CD1288
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 03:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDC1112DA6;
	Thu,  4 Apr 2024 03:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fHx029bf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744B0112DA6
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 03:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712202253; x=1743738253;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R+5+jKOK8qq8sXbLmn6CR04EADpDT1Ml9emlQ6LoHSQ=;
 b=fHx029bfS0VT9OGsDzjBTqzv1edvmZiI3yiKcLfys6mcqcXTxpQgbYHD
 06tsfIvEnI8TkhnrprOKQb5aLLWBSyjYZWLbjxXIEadEM94fSu/wxsXsu
 Ti7CfRKDW01Ry3zMG7klEm/IFCSxdaZKYwhOg+vtSdHfj292BcRxjEq/m
 /txpoAmr2bYOcnzKd4Sfp3HEopmk6OgpugETRXqE+nZk4T9KhlxVvKZ7P
 IbuxM9wyxuRlpOneLXgFJLL2+edsD6qKd2Cq54pl87Gw1G1mb1n8HPREs
 CQkmlzM1V93RTnEv29KnYiJ7GKwv/Viu9VPz4DfXlmJjs6LxUWnqho5bm A==;
X-CSE-ConnectionGUID: YZd2S2c/RwGC2EPCiRs9Mw==
X-CSE-MsgGUID: 4JOUHnLjQN+QSjB5lqC6VA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11296486"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="11296486"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 20:44:13 -0700
X-CSE-ConnectionGUID: UQT7JlQ+RhqIarAGqHVx2Q==
X-CSE-MsgGUID: /NbWweBqQTyiWuKwrQ7HPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="23405163"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 20:44:10 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 0/4] drm/xe/hwmon: Update xe hwmon with couple of fixes 
Date: Thu,  4 Apr 2024 09:24:37 +0530
Message-Id: <20240404035441.965590-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Spit changes patch series into separate patches as per comment from Lucas.
https://patchwork.freedesktop.org/series/131765/

Made below changes as per review comments from Lucas, Badal, Rodrigo.

drm/xe/hwmon:
 - Update xe_hwmon_get_reg and xe_hwmon_process_reg protypes.
 - Address a potential overflow.

drm/xe:
 - Define XE_REG_IS_VALID.

Karthik Poosa (4):
  drm/xe: Define XE_REG_IS_VALID
  drm/xe/hwmon: Update xe_hwmon_get_reg to return struct xe_reg
  drm/xe/hwmon: Update xe_hwmon_process_reg
  drm/xe/hwmon: Cast to output precision before multiplying operands

 drivers/gpu/drm/xe/regs/xe_reg_defs.h |  2 +
 drivers/gpu/drm/xe/xe_hwmon.c         | 96 ++++++++++++++-------------
 2 files changed, 52 insertions(+), 46 deletions(-)

-- 
2.25.1

