Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC13B105A596
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 13:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C1E10E9F3;
	Thu, 12 Mar 2026 13:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ijd12aCL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A2A10E9F0;
 Thu, 12 Mar 2026 13:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773322089; x=1804858089;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vR6201sbq7VY4vnrVz5I+wDiDUkSvc1Ew4S1mHLrGqE=;
 b=Ijd12aCLKaQhWw8m2hsutlwu4BLXyCIM4+VzlkENrbZqhXX4Q4PDRyyX
 OKr19ZneCTBzA7GHplsI3qiqeGgvcxXL/ALifkoPnROerUwb8VOQO4Sof
 otda5JGyxoYEmWryVK1RQ9Z/S+3x8y+OW2mQB52M97dzmID8SOXIsxnsF
 u8OmAbGCeqejTfECeqF8EnERQ59fdJO9bFbtQhADIbY+VQWEjbXZMiesE
 pDiINiIWa3phUg91YgEsTqy0XyCgETy76dESiT7N1Rgsclw9saWG0mF+P
 kyXIashnubsxNtUzYCSsaSiOmnZwCaxzWko10uCJHre9Yf7163NeCWRig A==;
X-CSE-ConnectionGUID: M7p+nCYLQWSoszcRw2Z3Zg==
X-CSE-MsgGUID: JBKrzTqTTXe19xtt5lD8rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="61988236"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="61988236"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 06:28:09 -0700
X-CSE-ConnectionGUID: +7pv8WjUT0+m/4eXr6ONsQ==
X-CSE-MsgGUID: 4vy2wYYjQ2+9LYugd8XW2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="220881959"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 06:28:07 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 swati2.sharma@intel.com, suraj.kandpal@intel.com
Subject: [PATCH v3 0/2] drm/i915/dmc: Update PIPEDMC interrupt mask
Date: Thu, 12 Mar 2026 18:59:39 +0530
Message-ID: <20260312132941.2614478-1-dibin.moolakadan.subrahmanian@intel.com>
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

On display version 35+ the PIPEDMC_ATS_FAULT and
PIPEDMC_GTT_FAULT interrupt bits are no longer defined.
Update the interrupt mask accordingly and enable the
PIPEDMC_ERROR interrupt.

Changes in v2:
- Move PIPEDMC_ERROR interrupt enable to a separate patch (Ville Syrjala)  
Changes in v3:
- Add Bspec reference (Suraj Kandpal)

Dibin Moolakadan Subrahmanian (2):
  drm/i915/dmc: Remove invalid PIPEDMC interrupt bits
  drm/i915/dmc: Enable PIPEDMC_ERROR interrupt

 drivers/gpu/drm/i915/display/intel_dmc.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.43.0

