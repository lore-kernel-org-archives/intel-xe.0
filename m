Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB90F36B96
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 23:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBF510E87D;
	Thu,  9 Apr 2026 23:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gJ8XyRKJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BCB310E873
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 23:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775776679; x=1807312679;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wSjiLTBWoM7KCDEG4fDeuo2irTECsDbuiaiGKLI5uoc=;
 b=gJ8XyRKJS5eyE53cXE8fiwN0IxFx79H7UVvTz4hVt1R83QKnCeXXQnRu
 6I+YdGvNcrxe6rOPzY1aEGwxH5D3tea+ce+PtwrEIhf5IChbyxBQfbOV2
 +A0BAl4tvzqMbZkj6HOlfb9pil4OLswDKFixRFGClqfFVbrDpnhDzO5IG
 ElD3+ovEzgT2glnMOjQ2Fgln5aisx1r/mXU0CvYKGv/n1Wmkce0PMh1jN
 wmrrnArhZ+yITNDIQ+WAqeSPe1cobe1j6ipqHxwPqhQBFnhkkCYIIsi9k
 wx2wukU4UKl1D11Oh0hgpOTSV0tJc0EFLijB/VhkSbBs2moRalRRVcWFH g==;
X-CSE-ConnectionGUID: 6zVKPQmjRtyMCo0wbiswCw==
X-CSE-MsgGUID: +r/1TsNpQXOZ1wympNz8zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="80654738"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="80654738"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 16:17:59 -0700
X-CSE-ConnectionGUID: /rHulvhjSlCzND0T67zh3Q==
X-CSE-MsgGUID: CLHucD4mSwCiD7/EadwY4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="252268981"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 16:17:59 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v2 0/3] drm/xe/oa: Wa_14026633728
Date: Thu,  9 Apr 2026 16:17:51 -0700
Message-ID: <20260409231754.528518-1-ashutosh.dixit@intel.com>
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

v2: Change to Patch 1

Ashutosh Dixit (3):
  drm/xe/oa: Use xe_map layer
  drm/xe/oa: Use drm_gem_mmap_obj for OA buffer mmap
  drm/xe/oa: Implement Wa_14026633728

 drivers/gpu/drm/xe/xe_oa.c         | 127 ++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_oa_types.h   |   3 -
 drivers/gpu/drm/xe/xe_wa_oob.rules |   1 +
 3 files changed, 72 insertions(+), 59 deletions(-)

-- 
2.48.1

