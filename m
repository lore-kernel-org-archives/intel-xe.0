Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79E2C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 09:42:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A01E10E97B;
	Thu,  3 Apr 2025 09:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q63dbwiY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E170A10E97B
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 09:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743673320; x=1775209320;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YQL86qd7K1TyCMBhTSc4o2LpThBubxZzhUsuXg7hRq4=;
 b=Q63dbwiY/3v+g+DAFz2t/MJS+sfSpz7/T4R39VgyseMc+ITGAC5wkzZk
 mqlu9eEXvyeVkU2pCZzy9odQ8WbVECYgal17g/S1vJIZYKzYvFSVI/h8Y
 lCEK6giehJ2JEU+tfxgdjJ35gDa23/ouCmJx/2yKwcsJfjdGh1W2sCvPe
 LcLYDHhhUqJXRkDZcXyu5p8iJEtjB8eAoo3xln182+tG0jTBDO6NSsmZ2
 SXEH0Z//yidoz/POsUniVNUCYScNnLhEQCeV+EOg5TSFys5y6/bDs5Etf
 vHN2ghuhVx4/evHBw9Gp2zkgDNDxdvFxlPlvDFhhtOPysJW8hVNDYaIyT w==;
X-CSE-ConnectionGUID: 4lOqthXIRmG13TCzg6EaDg==
X-CSE-MsgGUID: Np9f75ERRqSOpYi8g2jh6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44955478"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="44955478"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 02:41:56 -0700
X-CSE-ConnectionGUID: RA5UDL35SG6Oma37IJqgfQ==
X-CSE-MsgGUID: /F16IyxLTvG8TZxprSuakA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="131938081"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 02:41:55 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
	lukasz.laguna@intel.com
Subject: [PATCH 0/2] VF: Don't update GuC reset policy when changing wedged
 mode
Date: Thu,  3 Apr 2025 11:41:39 +0200
Message-Id: <20250403094141.25941-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

Prevent the VF from attempting to update the GuC reset policy when
changing the wedged mode, as this operation is not supported for VFs.

Lukasz Laguna (2):
  drm/xe/vf: Don't support changing GuC reset policy
  drm/xe/vf: Don't update GuC reset policy when changing wedged mode

 drivers/gpu/drm/xe/xe_debugfs.c | 5 +++++
 drivers/gpu/drm/xe/xe_guc_ads.c | 2 ++
 2 files changed, 7 insertions(+)

-- 
2.40.0

