Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFD7C5AD69
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 20:19:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA2310E22B;
	Fri, 20 Feb 2026 20:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YD8P4TJ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9300010E22B
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 20:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771618750; x=1803154750;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WBYaDSUwNItMQgqyMJYkVw9f1gs4GUBPIlmtxdui+hM=;
 b=YD8P4TJ72SMRoCAWfVc+1OBPUvBiFLqxNEJ8Gffiav1THrTt1bxAT1z6
 k+jGMDXqtmA8VHkV7vzsFXLIylRy/ycgUt+epu5fec/kG9FZocMlJNCsR
 ephHCaAnmBM2mUl/4DC1EXRlTLCM/iNxJnasdbMOy1x5+dVAMIxdiv3qT
 mLxngxvxlgDvn3x3usnnBaVcpGCwEEhv7Wq0XURBr5Y2IAdXEJqDTB5HJ
 Z2f+GblaDGN/s0vzib3Efi0tM778CoN0e61pxskXUS+vOD6CV+ULMYT3r
 UXccMxnNVP7b+dbXARHR3hmeKBaO8poRMv69s5QPg/ZnYmiMCHMnpVIlf Q==;
X-CSE-ConnectionGUID: oVZHQ02sRu+WwlT/2Mkb+Q==
X-CSE-MsgGUID: +cv4tO5ORXO2yMXXIJOYZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="84169539"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="84169539"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 12:19:10 -0800
X-CSE-ConnectionGUID: 3BvF8K7CQlWusRqrpW0FTg==
X-CSE-MsgGUID: QBKG3Y/QS9GlN0ngPSczgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214182099"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 12:19:08 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH 0/3] drm/xe/pf: Some VRAM flag improvements
Date: Fri, 20 Feb 2026 21:18:52 +0100
Message-ID: <20260220201857.6113-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>

Michal Wajdeczko (3):
  drm/xe/pf: Use explicit VRAM BO flag for VRAM provisioning
  drm/xe/pf: Don't use LMTT page size if no LMTT
  drm/xe/pf: Don't force 2MB VRAM alignment

 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

-- 
2.47.1

