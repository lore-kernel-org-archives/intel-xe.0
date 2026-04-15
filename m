Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401DFFA0C20
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 03:35:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F258B10E66F;
	Wed, 15 Apr 2026 03:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWtyAHWT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C557610E66E
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 03:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776224136; x=1807760136;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WLBLR9Pw10dN0q5RTkyVksmRaYGUaasGg+hY2z8fUqQ=;
 b=dWtyAHWTXYcmPSUo0ruiYQ7C1u0+pIAvTrEZDCWXgV1sjAJczb6UEYwK
 Y98d1ozsbi/X7ibdIJ71GuBdrsU6hwomjZsrAeVBhTPZqE6igSIZ8F89e
 2W2cbOye0IJjtV2GVUlmbc7QVFFYYIBlcaZ6LBswyqemPBGIOM3ogfmaJ
 hJUYa7Qop6kdYjod2xwnXdrWhs1JZFtELYs0syZCUUVBUBOR+VGxW+LLd
 oj/mO1BfRoIsBhJS25jbKrbAYir1C3XMxAvl4MyC6eFbf8E65jxIhoVqc
 RTUzl35JGalX+TGn8/K6Kh9/Lq7j9cn7U9+WScdG6oGT+W/b503lebPtf Q==;
X-CSE-ConnectionGUID: IYx07fsWR/W2dKV9Q85hsA==
X-CSE-MsgGUID: bI9MKhpDTC6mqhO1/D5Xbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="76225341"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="76225341"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 20:35:36 -0700
X-CSE-ConnectionGUID: DyfzwZOKR9a0Q5Wc28RAxg==
X-CSE-MsgGUID: 1PMMNewlSH2RuOeLwdoZ0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="232033284"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 20:35:36 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH 0/3] drm/xe/oa: OA register whitelist fixes
Date: Tue, 14 Apr 2026 20:35:29 -0700
Message-ID: <20260415033532.789954-1-ashutosh.dixit@intel.com>
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

Ashutosh Dixit (3):
  drm/xe/oa: Don't whitelist OA status registers
  drm/xe/oa: Don't whitelist OA head pointer registers
  drm/xe/oa: Fix offset alignment for MERT WHITELIST_OA_MERT_MMIO_TRG

 drivers/gpu/drm/xe/xe_reg_whitelist.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

-- 
2.48.1

