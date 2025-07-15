Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978DAC83F22
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 18:14:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3247310E0B5;
	Tue, 15 Jul 2025 18:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kFQ34L3L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6963E10E0B5
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 18:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752603288; x=1784139288;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KRuU+xsjJDVM7CzRhpaQGp1iUneiN2fr/oVOlJNYX74=;
 b=kFQ34L3LfzuK6So3wbjJFWiO0vSXjukR8/LB8Rq4SWOAa+3pyS5WRqAL
 51eBySeBU+QrEN4zRNNPHVItFmgZi42LJTzqf8GHQzMd3/8JWQpKds6JG
 svclTNAbTT8ed4u9jTnyJoLSod+mT7300RoTwu2Wr9dKw+KDD7Lsdw8g1
 dWv7N9IX9FSB58J7C4fOgxJz0CgUiUmpU3PGafuNatsuQMXVI6PUY/aqv
 fGD23Ak0Y+UKamJfIYsTQrwY74Yodt77IfxrVvzNZuecbojM6jeW3Qk5W
 pr4gs/bCYotbTDr/RTeGBCVhHf31JAdlq0IsbJD84gIro06/z4EL/zDP+ A==;
X-CSE-ConnectionGUID: WG/UNK5ySLOzTxXt8UNdJQ==
X-CSE-MsgGUID: FfISHPAbS/KewvCs5hnzLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65406506"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="65406506"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 11:14:47 -0700
X-CSE-ConnectionGUID: ldIDHxYDSVSZxRlmDVov4w==
X-CSE-MsgGUID: edfTS3fgSaaUTVTDiV6cNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="162845979"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.253.198])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 11:14:46 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/4] Enable SR-IOV PF mode by default
Date: Tue, 15 Jul 2025 20:14:14 +0200
Message-Id: <20250715181419.807-1-michal.wajdeczko@intel.com>
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

Patch 1/4 is just for the CI. Reverted patch is replaced with patch 4/4.

Michal Wajdeczko (4):
  Revert "drm/xe: Enable SR-IOV for ADL/ATSM"
  drm/xe/pf: Enable SR-IOV PF mode by default
  drm/xe/pf: Add max_vfs configfs attribute to control PF mode
  drm/xe: Enable SR-IOV for ADL/ATSM

 drivers/gpu/drm/xe/xe_configfs.c | 89 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_configfs.h | 11 ++++
 drivers/gpu/drm/xe/xe_module.c   |  6 +--
 drivers/gpu/drm/xe/xe_sriov_pf.c |  4 +-
 4 files changed, 103 insertions(+), 7 deletions(-)

-- 
2.47.1

