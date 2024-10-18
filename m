Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAFED3E18D
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 22:43:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A0F10E9DA;
	Fri, 18 Oct 2024 22:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Am1IJv5w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3EE210E9DA
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 22:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729291409; x=1760827409;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1A+/7+5uJeYXwqTU8ajYJiBhqVYEaRxwmc5yzP+8dD0=;
 b=Am1IJv5wGt2HahfymUej7EkrjujMTcqh61yB1MjaSJEwzsykiKuV4Dyj
 cmVRF3N1fiSDwbm62oZXKCCVXJ47d06Gp2GrvAfSUW/1+9Fv3Tift/AM2
 86ygY4qMDNbfnb2717ycIFPzO+g5P+UM48MKKXIgCSHlsUzyBu9mDx08S
 KPC3SP1L/u4sWlC84EL+T0GQ/RkiXvQuQkOUmUE0Ih6JgJbd9siT0p/bE
 zC4zTpw+THVmkPQVpiVtySd8Rq0RjkVAd69Ehen0KhRsIvNXqIw74UnXg
 ILUNsP7JGWNrV0Bz2K+8i9thZcHpuAP1kzwXebV5ooj6h8sxdKitfVlbT w==;
X-CSE-ConnectionGUID: y7Og5ED6S+qPMnTZ0uNaEw==
X-CSE-MsgGUID: vfuw/ztQRMy8B4gPyTIigw==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="31699178"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="31699178"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 15:43:28 -0700
X-CSE-ConnectionGUID: Cg0P3JesQSC1z/bG5PxZeQ==
X-CSE-MsgGUID: 5Ud8uATVT0uA5TxMmd6VhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="79407463"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa007.jf.intel.com with ESMTP; 18 Oct 2024 15:43:28 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v1 0/1] drm/xe/guc: Prevent GuC register capture running on VF
Date: Fri, 18 Oct 2024 15:43:24 -0700
Message-Id: <20241018224325.130754-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

GuC based register capture is not supported by VF, thus prevent it
running on VF.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

Zhanjun Dong (1):
  drm/xe/guc: Prevent GuC register capture running on VF

 drivers/gpu/drm/xe/xe_guc_capture.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

-- 
2.34.1

