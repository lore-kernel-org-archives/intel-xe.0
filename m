Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106DAC4828E
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 22:50:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C500710F134;
	Fri,  2 Feb 2024 22:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hVXW+smd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E48110F134
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 22:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706914256; x=1738450256;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YmBdiCFc5gPWhjorMBXvfx065zN0cmtErt/U+iMwDEk=;
 b=hVXW+smdFNXKBU5CMfF7goDMES6wJsaK7fxO2Qbqh0u3XpK/tsqlhoae
 l8w25YIXNCpf9xlZkkiBt30PB6546Bkf8dggwFPoGHjWqTGcnW5rWPii2
 a4Mt64+lv7JEluJaSqiFAVph627w2fT8TwErFLYZ+Ktc9VACr4YFugC4f
 fqOMqutwQxozqkI8hgZVJZFzJfiFUtqa4763RXNMjfriHKFnulY9IYxoz
 JsFhvQPSucBTnazvz3e1nK1ypcVYHyyG79d1wz0QjQlYkILutoQvx6z9a
 wT2of0tf0+0fSzBtj0AGzMtSGQf8alZtEFV5bCCfNW6eCc4avtC4r0zus Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="153713"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="153713"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 14:43:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="823331998"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="823331998"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 02 Feb 2024 14:43:48 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 03 Feb 2024 00:43:47 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Paz Zcharya <pazz@chromium.org>
Subject: [PATCH v4 02/16] drm/i915: Print memory region info during probe
Date: Sat,  3 Feb 2024 00:43:26 +0200
Message-ID: <20240202224340.30647-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202224340.30647-1-ville.syrjala@linux.intel.com>
References: <20240202224340.30647-1-ville.syrjala@linux.intel.com>
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

Dump the details about every memory region into dmesg at probe time.
Avoids having to dig those out from random places when debugging stuff.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Tested-by: Paz Zcharya <pazz@chromium.org>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/intel_memory_region.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index b2708f8cac2a..52d998e5c21a 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -372,6 +372,24 @@ int intel_memory_regions_hw_probe(struct drm_i915_private *i915)
 		i915->mm.regions[i] = mem;
 	}
 
+	for (i = 0; i < ARRAY_SIZE(i915->mm.regions); i++) {
+		struct intel_memory_region *mem = i915->mm.regions[i];
+		u64 region_size, io_size;
+
+		if (!mem)
+			continue;
+
+		region_size = resource_size(&mem->region) >> 20;
+		io_size = resource_size(&mem->io) >> 20;
+
+		if (resource_size(&mem->io))
+			drm_dbg(&i915->drm, "Memory region(%d): %s: %llu MiB %pR, io: %llu MiB %pR\n",
+				mem->id, mem->name, region_size, &mem->region, io_size, &mem->io);
+		else
+			drm_dbg(&i915->drm, "Memory region(%d): %s: %llu MiB %pR, io: n/a\n",
+				mem->id, mem->name, region_size, &mem->region);
+	}
+
 	return 0;
 
 out_cleanup:
-- 
2.43.0

