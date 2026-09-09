Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02343C79FB7
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:21:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E1910E559;
	Wed,  9 Sep 2026 16:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGasB8Rb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3983710E559
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 16:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788970875; x=1820506875;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v3UEya0J+mMgfLntqA4Jedbenl7l0cx8AdLto2gAVpo=;
 b=KGasB8RbBEA7MNmYRrGdm2eWSPGmgnFAgBh78t3Llev6kh4o7ZgEmCfU
 BI+7Jm/hgS1xyLzF8wzrm043//SaXvbl9IrpFf+glEcvceA5Ig1cBbk4m
 CZrqUk7z5MhJFOeQZ2TnNzr5G7gpnvtANi4l/0Egv9WYDxrOGPaSa2N+G
 /aah00dbzMxRTX0qWmXnWZYqEGbvpc9H2BG88rJKL1tXiraN5Sgi946NW
 u5nTkCc8+auuvLPKNiQv5KM+xj7K9/OmSED58KkFIMQKiqg3uLm+kBg+l
 MBMFU+6dDFStfmkEba5/dAGb9cK9Gn26L5ioycjS6w0olap1K2xYEnXwN g==;
X-CSE-ConnectionGUID: qmaWHGSYSKiGMW5tTq8cIw==
X-CSE-MsgGUID: Ql8fIfHSSomDkWgxhyq50g==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100000054"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="100000054"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:21:15 -0700
X-CSE-ConnectionGUID: xve1+cnaT8Onkp/IjodHBw==
X-CSE-MsgGUID: m3c/0o6KQUWi7pB9OeCIgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="268782924"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa008.fm.intel.com with ESMTP; 09 Sep 2026 09:21:14 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v7 0/2] drm/xe/shrinker: Runtime PM reference for non-system
 memory
Date: Wed,  9 Sep 2026 16:21:00 +0000
Message-Id: <20260909162102.1097006-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
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

Change since v6: update patch 2 to use xe_shrinker_runtime_pm_put()
instead of xe_pm_runtime_put().

Shuicheng Lin (2):
  drm/xe/shrinker: Return the freed page count through a parameter
  drm/xe/shrinker: Take a runtime PM ref before shrinking non-system
    memory

 drivers/gpu/drm/xe/xe_shrinker.c | 124 +++++++++++++++++--------------
 1 file changed, 69 insertions(+), 55 deletions(-)

-- 
2.43.0

