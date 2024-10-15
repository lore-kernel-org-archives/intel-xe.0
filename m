Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FC0CFC27F
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 09:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6136B10E555;
	Tue, 15 Oct 2024 09:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PO4CvEh6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A7C10E092
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 09:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728985676; x=1760521676;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B5BMLDbTLvfYjyyFjW+49loShAgxzhrEXN3F9yal58M=;
 b=PO4CvEh6jCxxc0ua6Jn61cOm6vugTHceezcWWfyv8YpYFzkyF2/l55pt
 VINRNVs+CWh7RRFV4BYPlgK9xQwmZVUjA5K3SUVhFBkCvhl/3kHjJ2O8b
 khjZYsBLFRfg/ow7mhltXoPkSWyvuir1wPa4RE4udX+XCNseScn94LJxE
 KJ+XICO9rBPPHjudfOwfSSyFxiTAkKnmBfNsM5o6uQZxT5tFE1Izuto88
 nIXbdGAo0W5KNFKoLpUrvlodAF76hb/0MgB8URCTPKtlg0rlRPLp8Yqts
 zwJQs+1OQDEGXZqIeBkY/VJgx8foEkq8RbwEC+e+2PGyc/aNd5EVENFGv Q==;
X-CSE-ConnectionGUID: 3o1h9WazQPuDrvkuQEGRnQ==
X-CSE-MsgGUID: EwazIqy8Q9qNFf2Zai7E5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27850218"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; d="scan'208";a="27850218"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 02:47:56 -0700
X-CSE-ConnectionGUID: Ch00kt+yTQmEXc7bl9D6rw==
X-CSE-MsgGUID: s7tpUPXLSkm3sejuTHGI2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; d="scan'208";a="82888575"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 02:47:54 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 0/2]  Improve ufence addr validation and error handling
Date: Tue, 15 Oct 2024 11:05:44 +0200
Message-ID: <20241015090546.3082719-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Resending https://patchwork.freedesktop.org/series/139887/ with 
Test-with tag to validate we catch bogus addr from userspace early.

Test-with: 20241014141839.1618518-1-nirmoy.das@intel.com
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Nirmoy Das (2):
  drm/xe/ufence: Prefetch ufence addr to catch bogus address
  drm/xe/ufence: Warn if mmget_not_zero() fails

 drivers/gpu/drm/xe/xe_sync.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.46.0

