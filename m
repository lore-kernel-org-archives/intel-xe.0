Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC4ACF8861
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 15:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0779010E074;
	Thu, 20 Nov 2025 15:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V/nZlmvT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22CD10E074
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 15:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763651791; x=1795187791;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sUQ8WQcGBIUHo+dRAfc6gyVjSJBONGdvKFlSJxFQdkQ=;
 b=V/nZlmvTtjR+NyMD/FxrRBVWBqte+ii1lm6E3OUG8S9KsA2/gIqcBU7p
 UQhj5NbDyERWqJKPkDlokgId4B63sx86bUvE2qXR2BBY335UttYIXwbnI
 cDm3XFPO2JQTGpgvEZTMV4Er/hq+YXr3DBB8QpU2HQuM1EA0JwiriPM/W
 mx9uxUclaHUw6fUEv2WfLFEyQtiyIY5n4/o//WIMvv6IkjvmcDOGwOCxJ
 1SWRtSN78b2POE4+2Ln52ASuYrxY6Ah5DZ+KWDh5701UtFpOwjs1ECqsR
 N6YxkDELz/uz78XXFHB8zItMZMKIPzSAJajGFPgnivSEpmbPoAyUmiQh9 A==;
X-CSE-ConnectionGUID: yjRtxEnvQSKdzbDHHJHpJA==
X-CSE-MsgGUID: yKVar6JiRj+kf/5ZvvP4vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="64731470"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="64731470"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 07:16:30 -0800
X-CSE-ConnectionGUID: lrnP2DsmR62yDsWoKtHTdg==
X-CSE-MsgGUID: U1wOR88sTw+0zaKr0Kdd4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="196366112"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 07:16:29 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: maciej.patelczyk@intel.com, joonas.lahtinen@intel.com,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 0/1] drm/xe/guc: Don't run jobs during GT reset
Date: Thu, 20 Nov 2025 16:16:10 +0100
Message-Id: <20251120151611.2205914-1-jan.maslak@intel.com>
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



Jan Maslak (1):
  drm/xe/guc: Don't run jobs during GT reset

 drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.34.1

