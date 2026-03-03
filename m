Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECA5EDEBF6
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 21:37:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E666110E8E7;
	Tue,  3 Mar 2026 21:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mSyZcmn0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C94E10E8E7
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 21:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772573841; x=1804109841;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V9JKLimebs6kw16kA+eHiClw6u99wWH/Ao1woTlUgmc=;
 b=mSyZcmn0dxO3hPQSDBF2JiS7rhhnSXQ3N/Gj6jiraywhb4gyarYlAHmZ
 GiKCNAWHngQBgsOd+i6hoqe2W6Dg+eWMtX3Hqwb5PqVV5q+Jpl3GhL/EU
 ZGZc9jEOS8g154znOqjkuUC0FBzdbj2BCGX9jO4MVI7ncAabAxBd9d/Zm
 dbXjEBEldo8ed2/auUjg71g7DT+5F4OrRgF4u2/YMSvCNXUfHepRHd5Qn
 sj7d57aQRMA3l14e+9ol0pcQFGsVSvj2uXX8nz++uGrCyxHjyWetckocR
 bQxT7Rp7OTy1XKkrrAmIAqLSswe3zD5qrhbi6davARD2X9J8ROx6ZINl9 w==;
X-CSE-ConnectionGUID: eB/5Nn3xT+SnAiiy2BNLXw==
X-CSE-MsgGUID: 6ABgrV99R3a60ZKAofzVWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73689132"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="73689132"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 13:37:21 -0800
X-CSE-ConnectionGUID: qtwUs/aeQSiGl54BcV/qug==
X-CSE-MsgGUID: WWA82NEIRBqVn9rH2oObxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="217294694"
Received: from mjruhl-desk.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.124.220.75])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 13:37:20 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 0/1] [topic/xe-for-CI] Update NVL-P GuC to v70.60.0
Date: Tue,  3 Mar 2026 18:36:50 -0300
Message-ID: <20260303213655.241442-3-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.52.0
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

Add a fixup commit updating NVL-P GuC to v70.60.0.

Gustavo Sousa (1):
  fixup! drm/xe/nvlp: Define GuC firmware for NVL-P

 drivers/gpu/drm/xe/xe_uc_fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.52.0

