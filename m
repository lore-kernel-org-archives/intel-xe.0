Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6241061B2A
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 23:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C743210E810;
	Mon, 30 Mar 2026 23:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mnrpR5GJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9ACB10E811;
 Mon, 30 Mar 2026 23:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774914858; x=1806450858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T22jqak7i+QazMF4FUiNCZ3P9iUck6E+OwV6zEZ9EMo=;
 b=mnrpR5GJ+3WdXHcB7xApCcGeuv7/lDdX26/x+oIq5ZuQrz38SNVJtKsZ
 mavkvlkYjQoHVEtKWWSsncZiukwHDUX5GPV7lMjb3YIdkjwlbwyktHx/S
 YKN7n4KLQjOFxY45Cy+8sukfM3LUhEfhUJnQMpOpxhjdg8r4+jqNaWTwS
 gWS1u7X53R7KWZCIfTNjikuBCDskjpmqDAxlbA8Uhu89+tPs99kpMi9kN
 TrrcMeqOxyXf2YQP6CKLfO+FQM+VIIvkRogAysNwczoG7mbrOF3bqdyAu
 86M2Wcp639vda9UwWsMIezd1qV3xk7IFR0QfeTd2VTAEImFDOTG9h+Gyi A==;
X-CSE-ConnectionGUID: zw3EV/+sTwGiDXBx8QztPg==
X-CSE-MsgGUID: Q9RnmIOeS1yeiSblXM84Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86611990"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="86611990"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 16:54:17 -0700
X-CSE-ConnectionGUID: cKrSvS6WQaCOE4UW6Wf0LQ==
X-CSE-MsgGUID: 4mG0luqIRlW7w38TAo1tfQ==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.155])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 16:54:16 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 7/9] drm/i915/dp: Validate sink format in .mode_valid()
Date: Tue, 31 Mar 2026 02:53:37 +0300
Message-ID: <20260330235339.29479-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260330235339.29479-1-ville.syrjala@linux.intel.com>
References: <20260330235339.29479-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Make sure the sink supports out chosen sink format. I suppose it
might be at least possible that some PCONs might not snoop the EDID
hard enough and filter out all the modes that they should.

Also if we ever want to add a similar "force DVI" knob to DP
outputs that we have for native HDMI, we'd need to manually
get rid of anything DVI sinks can't handle.

Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ce40d38557e1..ed89fbcdd549 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1466,6 +1466,10 @@ intel_dp_mode_valid_format(struct intel_connector *connector,
 	int num_joined_pipes;
 	int link_bpp_x16;
 
+	status = intel_dp_sink_format_valid(connector, mode, sink_format);
+	if (status != MODE_OK)
+		return status;
+
 	output_format = intel_dp_output_format(connector, sink_format);
 
 	max_link_clock = intel_dp_max_link_rate(intel_dp);
-- 
2.52.0

