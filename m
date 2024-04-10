Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30822C67861
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 00:26:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E06113035;
	Wed, 10 Apr 2024 00:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EpEI+Iyq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B28B113035
 for <Intel-Xe@lists.freedesktop.org>; Wed, 10 Apr 2024 00:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712708807; x=1744244807;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b5AQRdyMSZD9F3KFL58gAlwTPTppTeq/dt2G9cZoCVw=;
 b=EpEI+Iyq7+JW1vkZzQC+DPosvF2Mjf9VDnVtDnTDie+gjzfeDdlCioGh
 +y3xenrbNbmsXVlW08YZHj+K5cLzhzewQhlzaEEMcg/Ui/8HCIvGiyavV
 NpVhYcrPthau2iKA/HfL+IiQLFM0K74h12rVUnVkAuOlN/P3eLZWDFk1W
 09fOnRGIZ//yAWe2KA4GdYnlItW+UIVvu3zTcndBXvjqOKx/VnpO2kL6N
 WBQinyL39O7btAfWdIVaCEXDM23A6OBlbM9orUiMONC8tVy7MeyAj9IW/
 BFYr+fHqABgIryCY0J+7Mjen4pw+5o6MK7yPYt0ZaEUhK5G7XQwyaWoL3 w==;
X-CSE-ConnectionGUID: if691B2QSZ2gMXoAnq5DAA==
X-CSE-MsgGUID: DW/SunDvS8CJQngsG3Lr+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7907001"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7907001"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 17:26:47 -0700
X-CSE-ConnectionGUID: u94fi6xDTpWGwMJmtHDX1A==
X-CSE-MsgGUID: YkbA1ywQTXmJZMpl602e0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="51359630"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa002.jf.intel.com with ESMTP; 09 Apr 2024 17:26:46 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH 0/2] More LNL workarounds
Date: Tue,  9 Apr 2024 17:26:44 -0700
Message-ID: <20240410002646.3002394-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.2
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

Add more LNL workarounds that are implemented by GuC.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/xe/lnl: Enable more GuC based workarounds
  drm/xe/bmg: Some LNL workarounds also apply to BMG

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 2 ++
 drivers/gpu/drm/xe/xe_guc_ads.c       | 8 ++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    | 5 +++++
 3 files changed, 15 insertions(+)

-- 
2.43.2

