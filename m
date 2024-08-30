Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C4CCA0FEB
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 13:21:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBC110E69D;
	Fri, 30 Aug 2024 13:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sjpbnt5A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB4210E69D
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 13:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725024072; x=1756560072;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PZ93IL+Dmeqb9X+k1hLo5/LWWREFfuGhddm9cN2tGzs=;
 b=Sjpbnt5AxHV/o04PhlinxxKZaq/RVNI6VM7Gq1hfAYtEcsb5TKvqZhUi
 dFxcGf+V0MDhAsyZoV8kpAcrmUueaa6Y9gmrgd/1/uzYj88ymzHb4sXNV
 iAq8K9Ik8Zwl05d+Ps0tO4br0wMgxfRnNaXCxPMM+PhVi8PlSBCCLZRfS
 PcvCj+BsYKnDsrch6w6MgT3jk8aZKsuDEv1gi6+FVU4rDHfcpZVf/NfVu
 X75coz+Pu7aIP87FjBzuRbiTCZxs9Ea1fQI7VmKpJ8XSuDyIMdOw/mH/N
 XlDc2diXt7WuLrOMfrGbi2f6len3R6XtNLyGuFpPWMd8G3r/YF0bDRyp2 Q==;
X-CSE-ConnectionGUID: tn1+7GUDSUS3pQ++R/owfg==
X-CSE-MsgGUID: 8LUDbTN6QsaLYweNI6+npQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="41144574"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="41144574"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 06:21:11 -0700
X-CSE-ConnectionGUID: ju9BI09hQjSmwh5KDjskJw==
X-CSE-MsgGUID: d7iHPR4PQT2iXO8WLsgqfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="63724345"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.120.199])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 06:21:10 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/2] PF: threshold config fixes
Date: Fri, 30 Aug 2024 15:20:58 +0200
Message-Id: <20240830132100.1704-1-michal.wajdeczko@intel.com>
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
  drm/xe/pf: Add thresholds to the VF KLV config
  drm/xe/pf: Reset thresholds when releasing a VF config

 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

-- 
2.43.0

