Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7A2CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 00:06:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC0910E6E2;
	Wed, 27 Aug 2025 00:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ln1Ol2y5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB82910E6E2
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 00:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756253199; x=1787789199;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Tn/vcldR8Eu+uHiscT6Dk7ETQCZkVPH8jdY0EjS1Wzg=;
 b=Ln1Ol2y5HRzCQRceH5bTkLGHFzYZCNgXdCi0Psa+K73VYIeHANQEEuS7
 Y3kwqhX9Cwc8xVLwZXSFT5SGzY4p6UXTdXxnLd2abHMo4HsXJXDFmLOAq
 FpfI5DvJPmXRAVnHElagagL9gfzsZFzGLVo/VchxFzJ47LYXj2xx2gEQd
 eZO6oplHL672SxrOtdqtfCR3AMA0If2QftGabW3wf+2litJLRq/Esyo7c
 vJgoCaBtWCkHXGxsEcmUN2XZsiT0iCg+rqUl6a1+t0JjEZyPCWn0rbgaN
 yUlL23E0dzsRgn4A/hIStk9Ey9s75LTAPDZ3ZxA5mYQcfOEu8OYqpQpsM A==;
X-CSE-ConnectionGUID: KAYLIS0FSt+5VNJ7B5lxqA==
X-CSE-MsgGUID: 39gE0RGBRwyRqDtWXhvp5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58600560"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58600560"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 17:06:39 -0700
X-CSE-ConnectionGUID: Bh9216w9SE2z/tELUPwjjQ==
X-CSE-MsgGUID: aDwZWSE0TiuX+q1j55Rpfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174113171"
Received: from osgc-sh-rabbit.sh.intel.com ([10.239.81.90])
 by orviesa004.jf.intel.com with ESMTP; 26 Aug 2025 17:06:36 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, karthik.poosa@intel.com, james.xiong@intel.com,
 stuart.summers@intel.com, shuicheng.lin@intel.com,
 vinay.belgaumkar@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH 0/2] Ensure GT is in C0 during resumes 
Date: Tue, 26 Aug 2025 17:06:31 -0700
Message-ID: <20250827000633.1369890-1-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
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


Xin Wang (2):
  drm/xe: make xe_gt_idle_disable_c6() handle the forcewake internally
  drm/xe: Ensure GT is in C0 during resumes

 drivers/gpu/drm/xe/xe_gt_idle.c | 25 ++++++++++++++++---------
 drivers/gpu/drm/xe/xe_gt_idle.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c  | 13 +------------
 drivers/gpu/drm/xe/xe_pm.c      |  8 +++++++-
 4 files changed, 25 insertions(+), 23 deletions(-)

-- 
2.43.0

