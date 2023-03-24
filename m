Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5E5C6FD20
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 05:19:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E23310E4B5;
	Fri, 24 Mar 2023 05:19:52 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFD610E257;
 Fri, 24 Mar 2023 05:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679635190; x=1711171190;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LLT4NuQDVPRRxK4H+3pScxUKNCwYW4lbywazDkKpWik=;
 b=kISRMsybOckG7ZXoKUPjKqs0EVDCpJ4zCmwKDCPZ8TnajBi8xja9RKKN
 IdS7F2SmhSZ1ZiUr3ogHg693wEfC/RhDqFG5tf5neD3zCpj/FL0rCZ7Nx
 xJpnpZ9JAiBFwHUNlA6eJ8/8xPdyUZ63ewYVOEPSfT8f2W2cMuB8aBiLu
 +eSyGUX36DeyXYqJlsMiaZihnT0IGVitUAooaNjCbOzFo+HArHiJDsJQt
 zWygalgJyIrwJWxKvNYG3dsRh4rVfk17KYXzYcL7Sv/4jTNPsr6Si0JFs
 Yg1mgDnpHV1QiBsrap3YNuXfOBO9UkymUIDhuHSfFH+KzGolOEJQI9rXy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="341262576"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="341262576"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 22:19:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="806523062"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="806523062"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 22:19:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 23 Mar 2023 22:17:51 -0700
Message-Id: <20230324051754.1346390-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] drm/xe: Update GuC/HuC firmware autoselection
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This re-aligns the xe driver with the upstream guidelines
(https://docs.kernel.org/driver-api/firmware/firmware-usage-guidelines.html?highlight=firmware+guideline)
and document the table used for it so it's easier to understand the
policy in place. Justification for the changes, including the exception
made in the guideline under "If the kernel support for the hardware is
normally inactive, or the hardware isn’t available for public
consumption, this can be ignored" is in the third commit.

Tested on Tigerlake, including some firmware renames to check if the
minor fallback works properly.

Lucas De Marchi (3):
  drm/xe: Remove unused revid from firmware name
  drm/xe: Fix platform order
  drm/xe: Update GuC/HuC firmware autoselect logic

 drivers/gpu/drm/xe/xe_platform_types.h |   3 +-
 drivers/gpu/drm/xe/xe_uc_fw.c          | 318 +++++++++++++++----------
 drivers/gpu/drm/xe/xe_uc_fw.h          |   2 +-
 drivers/gpu/drm/xe/xe_uc_fw_types.h    |   7 +
 4 files changed, 205 insertions(+), 125 deletions(-)

-- 
2.39.0

