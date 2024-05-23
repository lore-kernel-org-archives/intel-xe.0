Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86FFC25B7C
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 19:23:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A46D710E1D8;
	Thu, 23 May 2024 19:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zg+5xNw+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC4210EB7D
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 19:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716492176; x=1748028176;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yQXNXAcgVS1n9LSg7QyuRL0sI+fMUHbRxEbgwL4hSbg=;
 b=Zg+5xNw+LPTevU9MbKVxxDSE9ZkSmBlzKLzIMnIvg5GIpJBOhdvOlSam
 i4HcvRh8LJq4d/bKnNRn91SK5eSGUu4TQFW7Ni25OZfNjJpFcFPYDO55Z
 TQv73eMLwLMs64ml7KRbNnyV77wzLcrTrDywRQmMh1jWx/2/m70lrTEsh
 6I9kqNUZqFbweX+1s9u0Qc/NypmLSSvgTbZvx2UPlrxVK8MP3mfL5SGUo
 oGV5M9C3BYnARvzHMti3+popcBi1tO5AVpB9WYD6Efa5Tbl+kbxCCxCtS
 UAC/bmwEckPqfwXPuDfEhVDaAsWvO8hBYwM5zeZR0QPwCsBRuDa6tmsJi w==;
X-CSE-ConnectionGUID: HnTiQ6TXT8eWz7cfwTffdA==
X-CSE-MsgGUID: oBD9Hrz7Q0qRxF9lQYPAYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="13023471"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="13023471"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 12:22:52 -0700
X-CSE-ConnectionGUID: 1JHgXiJjQP+Br8QX1fvx3Q==
X-CSE-MsgGUID: ADgqKWNuQ9+UYJasTXCcGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="33848820"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.19.248])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 12:22:51 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/6] VF: Use the runtime registers
Date: Thu, 23 May 2024 21:22:34 +0200
Message-Id: <20240523192240.844-1-michal.wajdeczko@intel.com>
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

Michal Wajdeczko (6):
  drm/xe/vf: Use register values obtained from the PF
  drm/xe/guc: Add GLOBAL_CFG_GMD_ID KLV definition
  drm/xe/vf: Obtain value of GMDID register from GuC
  drm/xe/vf: Provide early access to GMDID register
  drm/xe/vf: Cache value of the GMDID register
  drm/xe/vf: Treat GMDID as another runtime register

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h     |  14 +++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 106 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   3 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   2 +
 drivers/gpu/drm/xe/xe_mmio.c              |   4 +
 drivers/gpu/drm/xe/xe_pci.c               |  47 +++++++++-
 6 files changed, 173 insertions(+), 3 deletions(-)

-- 
2.43.0

