Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D64C27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 14:01:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6FA110E3D4;
	Mon, 17 Jun 2024 14:01:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQUyT6jQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D836510E3D4
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 14:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718632897; x=1750168897;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=83auGxPA0+ICGSyGL+Up49tAaSEkYGkHZEzgSGE6+Ac=;
 b=IQUyT6jQarGTQDGv+GfRVmatopQApFdJ6Lj81fdooxTkj2G1pVYIAziK
 IfKyNxbkFEdkn1DLk3Hg+Qk/T260vDEL3f8AuHwBEMmraSJ61VXiSzX9d
 H9S5nD6yYGrdjqRbdie4O0uFY8n1P7xnqjpHxBmLWisR0IMwjDHkf9JyR
 lMFLG9xhBLcPAjGE5efAmjhwAnk7DMnIxfAlDy9uwnXi6XxmMj2TlU/m9
 Gz+AsdX9Ok2KbDMIKr03SBhEDqMYfQobOtHvzpG68kZmcNzc8OelHBTWS
 kELfJsGJwD0wk5qPyp+RipCUHQx1z6+7TsaKZ+YMBg0vECSzgFyKRmOsX w==;
X-CSE-ConnectionGUID: UPI7w2AmRCWZsHq3WFRNUw==
X-CSE-MsgGUID: YvPw5DONQAq6KPr0eMuaXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="12109875"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="12109875"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 07:01:36 -0700
X-CSE-ConnectionGUID: DqMnaOptTuihgrFoYGvtLg==
X-CSE-MsgGUID: 0nSLgsSuT3ecljSxrY734w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="41142193"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 07:01:35 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [RFC 0/2] PM guard classes
Date: Mon, 17 Jun 2024 16:01:18 +0200
Message-Id: <20240617140120.597-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

There is support for 'classes' with constructor and destructor
semantics that can be used for scope-based resource management,
like our device power management.

Use provided macros from linux/cleanup.h to generate required
code definitions.

This should allow us to use:

	scoped_guard(xe_pm, xe)
		foo();
or
	CLASS(xe_pm, var)(xe);

without any concern of leaking the pm reference.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Michal Wajdeczko (2):
  drm/xe: Introduce PM guard classes
  drm/xe: Use new PM guard in xe_gt_debugfs.c

 drivers/gpu/drm/xe/xe_gt_debugfs.c | 91 +++++++++++-------------------
 drivers/gpu/drm/xe/xe_pm.h         |  5 ++
 2 files changed, 39 insertions(+), 57 deletions(-)

-- 
2.43.0

