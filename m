Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16383C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 19:46:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C633810E161;
	Tue, 25 Jun 2024 19:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQxdVWx/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288FA10E07D
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 19:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719344757; x=1750880757;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z8IOtMRTFkzrbf5qX5w5tOMDk/HTOfn3ULns4Gnxzxs=;
 b=IQxdVWx/RfPrFyZ2OikOuqDFEetctDSy7J/oyYPrcucRYIITs9bJEg+K
 e9J67t1wGhHJV4jNjYjLT9buZH3EUADN4LRo2LuYzrhVHtVo8vS1mIZz2
 ouxerctschmb3/31QLvQ5cNxO0zE/NmUxmxZrgtZWEQVAF8FIgMikpF4g
 zgRAGj0YZvsnI2SQC32GIjZaW3ZAWhpvwmBl5kOD16JFwRQbIqD/iYQ6t
 rm6Q1rZtUy3HiQuLiR04iPKzLO8X+uiqSHIVyG9WePZ23384Hd4NedHVr
 l2OzaxuwAkFNoP8OFLdMaxEu5FZ6l7zDDV6n9g76C+ac7sdortOYUNFW+ Q==;
X-CSE-ConnectionGUID: ZMcqGyiET5mTXCG3dTNSHw==
X-CSE-MsgGUID: v0k69eIMQDyqVI3+zj/+dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="41807853"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="41807853"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 12:45:57 -0700
X-CSE-ConnectionGUID: 7cTbFTBQQgiYE9rweTWO+g==
X-CSE-MsgGUID: IhwX0jb/TZyz1HIxi+Hbhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43825619"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.34.68])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 12:45:56 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/1] PF: Trigger explicit FLR while disabling VFs
Date: Tue, 25 Jun 2024 21:45:45 +0200
Message-Id: <20240625194546.1301-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

v1: https://patchwork.freedesktop.org/series/135321/#rev1
v2: Without the HAX.

Michal Wajdeczko (1):
  drm/xe/pf: Trigger explicit FLR while disabling VFs

 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h |  1 +
 drivers/gpu/drm/xe/xe_pci_sriov.c           | 14 ++++++++++++++
 3 files changed, 36 insertions(+)

-- 
2.43.0

