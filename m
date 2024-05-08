Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24032C04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 15:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D761E10FC55;
	Wed,  8 May 2024 15:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVnBAlF8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F200A10FC55
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 15:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715180883; x=1746716883;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jgUrDxW4gdbE6kR44X6sSD2qUsLiigJfahQO1tD8fD0=;
 b=DVnBAlF85yZWFDXKP0dUVno2QF1Qm0GSmPRBCSB2n+NkbwoWHjMNGaYX
 yG/uvFGd5D1fAwO+74HySWja3OtSmoDWBn+32XpSVv/qB9vR3CUduWCeN
 UU+4Y38c+FFrxqXgQnAZOGppEm1jlQ7kTur5X8kmqAC0V0ntiGimKz6UV
 FajSFtnIIJetn7N6Ke+7kqpI60cckGzesKsmrVmcDumB6tzpu/yEC7xzb
 DkQRGDAc6eG2UksoHJ9a/fwO6lNSoYokjL4btz1tmp2zxcfynucfdNwTL
 ufKYMeB1LNqsz+8YJX5jMweBSqSuXPlLHVvcp4AZ8jZ5acHIeQ/sPuOiZ Q==;
X-CSE-ConnectionGUID: uW++Hws9Tquf58wlZZFQWw==
X-CSE-MsgGUID: ZCNf66yySk+YIna4/g9OlA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="22442157"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="22442157"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 08:08:02 -0700
X-CSE-ConnectionGUID: /x0nrDn4QLSf0MdlclSLwA==
X-CSE-MsgGUID: QE1zmVoqS6S1slUDUhAetw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33474795"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa004.fm.intel.com with ESMTP; 08 May 2024 08:08:01 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 0/2] Fix xe_pcode_request
Date: Wed,  8 May 2024 20:52:14 +0530
Message-Id: <20240508152216.3263109-1-himal.prasad.ghimiray@intel.com>
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

Modify timeout related warnings and intervals in xe_pcode_request and
pcode_try_request.

Himal Prasad Ghimiray (2):
  drm/xe: Change pcode timeout to 50msec while polling again
  drm/xe: Fix the warning conditions

 drivers/gpu/drm/xe/xe_pcode.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.25.1

