Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBF0C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 19:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E461410E607;
	Mon, 15 Apr 2024 19:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hM8wvhNy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DE610E607
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 19:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713207866; x=1744743866;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W3qZ+Yui3f1Itk/7720c8uoaN2SR2+jsVKaMFjT5ST8=;
 b=hM8wvhNyBtAzVQFVMJTGNkOTk9oi1TSVLayov/MO7b4eePWp2D7lVRfz
 6qPVIGXg60S3QoRadsSO76jA1uqHBw77GCTAEfE+yi7KWnhBaJ5oTuQa4
 NMpfdVTQujSUdaRs6OnLE34A1CoiRFW8mBqBhTfUhYLYIusNp0+CKPMEX
 MXxG8a7MGrmMGeCOwVAQ4B6XnhtluFu/O8Vj1pdEyVN8VxwFJs3lFi5n7
 5fszYFxTxwWrDc4f5FBFcIGEM97YJECYv47nYh2VYp3iqTDDyCKPbRNp9
 21WSELL+3R+nsTr6Ob1GxIQC+ApVbJUXkovzteZvVQUv0cif8VrNyEprz A==;
X-CSE-ConnectionGUID: aLv8k8NLQcOfF/0Sai0c2A==
X-CSE-MsgGUID: jvyRlPGjRWKpjJSTpOZ7uA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="12463720"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="12463720"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 12:04:26 -0700
X-CSE-ConnectionGUID: 35rR1Y75T3KJ+qexuVqgaw==
X-CSE-MsgGUID: WecTBMeLSSOyMtBhgvU8Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22018413"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 12:04:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 0/1] Fix faulting VM deadlock
Date: Mon, 15 Apr 2024 12:04:52 -0700
Message-Id: <20240415190453.696553-1-matthew.brost@intel.com>
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

Stumbled across this one while trying to stablize [1] on PVC. While not
supporting PVC at the moment, this is a generic problem to faulting
devices.

[1] https://patchwork.freedesktop.org/series/125608/

Matthew Brost (1):
  drm/xe: Only use reserved BCS instances for usm migrate exec queue

 drivers/gpu/drm/xe/xe_migrate.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

-- 
2.34.1

