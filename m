Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2BDC36005
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 22:47:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CC510E617;
	Tue, 25 Mar 2025 22:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g4gUgeP7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045F110E617
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 22:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742942834; x=1774478834;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Rbrr8C1xsgesflnucDISd7PQBzYrhZOsG14+eEtJwkg=;
 b=g4gUgeP7CssMFcCYNWVO8HNHFVHlpfqFpleOahmdhOLn/d74RMHKSECB
 GaYbXjSy3Jkg1LP91Dnaeuq0+qytWho7XfNXUfoTwo0plQLnsknjNknEw
 fXeMzpChLhPb1visB7zaRN8Loho9DbH09YBcgKv5qg9zrZr7Uvei7XvmM
 BC3KSxh5pWZfdgDtXy0jL+gUliuvS4iys/KtVdJlOPhdgKWF+6BhFASDj
 soYXBCRl45DJPcEObThu2myFhdd6GcrdQl+FL9fxa4mBwuUSn98//kmst
 5e3HTWzRWyC64GyHc72qfsWhEn//8YcMHxoUBpGKUzcZRKnecxcLVmX+G w==;
X-CSE-ConnectionGUID: Pey1JL5cQNKmEmudvoq/qg==
X-CSE-MsgGUID: 3LKoCiBPSRys/3KYjXXlQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="69576041"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="69576041"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 15:47:13 -0700
X-CSE-ConnectionGUID: ff9DCNAVTeeiw3IHRPEomg==
X-CSE-MsgGUID: 9WvE2/cGSpWewk/tRA2ykQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="155444956"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 15:47:13 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH] drm/xe/bmg: Add one additional PCI ID
Date: Tue, 25 Mar 2025 15:47:10 -0700
Message-ID: <20250325224709.4073080-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.48.1
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

One additional BMG PCI ID has been added to the spec; make sure our
driver recognizes devices with this ID properly.

Bspec: 68090
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 include/drm/intel/pciids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index 4736ea525048..d212848d07f3 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -850,6 +850,7 @@
 	MACRO__(0xE20C, ## __VA_ARGS__), \
 	MACRO__(0xE20D, ## __VA_ARGS__), \
 	MACRO__(0xE210, ## __VA_ARGS__), \
+	MACRO__(0xE211, ## __VA_ARGS__), \
 	MACRO__(0xE212, ## __VA_ARGS__), \
 	MACRO__(0xE215, ## __VA_ARGS__), \
 	MACRO__(0xE216, ## __VA_ARGS__)
-- 
2.48.1

