Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD395CCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 08:03:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924D210E750;
	Wed, 15 Oct 2025 08:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fG8tNjc4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E687110E750
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 08:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760515395; x=1792051395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hL6Oj0457W1ccYkzRwwH6dIwpIvldkAXzRJyQpPfUc4=;
 b=fG8tNjc418BpxYSJ2qNy7nOEIzFNYgSyRgMSPVu++nx8MOeJhqK6okYh
 rY8ol7AoqhC9hICiU+4gKe9M5zHiEYNNMzfjhpgZRQdKwq1+NKmynille
 c2TUBDtGtDZz//KvRPbjM6LFBLc319HmJH9Ufq6eE/1gnH+Fz3DF2To8t
 cZUL8bg4VNFYLqDhCmpuaR9JwtrbKahUG+pVMF/PSRrZtsTD3ex54iqT3
 VJjEVm7Hd4uEZIwf9yJgRJHcGQf7gJjCBt6RDvTzmGXHzIUKXvkaa45aY
 lutRvhPoSDpN3TUXTRzmiPqmqxNmVbP8Z+FSCr8JeKft6+h3lGqTgMfxG w==;
X-CSE-ConnectionGUID: 0Qj205xoRb68woWASmPD2w==
X-CSE-MsgGUID: cFW8K72iRoiVJgKIzqXDeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="61891544"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="61891544"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 01:03:15 -0700
X-CSE-ConnectionGUID: C8rnhy7SQFqSxfjI4ZhzAw==
X-CSE-MsgGUID: bIBj/XW1R8aHi/Vad3RNqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="205805570"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 01:03:10 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: anshuman.gupta@intel.com, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, varun.gupta@intel.com,
 ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 karthik.poosa@intel.com
Subject: [PATCH v5 12/12] drm/xe/vrsr: Introduce a debugfs node named
 vrsr_capable
Date: Wed, 15 Oct 2025 13:37:10 +0530
Message-Id: <20251015080710.1468409-13-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015080710.1468409-1-badal.nilawar@intel.com>
References: <20251015080710.1468409-1-badal.nilawar@intel.com>
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

Add a debugfs node named vrsr_capable to check if the device
supports VRSR.

V2: Use debugfs_create_bool for vrsr_capable node (Karthik)

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 1c3c9557a9bd..11d1942c196d 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -402,6 +402,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("disable_late_binding", 0600, root, xe,
 			    &disable_late_binding_fops);
 
+	debugfs_create_bool("vrsr_capable", 0400, root,
+			    &xe->d3cold.vrsr_capable);
+
 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		man = ttm_manager_type(bdev, mem_type);
 
-- 
2.34.1

