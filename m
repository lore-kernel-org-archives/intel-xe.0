Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51251606A326
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 17:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eYoyZGvp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184FE112665;
	Thu, 26 Nov 2026 17:51:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5324D112665;
 Thu, 26 Nov 2026 17:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795715459; x=1827251459;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HhfBmnv3GTL+8YK7slhmMMjXVcz7+HyLWDHeUzLjUnA=;
 b=eYoyZGvpAO1DhYckGr9h2mHqkspggVTzDJ3879xk+r69pcnF7SaqdSSp
 XPaznsXI3pYfHo8zMPkamdzV2SruaXypcdBVx4adfiTQzW22DHfbFHDop
 cw/fwhJA82KFRciEuGk+Hh8s5eMyStpeQpZifm/S94rV+eYqdWxuswTCt
 mtEdN8is+nyN4/JB5awVIq/9ujRGdQ6CIIk8nf3/TeJz9kdQ/76QRbUte
 CgGoQD0iG7TSNCWdAHjbK1yAbTEDqhHluByP6aZv26eEaES1Oq+MqwL7v
 K/X+gfDyzCVT3F+H1DDbmvDIY2bHHWZod4mKHBKH/PISch23PYhLftCUg Q==;
X-CSE-ConnectionGUID: cS6OGUWxTNuoD8XMJQsu6g==
X-CSE-MsgGUID: ZiEQTdKKQ0+KYXTOit1FOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4588371"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4588371"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 09:50:58 -0800
X-CSE-ConnectionGUID: Jp0rDI9pSpi5RqmVOqeNUw==
X-CSE-MsgGUID: MasxV4mpQia2eBf7qVoipQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12558222"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 09:50:57 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH v1 0/2] drm/i915/bios: vbt-related fixes
Date: Thu, 26 Nov 2026 18:50:31 +0100
Message-ID: <20261126175033.181407-1-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Michał Grzelak (2):
  drm/i915/bios: include whitespace into VBT signature
  drm/i915/bios: check if VBT#57's tables are zeroed

 drivers/gpu/drm/i915/display/intel_bios.c     | 17 +++++++++++++----
 drivers/gpu/drm/i915/display/intel_vbt_defs.h |  2 +-
 2 files changed, 14 insertions(+), 5 deletions(-)

-- 
2.45.2

