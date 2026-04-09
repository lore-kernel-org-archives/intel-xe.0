Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A06EA3C23
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 10:16:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E4C10E7B8;
	Thu,  9 Apr 2026 10:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TAbxeyn5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68D910E79D;
 Thu,  9 Apr 2026 10:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775729777; x=1807265777;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xoADIcGtlzLsJzKHVNBow6c20xBNipOjTeWWrDvHEFA=;
 b=TAbxeyn5lo0iJpxQjTahC7W7exT6u1siizUnQgyEaA89GFGgG3ohv44t
 bi39li5lhkjXxqTnNnnq1hgOqLcpMYTnGAOBP0uIHqqqBzjW/8Pj4fbKf
 E5claZ9AjKgcPmdSH8EgKTVqSR4nhQNuca7uIEyFuEOLdtRXdaeiJsIbz
 eyCwc7flr6y3QLPS8V94AxNdvyvod3bIBDzdIU9PgjlmGx/VYXJG2kz6M
 SCSWrfftFQx3eY+JtbaaQtz7NXImxKvKmmhwljaaw3kf5bFv1PE6YL1yN
 pGCqTfZtjy2HrVllXxrdN0Fu3qxI6oGB7kxhTdsIbiBJNhuauvFDkAkNw Q==;
X-CSE-ConnectionGUID: yfuEN7jMQASvTiIGbEM0EQ==
X-CSE-MsgGUID: WiHt7Jx9S3isEyixyryhQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="87354278"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="87354278"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 03:16:13 -0700
X-CSE-ConnectionGUID: SU2T8X1wT4607rf4q71xjQ==
X-CSE-MsgGUID: M3+5y9pdSau72Bbcn3vqYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="252065529"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.216])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 03:16:12 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 7/9] drm/i915/dp: Validate sink format in .mode_valid()
Date: Thu,  9 Apr 2026 13:15:37 +0300
Message-ID: <20260409101539.22032-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260409101539.22032-1-ville.syrjala@linux.intel.com>
References: <20260409101539.22032-1-ville.syrjala@linux.intel.com>
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

Make sure the sink supports our chosen sink format. I suppose it
might be at least possible that some PCONs might not snoop the EDID
hard enough and filter out all the modes that they should.

Also if we ever want to add a similar "force DVI" knob to DP
outputs that we have for native HDMI, we'd need to manually
get rid of anything DVI sinks can't handle.

Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index e80682834530..945994fe681b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1457,6 +1457,10 @@ intel_dp_mode_valid_format(struct intel_connector *connector,
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

