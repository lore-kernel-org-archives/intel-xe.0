Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A88C021AD
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 06:25:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D5010E8D2;
	Thu, 20 Feb 2025 06:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E01keM8t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5983710E8D4
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 06:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740032752; x=1771568752;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/BvxnJc98GO2a48tKffdZ/ZZ/wSFwV0KB5LkEHDce50=;
 b=E01keM8t67TNqfi7SydAgdpvqU5R4872wetaK7T3ATEfY9Zwp4LMfNMA
 GwUSvCPH0zLf769eCmfrGjIl1GFIfbmdj73c9X9doIbYhMS3K0hFwSLjd
 ljLroDMRY0LuA0t0fE/B/nUxPgDTzD3G2lFuaFRsqiSPffP1uTfJHd6Iv
 AH1Ibeeme5ud7bgX9tTickIqyp0PcPHyqTCgP3twCdT5bRgVFUCzJkdG4
 Cel3E9iVjB3Myc2gtk3jQx8XkEaNY6TStAlXDabP2v4grxNt4WYhqWP30
 2KflkGcaKS3a8APnUA/WTEEQ6oiiH1KRFmD19RpB59jR7bZIlgD9HcmUv g==;
X-CSE-ConnectionGUID: rghay5T5RJShCo8FWceBOQ==
X-CSE-MsgGUID: LUdEzPX9TDu04SQbciJN8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40665036"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="40665036"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 22:25:51 -0800
X-CSE-ConnectionGUID: 5OyQxaJ8SceTClNpI5Ib5w==
X-CSE-MsgGUID: fLurLcrQQ3urYVgzH18OkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="114781911"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa006.fm.intel.com with ESMTP; 19 Feb 2025 22:25:48 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH 0/2] Create a link between PF and VF
Date: Thu, 20 Feb 2025 12:11:17 +0530
Message-Id: <20250220064119.26623-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Establish a connection between the PF and VF to ensure that VFs only
resume after the PF has resumed. Although the PF resumes, the VF reset
and provisioning occur in a separate worker process. VFs begin resuming
once the PF has completed its resumption.

However, some VFs might attempt to resume before the provisioning is
fully completed. In such cases, if a VF resume fails due to an MMIO
request, retry the operation up to GUC_RESET_VF_STATE_RETRY_MAX times.

Satyanarayana K V P (2):
  drm/xe/pf: Create a link between PF and VF devices
  drm/xe/vf: Retry sending MMIO request to GUC on timeout error

 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  9 ++++++-
 drivers/gpu/drm/xe/xe_pci_sriov.c   | 37 +++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 1 deletion(-)

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>

-- 
2.35.3

