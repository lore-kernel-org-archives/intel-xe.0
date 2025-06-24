Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E90AC77B7C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 17:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D2C10E612;
	Tue, 24 Jun 2025 17:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZlDEBpL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E41E10E614;
 Tue, 24 Jun 2025 17:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750784483; x=1782320483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1lhuQOfZl4wHQrIbeO24gs0U7lwwKmZh0Hlx349cCvw=;
 b=SZlDEBpLqVkYXqR9xVKSgvnXCdys2eKn6k7+Hb9e50sV8IrcLjhd+OE0
 ZBc6fNchOa8D+dyQ60StugjaoORrwllAt2qNZMRJqWRKCUAt2+mcwcZFi
 MUhTB0wDPIKbajYhuiMi3FcavjhiUBdkHYrt3vpne7ApDgHIhj6CLswzP
 dwa7aub6esPat0Vc0u/bh/Qn1f+o23eHVQmnzMf307YuFqnjpQMYgcFBP
 +xHQMUuB5Egcg6b5mDvN/wtz/rPJJtHs6AbEyZecnOmNqs8o804aq3PaA
 TsIJawWk6zI1EEemrF8XKb4iGTsmvgCMUDfN3LsdS9e3p7Zaan80UzX+a Q==;
X-CSE-ConnectionGUID: RTGaCkquTSq3KJ51CnqQUw==
X-CSE-MsgGUID: lrJgojnYRRG8EW2wQWa54w==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56820903"
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; d="scan'208";a="56820903"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 10:01:22 -0700
X-CSE-ConnectionGUID: t/w+agIlRPimAvNgFboHOQ==
X-CSE-MsgGUID: 75CBpe6sSuOrhj4YSEl+xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; d="scan'208";a="157749661"
Received: from vpanait-mobl.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.73])
 by orviesa005.jf.intel.com with SMTP; 24 Jun 2025 10:01:21 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 24 Jun 2025 20:01:19 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 9/9] drm/i915/flipq: Enable flipq by default for testing
Date: Tue, 24 Jun 2025 20:00:49 +0300
Message-ID: <20250624170049.27284-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624170049.27284-1-ville.syrjala@linux.intel.com>
References: <20250624170049.27284-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Flip on the enable_flipq modparam to see if CI blows up.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_params.c | 2 +-
 drivers/gpu/drm/i915/display/intel_display_params.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/drivers/gpu/drm/i915/display/intel_display_params.c
index 75316247ee8a..2883663e06ff 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.c
+++ b/drivers/gpu/drm/i915/display/intel_display_params.c
@@ -63,7 +63,7 @@ intel_display_param_named_unsafe(enable_dsb, bool, 0400,
 	"Enable display state buffer (DSB) (default: true)");
 
 intel_display_param_named_unsafe(enable_flipq, bool, 0400,
-	"Enable DMC flip queue (default: false)");
+	"Enable DMC flip queue (default: true)");
 
 intel_display_param_named_unsafe(enable_sagv, bool, 0400,
 	"Enable system agent voltage/frequency scaling (SAGV) (default: true)");
diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
index 784e6bae8615..600bff5cddda 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.h
+++ b/drivers/gpu/drm/i915/display/intel_display_params.h
@@ -31,7 +31,7 @@ struct drm_printer;
 	param(int, enable_dc, -1, 0400) \
 	param(bool, enable_dpt, true, 0400) \
 	param(bool, enable_dsb, true, 0600) \
-	param(bool, enable_flipq, false, 0600) \
+	param(bool, enable_flipq, true, 0600) \
 	param(bool, enable_sagv, true, 0600) \
 	param(int, disable_power_well, -1, 0400) \
 	param(bool, enable_ips, true, 0600) \
-- 
2.49.0

