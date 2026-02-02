Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07333E7DF0D
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 17:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF1E10E1B4;
	Mon,  2 Feb 2026 17:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IZ7dNWDG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AABC10E1B4
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Feb 2026 17:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770052440; x=1801588440;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A+b9jcvniSrn44MrziHzC+pijg9cohDebIXcZP0s50A=;
 b=IZ7dNWDG5OipPeeI6iW/cj84EwE10EOTyOnbDFJ07UvQQvdbjuNkm2EC
 sRpF9YqvHaxzE+bwzaQGcaBb1r8Xd6MwfWOMS+D6mkExZHsxOZ1HvLH6j
 AAfNoNdoQFNldX5VKJS5cAp7zFBflJ2Dgtgt3fyb8GbQKdDv1fWHq9S3b
 +u4t4wvNxoPTVqvMNoJH7DU9alslT5pJ/2YzTSbeG3PyQCDnIpj2v+pSg
 M76APZ643HtZMLJiQGYS9V9TMcn715lVJ0N/Rejy2A/yAX0eH+KLIqvx8
 0VUo3kdMXOV45NDFaTG8IK79AqskRDVwdF9De3+rKGaHtDw21a8bU5Q0j g==;
X-CSE-ConnectionGUID: aGxbq//qSbynxlp8ijL90w==
X-CSE-MsgGUID: RfggJzmJRq6rcBFlILW8wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82641709"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="82641709"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 09:14:00 -0800
X-CSE-ConnectionGUID: o5Rt6sIiSa2Sgw65niU2bg==
X-CSE-MsgGUID: tKzHz+e1TE2Spe4i74DRhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="208682905"
Received: from nkumarg-desk.iind.intel.com ([10.190.216.171])
 by orviesa006.jf.intel.com with ESMTP; 02 Feb 2026 09:13:58 -0800
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: naresh.kumar.g@intel.com,
	Michal.Wajdeczko@intel.com
Subject: [PATCH v3 0/2] drm/xe:Mutual exclusivity between CCS-mode and PF
Date: Mon,  2 Feb 2026 22:38:11 +0530
Message-ID: <20260202170810.1393147-4-naresh.kumar.g@intel.com>
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

Due to SLA agreement between PF and VFs, Currently we block CCS mode
changes if driver is running as PF, even if there are no VFs enabled yet.
Use lockdown mechanism provided by the PF to relax that limitation
and still enforce above VFs related requirements.Also skipping CCS-mode
sysfs entry in VF Mode.

---
The previous change log can be referenced at the following link,
https://patchwork.freedesktop.org/series/154538/#rev9

v1:(Michal)
- Split into two patches with cover letter and subject of cover letter
  refactored

v2:(Michal)
- Add direct code instead of gt_prepare_ccs_mode_enabling and
  gt_finish_ccs_mode_enabling function's for readability

v3: (Michal)
- Remove Fix up tag in commit message
- Refactored Commit Message

Nareshkumar Gollakoti (2):
  drm/xe: Fix Prevent VFs from exposing the CCS mode sysfs file
  drm/xe: Mutual exclusivity between CCS-mode and PF

 drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 44 +++++++++++++++++++----------
 1 file changed, 29 insertions(+), 15 deletions(-)

-- 
2.43.0

