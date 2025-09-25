Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18EDCAC5A5
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 04:42:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D5110E83B;
	Thu, 25 Sep 2025 04:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CO2XavZr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D800C10E83B
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 04:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758775349; x=1790311349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6brkUgesDQ9HK3twoWZkydnvRex6ZO9p+MIOMWe+MyM=;
 b=CO2XavZrivkBMXGWSkoBbSmqb+iY/cNFjRwzcufxQOW9XnJBE0BoQFF8
 4HwLmcXqUCzK+Xf8qwe9XnLJtukMtlrdBKX9j1VaKRQ4kd7MJ6AEXehL9
 jrua0kniUcqI9ON0nabEcC5iFVmC/fDQUNeTc1hdR4Cxcl6rLibAQDGys
 rkC9lnBUnF1HnXFdus1v0SR8aJxCzH9eJPUijiHYTz/Laj72q0ksxT9P7
 RAL7e22MBdXNCCS8Hcclu5iw9n2XzyW7ZfS6qkOF4p4lya+eDhpxjBo5j
 KW4lSpfapU/TnOR6AFxEQ4r+ooH8tdxROxXT7m2yPxQYpo51sBu6Ttyup A==;
X-CSE-ConnectionGUID: 3lJYb8BgSrm8TDaX4NoQQQ==
X-CSE-MsgGUID: N9+dm/nURWybAi1UFpZd4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="61005405"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="61005405"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 21:42:29 -0700
X-CSE-ConnectionGUID: qD4dbC/uTHK3XO8pdrOfZQ==
X-CSE-MsgGUID: JwHUiFLzSDuk01BQzeKOCg==
X-ExtLoop1: 1
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 21:42:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v4 0/5] drm/xe: Use poll_timeout_us()
Date: Wed, 24 Sep 2025 21:42:10 -0700
Message-ID: <175877528496.1427768.3926811399148541613.b4-ty@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250922-xe-iopoll-v4-0-06438311a63f@intel.com>
References: <20250922-xe-iopoll-v4-0-06438311a63f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Mon, 22 Sep 2025 12:58:28 -0700, Lucas De Marchi wrote:
> This starts using poll_timeout_us() throughout xe. Tested only by
> probing xe on BMG and I haven't seen any difference.
> 
> Size-wise, it's pretty much the same thing as open coding the loops:
> 
> 	add/remove: 2/0 grow/shrink: 6/1 up/down: 254/-128 (126)
> 	Function                                     old     new   delta
> 	pcode_mailbox_rw                               -     159    +159
> 	__xe_guc_upload.isra                        1481    1522     +41
> 	__pfx_pcode_mailbox_rw                         -      16     +16
> 	wait_for_lmem_ready                          688     701     +13
> 	xe_device_probe_early                        549     560     +11
> 	wait_for_pc_state.constprop                  213     222      +9
> 	xe_guc_pc_apply_flush_freq_limit             390     394      +4
> 	wait_for_pc_state.constprop.cold              24      25      +1
> 	__xe_guc_upload.isra.cold                    787     659    -128
> 	Total: Before=2806317, After=2806443, chg +0.00%
> 
> [...]

Merged to drm-xe-next, thanks!

[1/5] drm/xe/device: Use poll_timeout_us() to wait for lmem
      commit: 09ab20c41ace0cfc00e48338ab2e2c58896fa094
[2/5] drm/xe/guc_pc: Use poll_timeout_us() for waiting
      commit: b0ac4ef074ace20714a3bf96d23ae2ba61cc4439
[3/5] drm/xe/guc: Drop helper to read freq
      commit: 2a16f47dcc75e7bfd98291f0951c5e864294341e
[4/5] drm/xe/guc: Extract function to print load error
      commit: abde96d8442de131fc3af647fdc63a0877dc99b6
[5/5] drm/xe/guc: Refactor GuC load to use poll_timeout_us()
      commit: a4916b4da44812384388ac09a2baf9da461dbc30

--
Lucas De Marchi

