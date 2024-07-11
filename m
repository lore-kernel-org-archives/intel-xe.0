Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83103C3DA4B
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 19:23:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510C410E2CB;
	Thu, 11 Jul 2024 19:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LXM9L32+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A686E10E2CB
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 19:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720725813; x=1752261813;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ADPuFa2IFn1ih6K1s101uDUEc59RpI5N+wSQWghcaGc=;
 b=LXM9L32+GlywbWq2XTMqDLeWFRcu21b3kMAkvVTCra18Dv8sttbziOyA
 Yt/BVvugELn5nHCgRRPDf0J5wCx3G4GgmdwuygeVbGbP/j/65m8+iuYe8
 qAEUd2XOg2gMf39u+Gm6kr16OtpUW4BdEagJsajefnIB8vf+1N077bSQz
 xHi8ECgHHAiaByjLmq8iC/LCgcjdJh+Vef05NGuOPwWzdvUrCvzTAUq+o
 wV1I4ZmxxSlGRumh6B2DNnj5ZsKQOrTCi3Nw0ctOGsJQfPp8quAgZ4TfD
 Md3EyW91XFWHV/fYUsLC8fDRlLPxRcDA85hRO2ZK4zgBXTfcoj/xIEyER g==;
X-CSE-ConnectionGUID: 9RZmY3qNRxa8etazykHoOw==
X-CSE-MsgGUID: Jw6I88MXRzeTAI/d+9sTRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="28808968"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="28808968"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 12:23:32 -0700
X-CSE-ConnectionGUID: xQ8FvgbjTXClKGocV1GFdA==
X-CSE-MsgGUID: sf3muzKiQUypyVgDFJkX9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="79790259"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.49.75])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 12:23:31 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/2] drm/xe/pf: Limit fair VF LMEM provisioning
Date: Thu, 11 Jul 2024 21:23:18 +0200
Message-Id: <20240711192320.1198-1-michal.wajdeczko@intel.com>
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
  drm/xe/pf: Limit fair VF LMEM provisioning
  drm/xe: Enable SR-IOV for ADL/ATSM

 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 1 +
 drivers/gpu/drm/xe/xe_module.c             | 3 +++
 drivers/gpu/drm/xe/xe_pci.c                | 4 ++++
 3 files changed, 8 insertions(+)

-- 
2.43.0

