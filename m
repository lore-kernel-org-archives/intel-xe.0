Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFB7D358E5
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 09:02:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3BF89E59;
	Thu, 29 Jan 2026 09:02:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V5ZxpOiX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9396F890EB;
 Thu, 29 Jan 2026 09:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769677355; x=1801213355;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7nLHDetjhXQKtgNSEu0MclmdkH2clD6+kPuMXFtNOZY=;
 b=V5ZxpOiXjGpWZazZUlMfulGh6yZU0pDg4B8i6dlpUyjVmuFoqbBFi41R
 aMFOdmbP/ej47Yo96sKElMVCexzh4dSnBvarxh7aEj1jZMjEsXcYl+kDZ
 KR4QJcDhiXxvxceohKd+CjgT2IICfWY6GMk5IRq7Y3+Y7DN2FPUjDU1Xe
 1wS1c3WmtONhstKHsWqYt37ppXFegPUPby4RB+/b0a9+XIeTzGwrewjG3
 6hn8w7F6aCYy0FCzwkFmtjnxC1Mp7VnCBta1U0WYF51ABbKvklvmM9275
 IHzKQSzvjhloGXMlZJWJ22o9zvBP/1APc6RcZQM2zMx5RTc5xwmGTWOs3 Q==;
X-CSE-ConnectionGUID: Gb3hFCM+Ssy2sxT5gJ0SZA==
X-CSE-MsgGUID: bu6YN/mzR4S034ReBKNhNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="69920774"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="69920774"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 01:02:35 -0800
X-CSE-ConnectionGUID: iMt3rOxiR4+Napiq4Pe9tg==
X-CSE-MsgGUID: OYjZopwESyG6Zy5ksB3+xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="213020948"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 29 Jan 2026 01:02:33 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v2 0/1] i915/i915_driver: move intel_gvt_init() level higher
Date: Thu, 29 Jan 2026 10:01:28 +0100
Message-ID: <20260129090129.2601661-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Next version of [1]. Tested on MTL-P.

[1] https://lore.kernel.org/all/20260128180933.2561419-1-michal.grzelak@intel.com

BR,
Michał

---
Changelog:
v1->v2
- don't move err_msi error path from i915_driver_hw_probe (Jani)
- rewrite commit message

Michał Grzelak (1):
  i915/i915_driver: move intel_gvt_init() level higher

 drivers/gpu/drm/i915/i915_driver.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

-- 
2.45.2

