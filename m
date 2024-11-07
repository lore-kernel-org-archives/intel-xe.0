Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6EAD5D683
	for <intel-xe@archiver.kernel.org>; Thu,  7 Nov 2024 19:48:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9AA10E8CC;
	Thu,  7 Nov 2024 19:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EgSOIf0y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBC210E8C4
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Nov 2024 19:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731008879; x=1762544879;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6iEUl3hQrk6NNo6QR5MRKW/TGzWNMgICoapwi0wSx0w=;
 b=EgSOIf0y65pIvi2RMh55M+UzLoHtOw8EcZjHfMmjsjIMxZeh5V6hKPZn
 VxzeT/x316jIT4ttGBV4OLHEfWv3VT0WXEZdMmYSmuHFtyPd4/pejAR1x
 gIAAigmbXnAlnfVVPXqGDe/Ot9vk3XiEB5YT9hRwtwLm0kkJkB2g3l+un
 78YCKKOvaUao518uclxNz2ABF/+zpkVBVv3k4s1+0XtUSnHU5+Y8UZjEm
 8/1MHGk84CWurvVun/Tkwy7i13/QClGmidDmt4skbohRVJefpNXGeTord
 yTOB5kpy3w4H6AU165LYn87TNY58OZpvB8mFQ9CZvafHWCkmv3yd1HIOx w==;
X-CSE-ConnectionGUID: wb+F6zQMQVm0ngEumoZEjQ==
X-CSE-MsgGUID: U9PrISr7SDCvY9H5qalV4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31045973"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31045973"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 11:47:56 -0800
X-CSE-ConnectionGUID: kjwtqZD5SwiIp3o6lzVqCw==
X-CSE-MsgGUID: OlK6zpSbTyGF4Ep5aQrgeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="90340354"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.2.138])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 11:47:54 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/2] Prefer GT oriented logs/asserts in submit code
Date: Thu,  7 Nov 2024 20:47:39 +0100
Message-Id: <20241107194741.2167-1-michal.wajdeczko@intel.com>
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

Michal Wajdeczko (2):
  drm/xe/guc: Prefer GT oriented asserts in submit code
  drm/xe/guc: Prefer GT oriented logs in submit code

 drivers/gpu/drm/xe/xe_guc_submit.c | 77 +++++++++++++-----------------
 1 file changed, 33 insertions(+), 44 deletions(-)

-- 
2.43.0

