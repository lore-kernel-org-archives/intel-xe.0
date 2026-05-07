Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C1BCD342C
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 01:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2494A10EF3C;
	Thu,  7 May 2026 01:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VBW4ikpf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032D110EF3C;
 Thu,  7 May 2026 01:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778117524; x=1809653524;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1yDusuCNQTU/KMxcszPQgtsGVWLo5Uqsiq+kPF9H8xo=;
 b=VBW4ikpfqG7aoFt8z5Fa7noxe0QKcW7beP4NubA+ov0nKZHe3aAJ3Sjq
 Lys4PsEn4UNk8V3yPygwzxdfXfdKygv9zbNvdLnWf/tSKJGKcMHuS0yHq
 gNwrM9NVouV27G/tXlDgvyeiiEJQbpvw5UYgJe9ir2Xubbbvqxz9scxlo
 /D4Sv7YxxImg5zFJsIG/nrFNqKVSEQYcML1+2MbYHGFJklKl87RWmpkPY
 DVGxLWhVvmEisqBt8o9G2HTKPLFMBcw941GethNtZWUdJLp7j6fwovyUe
 gnTwvOOKqYnOQoRu62UWtLCtFBGW5YIXRh3npmfcN4lnTO1/ER5cVWHrf g==;
X-CSE-ConnectionGUID: TvQapu0fRVeVBjmoRNJCqw==
X-CSE-MsgGUID: w0QZcuxqQZWbyDNrDpOqEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78089027"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="78089027"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 18:32:03 -0700
X-CSE-ConnectionGUID: +2CEhX6WRMupkKsHvSb27Q==
X-CSE-MsgGUID: qzNp+RTIQ46AtEizeCLJCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="266692773"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 06 May 2026 18:32:03 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v3 10/31] drm/i915/bios: print VS/PE-O port info
Date: Thu,  7 May 2026 03:31:16 +0200
Message-ID: <20260507013137.527510-11-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260507013137.527510-1-michal.grzelak@intel.com>
References: <20260507013137.527510-1-michal.grzelak@intel.com>
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

Issue a debug message when port asks to override default Vswing /
Preemphasis tables.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index b01e485283459..5ff7f25270cf6 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2801,6 +2801,11 @@ static void print_ddi_port(const struct intel_bios_encoder_data *devdata)
 			    "Port %c supports dynamic DDI allocation in TCSS\n",
 			    port_name(port));
 
+	if (intel_bios_encoder_overrides_vswing(devdata))
+		drm_dbg_kms(display->drm,
+			    "Port %c overrides VS/PE tables\n",
+			    port_name(port));
+
 	hdmi_level_shift = intel_bios_hdmi_level_shift(devdata);
 	if (hdmi_level_shift >= 0) {
 		drm_dbg_kms(display->drm,
-- 
2.45.2

