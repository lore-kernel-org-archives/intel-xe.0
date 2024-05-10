Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8ABC25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 20:38:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D4B10E14F;
	Fri, 10 May 2024 20:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+hTDoC7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33DB10E23A
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 20:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715373528; x=1746909528;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UMtgM5z4LrAyPzMgHVu5+u5eR1Z8VJY0Hsso2C46bOM=;
 b=j+hTDoC7dWOjSxvNTkp7HylH8Iu8C0PfZlMg/Z7crbdMn+x4ivswn+jg
 U/BQQO2R1IXCrzX6IvNevRgsvC2GNrQPVFyBI6OP5G1eC9E2rcmHULzYR
 kSB65fDM6oza3+UOOy0s5yr6QOYKvUAfUimLMhircwufR60tkgLitv6Xy
 EF+kTzTD74xEacwf726CF5FkDf3urQxYu+Uj1bDWTwi3mpOR43AH3umjI
 1SXzx8pDbmpvqMGOCEF/A46bU0KzVKPkEu+snE7phskU+F12jJF/1ETdR
 knsD9hz7/um49pU2rf1dhy5vWrO82Y453KlKZRBs8SHfjuT1KGEOu2enW A==;
X-CSE-ConnectionGUID: qrjqsnaSR2Co98QFGBjFkA==
X-CSE-MsgGUID: sLAK4XdITvmSEe/LZm+kkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28886824"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="28886824"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 13:38:47 -0700
X-CSE-ConnectionGUID: o+8e4wFwQtmBitzV1QbRvw==
X-CSE-MsgGUID: MxTnQ+QbRNeoDk82wEJEkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="29577952"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.252.59])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 13:38:46 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/2] Move GuC submission init to post hwconfig step
Date: Fri, 10 May 2024 22:38:08 +0200
Message-Id: <20240510203810.1952-1-michal.wajdeczko@intel.com>
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
  drm/xe/uc: Reorder post hwconfig uC initialization step
  drm/xe/uc: Move GuC submission init to post hwconfig step

 drivers/gpu/drm/xe/xe_gt.c  |  8 ++++----
 drivers/gpu/drm/xe/xe_guc.c |  9 +++++++++
 drivers/gpu/drm/xe/xe_uc.c  | 10 +++-------
 3 files changed, 16 insertions(+), 11 deletions(-)

-- 
2.43.0

