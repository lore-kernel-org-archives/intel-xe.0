Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B426A1061B2A
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 23:53:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECE510E6E7;
	Mon, 30 Mar 2026 23:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aMZT+ZC0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3702E10E6E7;
 Mon, 30 Mar 2026 23:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774914825; x=1806450825;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S64HRFKJ/flc88YzORJeO5FNbJHLiQNpf4Unr6VzVqg=;
 b=aMZT+ZC0rqfUx6FwMI80DxF3HVF8TOUCSPVf8rIKHpQpAShADeA+ykiq
 YvH3jDdMkRk3WhYMlE83FLg8EXGUhnrL0f0VWdJup19CLptsB6L/7XUDq
 YlskyKYNrXcVlnVdHd0Bx4Z4Lj0RJqcERSaqi4gmF4ANDpkNV1fbveLZ2
 JqRlgF8Oioew8mMgLdjDNraGJ1YUdpu+QrEambEAaGapRrkeKhXXapB8b
 Kpf3jal4vqBIBRBe7pgVeJq1GV5I3+PeTeZS7oaxar2i17sgK6No9AwfI
 G5XwbmUVEZlm4/ekS9QuZdp4OittlwNvM05h4YE5WUEjWGX+eXCOWFmHt A==;
X-CSE-ConnectionGUID: bfKlFASaSt6HtoxnnpeFIA==
X-CSE-MsgGUID: hY21Q9zWQVCKewWt5b9pDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75979228"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75979228"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 16:53:45 -0700
X-CSE-ConnectionGUID: wtVvYb3lRoWxcLdZp5HwEQ==
X-CSE-MsgGUID: fBoAHhHcQVyb7Dvs89gXJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="225208167"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.155])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 16:53:43 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 0/9] drm/i915/{dp,
 hdmi}: Restructure DP/HDMI sink format handling
Date: Tue, 31 Mar 2026 02:53:30 +0300
Message-ID: <20260330235339.29479-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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

Restructure the DP/HDMI sink format handling. I got inspired to do this
by https://lore.kernel.org/dri-devel/20260324-color-format-v11-8-605559af4fb4@collabora.com/

I envision that after this the aforementioned patch could just
become something like this:

1. s/intel_foo_compute_formats/intel_foo_compute_formats_auto/
2. Add a new intel_foo_compute_formats()

   intel_foo_compute_formats()
   {
	switch (color_format) {
	case YCBCR420:
		return intel_foo_compute_output_format(YCBCR420);
	case RGB:
		return intel_foo_compute_output_format(RGB);
	case AUTO:
		return intel_foo_compute_formats_auto();
	}
   }

Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Ville Syrjälä (9):
  drm/i915/hdmi: Add missing intel_pfit_mode_valid() for 4:2:0 also
    modes
  drm/i915/hdmi: Restructure the sink/output format selection
  drm/i915/hdmi: Restructure 4:2:0 vs. 4:4:4 mode validation
  drm/i915/dp: Restructure the sink/output format selection
  drm/i915/dp: Validate "4:2:0 also" modes twice
  drm/i915/dp: Require a HDMI sink for YCbCr output via PCON
  drm/i915/dp: Validate sink format in .mode_valid()
  drm/i915/hdmi: Make the RGB fallback for "4:2:0 only" modes the last
    resort
  drm/i915/dp: Make the RGB fallback for "4:2:0 only" modes the last
    resort

 drivers/gpu/drm/i915/display/intel_dp.c   | 213 ++++++++++++++--------
 drivers/gpu/drm/i915/display/intel_hdmi.c | 167 ++++++++++-------
 2 files changed, 237 insertions(+), 143 deletions(-)

-- 
2.52.0

