Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603BDC6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 19:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186F210F213;
	Tue, 26 Mar 2024 19:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G3nT8rtj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73D810F213
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 19:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711480536; x=1743016536;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R0hzFa2lbnNBR5Gx8KACcLnZa5cqLjhc7kB5ncL4Zn4=;
 b=G3nT8rtje2rOJXQmumHFaF6G4jQW45O3d/fUgHSji/sCDEFZvpjj9AIW
 EKX6Mi0/oGQeDCHkkEfbaqzM52xTTw927CH+wFeeHFl8yFzgiUvjILzCJ
 NYy46EEl3TnNpj5Sbxox+uTvbwWPfNZXYwOZ/iz+bwnyYecSaDWkGkn9E
 uzJcGfrjcMLbZyOYJmvQrMLaA6i4gBbqYi4CxTLKN84oB/YZQIDXh5nz/
 DnbfUiZ7OPSJcaLggyYl0jz2UxdQb1JVGoxEMlGtskbkM+r0OlYxCIU3h
 c81jVsDMPBlWRbBrnJloAm2lWOZzMsHW2m/fz/oJnT3Up+fKRetoyhKJw A==;
X-CSE-ConnectionGUID: xXwqnTbuQmeaj3Xpy3RzAA==
X-CSE-MsgGUID: XWlaKgdSREiWzzVEa+hnwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="31994172"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="31994172"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 12:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20704787"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.156.251])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 12:15:26 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] Minimal support for VF state management
Date: Tue, 26 Mar 2024 20:15:16 +0100
Message-Id: <20240326191518.363-1-michal.wajdeczko@intel.com>
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

Add minimal support for VF_CONTROL and VF_STATE_NOTIFY messages that
are used by the PF and GuC for the VF state management.

Michal Wajdeczko (2):
  drm/xe/guc: Add VF_STATE_NOTIFY and VF_CONTROL to ABI
  drm/xe/pf: Add minimal support for VF_STATE_NOTIFY events

 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    |  94 +++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 257 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |  27 ++
 drivers/gpu/drm/xe/xe_guc_ct.c                |   5 +
 5 files changed, 384 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h

-- 
2.43.0

