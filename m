Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDF0CD11C2
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 15:55:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D21E10FBBE;
	Tue, 19 Mar 2024 15:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="inmrc24P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED7810FB0E
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Mar 2024 15:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710863710; x=1742399710;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6Yy91KZ7/RvFQ5MruRXd8saYM4JPE2zSYOgfINDTEcQ=;
 b=inmrc24P+15IMiPjs0RUeUSaerWKuy2jjnCpLjC9qHkBJUgiiwvTQRZX
 N0FjYwmgJ9E1mi3vb80/VMJE+BNryT3bC9u0nO+JqUGQUwtpsObjuEA4P
 rOC+UGTH78MzC6zbddt3KN8zWrkTl11jtkhHDXQR1871mvtMZvuA+fh6b
 vTizDkXa66SSZs+i1KDa4AlU+C7x7gSYUuZHynQwu+ZoIDvWmfR0UON7P
 tWscZVtVWLjMidDhJLeSYeY/+bfQrSMWF32GT0eE0RzI6SWsc9On2R596
 o4NVEjpl9elgs6+hPAnmlaIpZ/6+W+4KKAxxSLMBk+AsBWS8nUuUr/Ibg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="17145556"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="17145556"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 08:55:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="13949150"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 08:55:07 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 john.c.harrison@intel.com, matthew.d.roper@intel.com
Subject: [PATCH 0/2] Add support for Wa KLVs
Date: Tue, 19 Mar 2024 21:38:57 +0530
Message-Id: <20240319160859.2672825-1-badal.nilawar@intel.com>
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

Add infra to opt-in GuC Wa via KLV interface. 
Enable Wa_14019882105 for LNL A step

Badal Nilawar (2):
  drm/xe/guc: Add support for w/a KLVs
  drm/xe/lnl: Enable GuC Wa_14019882105

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  7 +++
 drivers/gpu/drm/xe/xe_guc_ads.c       | 83 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_ads_types.h |  2 +
 drivers/gpu/drm/xe/xe_guc_fwif.h      |  5 +-
 drivers/gpu/drm/xe/xe_wa_oob.rules    |  1 +
 5 files changed, 95 insertions(+), 3 deletions(-)

-- 
2.25.1

