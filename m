Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0301061B2A
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 23:54:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00AB10E814;
	Mon, 30 Mar 2026 23:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g1iDQh+N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D47B10E813;
 Mon, 30 Mar 2026 23:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774914862; x=1806450862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+Z2wbaJtKzjgRZjuwX4K/86HgZhpRBnjoHXKIxiKYuk=;
 b=g1iDQh+NTFFn5oDIVpvRnJ0KyFHOXOjE1o3+tRRZVpqF51UTROQJBTiZ
 u2B/aNRxnkLM0QadXg6VUsOaYR/DUWRFmZKNjNi2ThpmsP4Smcjbq9Lt6
 6Lhg5aHNw2JWlPrvKKsevb1LeSouJIMFnt8GKD6rYhJiH5wx5dK5tPSZG
 Sffol6zpD0hcwX+FGJayY8Hgy02C4heN8fAgaaokNgxoRANwyzcWIhNxD
 7SEMWZhwNqOrcPRTDliNntN+mIyXqZ91i8WvO0GsjYnveJtLtg+na5MRC
 U7z9qXBV/kHpfKN4ny6PfFMgr3mhRgnwM0MdcrzZxpGz/U1n5TbXdMEb6 g==;
X-CSE-ConnectionGUID: Fq+5UMACRRewWsU9LLsDLw==
X-CSE-MsgGUID: yxzA3bHTTOqspp5sCVlkRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86611996"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="86611996"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 16:54:22 -0700
X-CSE-ConnectionGUID: sFlVPj+nREe5bxc2DUoaNg==
X-CSE-MsgGUID: RVSHOznoSEiFcdUmxtW4gw==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.155])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 16:54:20 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 8/9] drm/i915/hdmi: Make the RGB fallback for "4:2:0 only"
 modes the last resort
Date: Tue, 31 Mar 2026 02:53:38 +0300
Message-ID: <20260330235339.29479-9-ville.syrjala@linux.intel.com>
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

Currently we take the Hail Mary RGB fallback for "4:2:0 only" modes
already during the first pass when respect_downstream_limits==true.
It seems better to try everything else first (like ignoring TMDS
clock limits) while still preferring 4:2:0, and only if everything
else has failed fall back to RGB.

Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 95bd38c620d1..6bc1689cbf93 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2314,7 +2314,7 @@ static int intel_hdmi_compute_formats(struct intel_encoder *encoder,
 						       respect_downstream_limits,
 						       INTEL_OUTPUT_FORMAT_YCBCR420);
 
-		if (ret) {
+		if (ret && !respect_downstream_limits) {
 			drm_dbg_kms(display->drm,
 				    "YCbCr 4:2:0 mode but YCbCr 4:2:0 output not possible. Falling back to RGB.\n");
 
-- 
2.52.0

