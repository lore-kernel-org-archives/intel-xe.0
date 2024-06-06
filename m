Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B98C25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 09:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBB910E8B6;
	Thu,  6 Jun 2024 09:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JadF5XbL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D579E10E8B6
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 09:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717667789; x=1749203789;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8fLEet6fu7OzCGiPJcQe33XPY2BmCs0AcWeuFVILudo=;
 b=JadF5XbLTvXxhSSY5fE2r+txfNkHeTY0DjxMXqSXmCNiXoCNTX2kVt4/
 bmhvo+y0XOKfEimkDBuJDgd3eT6PIkfo9qx9xYmIB5uKnaugeDQbDOr2I
 HTn5FB2iEoxmnSVGEXMavw32Ber9ZzZ3kBh79Mpbm1VcATM/9fi17+XQU
 WOdUGYA9e/D8x5VFon122J4mSyOZ9ecLwG30g2BeQ7mHdN81BbnqXbjkI
 apyeMAlcmT7TJMTAFgiaU42+7VcezKECAbIisCsN5UK/KyTmlw+a6A1js
 Ln+NEQsJrxiFFxemndzRQH6idTfMjy2MlKJHJVnoJrNQLcta6An/kwgux w==;
X-CSE-ConnectionGUID: /RxdiY3zRgCAyA2ZijI9Nw==
X-CSE-MsgGUID: lI8Z6j1aSCax3379B5XlMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="31823901"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="31823901"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 02:56:28 -0700
X-CSE-ConnectionGUID: JXX2eF4XTSGSdu2C0384RQ==
X-CSE-MsgGUID: cMBYWbqpTO2YS1ng6oZ6mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="42326691"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 02:56:26 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com
Subject: [PATCH v3 0/2] xe_gt_idle fixes
Date: Thu,  6 Jun 2024 15:38:40 +0530
Message-Id: <20240606100842.956072-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
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

Use GT forcewake domain while disabling c6
Move disable c6 call from GuC Pc to gt_idle

Rev2: rebase
Rev3: add fixes tag

Riana Tauro (2):
  drm/xe/xe_gt_idle: use GT forcewake domain assertion
  drm/xe: move disable_c6 call

 drivers/gpu/drm/xe/xe_gt_idle.c | 8 +++++++-
 drivers/gpu/drm/xe/xe_guc_pc.c  | 5 -----
 2 files changed, 7 insertions(+), 6 deletions(-)

-- 
2.40.0

