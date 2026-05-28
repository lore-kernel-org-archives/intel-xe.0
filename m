Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8D8CD4F54
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 21:52:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7ADC10F653;
	Thu, 28 May 2026 21:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NezdoeyZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE6A010F653
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 21:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780005167; x=1811541167;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nhaE7gB05Jf3ZT7QcPeieXqO9nsTCxp3rDkh1Y4nrSY=;
 b=NezdoeyZ5n8JAUGhtRprmZ35Y6SfDIe8RttmRWlqygFptZeY/i92hn8v
 UkpFlMKo0NkFHgdXRPvOTDubZ+3ZTj8b54uiK92yZqKpfCcs1f9AP7aoJ
 YJ7v26d20llqU4TLFtFGKyUThoMj1nHrRS4lSD2QYmSlLKw9hgbngv3SX
 eSwpheC/3KsxRL04dyBZL96K/ivm4HY2Dzleo8heHyyrSCBaGNDWR5A8E
 PUMJ5RjSThGX+NlCfy+Xoo6BDxbNo8M9/s53ekTzaHJR56caDYc6ZL8hj
 7776yonftTcP1Fm/4wvxZEWESXIMNCJSHJWcy+7xv4PDwUQ4CMNCJ3zAi A==;
X-CSE-ConnectionGUID: j29YXo0ERRyB9N0I+Xvo4Q==
X-CSE-MsgGUID: U3C5+hw5SKCihd0zWFiMVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80710743"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; d="scan'208";a="80710743"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 14:52:46 -0700
X-CSE-ConnectionGUID: MU2Wj/asTd2JxlUOYhrvbw==
X-CSE-MsgGUID: pPbgcWUjTxiLL7THgXcklQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; d="scan'208";a="272994605"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 14:52:46 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 00/10] drm/xe/guc: GuC v70.65.0 for BMG, LNL, PTL, NVL-S, CRI,
 NVL-P
Date: Thu, 28 May 2026 14:51:27 -0700
Message-ID: <20260528215227.1282471-12-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
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

Recommend newer GuC firmware for BMG, LNL, PTL, NVL-S/U/H.

Use newer GuC firmware for NVL-S.

Use newer GuC firmware for CRI, NVL-P (fixups to topic/xe-for-ci patches)

UAPI version: 1.34.0

Platforms PVC, CRI, NVL-P are not merged to upstream at present. The
GuC definitions for those only exist in the for-ci topic branches
drm-xe:topic/xe-for-ci and drm-intel:topic/core-for-ci. This patch set
reverts those patches, updates the recommended GuC versions for fully
upstream platforms, then re-adds the CI only platforms definitions.
Fixups are provided to bump versions in 'topic/xe-for-ci'.

Julia INTEL (10):
  Revert "drm/xe/nvlp: Define GuC firmware for NVL-P"
  Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
  Revert "drm/xe/pvc: Add GuC firmware definition"
  drm/xe/guc: Recommend GuC v70.65.0 for BMG, LNL, PTL
  drm/xe/guc: Use GuC v70.65.0 for NVL-S
  Reapply "drm/xe/pvc: Add GuC firmware definition"
  Reapply "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
  Reapply "drm/xe/nvlp: Define GuC firmware for NVL-P"
  fixup! topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI
  fixup! drm/xe/nvlp: Define GuC firmware for NVL-P

 drivers/gpu/drm/xe/xe_uc_fw.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

-- 
2.51.0

