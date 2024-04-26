Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637C0C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 09:36:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1E010F282;
	Fri, 26 Apr 2024 09:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CkxJ5Usz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850DE10F282
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Apr 2024 09:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714124174; x=1745660174;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VNWxsIg+hLLu7P4ysMFT0d8SxGNEv1x6SDN7hlUAzpY=;
 b=CkxJ5Usz2cih0vJ/mlZlKEeiPQflxMhw5XTlQQA3JKF0p6HZ6wiNh9WH
 srWWyxYdv0mSY95mZLAHNTAfZPhnDtgVEjr8KhY62H7wWfNkNI3ujJsI1
 XpRJEwUCfORnaBzkQ1qv1me49O107TYaioOMNwUPAl7e0rw7mSer+fSsc
 EEK7nAXBZ/gJawrGUy/hrJ29wuYQnTOT7IlMkJ5q7TfnVFOGn1Tww9Cqs
 8UeQR87mfI9uIukBs8n8mmUSvRcg9pAOKTFoVcR+NF6KK99mTavJPz9CH
 53pEKYthpGGsOhqfDVGauZhPRbIAVt942gInEW1nAUAtcjb1JpzvutQof w==;
X-CSE-ConnectionGUID: PcgcaX+SSya6olRNU/fGLg==
X-CSE-MsgGUID: /dgo7LOBSD6hsG3sjCou5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="13686906"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="13686906"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:36:13 -0700
X-CSE-ConnectionGUID: qV+/r4JzTQud+Ssot9v4JA==
X-CSE-MsgGUID: f1W2f1UKQyy6RIrBhuMayQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="29830343"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa003.fm.intel.com with ESMTP; 26 Apr 2024 02:36:12 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 0/2] Extend wa_14020756599 to xe2lpg/lpm
Date: Fri, 26 Apr 2024 15:19:45 +0530
Message-Id: <20240426094947.2039436-1-tejas.upadhyay@intel.com>
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

wa_14020756599 applies to xe2_lpg as well as xe2_lpm all
steppings.

Tejas Upadhyay (2):
  drm/xe/xe2lpg: Add permanent wa_14020756599
  drm/xe/xe2lpm: Add permanent wa_14020756599

 drivers/gpu/drm/xe/xe_wa.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.25.1

