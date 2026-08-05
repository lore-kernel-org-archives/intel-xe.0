Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D9FC55174
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 15:47:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8318410EEED;
	Wed,  5 Aug 2026 15:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JHNyXC+G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB4010EEED
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 15:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785944867; x=1817480867;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rDB/11N6lnuB7CI8tqhCQddDS+NYrh8YNn+k1dFdnoY=;
 b=JHNyXC+GP0VpXRLekF3c2TgkpOARokjS+DvY6hI6sSO84o52Xs70JjHx
 adU86BmYbezUXfwoUZsbDSLiNzOhEAaQFo+HLjqy+DLOJqzg1CNZXr4Zf
 lU715ooKELWJSvdD+3Fu74hIYizXINY7QUoqMKsb2rrR6h7CbeFYcxzGL
 PrtRqextpof10cenmioJHYz7SLhTwpLp1gZ43VSqCcDCkxwMPLoqJUyk7
 3Cn4CfggyLtxAQWaH/QLreEgTIV6kFObELfVDBAAUs77VzwL5ac3aWYbe
 SqEy2SVGjJQvQYbF3zyYLgxuHJEt6sBpWXEz0oXG/9cJMfPPnA1D5CUEl A==;
X-CSE-ConnectionGUID: 9lgM0fuuRDm+Z9T30cpwUw==
X-CSE-MsgGUID: XiobF7mOTGm+A1gs/mL3UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="96874527"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="96874527"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 08:47:47 -0700
X-CSE-ConnectionGUID: lRpfp5qdS2GiSK8gPjfTCA==
X-CSE-MsgGUID: fO5ewQ77R+ey6tubVNo+Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="266069762"
Received: from kposwiat-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.94.252.229])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 08:47:46 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/3] drm/xe/pf: Add _locked variants of some config functions
Date: Wed,  5 Aug 2026 17:47:30 +0200
Message-ID: <20260805154733.604-1-michal.wajdeczko@intel.com>
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

We will also need these function variants in the upcoming VGPU profile series.

Michal Wajdeczko (3):
  drm/xe/pf: Add _locked variant of the GGTT bulk config function
  drm/xe/pf: Add _locked variant of the contexts bulk config function
  drm/xe/pf: Add _locked variant of the doorbells bulk config function

 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 111 +++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |   6 ++
 2 files changed, 87 insertions(+), 30 deletions(-)

-- 
2.47.1

