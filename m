Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDD7C47E49
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 21:34:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F0010EFE3;
	Mon, 22 Jan 2024 21:34:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D0D10E64D
 for <Intel-Xe@lists.freedesktop.org>; Mon, 22 Jan 2024 21:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705959288; x=1737495288;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VGsSSmphyomptWxX9ykJvTn6isMSvB6kaDT24WEWC/A=;
 b=BUiFwOa1WGuxc5ZzhCZQD2nUKHcMT2+5aX8yAyEDrNzx3Vu1XLBB7DIx
 0xGtwyxLAw1h6Ru2/ZNg4zqjKchYY7NHyPOhtCMK40YQcrC+nqeMpoKMT
 mhuwD4Y3yyDp+klbW3mbHYnEzdSXmxorTy0QIqSVfLdpLUHk5TvdE2lHW
 V5JNe4YK0/EXfBLe1FEIto5wUK5E7gNVjblGptuoAWvUKJsizbc1pZgvl
 Kcdyh5Rg6jnUOo3lMQul/1p06iVROp+fyEuSJjsnqAOc6PYRSo1EVE4na
 kYwEVhb/6Klf5Lcd7CFTE8WdAh1sQKF6TxJd+a5fbTOrKfI1xxkocFxAt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="432489921"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="432489921"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 13:34:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="909073619"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="909073619"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga004.jf.intel.com with ESMTP; 22 Jan 2024 13:34:47 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Subject: [PATCH 0/2] Update to GuC 70.19.1
Date: Mon, 22 Jan 2024 13:37:06 -0800
Message-ID: <20240122213708.1841488-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Update to the latest GuC release. Also include patch version in
expectation check as it can be important.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/xe/uc: Include patch version in expectations
  drm/xe/guc: Update to GuC firmware 70.19.1

 drivers/gpu/drm/xe/xe_uc_fw.c | 49 +++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 22 deletions(-)

-- 
2.43.0

