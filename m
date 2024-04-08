Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6764CCD1292
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 18:14:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D979F112935;
	Mon,  8 Apr 2024 18:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AeaEHHxw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912C2112934
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 18:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712600067; x=1744136067;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AbcQ+fF1iS7thTV+fbtvrntrilFs31Wje+XvEVQlyTM=;
 b=AeaEHHxwXU11gv1jAjLWBVau0Cbgzyl6AyzAT3Rn/xoMX9Fv9PFDZlj7
 psmqwYKuR/3FnrByYOjDmpaKNADTSJnjGQihMqaAHBn0SXV4yHNVFUI0M
 TyK/SH2877Iso+VK1a+F4n72dnEKaYJigNiH10k2I+nq9ffo4/TjJ17Z2
 fA52hk7fDq9xP6ilfg2AdJ/qE59iKUmFwhG73OcuXFlkIA32hw1GaNlV0
 jG1mtWqiywjk4PqB8r3XDAV8oP1KkQz5Q95/XOGQrRfABxWsrZ3DDZVBn
 PnYUKerVM2GpbtD0Z/k+sKH2gYKgkb93gim/LRgA6ECCfGBWv1GizfhZN Q==;
X-CSE-ConnectionGUID: /XvOMdj2S8G1dyBR9RwrAw==
X-CSE-MsgGUID: smKt3jcVSmyTq0lB6Je/ag==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="30383391"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="30383391"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 11:14:27 -0700
X-CSE-ConnectionGUID: ncmWL0OSRuuJwf7doNiHQQ==
X-CSE-MsgGUID: 3s5VCdtIRsubCib8+u/uuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24758832"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.158.202])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 11:14:25 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] Helpers for GuC KLVs
Date: Mon,  8 Apr 2024 20:14:06 +0200
Message-Id: <20240408181408.1023-1-michal.wajdeczko@intel.com>
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
  drm/xe/guc: Add helpers for GuC KLVs
  drm/xe/kunit: Add tests for GuC KLV helpers

 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../drm/xe/tests/xe_guc_klv_helpers_test.c    | 200 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c       | 137 ++++++++++++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.h       |  51 +++++
 4 files changed, 389 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_test.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_klv_helpers.h

-- 
2.43.0

