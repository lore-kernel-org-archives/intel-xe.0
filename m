Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF068C6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 04:03:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E1D10E0E4;
	Thu, 16 Mar 2023 04:03:20 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E9E10E0E4
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Mar 2023 04:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678939399; x=1710475399;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xy7q+uyq/4wZVVs2Pi4C0lXvGI8rYTeWQq7KFTpMjl4=;
 b=BFvQRlRtO8Gf+U41wU8MKvZ0kDc4Qq13mpymFHNur9gZVKlgaAKEqGr+
 jULVvUzVOkyQMv+rieqm217W1BoGaEDk8vbcdueSpGe/td39t9Vhd+X3B
 vITtRHKXFJrvSwtFt7Ekl39RYgYUhZG1OSj5hPTjE3YmhBYwoBKk+wvyg
 0l8rwLqmAC+XM2kkfJHjcsgTPwBxIL+PJKvqgZtD1PNsTyOYq+th9yLaK
 AZsWtEcByWwOPzXvOoOpmsdtOFH0MeFtD1F+wIc7odsjb+JcFKKS1FDmJ
 rhOk4nrtDmIZ6i4JT2DGsJcjkLRM5Vm02JDn2JBmZDb0Iak//1lRcX6Fm w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="365572366"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; d="scan'208";a="365572366"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 21:03:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="743953291"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; d="scan'208";a="743953291"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmsmga008.fm.intel.com with ESMTP; 15 Mar 2023 21:03:17 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Mar 2023 09:35:42 +0530
Message-Id: <20230316040543.1616473-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/1] drm/xe/RAS: Count SOC and SGUNIT errors
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
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Count the SOC, SGUNIT hardware errors as signaled by relevant
interrupts and respective registers.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>

Himal Prasad Ghimiray (1):
  drm/xe/RAS: Count SOC and SGUNIT errors

 drivers/gpu/drm/xe/regs/xe_regs.h | 192 +++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_device.c    |   5 +
 drivers/gpu/drm/xe/xe_gt.c        |   1 +
 drivers/gpu/drm/xe/xe_gt_types.h  |  28 ++++
 drivers/gpu/drm/xe/xe_irq.c       | 241 ++++++++++++++++++++++++++++++
 5 files changed, 426 insertions(+), 41 deletions(-)

-- 
2.25.1

