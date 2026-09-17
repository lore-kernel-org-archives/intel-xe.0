Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5385EC88E72
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 22:30:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0720210E4D8;
	Thu, 17 Sep 2026 22:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RHQo46Ns";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE09510E4D8
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Sep 2026 22:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789684245; x=1821220245;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eyKthiQPaVYlEFfiXZ7qERFDVNMYiF9u0wQs+ls6WfM=;
 b=RHQo46NsPByRszeuSL7VogiRnC6fC0Q9Okp/7Z8Deqf5Mrjg2r+WeriJ
 +MG3zdjJXyk+YrMBWNnYTVEI1NnBeVI9zuMFMUt/KcMKiEMUjg/fLIp9l
 TskrObk5tXiMIqTN+vF0k/JFLAwZcwbxYQ04XBgaziJRdlb24QX1M7yEA
 9cNI/+CUji4kWeVAVCecL0wdeJ/0Bwq1z17uWZt3lv2yijQNjHhqSWmPG
 WklmONAkAsGi3J5gb9TRWS6SZYwGZiYJiTDBbW19cXJl0f6LE1GhMcWaY
 kXazkjssb1Kv8hLyku4fcmYovLT0SXCRn7a5xYGDHlN/Rrm9Ml6hgz2K7 A==;
X-CSE-ConnectionGUID: oR/ZW1dOSU6PKRESYtnrJQ==
X-CSE-MsgGUID: EYJ4uqIhSRSDxjJcj7ES1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92665115"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="92665115"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 15:30:45 -0700
X-CSE-ConnectionGUID: 2Js3/Y9iQpC7s2JVUCN3rA==
X-CSE-MsgGUID: AkBgHecQRku0J3PSJyAoNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="279297686"
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by fmviesa005.fm.intel.com with ESMTP; 17 Sep 2026 15:30:45 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 0/2] Enable GSC loading and PXP for NVL-P
Date: Thu, 17 Sep 2026 15:30:41 -0700
Message-ID: <20260917223042.715286-4-alan.previn.teres.alexis@intel.com>
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

GSC firmware is required for content protection features (PXP, HDCP).
This series adds this support.

Alan Previn (2):
  drm/xe/gsc: Define GSC for NVL-P
  drm/xe/nvl-p: Enable PXP for NVL-P

 drivers/gpu/drm/xe/xe_pci.c   | 1 +
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 2 files changed, 2 insertions(+)


base-commit: 2a7cc08892e65d665f62d4095bfc97b498650a6b
-- 
2.43.0

