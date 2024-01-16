Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8EFC47DA7
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 22:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2495410E622;
	Tue, 16 Jan 2024 22:35:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA4810E5E0
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 22:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705444506; x=1736980506;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LjiYLy+x+FJp9vo+TLOEhQm8hDJ4zN+z1VGmQzfuFjI=;
 b=WduJcpHwrgiPk5IQYQbpWq/qWCxyo24CXZVZpUyjrCWdDV2XgCVt0y+W
 +ZxJSCW4cTq38hKdbfeSzEo9M9rG7/Wj0wA6DyEVgueVVr0tVwAVKKHb+
 1myquIsw1eCvnnkLRCN91I7px8Ia6QrvSK+E9BjbNJTDiACxh0WaJ5PkV
 f2N2kQlTjitLBW7YYYrxz+GCxeH6QStu/KlGkj8XL8HYAlV1HXyoavBSL
 A34VMCHYZsPaLL0j1XbImTB+ok9Jk4VdGRUEm8u+lRs71pyxelpY7qp+d
 0U7xOCclEmoe/VJyM9PBTkNEHE7PxMulrK0NK3PfEVNpAErIBma7T+rwI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="398873115"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="398873115"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 14:34:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="818306419"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="818306419"
Received: from fyang16-desk.jf.intel.com ([10.24.96.243])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 14:34:36 -0800
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/1] drm/xe: correct the calculation of remaining size
Date: Tue, 16 Jan 2024 14:37:08 -0800
Message-Id: <20240116223709.652585-1-fei.yang@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

Fix a bug in function write_pgtable where, in case the number of
PTEs is more than the maximum of one MI_STORE_DATA_IMM can take,
the caclulation of remaining size is wrong.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Fei Yang <fei.yang@intel.com>

Fei Yang (1):
  drm/xe: correct the calculation of remaining size

 drivers/gpu/drm/xe/xe_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.25.1

