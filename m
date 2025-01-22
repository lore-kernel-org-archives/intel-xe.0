Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14511C0218C
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 04:02:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E48D10E283;
	Wed, 22 Jan 2025 04:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XaeAdmHf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F6B10E194
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jan 2025 04:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737518529; x=1769054529;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vqTJF1hS7t+wRCYhENIFjOFu3tAhUmEkKt1KQayiJrM=;
 b=XaeAdmHfRao4VISvo9Eu+hwXWccTFUeKU4cw19OMg2yTGFEC5eRXp5ya
 hYQWOGuvJOVJO7DEOe/I8IJwek7zkvSeZ/kqEZch1fQu0/dF9D+cTDUkJ
 9mZrEmUjig4RCttcbEAC0goAa2eSigFWbtq4zbkCQTnUQGe4ZSS6K7CWJ
 l2ufoYu7aKevIFgk3676l0gu6DhVVt3LraoPGQOGrUOm4uO4jYWVQ/vOd
 20JT1XM+nsPde9kA9Dfm28ZBHBE236Uvdr3c5eWiFDv6quJYR7s8doOOJ
 9GJKz4B+MzAgMN5veYPD3rTqjDf/LZ8siRW/GUotophNrzxswQp+o++Og Q==;
X-CSE-ConnectionGUID: mMOth84dTCaLPk5jHYjK/A==
X-CSE-MsgGUID: 0pytMLb4SXeOt0FlaRIV3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="38112769"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="38112769"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 20:02:08 -0800
X-CSE-ConnectionGUID: CoCPDYyiSCiliNZr2Ign3A==
X-CSE-MsgGUID: goDtrQxDRf2btTm39utP5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112088656"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 20:02:08 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 0/2] stream->pollin fixes
Date: Tue, 21 Jan 2025 20:02:02 -0800
Message-ID: <20250122040204.3239397-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.47.1
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

Ashutosh Dixit (2):
  drm/xe/oa: Set stream->pollin in xe_oa_buffer_check_unlocked
  drm/xe/oa: Fix locking for stream->pollin

 drivers/gpu/drm/xe/xe_oa.c       | 15 +++++++++------
 drivers/gpu/drm/xe/xe_oa_types.h |  2 +-
 2 files changed, 10 insertions(+), 7 deletions(-)

-- 
2.47.1

