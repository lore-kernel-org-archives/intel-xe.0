Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBF2CD98F6
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 11:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5186410E075;
	Fri, 19 Jun 2026 11:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ehEdheal";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA86510E075
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 11:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781868658; x=1813404658;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CZCyCRZiz7IFxXLF6uRIDyz1iIN6yd9qKVLjfKYZSO4=;
 b=ehEdhealNXhyr21aLdOA03wvz7CVmEfTxEJe2HDJKJ/AroIQILNHvAJy
 Q/2dBde3ONv+50MaKr0uEgVxK2tRDTb8rpU5X4aB52lBQbRlnUbFvhVfz
 a99GZ1x9S9R3czpjQ4kRJZw/4LIU6MPZxhhLcfEGYzZvVeqYjB6f0oNUp
 heJsGOMV1sQlwfSZGY8ZPzp1N7+5DPyiUB6XLRd5/1mEd1EjZBLLk0Hn2
 fjGAQ04uF4gyNJaOW4JrCJPMjcnifUSqbAxTm2GaVxcF6pFS+su9LeRnA
 wVx6PEzIuoZlnFzvhqtTlbjjffLxBZI34JSx66JKpj7NyJILjRgnMFazq A==;
X-CSE-ConnectionGUID: ne4Ox74rQ+CRw/2Bem892Q==
X-CSE-MsgGUID: gLD6TQ3VSYu5Iiz0AKl09Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="81822746"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="81822746"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 04:30:58 -0700
X-CSE-ConnectionGUID: 5nj5AV7OQH+pVrPybMbtIA==
X-CSE-MsgGUID: FdmoAGo3QNm/Jtj61lMv3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="247470104"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 04:30:56 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 michael.j.ruhl@intel.com, matthew.d.roper@intel.com,
 soham.purkait@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v4 0/2] Add a debugfs for pcode information
Date: Fri, 19 Jun 2026 17:10:16 +0530
Message-Id: <20260619114018.667995-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Introduce a pcode_info debugfs entry to report pcode details.
This initial implementation exposes the pcode version which is got from PMT
telemetry.
This can aid debugging when the pcode version is needed.

v2: Enable the debugfs only for supported platforms which is BMG and CRI
as of now.

v3:
 - Move platform check from patch 2 to patch 1.
 - Add a comment about why only BMG and CRI have pcode_info debugfs
   enabled.
 - To runtime reference of device before reading from PMT.

v4:
 - Skip creation of the debugfs pcode_info for SRIOV-VFs. (Matt)
 - Move the platform check to xe_debugfs.c.

Karthik Poosa (2):
  drm/xe/pcode: Add support to get pcode version from PMT
  drm/xe/debugfs: Add debugfs for pcode information

 drivers/gpu/drm/xe/regs/xe_pmt.h |  2 ++
 drivers/gpu/drm/xe/xe_debugfs.c  | 34 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode.c    | 21 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode.h    |  7 +++++++
 4 files changed, 64 insertions(+)

-- 
2.25.1

