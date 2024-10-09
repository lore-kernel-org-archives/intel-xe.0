Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9E7CF0449
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 10:36:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D4410E6CA;
	Wed,  9 Oct 2024 10:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HETHeUIE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204AD10E6CA
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 10:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728470184; x=1760006184;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UCFx9G2kYZlQUM6ubuIo+SN2uJpo4baeF6dA3p4oO24=;
 b=HETHeUIEGiHckbO8r/Mitkvpf5wE2XHsM5FLNI+k8eN4Ux8YrNeRHdsN
 zKzpXwK4kl7IJBy03ZcRfVTOmNcAd5VLZ1ZkNMPDJbA6YYCdwdcIBBKYd
 BoEFet6Im9fMRxQW5fplGeWiSp4OppAsLRAlQ/DZnE514RnQkh4wPL0iv
 R+HC/599NjwfrO4gi0vkBeMKQmbrDrIU7mVcdQSoD21cCjKgRtbmJNHiZ
 qyWEjGCg2/cosQXgMbvYa6KCUmK0Kq2V5qFI7w/p24P5HkGh5tFPFlSQG
 dG2/PlITIzVe0PM2IKQfuG4yxM2qtRPqNaTm1Pp9oSr6dlBtaBoxmiIgE g==;
X-CSE-ConnectionGUID: yR3zgSPQT82ZnfY0ZGj5rw==
X-CSE-MsgGUID: L/wlFl5hSUSgEzvnALZ9sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="39152326"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="39152326"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 03:36:23 -0700
X-CSE-ConnectionGUID: 9Z5tvYnGQTmnwgDRTbzPuA==
X-CSE-MsgGUID: PcdhJKNqSOOF+k5/JjHiQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="80191500"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 03:36:18 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, john.c.harrison@intel.com,
 rodrigo.vivi@intel.com, matthew.brost@intel.com, matthew.auld@intel.com
Subject: [PATCH 0/3] Handle G2H response timeout
Date: Wed,  9 Oct 2024 16:26:42 +0530
Message-Id: <20241009105645.1416588-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
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

Handle G2H response timeout

Badal Nilawar (3):
  drm/xe/guc/ct: Improve g2h request handling during async gt reset
  drm/xe/guc/ct: Increase wait timeout for g2h response
  drm/xe/guc/ct: Flush g2h worker in case of g2h response timeout

 drivers/gpu/drm/xe/xe_guc_ct.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

-- 
2.34.1

